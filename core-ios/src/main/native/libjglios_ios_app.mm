#include "libjglios_ios_launcher.h"

#define SDL_MAIN_USE_CALLBACKS 1
#include <SDL3/SDL.h>
#include <SDL3/SDL_main.h>
#if !LIBJGLIOS_IOS_LEGACY_GLES
#include <SDL3/SDL_metal.h>
#endif
#include <cstdlib>
#if !LIBJGLIOS_IOS_LEGACY_GLES
#import <QuartzCore/CAMetalLayer.h>
#endif
#import <UIKit/UIKit.h>

struct __graal_isolate_t;
typedef struct __graal_isolate_t graal_isolate_t;
struct __graal_isolatethread_t;
typedef struct __graal_isolatethread_t graal_isolatethread_t;
struct __graal_create_isolate_params_t;
typedef struct __graal_create_isolate_params_t graal_create_isolate_params_t;

extern "C" int graal_create_isolate(graal_create_isolate_params_t* params, graal_isolate_t** isolate, graal_isolatethread_t** thread);
extern "C" int graal_tear_down_isolate(graal_isolatethread_t* thread);
extern "C" int libjglios_app_start(graal_isolatethread_t* thread);
extern "C" int libjglios_app_frame(graal_isolatethread_t* thread);
extern "C" int libjglios_app_resize(graal_isolatethread_t* thread, int width, int height);
extern "C" int libjglios_app_stop(graal_isolatethread_t* thread);

extern "C" __attribute__((weak, visibility("default"))) int libjglios_app_configure(graal_isolatethread_t*) {
    return 0;
}

extern "C" void parkRunLoop(void) {
    SDL_Log("libJGLIOS_GRAAL_PARK_RUN_LOOP");
}

extern "C" void terminateRunLoop(void) {
    SDL_Log("libJGLIOS_GRAAL_TERMINATE_RUN_LOOP");
}

struct LibJGLIOSAppState {
    int frame = 0;
    int maxFrames = -1;
    int javaFrame = 0;
    SDL_Window* window = nullptr;
#if !LIBJGLIOS_IOS_LEGACY_GLES
    SDL_MetalView metalView = nullptr;
#endif
    graal_isolate_t* isolate = nullptr;
    graal_isolatethread_t* thread = nullptr;
};

static SDL_AppResult fail_app_init(const char* message) {
    const char* sdlError = SDL_GetError();
    fprintf(stderr, "libJGLIOS_APP_INIT_FAILED=%s SDL_ERROR=%s\n", message, sdlError ? sdlError : "");
    fflush(stderr);
    SDL_Log("libJGLIOS_APP_INIT_FAILED=%s SDL_ERROR=%s", message, sdlError ? sdlError : "");
    return SDL_APP_FAILURE;
}

static int positive_rounded(CGFloat value) {
    return value > 0 ? static_cast<int>(value + 0.5f) : 0;
}

static CGFloat positive_display_scale(UIScreen* screen
#if !LIBJGLIOS_IOS_LEGACY_GLES
        , CAMetalLayer* metalLayer
#endif
) {
#if !LIBJGLIOS_IOS_LEGACY_GLES
    CGFloat scale = metalLayer != nullptr && metalLayer.contentsScale > 0 ? metalLayer.contentsScale : 0;
#else
    CGFloat scale = 0;
#endif
    if (scale <= 0 && screen != nullptr && screen.nativeScale > 0) {
        scale = screen.nativeScale;
    }
    if (scale <= 0 && screen != nullptr && screen.scale > 0) {
        scale = screen.scale;
    }
    return scale > 0 ? scale : 1;
}

