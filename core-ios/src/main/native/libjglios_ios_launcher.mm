#include "libjglios_ios_launcher.h"

#include <cstdio>
#include <cstdlib>
#include <atomic>
#include <limits>
#include <mutex>
#include <string>
#include <vector>

#include <SDL3/SDL.h>
#include <EGL/egl.h>
#include <EGL/eglext.h>
#include <GLES3/gl3.h>

#ifndef EGL_PLATFORM_ANGLE_ANGLE
#define EGL_PLATFORM_ANGLE_ANGLE 0x3202
#endif
#ifndef EGL_PLATFORM_ANGLE_TYPE_ANGLE
#define EGL_PLATFORM_ANGLE_TYPE_ANGLE 0x3203
#endif
#ifndef EGL_PLATFORM_ANGLE_TYPE_METAL_ANGLE
#define EGL_PLATFORM_ANGLE_TYPE_METAL_ANGLE 0x3489
#endif

static void* g_metalLayer = nullptr;

static EGLDisplay g_display = EGL_NO_DISPLAY;
static EGLSurface g_surface = EGL_NO_SURFACE;
static EGLContext g_context = EGL_NO_CONTEXT;
static EGLConfig g_config = nullptr;
static std::atomic_int g_framebufferWidth(0);
static std::atomic_int g_framebufferHeight(0);
static std::atomic_bool g_quitRequested(false);
static SDL_Window* g_window = nullptr;

static std::string g_lastError;

struct LibJGLIOSQueuedInputEvent {
    int intData[4] = {0, 0, 0, 0};
    float floatData[4] = {0.0f, 0.0f, 0.0f, 0.0f};
};

static std::mutex g_inputMutex;
static std::vector<LibJGLIOSQueuedInputEvent> g_inputEvents;

static int fail(int code, const char* message) {
    g_lastError = message ? message : "unknown error";
    return code;
}

static EGLint config_attrib(EGLConfig config, EGLint attrib) {
    EGLint value = 0;
    eglGetConfigAttrib(g_display, config, attrib, &value);
    return value;
}

static int config_score(EGLConfig config, EGLint renderableType) {
    const EGLint surfaceType = config_attrib(config, EGL_SURFACE_TYPE);
    const EGLint supportedRenderableType = config_attrib(config, EGL_RENDERABLE_TYPE);
    if ((surfaceType & EGL_WINDOW_BIT) == 0 || (supportedRenderableType & renderableType) == 0) {
        return std::numeric_limits<int>::min();
    }

    int score = 0;
    score -= std::abs(config_attrib(config, EGL_RED_SIZE) - 8) * 16;
    score -= std::abs(config_attrib(config, EGL_GREEN_SIZE) - 8) * 16;
    score -= std::abs(config_attrib(config, EGL_BLUE_SIZE) - 8) * 16;
    score -= std::abs(config_attrib(config, EGL_ALPHA_SIZE) - 8) * 16;
    score -= std::abs(config_attrib(config, EGL_DEPTH_SIZE) - 24) * 4;
    score -= std::abs(config_attrib(config, EGL_STENCIL_SIZE) - 8) * 4;
    score -= config_attrib(config, EGL_SAMPLES);
    score += renderableType == EGL_OPENGL_ES3_BIT ? 2000 : 1000;
    return score;
}

static void log_config(const char* prefix, EGLConfig config) {
    std::fprintf(stderr,
        "%s EGL config: rgba=%d/%d/%d/%d depth=%d stencil=%d samples=%d renderable=0x%x surface=0x%x\n",
        prefix,
        config_attrib(config, EGL_RED_SIZE),
        config_attrib(config, EGL_GREEN_SIZE),
        config_attrib(config, EGL_BLUE_SIZE),
        config_attrib(config, EGL_ALPHA_SIZE),
        config_attrib(config, EGL_DEPTH_SIZE),
        config_attrib(config, EGL_STENCIL_SIZE),
        config_attrib(config, EGL_SAMPLES),
        config_attrib(config, EGL_RENDERABLE_TYPE),
        config_attrib(config, EGL_SURFACE_TYPE));
}

