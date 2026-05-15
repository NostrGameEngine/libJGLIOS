#include <jni.h>
#include <cstdlib>
#include <SDL3/SDL.h>
#include "libjglios_ios_launcher.h"

extern "C" JNIEXPORT jint JNICALL
Java_org_ngengine_libjglios_core_LibJGLIOSEglBridge_initWithMetalLayer(JNIEnv*, jclass, jlong metalLayer) {
    return libjglios_egl_init_with_metal_layer(reinterpret_cast<void*>(metalLayer));
}

extern "C" JNIEXPORT jboolean JNICALL
Java_org_ngengine_libjglios_core_LibJGLIOSEglBridge_makeCurrent(JNIEnv*, jclass) {
    return libjglios_egl_make_current() ? JNI_TRUE : JNI_FALSE;
}

extern "C" JNIEXPORT void JNICALL
Java_org_ngengine_libjglios_core_LibJGLIOSEglBridge_swapBuffers(JNIEnv*, jclass) {
    libjglios_egl_swap_buffers();
}

extern "C" JNIEXPORT jint JNICALL
Java_org_ngengine_libjglios_core_LibJGLIOSEglBridge_framebufferWidth(JNIEnv*, jclass) {
    return libjglios_egl_framebuffer_width();
}

extern "C" JNIEXPORT jint JNICALL
Java_org_ngengine_libjglios_core_LibJGLIOSEglBridge_framebufferHeight(JNIEnv*, jclass) {
    return libjglios_egl_framebuffer_height();
}

extern "C" JNIEXPORT jstring JNICALL
Java_org_ngengine_libjglios_core_LibJGLIOSEglBridge_lastError(JNIEnv* env, jclass) {
    return env->NewStringUTF(libjglios_egl_last_error());
}

extern "C" JNIEXPORT void JNICALL
Java_org_ngengine_libjglios_core_LibJGLIOSEglBridge_shutdown(JNIEnv*, jclass) {
    libjglios_egl_shutdown();
}

extern "C" JNIEXPORT void JNICALL
Java_org_ngengine_libjglios_core_LibJGLIOSLifecycleBridge_requestQuit(JNIEnv*, jclass) {
    libjglios_app_request_quit();
}

extern "C" JNIEXPORT void JNICALL
Java_org_ngengine_libjglios_core_LibJGLIOSLifecycleBridge_showError(JNIEnv* env, jclass, jstring title, jstring message) {
    const char* nativeTitle = title != nullptr ? env->GetStringUTFChars(title, nullptr) : nullptr;
    const char* nativeMessage = message != nullptr ? env->GetStringUTFChars(message, nullptr) : nullptr;
    SDL_ShowSimpleMessageBox(
        SDL_MESSAGEBOX_ERROR,
        nativeTitle != nullptr ? nativeTitle : "libJGLIOS Error",
        nativeMessage != nullptr ? nativeMessage : "An unknown error occurred.",
        nullptr);
    if (nativeMessage != nullptr) {
        env->ReleaseStringUTFChars(message, nativeMessage);
    }
    if (nativeTitle != nullptr) {
        env->ReleaseStringUTFChars(title, nativeTitle);
    }
}

extern "C" JNIEXPORT jboolean JNICALL
Java_org_ngengine_libjglios_core_LibJGLIOSKeyboardBridge_setSoftwareKeyboardVisible(JNIEnv*, jclass, jboolean visible) {
    return libjglios_app_set_software_keyboard_visible(visible == JNI_TRUE) ? JNI_TRUE : JNI_FALSE;
}

extern "C" JNIEXPORT jboolean JNICALL
Java_org_ngengine_libjglios_core_LibJGLIOSInputBridge_pollEvent(JNIEnv* env, jclass, jintArray intData, jfloatArray floatData) {
    if (intData == nullptr || floatData == nullptr || env->GetArrayLength(intData) < 4 || env->GetArrayLength(floatData) < 4) {
        return JNI_FALSE;
    }

    int nativeIntData[4] = {0, 0, 0, 0};
    float nativeFloatData[4] = {0.0f, 0.0f, 0.0f, 0.0f};
    if (!libjglios_input_poll_event(nativeIntData, nativeFloatData)) {
        return JNI_FALSE;
    }

    jint javaIntData[4] = {
        static_cast<jint>(nativeIntData[0]),
        static_cast<jint>(nativeIntData[1]),
        static_cast<jint>(nativeIntData[2]),
        static_cast<jint>(nativeIntData[3])
    };
    jfloat javaFloatData[4] = {
        static_cast<jfloat>(nativeFloatData[0]),
        static_cast<jfloat>(nativeFloatData[1]),
        static_cast<jfloat>(nativeFloatData[2]),
        static_cast<jfloat>(nativeFloatData[3])
    };
    env->SetIntArrayRegion(intData, 0, 4, javaIntData);
    env->SetFloatArrayRegion(floatData, 0, 4, javaFloatData);
    return JNI_TRUE;
}

extern "C" JNIEXPORT jboolean JNICALL
Java_org_ngengine_libjglios_core_LibJGLIOSDeviceBridge_isRumbleSupported(JNIEnv*, jclass) {
    return libjglios_device_rumble_supported() ? JNI_TRUE : JNI_FALSE;
}

extern "C" JNIEXPORT void JNICALL
Java_org_ngengine_libjglios_core_LibJGLIOSDeviceBridge_setRumble(JNIEnv*, jclass, jfloat amount) {
    libjglios_device_rumble(static_cast<float>(amount));
}

extern "C" JNIEXPORT jobject JNICALL
Java_org_ngengine_libjglios_core_LibJGLIOSBufferAllocator_allocate(JNIEnv* env, jclass, jint size) {
    if (size < 0) {
        return nullptr;
    }
    void* memory = std::calloc(1, static_cast<size_t>(size));
    if (memory == nullptr && size > 0) {
        return nullptr;
    }
    return env->NewDirectByteBuffer(memory, size);
}

extern "C" JNIEXPORT void JNICALL
Java_org_ngengine_libjglios_core_LibJGLIOSBufferAllocator_free(JNIEnv* env, jclass, jobject buffer) {
    if (buffer == nullptr) {
        return;
    }
    void* memory = env->GetDirectBufferAddress(buffer);
    if (memory != nullptr) {
        std::free(memory);
    }
}

extern "C" JNIEXPORT jlong JNICALL
Java_org_ngengine_libjglios_core_LibJGLIOSBufferAllocator_baseAddress(JNIEnv* env, jclass, jobject buffer) {
    if (buffer == nullptr) {
        return 0;
    }
    void* memory = env->GetDirectBufferAddress(buffer);
    if (memory == nullptr) {
        return 0;
    }
    return reinterpret_cast<jlong>(memory);
}