#if LIBJGLIOS_IOS_LEGACY_GLES
static void update_framebuffer_size(SDL_Window* window, UIScreen* screen, int fallbackWidth, int fallbackHeight) {
    int framebufferWidth = 0;
    int framebufferHeight = 0;
    int windowWidth = 0;
    int windowHeight = 0;
    CGFloat scale = positive_display_scale(screen);
    if (window != nullptr) {
        SDL_GetWindowSize(window, &windowWidth, &windowHeight);
        SDL_GetWindowSizeInPixels(window, &framebufferWidth, &framebufferHeight);
    }
    if ((windowWidth <= 0 || windowHeight <= 0) && screen != nullptr) {
        CGRect bounds = screen.bounds;
        if (bounds.size.width > 0 && bounds.size.height > 0) {
            windowWidth = positive_rounded(bounds.size.width);
            windowHeight = positive_rounded(bounds.size.height);
        }
    }
    if (windowWidth <= 0) {
        windowWidth = fallbackWidth > 0 ? fallbackWidth : positive_rounded(framebufferWidth / scale);
    }
    if (windowHeight <= 0) {
        windowHeight = fallbackHeight > 0 ? fallbackHeight : positive_rounded(framebufferHeight / scale);
    }
    if (framebufferWidth <= 0) {
        framebufferWidth = positive_rounded(windowWidth * scale);
    }
    if (framebufferHeight <= 0) {
        framebufferHeight = positive_rounded(windowHeight * scale);
    }
    libjglios_egl_set_display_metrics(framebufferWidth, framebufferHeight, windowWidth, windowHeight, static_cast<float>(scale));
    SDL_Log("libJGLIOS_DISPLAY_METRICS framebuffer=%dx%d window=%dx%d scale=%.3f",
        framebufferWidth, framebufferHeight, windowWidth, windowHeight, static_cast<double>(scale));
}
#else
static void update_framebuffer_size(SDL_Window* window, CAMetalLayer* metalLayer, UIScreen* screen, int fallbackWidth, int fallbackHeight) {
    int framebufferWidth = 0;
    int framebufferHeight = 0;
    int windowWidth = 0;
    int windowHeight = 0;
    CGFloat scale = positive_display_scale(screen, metalLayer);
    if (metalLayer != nullptr) {
        if ([metalLayer.delegate isKindOfClass:[UIView class]]) {
            UIView* metalUIView = (UIView*)metalLayer.delegate;
            CGRect bounds = metalUIView.window != nullptr ? metalUIView.window.bounds : metalUIView.bounds;
            if (bounds.size.width <= 0 || bounds.size.height <= 0) {
                bounds = screen != nullptr ? screen.bounds : CGRectZero;
            }
            if (bounds.size.width > 0 && bounds.size.height > 0) {
                windowWidth = positive_rounded(bounds.size.width);
                windowHeight = positive_rounded(bounds.size.height);
                metalUIView.frame = bounds;
                metalUIView.bounds = CGRectMake(0, 0, bounds.size.width, bounds.size.height);
                metalLayer.frame = metalUIView.bounds;
                metalLayer.bounds = metalUIView.bounds;
                metalLayer.contentsScale = scale;
                metalLayer.drawableSize = CGSizeMake(bounds.size.width * scale, bounds.size.height * scale);
            }
        }
        CGSize drawableSize = metalLayer.drawableSize;
        framebufferWidth = positive_rounded(drawableSize.width);
        framebufferHeight = positive_rounded(drawableSize.height);
    }
    if ((windowWidth <= 0 || windowHeight <= 0) && window != nullptr) {
        SDL_GetWindowSize(window, &windowWidth, &windowHeight);
    }
    if ((framebufferWidth <= 0 || framebufferHeight <= 0) && window != nullptr) {
        SDL_GetWindowSizeInPixels(window, &framebufferWidth, &framebufferHeight);
    }
    if ((windowWidth <= 0 || windowHeight <= 0) && screen != nullptr) {
        CGRect bounds = screen.bounds;
        if (bounds.size.width > 0 && bounds.size.height > 0) {
            windowWidth = positive_rounded(bounds.size.width);
            windowHeight = positive_rounded(bounds.size.height);
        }
    }
    if (windowWidth <= 0) {
        windowWidth = fallbackWidth > 0 ? fallbackWidth : positive_rounded(framebufferWidth / scale);
    }
    if (windowHeight <= 0) {
        windowHeight = fallbackHeight > 0 ? fallbackHeight : positive_rounded(framebufferHeight / scale);
    }
    if (framebufferWidth <= 0) {
        framebufferWidth = positive_rounded(windowWidth * scale);
    }
    if (framebufferHeight <= 0) {
        framebufferHeight = positive_rounded(windowHeight * scale);
    }
    libjglios_egl_set_display_metrics(framebufferWidth, framebufferHeight, windowWidth, windowHeight, static_cast<float>(scale));
    SDL_Log("libJGLIOS_DISPLAY_METRICS framebuffer=%dx%d window=%dx%d scale=%.3f",
        framebufferWidth, framebufferHeight, windowWidth, windowHeight, static_cast<double>(scale));
}
#endif