static bool choose_config(EGLint renderableType) {
    EGLint configCount = 0;
    if (!eglGetConfigs(g_display, nullptr, 0, &configCount) || configCount <= 0) {
        return false;
    }

    std::vector<EGLConfig> configs(configCount);
    EGLint returnedConfigCount = 0;
    if (!eglGetConfigs(g_display, configs.data(), configCount, &returnedConfigCount) || returnedConfigCount <= 0) {
        return false;
    }

    EGLConfig bestConfig = nullptr;
    int bestScore = std::numeric_limits<int>::min();
    for (EGLint i = 0; i < returnedConfigCount; ++i) {
        int score = config_score(configs[i], renderableType);
        if (score > bestScore) {
            bestScore = score;
            bestConfig = configs[i];
        }
    }

    if (bestConfig == nullptr || bestScore == std::numeric_limits<int>::min()) {
        return false;
    }

    g_config = bestConfig;
    log_config(renderableType == EGL_OPENGL_ES3_BIT ? "chosen GLES3" : "chosen GLES2", g_config);
    return true;
}

static EGLContext create_context(int clientVersion) {
    const EGLint contextAttribs[] = {
        EGL_CONTEXT_CLIENT_VERSION, clientVersion,
        EGL_NONE
    };
    return eglCreateContext(g_display, g_config, EGL_NO_CONTEXT, contextAttribs);
}

int libjglios_egl_init_with_metal_layer(void* metalLayer) {
    g_metalLayer = metalLayer;
    if (!g_metalLayer) {
        return fail(-1, "metal layer was null");
    }

    auto eglGetPlatformDisplayEXT =
        reinterpret_cast<PFNEGLGETPLATFORMDISPLAYEXTPROC>(eglGetProcAddress("eglGetPlatformDisplayEXT"));
    if (!eglGetPlatformDisplayEXT) {
        return fail(-2, "eglGetPlatformDisplayEXT not found");
    }

    const EGLint displayAttribs[] = {
        EGL_PLATFORM_ANGLE_TYPE_ANGLE,
        EGL_PLATFORM_ANGLE_TYPE_METAL_ANGLE,
        EGL_NONE
    };

    g_display = eglGetPlatformDisplayEXT(
        EGL_PLATFORM_ANGLE_ANGLE,
        reinterpret_cast<void*>(EGL_DEFAULT_DISPLAY),
        displayAttribs
    );
    if (g_display == EGL_NO_DISPLAY) {
        return fail(-3, "eglGetPlatformDisplayEXT returned EGL_NO_DISPLAY");
    }

    if (!eglInitialize(g_display, nullptr, nullptr)) {
        return fail(-4, "eglInitialize failed");
    }

    if (choose_config(EGL_OPENGL_ES3_BIT)) {
        g_context = create_context(3);
    }
    if (g_context == EGL_NO_CONTEXT) {
        g_config = nullptr;
        if (!choose_config(EGL_OPENGL_ES2_BIT)) {
            return fail(-5, "eglChooseConfig failed for GLES3 and GLES2");
        }
        g_context = create_context(2);
        if (g_context == EGL_NO_CONTEXT) {
            return fail(-6, "eglCreateContext failed for GLES3 and GLES2");
        }
    }

    g_surface = eglCreateWindowSurface(
        g_display,
        g_config,
        reinterpret_cast<EGLNativeWindowType>(g_metalLayer),
        nullptr
    );
    if (g_surface == EGL_NO_SURFACE) {
        return fail(-7, "eglCreateWindowSurface failed");
    }

    if (!eglMakeCurrent(g_display, g_surface, g_surface, g_context)) {
        return fail(-8, "eglMakeCurrent failed");
    }

    std::fprintf(stderr, "GL_VENDOR=%s\n", reinterpret_cast<const char*>(glGetString(GL_VENDOR)));
    std::fprintf(stderr, "GL_RENDERER=%s\n", reinterpret_cast<const char*>(glGetString(GL_RENDERER)));
    std::fprintf(stderr, "GL_VERSION=%s\n", reinterpret_cast<const char*>(glGetString(GL_VERSION)));
    std::fprintf(stderr, "GL_SHADING_LANGUAGE_VERSION=%s\n", reinterpret_cast<const char*>(glGetString(GL_SHADING_LANGUAGE_VERSION)));
    GLint maxTextureSize = 0;
    GLint maxSamples = 0;
    glGetIntegerv(GL_MAX_TEXTURE_SIZE, &maxTextureSize);
    glGetIntegerv(GL_MAX_SAMPLES, &maxSamples);
    std::fprintf(stderr, "GL_MAX_TEXTURE_SIZE=%d\n", maxTextureSize);
    std::fprintf(stderr, "GL_MAX_SAMPLES=%d\n", maxSamples);

    g_lastError.clear();
    return 0;
}

