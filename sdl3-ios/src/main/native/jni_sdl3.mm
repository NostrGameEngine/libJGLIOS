#include <jni.h>
#include <algorithm>
#include <cstdint>
#include <vector>

#include <SDL3/SDL.h>
#include <SDL3/SDL_metal.h>

namespace {

template <typename T>
inline T* ptr(jlong value) {
    return reinterpret_cast<T*>(static_cast<uintptr_t>(value));
}

template <typename T>
inline jlong addr(T* value) {
    return static_cast<jlong>(reinterpret_cast<uintptr_t>(value));
}

inline SDL_GLContext glContext(jlong value) {
    return reinterpret_cast<SDL_GLContext>(static_cast<uintptr_t>(value));
}

inline Uint16 clampUint16(jint value) {
    return static_cast<Uint16>(std::max(0, std::min(0xffff, static_cast<int>(value))));
}

inline Uint32 clampUint32(jint value) {
    return static_cast<Uint32>(std::max(0, static_cast<int>(value)));
}

jintArray joystickIdsToArray(JNIEnv* env, SDL_JoystickID* ids, int count) {
    if (ids == nullptr || count <= 0) {
        if (ids != nullptr) {
            SDL_free(ids);
        }
        return env->NewIntArray(0);
    }

    jintArray result = env->NewIntArray(count);
    if (result != nullptr) {
        std::vector<jint> values(static_cast<size_t>(count));
        for (int i = 0; i < count; ++i) {
            values[static_cast<size_t>(i)] = static_cast<jint>(ids[i]);
        }
        env->SetIntArrayRegion(result, 0, count, values.data());
    }
    SDL_free(ids);
    return result;
}

} // namespace

