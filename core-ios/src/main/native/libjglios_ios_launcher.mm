#include "libjglios_ios_launcher.h"

#include <algorithm>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <atomic>
#include <limits>
#include <mutex>
#include <string>
#include <vector>

#include <SDL3/SDL.h>
#include <TargetConditionals.h>
#import <CoreHaptics/CoreHaptics.h>
#if LIBJGLIOS_IOS_LEGACY_GLES
#import <OpenGLES/ES3/gl.h>
#else
#include <EGL/egl.h>
#include <EGL/eglext.h>
#include <GLES3/gl3.h>
#endif

#if !LIBJGLIOS_IOS_LEGACY_GLES
#ifndef EGL_PLATFORM_ANGLE_ANGLE
#define EGL_PLATFORM_ANGLE_ANGLE 0x3202
#endif
#ifndef EGL_PLATFORM_ANGLE_TYPE_ANGLE
#define EGL_PLATFORM_ANGLE_TYPE_ANGLE 0x3203
#endif
#ifndef EGL_PLATFORM_ANGLE_TYPE_METAL_ANGLE
#define EGL_PLATFORM_ANGLE_TYPE_METAL_ANGLE 0x3489
#endif
#endif

#if LIBJGLIOS_IOS_LEGACY_GLES
static SDL_GLContext g_glContext = nullptr;
#else
static void* g_metalLayer = nullptr;

static EGLDisplay g_display = EGL_NO_DISPLAY;
static EGLSurface g_surface = EGL_NO_SURFACE;
static EGLContext g_context = EGL_NO_CONTEXT;
static EGLConfig g_config = nullptr;
#endif
static std::atomic_int g_framebufferWidth(0);
static std::atomic_int g_framebufferHeight(0);
static std::atomic_int g_windowWidth(0);
static std::atomic_int g_windowHeight(0);
static std::atomic_int g_displayScaleMillis(1000);
static std::atomic_bool g_quitRequested(false);
static std::atomic_bool g_highPixelDensity(true);
static SDL_Window* g_window = nullptr;

struct LibJGLIOSFramebufferConfig {
    int redBits = 8;
    int greenBits = 8;
    int blueBits = 8;
    int alphaBits = 8;
    int depthBits = 24;
    int stencilBits = 8;
    int samples = 0;
};

static LibJGLIOSFramebufferConfig g_framebufferConfig;
static void* g_pendingMetalLayer = nullptr;
static SDL_Window* g_pendingWindow = nullptr;

static std::string g_lastError;

struct LibJGLIOSQueuedInputEvent {
    int intData[5] = {0, 0, 0, 0, 0};
    float floatData[4] = {0.0f, 0.0f, 0.0f, 0.0f};
};

static std::mutex g_inputMutex;
static std::vector<LibJGLIOSQueuedInputEvent> g_inputEvents;

static std::mutex g_hapticMutex;
static CHHapticEngine* g_hapticEngine = nil;
static id<CHHapticPatternPlayer> g_hapticPlayer = nil;

static float clamp01(float value) {
    if (!std::isfinite(value)) {
        return value > 0.0f ? 1.0f : 0.0f;
    }
    return std::max(0.0f, std::min(1.0f, value));
}

static int fail(int code, const char* message) {
    g_lastError = message ? message : "unknown error";
    return code;
}

static int non_negative_or_default(int value, int defaultValue) {
    return value >= 0 ? value : defaultValue;
}

static bool graphics_initialized(void) {
#if LIBJGLIOS_IOS_LEGACY_GLES
    return g_glContext != nullptr;
#else
    return g_display != EGL_NO_DISPLAY && g_surface != EGL_NO_SURFACE && g_context != EGL_NO_CONTEXT;
#endif
}