static void destroy_windowing(LibJGLIOSAppState* state) {
    libjglios_egl_shutdown();
    libjglios_app_set_window(nullptr);
#if !LIBJGLIOS_IOS_LEGACY_GLES
    if (state->metalView != nullptr) {
        SDL_Metal_DestroyView(state->metalView);
        state->metalView = nullptr;
    }
#endif
    if (state->window != nullptr) {
        SDL_DestroyWindow(state->window);
        state->window = nullptr;
    }
}

extern "C" SDL_AppResult SDL_AppInit(void** appstate, int, char**) {
    libjglios_app_reset_quit_request();
    auto* state = new LibJGLIOSAppState();
    *appstate = state;

    if (const char* maxFramesEnv = std::getenv("LIBJGLIOS_MAX_FRAMES")) {
        state->maxFrames = std::atoi(maxFramesEnv);
    }

    SDL_SetHint(SDL_HINT_ORIENTATIONS, "Portrait LandscapeLeft LandscapeRight");
    SDL_SetHint(SDL_HINT_TOUCH_MOUSE_EVENTS, "0");

    if (!SDL_InitSubSystem(SDL_INIT_VIDEO | SDL_INIT_EVENTS | SDL_INIT_GAMEPAD | SDL_INIT_JOYSTICK)) {
        return fail_app_init("SDL_InitSubSystem");
    }

    int windowWidth = 0;
    int windowHeight = 0;
    UIScreen* screen = [UIScreen mainScreen];
    CGRect screenBounds = screen.bounds;
    if (screenBounds.size.width > 0 && screenBounds.size.height > 0) {
        windowWidth = positive_rounded(screenBounds.size.width);
        windowHeight = positive_rounded(screenBounds.size.height);
    }
    const SDL_DisplayMode* displayMode = SDL_GetDesktopDisplayMode(SDL_GetPrimaryDisplay());
    if ((windowWidth <= 0 || windowHeight <= 0) && displayMode != nullptr) {
        windowWidth = displayMode->w;
        windowHeight = displayMode->h;
    }
    if (windowWidth <= 0 || windowHeight <= 0) {
        windowWidth = 800;
        windowHeight = 600;
    }

    state->window = SDL_CreateWindow(
        "libJGLIOS",
        windowWidth,
        windowHeight,
        SDL_WINDOW_FULLSCREEN |
#if LIBJGLIOS_IOS_LEGACY_GLES
        SDL_WINDOW_OPENGL |
#else
        SDL_WINDOW_METAL |
#endif
        SDL_WINDOW_RESIZABLE);
    if (state->window == nullptr) {
        return fail_app_init("SDL_CreateWindow");
    }
    libjglios_app_set_window(state->window);
#if LIBJGLIOS_IOS_LEGACY_GLES
    update_framebuffer_size(state->window, screen, windowWidth, windowHeight);
    libjglios_egl_set_pending_sdl_window(state->window);
#else
    state->metalView = SDL_Metal_CreateView(state->window);
    if (state->metalView == nullptr) {
        destroy_windowing(state);
        return fail_app_init("SDL_Metal_CreateView");
    }

    void* metalLayer = SDL_Metal_GetLayer(state->metalView);
    if (metalLayer == nullptr) {
        destroy_windowing(state);
        return fail_app_init("SDL_Metal_GetLayer");
    }
    CAMetalLayer* metalLayerObject = (__bridge CAMetalLayer*)metalLayer;
    CGFloat screenScale = positive_display_scale(screen, nil);
    if ([metalLayerObject.delegate isKindOfClass:[UIView class]]) {
        UIView* metalUIView = (UIView*)metalLayerObject.delegate;
        CGRect appFrame = CGRectMake(0, 0, windowWidth, windowHeight);
        metalUIView.frame = appFrame;
        metalUIView.bounds = appFrame;
    }
    metalLayerObject.frame = CGRectMake(0, 0, windowWidth, windowHeight);
    metalLayerObject.bounds = CGRectMake(0, 0, windowWidth, windowHeight);
    metalLayerObject.contentsScale = screenScale;
    metalLayerObject.drawableSize = CGSizeMake(windowWidth * screenScale, windowHeight * screenScale);
    update_framebuffer_size(state->window, metalLayerObject, screen, windowWidth, windowHeight);
    libjglios_egl_set_pending_metal_layer(metalLayer);
#endif

    int isolateResult = graal_create_isolate(nullptr, &state->isolate, &state->thread);
    if (isolateResult != 0 || state->thread == nullptr) {
        fprintf(stderr, "libJGLIOS_GRAAL_CREATE_ISOLATE_FAILED=%d\n", isolateResult);
        fflush(stderr);
        SDL_Log("libJGLIOS_GRAAL_CREATE_ISOLATE_FAILED=%d", isolateResult);
        destroy_windowing(state);
        return SDL_APP_FAILURE;
    }

    int configureResult = libjglios_app_configure(state->thread);
    if (configureResult != 0) {
        fprintf(stderr, "libJGLIOS_GRAAL_CONFIGURE_FAILED=%d\n", configureResult);
        fflush(stderr);
        SDL_Log("libJGLIOS_GRAAL_CONFIGURE_FAILED=%d", configureResult);
        graal_tear_down_isolate(state->thread);
        state->thread = nullptr;
        state->isolate = nullptr;
        destroy_windowing(state);
        return SDL_APP_FAILURE;
    }

    if (!libjglios_egl_is_initialized()) {
        int eglResult = libjglios_egl_init_pending();
        if (eglResult != 0) {
            fprintf(stderr, "libJGLIOS_EGL_INIT_FAILED=%d error=%s\n", eglResult, libjglios_egl_last_error());
            fflush(stderr);
            SDL_Log("libJGLIOS_EGL_INIT_FAILED=%d error=%s", eglResult, libjglios_egl_last_error());
            graal_tear_down_isolate(state->thread);
            state->thread = nullptr;
            state->isolate = nullptr;
            destroy_windowing(state);
            return SDL_APP_FAILURE;
        }
    }

    int startResult = libjglios_app_start(state->thread);
    if (startResult != 0) {
        fprintf(stderr, "libJGLIOS_GRAAL_START_FAILED=%d\n", startResult);
        fflush(stderr);
        SDL_Log("libJGLIOS_GRAAL_START_FAILED=%d", startResult);
        graal_tear_down_isolate(state->thread);
        state->thread = nullptr;
        state->isolate = nullptr;
        destroy_windowing(state);
        return SDL_APP_FAILURE;
    }

    return SDL_APP_CONTINUE;
}