void libjglios_egl_swap_buffers(void) {
    if (g_display != EGL_NO_DISPLAY && g_surface != EGL_NO_SURFACE) {
        eglSwapBuffers(g_display, g_surface);
    }
}

void libjglios_egl_set_framebuffer_size(int width, int height) {
    if (width > 0) {
        g_framebufferWidth.store(width);
    }
    if (height > 0) {
        g_framebufferHeight.store(height);
    }
}

bool libjglios_egl_make_current(void) {
    if (g_display == EGL_NO_DISPLAY || g_surface == EGL_NO_SURFACE || g_context == EGL_NO_CONTEXT) {
        g_lastError = "eglMakeCurrent failed: EGL is not initialized";
        return false;
    }
    if (!eglMakeCurrent(g_display, g_surface, g_surface, g_context)) {
        fail(-9, "eglMakeCurrent failed");
        return false;
    }
    g_lastError.clear();
    return true;
}

int libjglios_egl_framebuffer_width(void) {
    int overriddenWidth = g_framebufferWidth.load();
    if (overriddenWidth > 0) {
        return overriddenWidth;
    }
    if (g_display == EGL_NO_DISPLAY || g_surface == EGL_NO_SURFACE) {
        return 0;
    }
    EGLint width = 0;
    if (!eglQuerySurface(g_display, g_surface, EGL_WIDTH, &width)) {
        return 0;
    }
    return width;
}

int libjglios_egl_framebuffer_height(void) {
    int overriddenHeight = g_framebufferHeight.load();
    if (overriddenHeight > 0) {
        return overriddenHeight;
    }
    if (g_display == EGL_NO_DISPLAY || g_surface == EGL_NO_SURFACE) {
        return 0;
    }
    EGLint height = 0;
    if (!eglQuerySurface(g_display, g_surface, EGL_HEIGHT, &height)) {
        return 0;
    }
    return height;
}

const char* libjglios_egl_last_error(void) {
    return g_lastError.c_str();
}