static void log_framebuffer_config(const char* prefix) {
    std::fprintf(stderr,
        "%s framebuffer request: rgba=%d/%d/%d/%d depth=%d stencil=%d samples=%d\n",
        prefix,
        g_framebufferConfig.redBits,
        g_framebufferConfig.greenBits,
        g_framebufferConfig.blueBits,
        g_framebufferConfig.alphaBits,
        g_framebufferConfig.depthBits,
        g_framebufferConfig.stencilBits,
        g_framebufferConfig.samples);
}

#if !LIBJGLIOS_IOS_LEGACY_GLES
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
    score -= std::abs(config_attrib(config, EGL_RED_SIZE) - g_framebufferConfig.redBits) * 16;
    score -= std::abs(config_attrib(config, EGL_GREEN_SIZE) - g_framebufferConfig.greenBits) * 16;
    score -= std::abs(config_attrib(config, EGL_BLUE_SIZE) - g_framebufferConfig.blueBits) * 16;
    score -= std::abs(config_attrib(config, EGL_ALPHA_SIZE) - g_framebufferConfig.alphaBits) * 16;
    score -= std::abs(config_attrib(config, EGL_DEPTH_SIZE) - g_framebufferConfig.depthBits) * 4;
    score -= std::abs(config_attrib(config, EGL_STENCIL_SIZE) - g_framebufferConfig.stencilBits) * 4;
    const int actualSamples = config_attrib(config, EGL_SAMPLES);
    if (g_framebufferConfig.samples <= 0) {
        score -= actualSamples * 8;
    } else if (actualSamples < g_framebufferConfig.samples) {
        score -= (g_framebufferConfig.samples - actualSamples) * 24;
    } else {
        score -= (actualSamples - g_framebufferConfig.samples) * 8;
    }
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
#endif

int libjglios_egl_init_with_metal_layer(void* metalLayer) {
#if LIBJGLIOS_IOS_LEGACY_GLES
    return fail(-1, "Metal layer initialization is unavailable in legacy OpenGL ES mode");
#else
    if (graphics_initialized()) {
        return 0;
    }
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

    log_framebuffer_config("ANGLE");
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

    std::fprintf(stderr, "LIBJGLIOS_GRAPHICS_BACKEND=ANGLE\n");
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
#endif
}

int libjglios_egl_init_with_sdl_window(void* window) {
#if LIBJGLIOS_IOS_LEGACY_GLES
    if (graphics_initialized()) {
        return 0;
    }
    g_window = static_cast<SDL_Window*>(window);
    if (g_window == nullptr) {
        return fail(-1, "SDL window was null");
    }

    log_framebuffer_config("OpenGLES");
    libjglios_egl_prepare_window();

    g_glContext = SDL_GL_CreateContext(g_window);
    if (g_glContext == nullptr) {
        return fail(-2, SDL_GetError());
    }
    if (!SDL_GL_MakeCurrent(g_window, g_glContext)) {
        return fail(-3, SDL_GetError());
    }
    SDL_GL_SetSwapInterval(1);

    std::fprintf(stderr, "LIBJGLIOS_GRAPHICS_BACKEND=OpenGLES\n");
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
#else
    return fail(-1, "SDL window initialization is unavailable in ANGLE mode");
#endif
}

void libjglios_egl_set_pending_metal_layer(void* metalLayer) {
    g_pendingMetalLayer = metalLayer;
}

void libjglios_egl_set_pending_sdl_window(void* window) {
    g_pendingWindow = static_cast<SDL_Window*>(window);
}

int libjglios_egl_init_pending(void) {
    if (graphics_initialized()) {
        return 0;
    }
#if LIBJGLIOS_IOS_LEGACY_GLES
    return libjglios_egl_init_with_sdl_window(g_pendingWindow);
#else
    return libjglios_egl_init_with_metal_layer(g_pendingMetalLayer);
#endif
}

bool libjglios_egl_is_initialized(void) {
    return graphics_initialized();
}

void libjglios_egl_configure_window(bool highPixelDensity) {
    if (g_window == nullptr) {
        g_highPixelDensity.store(highPixelDensity);
    }
}