extern "C" SDL_AppResult SDL_AppIterate(void* appstate) {
    auto* state = static_cast<LibJGLIOSAppState*>(appstate);
    state->frame++;

    int javaFrame = libjglios_app_frame(state->thread);
    if (javaFrame < 0) {
        fprintf(stderr, "libJGLIOS_GRAAL_FRAME_FAILED=%d\n", javaFrame);
        fflush(stderr);
        SDL_Log("libJGLIOS_GRAAL_FRAME_FAILED=%d", javaFrame);
        return SDL_APP_FAILURE;
    }

    state->javaFrame = javaFrame;
    if (state->frame == 1 || state->frame % 120 == 0) {
        SDL_Log("libJGLIOS_GRAAL_NATIVE_FRAME frame=%d", state->frame);
    }

    if (libjglios_app_quit_requested()) {
        return SDL_APP_SUCCESS;
    }

    if (state->maxFrames > 0 && state->frame >= state->maxFrames) {
        return SDL_APP_SUCCESS;
    }

    return SDL_APP_CONTINUE;
}

extern "C" SDL_AppResult SDL_AppEvent(void* appstate, SDL_Event* event) {
    if (event->type == SDL_EVENT_QUIT) {
        return SDL_APP_SUCCESS;
    }
    if (event->type == SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED
            || event->type == SDL_EVENT_WINDOW_RESIZED
            || event->type == SDL_EVENT_DISPLAY_ORIENTATION
            || event->type == SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED) {
        auto* state = static_cast<LibJGLIOSAppState*>(appstate);
        int width = 0;
        int height = 0;
        SDL_Window* window = nullptr;
        if (event->type == SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED || event->type == SDL_EVENT_WINDOW_RESIZED) {
            window = SDL_GetWindowFromID(event->window.windowID);
        }
        if (window == nullptr && state != nullptr) {
            window = state->window;
        }
        if (window != nullptr) {
            SDL_GetWindowSizeInPixels(window, &width, &height);
        }
        if (state != nullptr) {
#if LIBJGLIOS_IOS_LEGACY_GLES
            update_framebuffer_size(window, [UIScreen mainScreen], width, height);
#else
            if (state->metalView != nullptr) {
                void* metalLayer = SDL_Metal_GetLayer(state->metalView);
                CAMetalLayer* metalLayerObject = (__bridge CAMetalLayer*)metalLayer;
                update_framebuffer_size(window, metalLayerObject, [UIScreen mainScreen], width, height);
            } else {
                libjglios_egl_set_framebuffer_size(width, height);
            }
#endif
        } else {
            libjglios_egl_set_framebuffer_size(width, height);
        }
        width = libjglios_egl_framebuffer_width();
        height = libjglios_egl_framebuffer_height();
        if (state != nullptr && state->thread != nullptr) {
            libjglios_app_resize(state->thread, width, height);
        }
        return SDL_APP_CONTINUE;
    }
    libjglios_input_enqueue_sdl_event(event);
    return SDL_APP_CONTINUE;
}

extern "C" void SDL_AppQuit(void* appstate, SDL_AppResult result) {
    auto* state = static_cast<LibJGLIOSAppState*>(appstate);
    if (state->thread != nullptr) {
        int stopResult = libjglios_app_stop(state->thread);
        fprintf(stderr, "libJGLIOS_GRAAL_STOP result=%d frames=%d\n", stopResult, state->frame);
        fflush(stderr);
        SDL_Log("libJGLIOS_GRAAL_STOP result=%d frames=%d", stopResult, state->frame);

        int tearDownResult = graal_tear_down_isolate(state->thread);
        fprintf(stderr, "libJGLIOS_GRAAL_TEAR_DOWN=%d\n", tearDownResult);
        fflush(stderr);
        SDL_Log("libJGLIOS_GRAAL_TEAR_DOWN=%d", tearDownResult);
        state->thread = nullptr;
        state->isolate = nullptr;
    }
    destroy_windowing(state);
    fprintf(stderr, "libJGLIOS_APP_QUIT result=%d\n", static_cast<int>(result));
    fflush(stderr);
    SDL_Log("libJGLIOS_APP_QUIT result=%d", static_cast<int>(result));
    delete state;
}