extern "C" {

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1CaptureMouse(JNIEnv* env, jclass, jboolean enabled) {
    auto result = SDL_CaptureMouse(enabled);
    return static_cast<jboolean>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1CloseGamepad(JNIEnv* env, jclass, jlong gamepad) {
    SDL_CloseGamepad(ptr<SDL_Gamepad>(gamepad));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1CloseJoystick(JNIEnv* env, jclass, jlong joystick) {
    SDL_CloseJoystick(ptr<SDL_Joystick>(joystick));
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1CreateColorCursor(JNIEnv* env, jclass, jlong surface, jint hot_x, jint hot_y) {
    auto result = SDL_CreateColorCursor(ptr<SDL_Surface>(surface), hot_x, hot_y);
    return addr(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1CreateSurfaceFrom(JNIEnv* env, jclass, jint width, jint height, jint format, jlong pixels, jint pitch) {
    auto result = SDL_CreateSurfaceFrom(width, height, static_cast<SDL_PixelFormat>(format), ptr<void>(pixels), pitch);
    return addr(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1CreateWindow(JNIEnv* env, jclass, jstring title, jint w, jint h, jlong flags) {
    const char* title_chars = env->GetStringUTFChars(title, nullptr);
    auto result = SDL_CreateWindow(title_chars, w, h, static_cast<SDL_WindowFlags>(flags));
    env->ReleaseStringUTFChars(title, title_chars);
    return addr(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1Delay(JNIEnv* env, jclass, jint ms) {
    SDL_Delay(ms);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1DestroyAudioStream(JNIEnv* env, jclass, jlong stream) {
    SDL_DestroyAudioStream(ptr<SDL_AudioStream>(stream));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1DestroyCursor(JNIEnv* env, jclass, jlong cursor) {
    SDL_DestroyCursor(ptr<SDL_Cursor>(cursor));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1DestroySurface(JNIEnv* env, jclass, jlong surface) {
    SDL_DestroySurface(ptr<SDL_Surface>(surface));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1DestroyWindow(JNIEnv* env, jclass, jlong window) {
    SDL_DestroyWindow(ptr<SDL_Window>(window));
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GL_1CreateContext(JNIEnv* env, jclass, jlong window) {
    auto result = SDL_GL_CreateContext(ptr<SDL_Window>(window));
    return addr(reinterpret_cast<void*>(result));
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GL_1DestroyContext(JNIEnv* env, jclass, jlong context) {
    auto result = SDL_GL_DestroyContext(glContext(context));
    return static_cast<jboolean>(result);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GL_1MakeCurrent(JNIEnv* env, jclass, jlong window, jlong context) {
    auto result = SDL_GL_MakeCurrent(ptr<SDL_Window>(window), glContext(context));
    return static_cast<jboolean>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GL_1ResetAttributes(JNIEnv* env, jclass) {
    SDL_GL_ResetAttributes();
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GL_1SetAttribute(JNIEnv* env, jclass, jint attr, jint value) {
    auto result = SDL_GL_SetAttribute(static_cast<SDL_GLAttr>(attr), value);
    return static_cast<jboolean>(result);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GL_1SetSwapInterval(JNIEnv* env, jclass, jint interval) {
    auto result = SDL_GL_SetSwapInterval(interval);
    return static_cast<jboolean>(result);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GL_1SwapWindow(JNIEnv* env, jclass, jlong window) {
    auto result = SDL_GL_SwapWindow(ptr<SDL_Window>(window));
    return static_cast<jboolean>(result);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetAudioStreamData(JNIEnv* env, jclass, jlong stream, jlong buf, jint len) {
    auto result = SDL_GetAudioStreamData(ptr<SDL_AudioStream>(stream), ptr<void>(buf), len);
    return static_cast<jint>(result);
}

JNIEXPORT jstring JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetBasePath(JNIEnv* env, jclass) {
    const char* result = SDL_GetBasePath();
    if (result == nullptr) {
        return nullptr;
    }
    return env->NewStringUTF(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetCurrentDisplayMode(JNIEnv* env, jclass, jint displayID) {
    auto result = SDL_GetCurrentDisplayMode(static_cast<SDL_DisplayID>(displayID));
    return addr(result);
}

JNIEXPORT jstring JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetCurrentVideoDriver(JNIEnv* env, jclass) {
    const char* result = SDL_GetCurrentVideoDriver();
    if (result == nullptr) {
        return nullptr;
    }
    return env->NewStringUTF(result);
}

JNIEXPORT jstring JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetDisplayName(JNIEnv* env, jclass, jint displayID) {
    const char* result = SDL_GetDisplayName(static_cast<SDL_DisplayID>(displayID));
    if (result == nullptr) {
        return nullptr;
    }
    return env->NewStringUTF(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetDisplays(JNIEnv* env, jclass, jintArray count) {
    jint* count_elems = env->GetIntArrayElements(count, nullptr);
    auto result = SDL_GetDisplays(reinterpret_cast<int*>(count_elems));
    env->ReleaseIntArrayElements(count, count_elems, 0);
    return addr(result);
}

JNIEXPORT jstring JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetError(JNIEnv* env, jclass) {
    const char* result = SDL_GetError();
    if (result == nullptr) {
        return nullptr;
    }
    return env->NewStringUTF(result);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetGamepadButtonLabel(JNIEnv*, jclass, jlong gamepad, jint button) {
    auto result = SDL_GetGamepadButtonLabel(ptr<SDL_Gamepad>(gamepad), static_cast<SDL_GamepadButton>(button));
    return static_cast<jint>(result);
}

JNIEXPORT jstring JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetGamepadName(JNIEnv* env, jclass, jlong gamepad) {
    const char* result = SDL_GetGamepadName(ptr<SDL_Gamepad>(gamepad));
    if (result == nullptr) {
        return nullptr;
    }
    return env->NewStringUTF(result);
}

JNIEXPORT jintArray JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetGamepads(JNIEnv* env, jclass) {
    int count = 0;
    SDL_JoystickID* result = SDL_GetGamepads(&count);
    return joystickIdsToArray(env, result, count);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetGlobalProperties(JNIEnv* env, jclass) {
    auto result = SDL_GetGlobalProperties();
    return static_cast<jint>(result);
}

JNIEXPORT jstring JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetHint(JNIEnv* env, jclass, jstring name) {
    const char* name_chars = env->GetStringUTFChars(name, nullptr);
    const char* result = SDL_GetHint(name_chars);
    env->ReleaseStringUTFChars(name, name_chars);
    if (result == nullptr) {
        return nullptr;
    }
    return env->NewStringUTF(result);
}

JNIEXPORT jstring JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetKeyName(JNIEnv* env, jclass, jint key) {
    const char* result = SDL_GetKeyName(key);
    if (result == nullptr) {
        return nullptr;
    }
    return env->NewStringUTF(result);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetMouseState(JNIEnv* env, jclass, jfloatArray x, jfloatArray y) {
    jfloat* x_elems = env->GetFloatArrayElements(x, nullptr);
    jfloat* y_elems = env->GetFloatArrayElements(y, nullptr);
    auto result = SDL_GetMouseState(reinterpret_cast<jfloat*>(x_elems), reinterpret_cast<jfloat*>(y_elems));
    env->ReleaseFloatArrayElements(y, y_elems, 0);
    env->ReleaseFloatArrayElements(x, x_elems, 0);
    return static_cast<jint>(result);
}

JNIEXPORT jstring JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetJoystickName(JNIEnv* env, jclass, jlong joystick) {
    const char* result = SDL_GetJoystickName(ptr<SDL_Joystick>(joystick));
    if (result == nullptr) {
        return nullptr;
    }
    return env->NewStringUTF(result);
}

JNIEXPORT jintArray JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetJoysticks(JNIEnv* env, jclass) {
    int count = 0;
    SDL_JoystickID* result = SDL_GetJoysticks(&count);
    return joystickIdsToArray(env, result, count);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetNumJoystickAxes(JNIEnv*, jclass, jlong joystick) {
    auto result = SDL_GetNumJoystickAxes(ptr<SDL_Joystick>(joystick));
    return static_cast<jint>(result);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetNumJoystickButtons(JNIEnv*, jclass, jlong joystick) {
    auto result = SDL_GetNumJoystickButtons(ptr<SDL_Joystick>(joystick));
    return static_cast<jint>(result);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetPrimaryDisplay(JNIEnv* env, jclass) {
    auto result = SDL_GetPrimaryDisplay();
    return static_cast<jint>(result);
}

JNIEXPORT jstring JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetScancodeName(JNIEnv* env, jclass, jint scancode) {
    const char* result = SDL_GetScancodeName(static_cast<SDL_Scancode>(scancode));
    if (result == nullptr) {
        return nullptr;
    }
    return env->NewStringUTF(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetTicks(JNIEnv* env, jclass) {
    auto result = SDL_GetTicks();
    return static_cast<jlong>(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetTicksNS(JNIEnv* env, jclass) {
    auto result = SDL_GetTicksNS();
    return static_cast<jlong>(result);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetWindowID(JNIEnv* env, jclass, jlong window) {
    auto result = SDL_GetWindowID(ptr<SDL_Window>(window));
    return static_cast<jint>(result);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetWindowPosition(JNIEnv* env, jclass, jlong window, jintArray x, jintArray y) {
    jint* x_elems = env->GetIntArrayElements(x, nullptr);
    jint* y_elems = env->GetIntArrayElements(y, nullptr);
    auto result = SDL_GetWindowPosition(ptr<SDL_Window>(window), reinterpret_cast<int*>(x_elems), reinterpret_cast<int*>(y_elems));
    env->ReleaseIntArrayElements(y, y_elems, 0);
    env->ReleaseIntArrayElements(x, x_elems, 0);
    return static_cast<jboolean>(result);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetWindowRelativeMouseMode(JNIEnv* env, jclass, jlong window) {
    auto result = SDL_GetWindowRelativeMouseMode(ptr<SDL_Window>(window));
    return static_cast<jboolean>(result);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetWindowSize(JNIEnv* env, jclass, jlong window, jintArray w, jintArray h) {
    jint* w_elems = env->GetIntArrayElements(w, nullptr);
    jint* h_elems = env->GetIntArrayElements(h, nullptr);
    auto result = SDL_GetWindowSize(ptr<SDL_Window>(window), reinterpret_cast<int*>(w_elems), reinterpret_cast<int*>(h_elems));
    env->ReleaseIntArrayElements(h, h_elems, 0);
    env->ReleaseIntArrayElements(w, w_elems, 0);
    return static_cast<jboolean>(result);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1GetWindowSizeInPixels(JNIEnv* env, jclass, jlong window, jintArray w, jintArray h) {
    jint* w_elems = env->GetIntArrayElements(w, nullptr);
    jint* h_elems = env->GetIntArrayElements(h, nullptr);
    auto result = SDL_GetWindowSizeInPixels(ptr<SDL_Window>(window), reinterpret_cast<int*>(w_elems), reinterpret_cast<int*>(h_elems));
    env->ReleaseIntArrayElements(h, h_elems, 0);
    env->ReleaseIntArrayElements(w, w_elems, 0);
    return static_cast<jboolean>(result);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1HideCursor(JNIEnv* env, jclass) {
    auto result = SDL_HideCursor();
    return static_cast<jboolean>(result);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1Init(JNIEnv* env, jclass, jint flags) {
    auto result = SDL_Init(static_cast<SDL_InitFlags>(flags));
    return static_cast<jboolean>(result);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1InitSubSystem(JNIEnv* env, jclass, jint flags) {
    auto result = SDL_InitSubSystem(static_cast<SDL_InitFlags>(flags));
    return static_cast<jboolean>(result);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1IsGamepad(JNIEnv*, jclass, jint instance_id) {
    auto result = SDL_IsGamepad(static_cast<SDL_JoystickID>(instance_id));
    return static_cast<jboolean>(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1Metal_1CreateView(JNIEnv* env, jclass, jlong window) {
    auto result = SDL_Metal_CreateView(ptr<SDL_Window>(window));
    return addr(reinterpret_cast<void*>(result));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1Metal_1DestroyView(JNIEnv* env, jclass, jlong view) {
    SDL_Metal_DestroyView(reinterpret_cast<SDL_MetalView>(ptr<void>(view)));
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1Metal_1GetLayer(JNIEnv* env, jclass, jlong view) {
    auto result = SDL_Metal_GetLayer(reinterpret_cast<SDL_MetalView>(ptr<void>(view)));
    return addr(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1OpenAudioDeviceStream(JNIEnv* env, jclass, jint devid, jlong spec, jlong callback, jlong userdata) {
    auto result = SDL_OpenAudioDeviceStream(
        static_cast<SDL_AudioDeviceID>(devid),
        ptr<const SDL_AudioSpec>(spec),
        reinterpret_cast<SDL_AudioStreamCallback>(static_cast<uintptr_t>(callback)),
        ptr<void>(userdata));
    return addr(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1OpenGamepad(JNIEnv* env, jclass, jint instance_id) {
    auto result = SDL_OpenGamepad(instance_id);
    return addr(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1OpenJoystick(JNIEnv* env, jclass, jint instance_id) {
    auto result = SDL_OpenJoystick(instance_id);
    return addr(result);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1PauseAudioStreamDevice(JNIEnv* env, jclass, jlong stream) {
    auto result = SDL_PauseAudioStreamDevice(ptr<SDL_AudioStream>(stream));
    return static_cast<jint>(result);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1PollEvent(JNIEnv* env, jclass, jlong event) {
    auto result = SDL_PollEvent(ptr<SDL_Event>(event));
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1PumpEvents(JNIEnv* env, jclass) {
    SDL_PumpEvents();
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1PutAudioStreamData(JNIEnv* env, jclass, jlong stream, jlong buf, jint len) {
    auto result = SDL_PutAudioStreamData(ptr<SDL_AudioStream>(stream), ptr<const void>(buf), len);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1Quit(JNIEnv* env, jclass) {
    SDL_Quit();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1QuitSubSystem(JNIEnv* env, jclass, jint flags) {
    SDL_QuitSubSystem(static_cast<SDL_InitFlags>(flags));
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1ResumeAudioStreamDevice(JNIEnv* env, jclass, jlong stream) {
    auto result = SDL_ResumeAudioStreamDevice(ptr<SDL_AudioStream>(stream));
    return static_cast<jint>(result);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1RumbleGamepad(JNIEnv*, jclass, jlong gamepad, jint lowFrequency, jint highFrequency, jint durationMs) {
    auto result = SDL_RumbleGamepad(
        ptr<SDL_Gamepad>(gamepad),
        clampUint16(lowFrequency),
        clampUint16(highFrequency),
        clampUint32(durationMs));
    return static_cast<jboolean>(result);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1RumbleJoystick(JNIEnv*, jclass, jlong joystick, jint lowFrequency, jint highFrequency, jint durationMs) {
    auto result = SDL_RumbleJoystick(
        ptr<SDL_Joystick>(joystick),
        clampUint16(lowFrequency),
        clampUint16(highFrequency),
        clampUint32(durationMs));
    return static_cast<jboolean>(result);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1SetCursor(JNIEnv* env, jclass, jlong cursor) {
    auto result = SDL_SetCursor(ptr<SDL_Cursor>(cursor));
    return static_cast<jboolean>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1SetGamepadEventsEnabled(JNIEnv*, jclass, jboolean enabled) {
    SDL_SetGamepadEventsEnabled(enabled == JNI_TRUE);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1SetHint(JNIEnv* env, jclass, jstring name, jstring value) {
    const char* name_chars = env->GetStringUTFChars(name, nullptr);
    const char* value_chars = env->GetStringUTFChars(value, nullptr);
    auto result = SDL_SetHint(name_chars, value_chars);
    env->ReleaseStringUTFChars(value, value_chars);
    env->ReleaseStringUTFChars(name, name_chars);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1SetJoystickEventsEnabled(JNIEnv*, jclass, jboolean enabled) {
    SDL_SetJoystickEventsEnabled(enabled == JNI_TRUE);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1SetWindowIcon(JNIEnv* env, jclass, jlong window, jlong iconSurface) {
    auto result = SDL_SetWindowIcon(ptr<SDL_Window>(window), ptr<SDL_Surface>(iconSurface));
    return static_cast<jboolean>(result);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1SetWindowMouseGrab(JNIEnv* env, jclass, jlong window, jboolean grabbed) {
    auto result = SDL_SetWindowMouseGrab(ptr<SDL_Window>(window), grabbed);
    return static_cast<jboolean>(result);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1SetWindowPosition(JNIEnv* env, jclass, jlong window, jint x, jint y) {
    auto result = SDL_SetWindowPosition(ptr<SDL_Window>(window), x, y);
    return static_cast<jboolean>(result);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1SetWindowRelativeMouseMode(JNIEnv* env, jclass, jlong window, jboolean enabled) {
    auto result = SDL_SetWindowRelativeMouseMode(ptr<SDL_Window>(window), enabled);
    return static_cast<jboolean>(result);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1SetWindowTitle(JNIEnv* env, jclass, jlong window, jstring title) {
    const char* title_chars = env->GetStringUTFChars(title, nullptr);
    auto result = SDL_SetWindowTitle(ptr<SDL_Window>(window), title_chars);
    env->ReleaseStringUTFChars(title, title_chars);
    return static_cast<jboolean>(result);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1ShowCursor(JNIEnv* env, jclass) {
    auto result = SDL_ShowCursor();
    return static_cast<jboolean>(result);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1ShowWindow(JNIEnv* env, jclass, jlong window) {
    auto result = SDL_ShowWindow(ptr<SDL_Window>(window));
    return static_cast<jboolean>(result);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1StartTextInput(JNIEnv* env, jclass, jlong window) {
    auto result = SDL_StartTextInput(ptr<SDL_Window>(window));
    return static_cast<jboolean>(result);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1StopTextInput(JNIEnv* env, jclass, jlong window) {
    auto result = SDL_StopTextInput(ptr<SDL_Window>(window));
    return static_cast<jboolean>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1WarpMouseInWindow(JNIEnv* env, jclass, jlong window, jfloat x, jfloat y) {
    SDL_WarpMouseInWindow(ptr<SDL_Window>(window), x, y);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1WasInit(JNIEnv* env, jclass, jint flags) {
    auto result = SDL_WasInit(static_cast<SDL_InitFlags>(flags));
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_sdl3_SDL3_SDL_1free(JNIEnv* env, jclass, jlong mem) {
    SDL_free(ptr<void>(mem));
}

}
