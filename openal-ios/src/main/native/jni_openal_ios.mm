#include <jni.h>
#include <dlfcn.h>

#include <OpenAL/al.h>
#include <OpenAL/alc.h>

namespace {

static ALCdevice* g_device = nullptr;
static ALCcontext* g_context = nullptr;
static bool g_created = false;

template <typename T>
T* directBuffer(JNIEnv* env, jobject buffer, jlong byteOffset = 0) {
    if (buffer == nullptr) {
        return nullptr;
    }
    void* address = env->GetDirectBufferAddress(buffer);
    if (address == nullptr) {
        return nullptr;
    }
    return reinterpret_cast<T*>(static_cast<unsigned char*>(address) + byteOffset);
}

const char* stringChars(JNIEnv* env, jstring value) {
    return value == nullptr ? nullptr : env->GetStringUTFChars(value, nullptr);
}

void releaseStringChars(JNIEnv* env, jstring value, const char* chars) {
    if (value != nullptr && chars != nullptr) {
        env->ReleaseStringUTFChars(value, chars);
    }
}

template <typename Fn>
Fn openalSymbol(const char* name) {
    return reinterpret_cast<Fn>(dlsym(RTLD_DEFAULT, name));
}

typedef void (*alGenAuxiliaryEffectSlotsFn)(ALsizei, ALuint*);
typedef void (*alGenEffectsFn)(ALsizei, ALuint*);
typedef void (*alEffectiFn)(ALuint, ALenum, ALint);
typedef void (*alAuxiliaryEffectSlotiFn)(ALuint, ALenum, ALint);
typedef void (*alDeleteEffectsFn)(ALsizei, const ALuint*);
typedef void (*alDeleteAuxiliaryEffectSlotsFn)(ALsizei, const ALuint*);
typedef void (*alGenFiltersFn)(ALsizei, ALuint*);
typedef void (*alFilteriFn)(ALuint, ALenum, ALint);
typedef void (*alFilterfFn)(ALuint, ALenum, ALfloat);
typedef void (*alDeleteFiltersFn)(ALsizei, const ALuint*);
typedef void (*alEffectfFn)(ALuint, ALenum, ALfloat);
typedef void (*alcDevicePauseSOFTFn)(ALCdevice*);
typedef void (*alcDeviceResumeSOFTFn)(ALCdevice*);

} // namespace