bool libjglios_egl_high_pixel_density_enabled(void) {
    return g_highPixelDensity.load();
}

void libjglios_egl_configure_default_framebuffer(
        int redBits,
        int greenBits,
        int blueBits,
        int alphaBits,
        int depthBits,
        int stencilBits,
        int samples) {
    if (graphics_initialized()) {
        return;
    }
    g_framebufferConfig.redBits = non_negative_or_default(redBits, g_framebufferConfig.redBits);
    g_framebufferConfig.greenBits = non_negative_or_default(greenBits, g_framebufferConfig.greenBits);
    g_framebufferConfig.blueBits = non_negative_or_default(blueBits, g_framebufferConfig.blueBits);
    g_framebufferConfig.alphaBits = non_negative_or_default(alphaBits, g_framebufferConfig.alphaBits);
    g_framebufferConfig.depthBits = non_negative_or_default(depthBits, g_framebufferConfig.depthBits);
    g_framebufferConfig.stencilBits = non_negative_or_default(stencilBits, g_framebufferConfig.stencilBits);
    g_framebufferConfig.samples = non_negative_or_default(samples, g_framebufferConfig.samples);
}

void libjglios_egl_prepare_window(void) {
#if LIBJGLIOS_IOS_LEGACY_GLES
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_ES);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 0);
    SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
    SDL_GL_SetAttribute(SDL_GL_RED_SIZE, g_framebufferConfig.redBits);
    SDL_GL_SetAttribute(SDL_GL_GREEN_SIZE, g_framebufferConfig.greenBits);
    SDL_GL_SetAttribute(SDL_GL_BLUE_SIZE, g_framebufferConfig.blueBits);
    SDL_GL_SetAttribute(SDL_GL_ALPHA_SIZE, g_framebufferConfig.alphaBits);
    SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, g_framebufferConfig.depthBits);
    SDL_GL_SetAttribute(SDL_GL_STENCIL_SIZE, g_framebufferConfig.stencilBits);
    SDL_GL_SetAttribute(SDL_GL_MULTISAMPLEBUFFERS, g_framebufferConfig.samples > 0 ? 1 : 0);
    SDL_GL_SetAttribute(SDL_GL_MULTISAMPLESAMPLES, g_framebufferConfig.samples);
#endif
}

void libjglios_egl_swap_buffers(void) {
#if LIBJGLIOS_IOS_LEGACY_GLES
    if (g_window != nullptr) {
        SDL_PropertiesID properties = SDL_GetWindowProperties(g_window);
        GLuint drawableFramebuffer = static_cast<GLuint>(SDL_GetNumberProperty(
            properties,
            SDL_PROP_WINDOW_UIKIT_OPENGL_FRAMEBUFFER_NUMBER,
            0));
        GLuint drawableRenderbuffer = static_cast<GLuint>(SDL_GetNumberProperty(
            properties,
            SDL_PROP_WINDOW_UIKIT_OPENGL_RENDERBUFFER_NUMBER,
            0));
        if (drawableFramebuffer != 0) {
            glBindFramebuffer(GL_FRAMEBUFFER, drawableFramebuffer);
        }
        if (drawableRenderbuffer != 0) {
            glBindRenderbuffer(GL_RENDERBUFFER, drawableRenderbuffer);
        }
        if (!SDL_GL_SwapWindow(g_window)) {
            fail(-10, SDL_GetError());
        }
    }
#else
    if (g_display != EGL_NO_DISPLAY && g_surface != EGL_NO_SURFACE) {
        eglSwapBuffers(g_display, g_surface);
    }
#endif
}

void libjglios_egl_set_framebuffer_size(int width, int height) {
    if (width > 0) {
        g_framebufferWidth.store(width);
    }
    if (height > 0) {
        g_framebufferHeight.store(height);
    }
}