void libjglios_egl_shutdown(void) {
    if (g_display != EGL_NO_DISPLAY) {
        eglMakeCurrent(g_display, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
        if (g_context != EGL_NO_CONTEXT) {
            eglDestroyContext(g_display, g_context);
        }
        if (g_surface != EGL_NO_SURFACE) {
            eglDestroySurface(g_display, g_surface);
        }
        eglTerminate(g_display);
    }

    g_context = EGL_NO_CONTEXT;
    g_surface = EGL_NO_SURFACE;
    g_display = EGL_NO_DISPLAY;
    g_metalLayer = nullptr;
    g_framebufferWidth.store(0);
    g_framebufferHeight.store(0);
}

static void push_input_event(const LibJGLIOSQueuedInputEvent& queued) {
    std::lock_guard<std::mutex> lock(g_inputMutex);
    if (g_inputEvents.size() >= 256) {
        g_inputEvents.erase(g_inputEvents.begin());
    }
    g_inputEvents.push_back(queued);
}

static const char* next_utf8_codepoint(const char* text, int& codepoint) {
    codepoint = 0;
    if (text == nullptr || text[0] == '\0') {
        return nullptr;
    }
    const unsigned char* bytes = reinterpret_cast<const unsigned char*>(text);
    if (bytes[0] < 0x80) {
        codepoint = bytes[0];
        return text + 1;
    }
    if ((bytes[0] & 0xE0) == 0xC0 && bytes[1] != '\0' && (bytes[1] & 0xC0) == 0x80) {
        codepoint = ((bytes[0] & 0x1F) << 6) | (bytes[1] & 0x3F);
        return text + 2;
    }
    if ((bytes[0] & 0xF0) == 0xE0 && bytes[1] != '\0' && bytes[2] != '\0'
            && (bytes[1] & 0xC0) == 0x80 && (bytes[2] & 0xC0) == 0x80) {
        codepoint = ((bytes[0] & 0x0F) << 12) | ((bytes[1] & 0x3F) << 6) | (bytes[2] & 0x3F);
        return text + 3;
    }
    if ((bytes[0] & 0xF8) == 0xF0 && bytes[1] != '\0' && bytes[2] != '\0' && bytes[3] != '\0'
            && (bytes[1] & 0xC0) == 0x80
            && (bytes[2] & 0xC0) == 0x80 && (bytes[3] & 0xC0) == 0x80) {
        codepoint = ((bytes[0] & 0x07) << 18) | ((bytes[1] & 0x3F) << 12)
                | ((bytes[2] & 0x3F) << 6) | (bytes[3] & 0x3F);
        return text + 4;
    }
    return text + 1;
}

static void push_text_input_events(const char* text) {
    int codepoint = 0;
    for (const char* next = text; (next = next_utf8_codepoint(next, codepoint)) != nullptr;) {
        if (codepoint == 0) {
            continue;
        }
        LibJGLIOSQueuedInputEvent queued;
        queued.intData[0] = 11;
        queued.intData[1] = codepoint;
        push_input_event(queued);
    }
}

void libjglios_input_enqueue_sdl_event(const void* rawEvent) {
    if (rawEvent == nullptr) {
        return;
    }

    const SDL_Event* event = static_cast<const SDL_Event*>(rawEvent);
    LibJGLIOSQueuedInputEvent queued;
    switch (event->type) {
        case SDL_EVENT_FINGER_DOWN:
            queued.intData[0] = 1;
            queued.intData[1] = static_cast<int>(event->tfinger.fingerID);
            queued.floatData[0] = event->tfinger.x;
            queued.floatData[1] = event->tfinger.y;
            queued.floatData[2] = 0.0f;
            queued.floatData[3] = 0.0f;
            push_input_event(queued);
            break;
        case SDL_EVENT_FINGER_UP:
            queued.intData[0] = 2;
            queued.intData[1] = static_cast<int>(event->tfinger.fingerID);
            queued.floatData[0] = event->tfinger.x;
            queued.floatData[1] = event->tfinger.y;
            queued.floatData[2] = 0.0f;
            queued.floatData[3] = 0.0f;
            push_input_event(queued);
            break;
        case SDL_EVENT_FINGER_MOTION:
            queued.intData[0] = 3;
            queued.intData[1] = static_cast<int>(event->tfinger.fingerID);
            queued.floatData[0] = event->tfinger.x;
            queued.floatData[1] = event->tfinger.y;
            queued.floatData[2] = event->tfinger.dx;
            queued.floatData[3] = event->tfinger.dy;
            push_input_event(queued);
            break;
        case SDL_EVENT_MOUSE_BUTTON_DOWN:
        case SDL_EVENT_MOUSE_BUTTON_UP:
            if (event->button.which == SDL_TOUCH_MOUSEID) {
                break;
            }
            queued.intData[0] = 4;
            queued.intData[1] = static_cast<int>(event->button.button);
            queued.intData[2] = event->type == SDL_EVENT_MOUSE_BUTTON_DOWN ? 1 : 0;
            queued.floatData[0] = event->button.x;
            queued.floatData[1] = event->button.y;
            push_input_event(queued);
            break;
        case SDL_EVENT_MOUSE_MOTION:
            if (event->motion.which == SDL_TOUCH_MOUSEID) {
                break;
            }
            queued.intData[0] = 5;
            queued.floatData[0] = event->motion.x;
            queued.floatData[1] = event->motion.y;
            queued.floatData[2] = event->motion.xrel;
            queued.floatData[3] = event->motion.yrel;
            push_input_event(queued);
            break;
        case SDL_EVENT_KEY_DOWN:
        case SDL_EVENT_KEY_UP:
            queued.intData[0] = 6;
            queued.intData[1] = static_cast<int>(event->key.scancode);
            queued.intData[2] = event->type == SDL_EVENT_KEY_DOWN ? 1 : 0;
            queued.intData[3] = event->key.repeat ? 1 : 0;
            push_input_event(queued);
            break;
        case SDL_EVENT_TEXT_INPUT:
            push_text_input_events(event->text.text);
            break;
        case SDL_EVENT_GAMEPAD_ADDED:
            queued.intData[0] = 7;
            queued.intData[1] = static_cast<int>(event->gdevice.which);
            push_input_event(queued);
            break;
        case SDL_EVENT_GAMEPAD_REMOVED:
            queued.intData[0] = 8;
            queued.intData[1] = static_cast<int>(event->gdevice.which);
            push_input_event(queued);
            break;
        case SDL_EVENT_GAMEPAD_AXIS_MOTION:
            queued.intData[0] = 9;
            queued.intData[1] = static_cast<int>(event->gaxis.which);
            queued.intData[2] = static_cast<int>(event->gaxis.axis);
            queued.intData[3] = static_cast<int>(event->gaxis.value);
            if (event->gaxis.axis == SDL_GAMEPAD_AXIS_LEFT_TRIGGER || event->gaxis.axis == SDL_GAMEPAD_AXIS_RIGHT_TRIGGER) {
                queued.floatData[0] = event->gaxis.value <= 0 ? 0.0f : static_cast<float>(event->gaxis.value) / 32767.0f;
            } else if (event->gaxis.value == SDL_MIN_SINT16) {
                queued.floatData[0] = -1.0f;
            } else {
                queued.floatData[0] = static_cast<float>(event->gaxis.value) / 32767.0f;
            }
            push_input_event(queued);
            break;
        case SDL_EVENT_GAMEPAD_BUTTON_DOWN:
        case SDL_EVENT_GAMEPAD_BUTTON_UP:
            queued.intData[0] = 10;
            queued.intData[1] = static_cast<int>(event->gbutton.which);
            queued.intData[2] = static_cast<int>(event->gbutton.button);
            queued.intData[3] = event->type == SDL_EVENT_GAMEPAD_BUTTON_DOWN ? 1 : 0;
            push_input_event(queued);
            break;
        default:
            break;
    }
}

bool libjglios_input_poll_event(int intData[4], float floatData[4]) {
    std::lock_guard<std::mutex> lock(g_inputMutex);
    if (g_inputEvents.empty()) {
        return false;
    }

    const LibJGLIOSQueuedInputEvent queued = g_inputEvents.front();
    g_inputEvents.erase(g_inputEvents.begin());
    for (int i = 0; i < 4; ++i) {
        intData[i] = queued.intData[i];
        floatData[i] = queued.floatData[i];
    }
    return true;
}

void libjglios_app_request_quit(void) {
    g_quitRequested.store(true);
}

void libjglios_app_reset_quit_request(void) {
    g_quitRequested.store(false);
}

bool libjglios_app_quit_requested(void) {
    return g_quitRequested.load();
}

void libjglios_app_set_window(void* window) {
    g_window = static_cast<SDL_Window*>(window);
}

bool libjglios_app_set_software_keyboard_visible(bool visible) {
    if (g_window == nullptr) {
        return false;
    }
    return visible ? SDL_StartTextInput(g_window) : SDL_StopTextInput(g_window);
}