extern "C" {

JNIEXPORT jstring JNICALL Java_org_ngengine_libjglios_openal_ios_IosAL_alGetString
(JNIEnv* env, jobject, jint parameter) {
    const ALchar* value = alGetString(static_cast<ALenum>(parameter));
    return value == nullptr ? nullptr : env->NewStringUTF(value);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_openal_ios_IosAL_alGenSources
(JNIEnv*, jobject) {
    ALuint source = 0;
    alGenSources(1, &source);
    return static_cast<jint>(source);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_openal_ios_IosAL_alGetError
(JNIEnv*, jobject) {
    return static_cast<jint>(alGetError());
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosAL_alDeleteSources
(JNIEnv* env, jobject, jint numSources, jobject sources, jlong sourcesOffset) {
    alDeleteSources(static_cast<ALsizei>(numSources), directBuffer<ALuint>(env, sources, sourcesOffset));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosAL_alGenBuffers
(JNIEnv* env, jobject, jint numBuffers, jobject buffers, jlong buffersOffset) {
    alGenBuffers(static_cast<ALsizei>(numBuffers), directBuffer<ALuint>(env, buffers, buffersOffset));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosAL_alDeleteBuffers
(JNIEnv* env, jobject, jint numBuffers, jobject buffers, jlong buffersOffset) {
    alDeleteBuffers(static_cast<ALsizei>(numBuffers), directBuffer<ALuint>(env, buffers, buffersOffset));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosAL_alSourceStop
(JNIEnv*, jobject, jint source) {
    alSourceStop(static_cast<ALuint>(source));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosAL_alSourcei
(JNIEnv*, jobject, jint source, jint param, jint value) {
    alSourcei(static_cast<ALuint>(source), static_cast<ALenum>(param), static_cast<ALint>(value));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosAL_alBufferData
(JNIEnv* env, jobject, jint buffer, jint format, jobject data, jlong dataOffset, jint size, jint frequency) {
    alBufferData(static_cast<ALuint>(buffer), static_cast<ALenum>(format), directBuffer<void>(env, data, dataOffset),
                 static_cast<ALsizei>(size), static_cast<ALsizei>(frequency));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosAL_alSourcePlay
(JNIEnv*, jobject, jint source) {
    alSourcePlay(static_cast<ALuint>(source));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosAL_alSourcePause
(JNIEnv*, jobject, jint source) {
    alSourcePause(static_cast<ALuint>(source));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosAL_alSourcef
(JNIEnv*, jobject, jint source, jint param, jfloat value) {
    alSourcef(static_cast<ALuint>(source), static_cast<ALenum>(param), static_cast<ALfloat>(value));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosAL_alSource3f
(JNIEnv*, jobject, jint source, jint param, jfloat v1, jfloat v2, jfloat v3) {
    alSource3f(static_cast<ALuint>(source), static_cast<ALenum>(param), v1, v2, v3);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_openal_ios_IosAL_alGetSourcei
(JNIEnv*, jobject, jint source, jint param) {
    ALint result = 0;
    alGetSourcei(static_cast<ALuint>(source), static_cast<ALenum>(param), &result);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosAL_alSourceUnqueueBuffers
(JNIEnv* env, jobject, jint source, jint numBuffers, jobject buffers, jlong buffersOffset) {
    alSourceUnqueueBuffers(static_cast<ALuint>(source), static_cast<ALsizei>(numBuffers), directBuffer<ALuint>(env, buffers, buffersOffset));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosAL_alSourceQueueBuffers
(JNIEnv* env, jobject, jint source, jint numBuffers, jobject buffers, jlong buffersOffset) {
    alSourceQueueBuffers(static_cast<ALuint>(source), static_cast<ALsizei>(numBuffers), directBuffer<ALuint>(env, buffers, buffersOffset));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosAL_alListener
(JNIEnv* env, jobject, jint param, jobject data, jlong dataOffset) {
    alListenerfv(static_cast<ALenum>(param), directBuffer<ALfloat>(env, data, dataOffset));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosAL_alListenerf
(JNIEnv*, jobject, jint param, jfloat value) {
    alListenerf(static_cast<ALenum>(param), value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosAL_alListener3f
(JNIEnv*, jobject, jint param, jfloat v1, jfloat v2, jfloat v3) {
    alListener3f(static_cast<ALenum>(param), v1, v2, v3);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosAL_alSource3i
(JNIEnv*, jobject, jint source, jint param, jint v1, jint v2, jint v3) {
    alSource3i(static_cast<ALuint>(source), static_cast<ALenum>(param), v1, v2, v3);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosALC_createALC
(JNIEnv*, jobject) {
    if (g_created) {
        return;
    }
    g_device = alcOpenDevice(nullptr);
    if (g_device == nullptr) {
        return;
    }
    g_context = alcCreateContext(g_device, nullptr);
    if (g_context == nullptr) {
        alcCloseDevice(g_device);
        g_device = nullptr;
        return;
    }
    if (!alcMakeContextCurrent(g_context)) {
        alcDestroyContext(g_context);
        alcCloseDevice(g_device);
        g_context = nullptr;
        g_device = nullptr;
        return;
    }
    g_created = true;
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosALC_destroyALC
(JNIEnv*, jobject) {
    if (g_context != nullptr) {
        alcMakeContextCurrent(nullptr);
        alcDestroyContext(g_context);
        g_context = nullptr;
    }
    if (g_device != nullptr) {
        alcCloseDevice(g_device);
        g_device = nullptr;
    }
    g_created = false;
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_openal_ios_IosALC_isCreated
(JNIEnv*, jobject) {
    return g_created ? JNI_TRUE : JNI_FALSE;
}

JNIEXPORT jstring JNICALL Java_org_ngengine_libjglios_openal_ios_IosALC_alcGetString
(JNIEnv* env, jobject, jint parameter) {
    const ALCchar* value = alcGetString(g_device, static_cast<ALCenum>(parameter));
    return value == nullptr ? nullptr : env->NewStringUTF(value);
}

JNIEXPORT jboolean JNICALL Java_org_ngengine_libjglios_openal_ios_IosALC_alcIsExtensionPresent
(JNIEnv* env, jobject, jstring extension) {
    const char* chars = stringChars(env, extension);
    if (chars == nullptr) {
        return JNI_FALSE;
    }
    ALCboolean result = alcIsExtensionPresent(g_device, chars);
    releaseStringChars(env, extension, chars);
    return result ? JNI_TRUE : JNI_FALSE;
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosALC_alcGetInteger
(JNIEnv* env, jobject, jint param, jobject buffer, jlong bufferOffset, jint size) {
    alcGetIntegerv(g_device, static_cast<ALCenum>(param), static_cast<ALCsizei>(size), directBuffer<ALCint>(env, buffer, bufferOffset));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosALC_alcDevicePauseSOFT
(JNIEnv*, jobject) {
    auto fn = openalSymbol<alcDevicePauseSOFTFn>("alcDevicePauseSOFT");
    if (fn != nullptr && g_device != nullptr) {
        fn(g_device);
    }
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosALC_alcDeviceResumeSOFT
(JNIEnv*, jobject) {
    auto fn = openalSymbol<alcDeviceResumeSOFTFn>("alcDeviceResumeSOFT");
    if (fn != nullptr && g_device != nullptr) {
        fn(g_device);
    }
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosEFX_alGenAuxiliaryEffectSlots
(JNIEnv* env, jobject, jint n, jobject buffers, jlong buffersOffset) {
    auto fn = openalSymbol<alGenAuxiliaryEffectSlotsFn>("alGenAuxiliaryEffectSlots");
    if (fn != nullptr) fn(n, directBuffer<ALuint>(env, buffers, buffersOffset));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosEFX_alGenEffects
(JNIEnv* env, jobject, jint n, jobject buffers, jlong buffersOffset) {
    auto fn = openalSymbol<alGenEffectsFn>("alGenEffects");
    if (fn != nullptr) fn(n, directBuffer<ALuint>(env, buffers, buffersOffset));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosEFX_alEffecti
(JNIEnv*, jobject, jint effect, jint param, jint value) {
    auto fn = openalSymbol<alEffectiFn>("alEffecti");
    if (fn != nullptr) fn(effect, param, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosEFX_alAuxiliaryEffectSloti
(JNIEnv*, jobject, jint slot, jint param, jint value) {
    auto fn = openalSymbol<alAuxiliaryEffectSlotiFn>("alAuxiliaryEffectSloti");
    if (fn != nullptr) fn(slot, param, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosEFX_alDeleteEffects
(JNIEnv* env, jobject, jint n, jobject buffers, jlong buffersOffset) {
    auto fn = openalSymbol<alDeleteEffectsFn>("alDeleteEffects");
    if (fn != nullptr) fn(n, directBuffer<ALuint>(env, buffers, buffersOffset));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosEFX_alDeleteAuxiliaryEffectSlots
(JNIEnv* env, jobject, jint n, jobject buffers, jlong buffersOffset) {
    auto fn = openalSymbol<alDeleteAuxiliaryEffectSlotsFn>("alDeleteAuxiliaryEffectSlots");
    if (fn != nullptr) fn(n, directBuffer<ALuint>(env, buffers, buffersOffset));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosEFX_alGenFilters
(JNIEnv* env, jobject, jint n, jobject buffers, jlong buffersOffset) {
    auto fn = openalSymbol<alGenFiltersFn>("alGenFilters");
    if (fn != nullptr) fn(n, directBuffer<ALuint>(env, buffers, buffersOffset));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosEFX_alFilteri
(JNIEnv*, jobject, jint filter, jint param, jint value) {
    auto fn = openalSymbol<alFilteriFn>("alFilteri");
    if (fn != nullptr) fn(filter, param, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosEFX_alFilterf
(JNIEnv*, jobject, jint filter, jint param, jfloat value) {
    auto fn = openalSymbol<alFilterfFn>("alFilterf");
    if (fn != nullptr) fn(filter, param, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosEFX_alDeleteFilters
(JNIEnv* env, jobject, jint n, jobject buffers, jlong buffersOffset) {
    auto fn = openalSymbol<alDeleteFiltersFn>("alDeleteFilters");
    if (fn != nullptr) fn(n, directBuffer<ALuint>(env, buffers, buffersOffset));
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_openal_ios_IosEFX_alEffectf
(JNIEnv*, jobject, jint effect, jint param, jfloat value) {
    auto fn = openalSymbol<alEffectfFn>("alEffectf");
    if (fn != nullptr) fn(effect, param, value);
}

}