void libjglios_egl_set_display_metrics(int framebufferWidth, int framebufferHeight, int windowWidth, int windowHeight, float displayScale) {
    libjglios_egl_set_framebuffer_size(framebufferWidth, framebufferHeight);
    if (windowWidth > 0) {
        g_windowWidth.store(windowWidth);
    }
    if (windowHeight > 0) {
        g_windowHeight.store(windowHeight);
    }
    if (std::isfinite(displayScale) && displayScale > 0.0f) {
        g_displayScaleMillis.store(static_cast<int>(displayScale * 1000.0f + 0.5f));
    }
}

bool libjglios_egl_make_current(void) {
#if LIBJGLIOS_IOS_LEGACY_GLES
    if (g_window == nullptr || g_glContext == nullptr) {
        g_lastError = "SDL_GL_MakeCurrent failed: OpenGL ES is not initialized";
        return false;
    }
    if (!SDL_GL_MakeCurrent(g_window, g_glContext)) {
        fail(-9, SDL_GetError());
        return false;
    }
    g_lastError.clear();
    return true;
#else
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
#endif
}

int libjglios_egl_framebuffer_width(void) {
    int overriddenWidth = g_framebufferWidth.load();
    if (overriddenWidth > 0) {
        return overriddenWidth;
    }
#if LIBJGLIOS_IOS_LEGACY_GLES
    if (g_window == nullptr) {
        return 0;
    }
    int width = 0;
    int height = 0;
    SDL_GetWindowSizeInPixels(g_window, &width, &height);
    return width > 0 ? width : 0;
#else
    if (g_display == EGL_NO_DISPLAY || g_surface == EGL_NO_SURFACE) {
        return 0;
    }
    EGLint width = 0;
    if (!eglQuerySurface(g_display, g_surface, EGL_WIDTH, &width)) {
        return 0;
    }
    return width;
#endif
}

int libjglios_egl_framebuffer_height(void) {
    int overriddenHeight = g_framebufferHeight.load();
    if (overriddenHeight > 0) {
        return overriddenHeight;
    }
#if LIBJGLIOS_IOS_LEGACY_GLES
    if (g_window == nullptr) {
        return 0;
    }
    int width = 0;
    int height = 0;
    SDL_GetWindowSizeInPixels(g_window, &width, &height);
    return height > 0 ? height : 0;
#else
    if (g_display == EGL_NO_DISPLAY || g_surface == EGL_NO_SURFACE) {
        return 0;
    }
    EGLint height = 0;
    if (!eglQuerySurface(g_display, g_surface, EGL_HEIGHT, &height)) {
        return 0;
    }
    return height;
#endif
}

int libjglios_egl_window_width(void) {
    int overriddenWidth = g_windowWidth.load();
    if (overriddenWidth > 0) {
        return overriddenWidth;
    }
    if (g_window == nullptr) {
        return 0;
    }
    int width = 0;
    int height = 0;
    SDL_GetWindowSize(g_window, &width, &height);
    return width > 0 ? width : 0;
}

int libjglios_egl_window_height(void) {
    int overriddenHeight = g_windowHeight.load();
    if (overriddenHeight > 0) {
        return overriddenHeight;
    }
    if (g_window == nullptr) {
        return 0;
    }
    int width = 0;
    int height = 0;
    SDL_GetWindowSize(g_window, &width, &height);
    return height > 0 ? height : 0;
}

float libjglios_egl_display_scale(void) {
    int scaleMillis = g_displayScaleMillis.load();
    return scaleMillis > 0 ? static_cast<float>(scaleMillis) / 1000.0f : 1.0f;
}

const char* libjglios_egl_last_error(void) {
    return g_lastError.c_str();
}

void libjglios_egl_shutdown(void) {
#if LIBJGLIOS_IOS_LEGACY_GLES
    if (g_window != nullptr) {
        SDL_GL_MakeCurrent(g_window, nullptr);
    }
    if (g_glContext != nullptr) {
        SDL_GL_DestroyContext(g_glContext);
    }
    g_glContext = nullptr;
#else
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
    g_pendingMetalLayer = nullptr;
#endif
    g_pendingWindow = nullptr;
    g_framebufferWidth.store(0);
    g_framebufferHeight.store(0);
    g_windowWidth.store(0);
    g_windowHeight.store(0);
    g_displayScaleMillis.store(1000);
}

static void push_input_event(const LibJGLIOSQueuedInputEvent& queued) {
    std::lock_guard<std::mutex> lock(g_inputMutex);
    if (g_inputEvents.size() >= 256) {
        g_inputEvents.erase(g_inputEvents.begin());
    }
    g_inputEvents.push_back(queued);
}

static void push_device_event(int type, SDL_JoystickID id, bool gamepad) {
    LibJGLIOSQueuedInputEvent queued;
    queued.intData[0] = type;
    queued.intData[1] = static_cast<int>(id);
    queued.intData[2] = gamepad ? 1 : 0;
    push_input_event(queued);
}

static float normalize_gamepad_axis(Sint16 value, bool trigger) {
    if (trigger) {
        return value <= 0 ? 0.0f : static_cast<float>(value) / 32767.0f;
    }
    if (value == SDL_MIN_SINT16) {
        return -1.0f;
    }
    return static_cast<float>(value) / 32767.0f;
}

bool libjglios_device_rumble_supported(void) {
#if !TARGET_OS_IOS || TARGET_OS_SIMULATOR
    return false;
#else
    if (@available(iOS 13.0, *)) {
        return [CHHapticEngine capabilitiesForHardware].supportsHaptics;
    }
    return false;
#endif
}

void libjglios_device_stop_rumble(void) {
#if TARGET_OS_IOS && !TARGET_OS_SIMULATOR
    if (@available(iOS 13.0, *)) {
        std::lock_guard<std::mutex> lock(g_hapticMutex);
        if (g_hapticPlayer != nil) {
            NSError* error = nil;
            [g_hapticPlayer cancelAndReturnError:&error];
            g_hapticPlayer = nil;
        }
    }
#endif
}

void libjglios_device_rumble(float amountHigh, float amountLow, float duration) {
    float high = clamp01(amountHigh);
    float low = clamp01(amountLow);
    float intensity = std::max(high, low);
    if (intensity <= 0.0f || duration <= 0.0f || std::isnan(duration)) {
        libjglios_device_stop_rumble();
        return;
    }

    if (!libjglios_device_rumble_supported()) {
        return;
    }

#if TARGET_OS_IOS && !TARGET_OS_SIMULATOR
    if (@available(iOS 13.0, *)) {
        std::lock_guard<std::mutex> lock(g_hapticMutex);

        NSError* error = nil;
        if (g_hapticEngine == nil) {
            g_hapticEngine = [[CHHapticEngine alloc] initAndReturnError:&error];
            if (g_hapticEngine == nil) {
                return;
            }
            g_hapticEngine.playsHapticsOnly = YES;
            g_hapticEngine.autoShutdownEnabled = YES;
        }

        if (![g_hapticEngine startAndReturnError:&error]) {
            return;
        }

        if (g_hapticPlayer != nil) {
            [g_hapticPlayer cancelAndReturnError:&error];
            g_hapticPlayer = nil;
        }

        float sum = high + low;
        float sharpness = sum > 0.0f ? high / sum : 0.5f;
        NSTimeInterval hapticDuration = std::isinf(duration) && duration > 0.0f
                ? static_cast<NSTimeInterval>(21 * 24 * 60 * 60)
                : static_cast<NSTimeInterval>(duration);
        NSArray<CHHapticEventParameter*>* parameters = @[
            [[CHHapticEventParameter alloc] initWithParameterID:CHHapticEventParameterIDHapticIntensity
                                                          value:intensity],
            [[CHHapticEventParameter alloc] initWithParameterID:CHHapticEventParameterIDHapticSharpness
                                                          value:sharpness]
        ];
        CHHapticEvent* event = [[CHHapticEvent alloc] initWithEventType:CHHapticEventTypeHapticContinuous
                                                             parameters:parameters
                                                           relativeTime:0.0
                                                               duration:hapticDuration];
        CHHapticPattern* pattern = [[CHHapticPattern alloc] initWithEvents:@[event] parameters:@[] error:&error];
        if (pattern == nil) {
            return;
        }

        g_hapticPlayer = [g_hapticEngine createPlayerWithPattern:pattern error:&error];
        if (g_hapticPlayer == nil) {
            return;
        }
        if (![g_hapticPlayer startAtTime:CHHapticTimeImmediate error:&error]) {
            g_hapticPlayer = nil;
        }
    }
#endif
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
            queued.intData[4] = static_cast<int>(event->key.mod);
            push_input_event(queued);
            break;
        case SDL_EVENT_TEXT_INPUT:
            push_text_input_events(event->text.text);
            break;
        case SDL_EVENT_GAMEPAD_ADDED:
            push_device_event(7, event->gdevice.which, true);
            break;
        case SDL_EVENT_GAMEPAD_REMOVED:
            push_device_event(8, event->gdevice.which, true);
            break;
        case SDL_EVENT_JOYSTICK_ADDED:
            if (!SDL_IsGamepad(event->jdevice.which)) {
                push_device_event(7, event->jdevice.which, false);
            }
            break;
        case SDL_EVENT_JOYSTICK_REMOVED:
            if (!SDL_IsGamepad(event->jdevice.which)) {
                push_device_event(8, event->jdevice.which, false);
            }
            break;
        case SDL_EVENT_GAMEPAD_AXIS_MOTION:
            queued.intData[0] = 9;
            queued.intData[1] = static_cast<int>(event->gaxis.which);
            queued.intData[2] = static_cast<int>(event->gaxis.axis);
            queued.intData[3] = static_cast<int>(event->gaxis.value);
            queued.floatData[0] = normalize_gamepad_axis(
                event->gaxis.value,
                event->gaxis.axis == SDL_GAMEPAD_AXIS_LEFT_TRIGGER || event->gaxis.axis == SDL_GAMEPAD_AXIS_RIGHT_TRIGGER);
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
        case SDL_EVENT_JOYSTICK_AXIS_MOTION:
            if (SDL_IsGamepad(event->jaxis.which)) {
                break;
            }
            queued.intData[0] = 9;
            queued.intData[1] = static_cast<int>(event->jaxis.which);
            queued.intData[2] = static_cast<int>(event->jaxis.axis);
            queued.intData[3] = static_cast<int>(event->jaxis.value);
            queued.floatData[0] = normalize_gamepad_axis(event->jaxis.value, false);
            push_input_event(queued);
            break;
        case SDL_EVENT_JOYSTICK_BUTTON_DOWN:
        case SDL_EVENT_JOYSTICK_BUTTON_UP:
            if (SDL_IsGamepad(event->jbutton.which)) {
                break;
            }
            queued.intData[0] = 10;
            queued.intData[1] = static_cast<int>(event->jbutton.which);
            queued.intData[2] = static_cast<int>(event->jbutton.button);
            queued.intData[3] = event->type == SDL_EVENT_JOYSTICK_BUTTON_DOWN ? 1 : 0;
            push_input_event(queued);
            break;
        default:
            break;
    }
}

bool libjglios_input_poll_event(int intData[5], float floatData[4]) {
    std::lock_guard<std::mutex> lock(g_inputMutex);
    if (g_inputEvents.empty()) {
        return false;
    }

    const LibJGLIOSQueuedInputEvent queued = g_inputEvents.front();
    g_inputEvents.erase(g_inputEvents.begin());
    for (int i = 0; i < 5; ++i) {
        intData[i] = queued.intData[i];
    }
    for (int i = 0; i < 4; ++i) {
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
