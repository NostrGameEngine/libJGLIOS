#include <jni.h>
#include <cstdint>
#include <cstring>

#if LIBJGLIOS_IOS_LEGACY_GLES
#include <dlfcn.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import <OpenGLES/ES3/gl.h>
#else
#include <EGL/egl.h>
#include <GLES2/gl2.h>
#include <GLES2/gl2ext.h>
#include <GLES3/gl3.h>
#endif

namespace {

void* libjglios_gl_get_proc_address(const char* name) {
#if LIBJGLIOS_IOS_LEGACY_GLES
    return dlsym(RTLD_DEFAULT, name);
#else
    return reinterpret_cast<void*>(eglGetProcAddress(name));
#endif
}

void throwJavaException(JNIEnv* env, const char* className, const char* message) {
    jclass exceptionClass = env->FindClass(className);
    if (exceptionClass) {
        env->ThrowNew(exceptionClass, message);
    }
}

void* directBufferAddress(JNIEnv* env, jobject buffer, jlong byteOffset = 0) {
    if (!buffer) {
        return nullptr;
    }
    if (byteOffset < 0) {
        throwJavaException(env, "java/lang/IllegalArgumentException", "Buffer offset must be non-negative");
        return nullptr;
    }
    void* address = env->GetDirectBufferAddress(buffer);
    if (!address) {
        throwJavaException(env, "java/lang/IllegalArgumentException", "Expected a direct NIO buffer");
        return nullptr;
    }
    return static_cast<void*>(static_cast<std::uint8_t*>(address) + byteOffset);
}

} // namespace

extern "C" {

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glAcquireKeyedMutexWin32EXT(JNIEnv* env, jclass, jint memory, jlong key, jint timeout) {
    using Fn = jbyte (*)(jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glAcquireKeyedMutexWin32EXT"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(memory, key, timeout);
    return static_cast<jbyte>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glActiveShaderProgramEXT(JNIEnv* env, jclass, jint pipeline, jint program) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glActiveShaderProgramEXT"));
    if (!fn) {
        return;
    }
    fn(pipeline, program);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glActiveTexture(JNIEnv* env, jclass, jint texture) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glActiveTexture"));
    if (!fn) {
        return;
    }
    fn(texture);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glAlphaFuncQCOM(JNIEnv* env, jclass, jint func, jfloat ref) {
    using Fn = void (*)(jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glAlphaFuncQCOM"));
    if (!fn) {
        return;
    }
    fn(func, ref);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glApplyFramebufferAttachmentCMAAINTEL(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glApplyFramebufferAttachmentCMAAINTEL"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glAttachShader(JNIEnv* env, jclass, jint program, jint shader) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glAttachShader"));
    if (!fn) {
        return;
    }
    fn(program, shader);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBeginConditionalRenderNV(JNIEnv* env, jclass, jint id, jint mode) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBeginConditionalRenderNV"));
    if (!fn) {
        return;
    }
    fn(id, mode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBeginPerfMonitorAMD(JNIEnv* env, jclass, jint monitor) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBeginPerfMonitorAMD"));
    if (!fn) {
        return;
    }
    fn(monitor);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBeginPerfQueryINTEL(JNIEnv* env, jclass, jint queryHandle) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBeginPerfQueryINTEL"));
    if (!fn) {
        return;
    }
    fn(queryHandle);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBeginQuery(JNIEnv* env, jclass, jint target, jint id) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBeginQuery"));
    if (!fn) {
        return;
    }
    fn(target, id);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBeginQueryEXT(JNIEnv* env, jclass, jint target, jint id) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBeginQueryEXT"));
    if (!fn) {
        return;
    }
    fn(target, id);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBeginTransformFeedback(JNIEnv* env, jclass, jint primitiveMode) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBeginTransformFeedback"));
    if (!fn) {
        return;
    }
    fn(primitiveMode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindAttribLocation(JNIEnv* env, jclass, jint program, jint index, jbyteArray name) {
    jbyte* name_elems = env->GetByteArrayElements(name, nullptr);
    using Fn = void (*)(jint, jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBindAttribLocation"));
    if (!fn) {
        env->ReleaseByteArrayElements(name, name_elems, JNI_ABORT);
        return;
    }
    fn(program, index, reinterpret_cast<jbyte*>(name_elems));
    env->ReleaseByteArrayElements(name, name_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindBuffer(JNIEnv* env, jclass, jint target, jint buffer) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBindBuffer"));
    if (!fn) {
        return;
    }
    fn(target, buffer);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindBufferBase(JNIEnv* env, jclass, jint target, jint index, jint buffer) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBindBufferBase"));
    if (!fn) {
        return;
    }
    fn(target, index, buffer);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindBufferRange(JNIEnv* env, jclass, jint target, jint index, jint buffer, jlong offset, jlong size) {
    using Fn = void (*)(jint, jint, jint, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBindBufferRange"));
    if (!fn) {
        return;
    }
    fn(target, index, buffer, offset, size);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindFragDataLocationEXT(JNIEnv* env, jclass, jint program, jint color, jbyteArray name) {
    jbyte* name_elems = env->GetByteArrayElements(name, nullptr);
    using Fn = void (*)(jint, jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBindFragDataLocationEXT"));
    if (!fn) {
        env->ReleaseByteArrayElements(name, name_elems, JNI_ABORT);
        return;
    }
    fn(program, color, reinterpret_cast<jbyte*>(name_elems));
    env->ReleaseByteArrayElements(name, name_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindFragDataLocationIndexedEXT(JNIEnv* env, jclass, jint program, jint colorNumber, jint index, jbyteArray name) {
    jbyte* name_elems = env->GetByteArrayElements(name, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBindFragDataLocationIndexedEXT"));
    if (!fn) {
        env->ReleaseByteArrayElements(name, name_elems, JNI_ABORT);
        return;
    }
    fn(program, colorNumber, index, reinterpret_cast<jbyte*>(name_elems));
    env->ReleaseByteArrayElements(name, name_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindFramebuffer(JNIEnv* env, jclass, jint target, jint framebuffer) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBindFramebuffer"));
    if (!fn) {
        return;
    }
    fn(target, framebuffer);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindProgramPipelineEXT(JNIEnv* env, jclass, jint pipeline) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBindProgramPipelineEXT"));
    if (!fn) {
        return;
    }
    fn(pipeline);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindRenderbuffer(JNIEnv* env, jclass, jint target, jint renderbuffer) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBindRenderbuffer"));
    if (!fn) {
        return;
    }
    fn(target, renderbuffer);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindSampler(JNIEnv* env, jclass, jint unit, jint sampler) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBindSampler"));
    if (!fn) {
        return;
    }
    fn(unit, sampler);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindShadingRateImageNV(JNIEnv* env, jclass, jint texture) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBindShadingRateImageNV"));
    if (!fn) {
        return;
    }
    fn(texture);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindTexture(JNIEnv* env, jclass, jint target, jint texture) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBindTexture"));
    if (!fn) {
        return;
    }
    fn(target, texture);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindTransformFeedback(JNIEnv* env, jclass, jint target, jint id) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBindTransformFeedback"));
    if (!fn) {
        return;
    }
    fn(target, id);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindVertexArray(JNIEnv* env, jclass, jint array) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBindVertexArray"));
    if (!fn) {
        return;
    }
    fn(array);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindVertexArrayOES(JNIEnv* env, jclass, jint array) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBindVertexArrayOES"));
    if (!fn) {
        return;
    }
    fn(array);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendBarrierKHR(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBlendBarrierKHR"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendBarrierNV(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBlendBarrierNV"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendColor(JNIEnv* env, jclass, jfloat red, jfloat green, jfloat blue, jfloat alpha) {
    using Fn = void (*)(jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBlendColor"));
    if (!fn) {
        return;
    }
    fn(red, green, blue, alpha);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendEquation(JNIEnv* env, jclass, jint mode) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBlendEquation"));
    if (!fn) {
        return;
    }
    fn(mode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendEquationSeparate(JNIEnv* env, jclass, jint modeRGB, jint modeAlpha) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBlendEquationSeparate"));
    if (!fn) {
        return;
    }
    fn(modeRGB, modeAlpha);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendEquationSeparateiEXT(JNIEnv* env, jclass, jint buf, jint modeRGB, jint modeAlpha) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBlendEquationSeparateiEXT"));
    if (!fn) {
        return;
    }
    fn(buf, modeRGB, modeAlpha);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendEquationSeparateiOES(JNIEnv* env, jclass, jint buf, jint modeRGB, jint modeAlpha) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBlendEquationSeparateiOES"));
    if (!fn) {
        return;
    }
    fn(buf, modeRGB, modeAlpha);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendEquationiEXT(JNIEnv* env, jclass, jint buf, jint mode) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBlendEquationiEXT"));
    if (!fn) {
        return;
    }
    fn(buf, mode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendEquationiOES(JNIEnv* env, jclass, jint buf, jint mode) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBlendEquationiOES"));
    if (!fn) {
        return;
    }
    fn(buf, mode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendFunc(JNIEnv* env, jclass, jint sfactor, jint dfactor) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBlendFunc"));
    if (!fn) {
        return;
    }
    fn(sfactor, dfactor);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendFuncSeparate(JNIEnv* env, jclass, jint sfactorRGB, jint dfactorRGB, jint sfactorAlpha, jint dfactorAlpha) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBlendFuncSeparate"));
    if (!fn) {
        return;
    }
    fn(sfactorRGB, dfactorRGB, sfactorAlpha, dfactorAlpha);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendFuncSeparateiEXT(JNIEnv* env, jclass, jint buf, jint srcRGB, jint dstRGB, jint srcAlpha, jint dstAlpha) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBlendFuncSeparateiEXT"));
    if (!fn) {
        return;
    }
    fn(buf, srcRGB, dstRGB, srcAlpha, dstAlpha);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendFuncSeparateiOES(JNIEnv* env, jclass, jint buf, jint srcRGB, jint dstRGB, jint srcAlpha, jint dstAlpha) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBlendFuncSeparateiOES"));
    if (!fn) {
        return;
    }
    fn(buf, srcRGB, dstRGB, srcAlpha, dstAlpha);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendFunciEXT(JNIEnv* env, jclass, jint buf, jint src, jint dst) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBlendFunciEXT"));
    if (!fn) {
        return;
    }
    fn(buf, src, dst);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendFunciOES(JNIEnv* env, jclass, jint buf, jint src, jint dst) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBlendFunciOES"));
    if (!fn) {
        return;
    }
    fn(buf, src, dst);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendParameteriNV(JNIEnv* env, jclass, jint pname, jint value) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBlendParameteriNV"));
    if (!fn) {
        return;
    }
    fn(pname, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlitFramebuffer(JNIEnv* env, jclass, jint srcX0, jint srcY0, jint srcX1, jint srcY1, jint dstX0, jint dstY0, jint dstX1, jint dstY1, jint mask, jint filter) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBlitFramebuffer"));
    if (!fn) {
        return;
    }
    fn(srcX0, srcY0, srcX1, srcY1, dstX0, dstY0, dstX1, dstY1, mask, filter);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlitFramebufferANGLE(JNIEnv* env, jclass, jint srcX0, jint srcY0, jint srcX1, jint srcY1, jint dstX0, jint dstY0, jint dstX1, jint dstY1, jint mask, jint filter) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBlitFramebufferANGLE"));
    if (!fn) {
        return;
    }
    fn(srcX0, srcY0, srcX1, srcY1, dstX0, dstY0, dstX1, dstY1, mask, filter);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlitFramebufferNV(JNIEnv* env, jclass, jint srcX0, jint srcY0, jint srcX1, jint srcY1, jint dstX0, jint dstY0, jint dstX1, jint dstY1, jint mask, jint filter) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBlitFramebufferNV"));
    if (!fn) {
        return;
    }
    fn(srcX0, srcY0, srcX1, srcY1, dstX0, dstY0, dstX1, dstY1, mask, filter);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBufferAttachMemoryNV(JNIEnv* env, jclass, jint target, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBufferAttachMemoryNV"));
    if (!fn) {
        return;
    }
    fn(target, memory, offset);
}

static void libjglios_gles_glBufferData(JNIEnv* env, jclass, jint target, jlong size, jlong data, jint usage) {
    using Fn = void (*)(jint, jlong, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBufferData"));
    if (!fn) {
        return;
    }
    fn(target, size, data, usage);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBufferData__IJLjava_nio_Buffer_2JI(JNIEnv* env, jclass, jint target, jlong size, jobject data, jlong dataOffset, jint usage) {
    using Fn = void (*)(jint, jlong, void*, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBufferData"));
    if (!fn) {
        return;
    }
    void* dataPtr = directBufferAddress(env, data, dataOffset);
    if (env->ExceptionCheck()) {
        return;
    }
    fn(target, size, dataPtr, usage);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBufferPageCommitmentMemNV(JNIEnv* env, jclass, jint target, jlong offset, jlong size, jint memory, jlong memOffset, jbyte commit) {
    using Fn = void (*)(jint, jlong, jlong, jint, jlong, jbyte);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBufferPageCommitmentMemNV"));
    if (!fn) {
        return;
    }
    fn(target, offset, size, memory, memOffset, commit);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBufferStorageEXT(JNIEnv* env, jclass, jint target, jlong size, jlong data, jint flags) {
    using Fn = void (*)(jint, jlong, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBufferStorageEXT"));
    if (!fn) {
        return;
    }
    fn(target, size, data, flags);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBufferStorageExternalEXT(JNIEnv* env, jclass, jint target, jlong offset, jlong size, jlong clientBuffer, jint flags) {
    using Fn = void (*)(jint, jlong, jlong, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBufferStorageExternalEXT"));
    if (!fn) {
        return;
    }
    fn(target, offset, size, clientBuffer, flags);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBufferStorageMemEXT(JNIEnv* env, jclass, jint target, jlong size, jint memory, jlong offset) {
    using Fn = void (*)(jint, jlong, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBufferStorageMemEXT"));
    if (!fn) {
        return;
    }
    fn(target, size, memory, offset);
}

static void libjglios_gles_glBufferSubData(JNIEnv* env, jclass, jint target, jlong offset, jlong size, jlong data) {
    using Fn = void (*)(jint, jlong, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBufferSubData"));
    if (!fn) {
        return;
    }
    fn(target, offset, size, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBufferSubData__IJJLjava_nio_Buffer_2J(JNIEnv* env, jclass, jint target, jlong offset, jlong size, jobject data, jlong dataOffset) {
    using Fn = void (*)(jint, jlong, jlong, void*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glBufferSubData"));
    if (!fn) {
        return;
    }
    void* dataPtr = directBufferAddress(env, data, dataOffset);
    if (env->ExceptionCheck()) {
        return;
    }
    fn(target, offset, size, dataPtr);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetBufferSubData(JNIEnv* env, jclass, jint target, jlong offset, jlong size, jobject data, jlong dataOffset) {
    if (offset < 0 || size < 0) {
        throwJavaException(env, "java/lang/IllegalArgumentException", "Offset and size must be non-negative");
        return;
    }

    void* destination = directBufferAddress(env, data, dataOffset);
    if (env->ExceptionCheck()) {
        return;
    }

    void* mapped = glMapBufferRange(
            static_cast<GLenum>(target),
            static_cast<GLintptr>(offset),
            static_cast<GLsizeiptr>(size),
            GL_MAP_READ_BIT);
    if (mapped == nullptr) {
        throwJavaException(env, "java/lang/IllegalStateException", "Unable to map buffer for reading");
        return;
    }

    std::memcpy(destination, mapped, static_cast<std::size_t>(size));
    if (glUnmapBuffer(static_cast<GLenum>(target)) != GL_TRUE) {
        throwJavaException(env, "java/lang/IllegalStateException", "Mapped buffer data became corrupted while reading");
    }
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glCheckFramebufferStatus(JNIEnv* env, jclass, jint target) {
    using Fn = jint (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCheckFramebufferStatus"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn(target);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClear(JNIEnv* env, jclass, jint mask) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glClear"));
    if (!fn) {
        return;
    }
    fn(mask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClearBufferfi(JNIEnv* env, jclass, jint buffer, jint drawbuffer, jfloat depth, jint stencil) {
    using Fn = void (*)(jint, jint, jfloat, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glClearBufferfi"));
    if (!fn) {
        return;
    }
    fn(buffer, drawbuffer, depth, stencil);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClearBufferfv(JNIEnv* env, jclass, jint buffer, jint drawbuffer, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glClearBufferfv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(buffer, drawbuffer, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClearBufferiv(JNIEnv* env, jclass, jint buffer, jint drawbuffer, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glClearBufferiv"));
    if (!fn) {
        env->ReleaseIntArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(buffer, drawbuffer, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClearBufferuiv(JNIEnv* env, jclass, jint buffer, jint drawbuffer, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glClearBufferuiv"));
    if (!fn) {
        env->ReleaseIntArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(buffer, drawbuffer, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClearColor(JNIEnv* env, jclass, jfloat red, jfloat green, jfloat blue, jfloat alpha) {
    using Fn = void (*)(jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glClearColor"));
    if (!fn) {
        return;
    }
    fn(red, green, blue, alpha);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClearDepthf(JNIEnv* env, jclass, jfloat d) {
    using Fn = void (*)(jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glClearDepthf"));
    if (!fn) {
        return;
    }
    fn(d);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClearPixelLocalStorageuiEXT(JNIEnv* env, jclass, jint offset, jint n, jintArray values) {
    jint* values_elems = env->GetIntArrayElements(values, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glClearPixelLocalStorageuiEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(values, values_elems, JNI_ABORT);
        return;
    }
    fn(offset, n, reinterpret_cast<jint*>(values_elems));
    env->ReleaseIntArrayElements(values, values_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClearStencil(JNIEnv* env, jclass, jint s) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glClearStencil"));
    if (!fn) {
        return;
    }
    fn(s);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClearTexImageEXT(JNIEnv* env, jclass, jint texture, jint level, jint format, jint type, jlong data) {
    using Fn = void (*)(jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glClearTexImageEXT"));
    if (!fn) {
        return;
    }
    fn(texture, level, format, type, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClearTexSubImageEXT(JNIEnv* env, jclass, jint texture, jint level, jint xoffset, jint yoffset, jint zoffset, jint width, jint height, jint depth, jint format, jint type, jlong data) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glClearTexSubImageEXT"));
    if (!fn) {
        return;
    }
    fn(texture, level, xoffset, yoffset, zoffset, width, height, depth, format, type, data);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glClientWaitSync(JNIEnv* env, jclass, jlong sync, jint flags, jlong timeout) {
    using Fn = jint (*)(jlong, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glClientWaitSync"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn(sync, flags, timeout);
    return static_cast<jint>(result);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glClientWaitSyncAPPLE(JNIEnv* env, jclass, jlong sync, jint flags, jlong timeout) {
    using Fn = jint (*)(jlong, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glClientWaitSyncAPPLE"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn(sync, flags, timeout);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClipControlEXT(JNIEnv* env, jclass, jint origin, jint depth) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glClipControlEXT"));
    if (!fn) {
        return;
    }
    fn(origin, depth);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glColorMask(JNIEnv* env, jclass, jbyte red, jbyte green, jbyte blue, jbyte alpha) {
    using Fn = void (*)(jbyte, jbyte, jbyte, jbyte);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glColorMask"));
    if (!fn) {
        return;
    }
    fn(red, green, blue, alpha);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glColorMaskiEXT(JNIEnv* env, jclass, jint index, jbyte r, jbyte g, jbyte b, jbyte a) {
    using Fn = void (*)(jint, jbyte, jbyte, jbyte, jbyte);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glColorMaskiEXT"));
    if (!fn) {
        return;
    }
    fn(index, r, g, b, a);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glColorMaskiOES(JNIEnv* env, jclass, jint index, jbyte r, jbyte g, jbyte b, jbyte a) {
    using Fn = void (*)(jint, jbyte, jbyte, jbyte, jbyte);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glColorMaskiOES"));
    if (!fn) {
        return;
    }
    fn(index, r, g, b, a);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCompileShader(JNIEnv* env, jclass, jint shader) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCompileShader"));
    if (!fn) {
        return;
    }
    fn(shader);
}

static void libjglios_gles_glCompressedTexImage2D(JNIEnv* env, jclass, jint target, jint level, jint internalformat, jint width, jint height, jint border, jint imageSize, jlong data) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCompressedTexImage2D"));
    if (!fn) {
        return;
    }
    fn(target, level, internalformat, width, height, border, imageSize, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCompressedTexImage2D__IIIIIIILjava_nio_Buffer_2J(JNIEnv* env, jclass, jint target, jint level, jint internalformat, jint width, jint height, jint border, jint imageSize, jobject data, jlong dataOffset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, void*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCompressedTexImage2D"));
    if (!fn) {
        return;
    }
    void* dataPtr = directBufferAddress(env, data, dataOffset);
    if (env->ExceptionCheck()) {
        return;
    }
    fn(target, level, internalformat, width, height, border, imageSize, dataPtr);
}

static void libjglios_gles_glCompressedTexImage3D(JNIEnv* env, jclass, jint target, jint level, jint internalformat, jint width, jint height, jint depth, jint border, jint imageSize, jlong data) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCompressedTexImage3D"));
    if (!fn) {
        return;
    }
    fn(target, level, internalformat, width, height, depth, border, imageSize, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCompressedTexImage3D__IIIIIIIILjava_nio_Buffer_2J(JNIEnv* env, jclass, jint target, jint level, jint internalformat, jint width, jint height, jint depth, jint border, jint imageSize, jobject data, jlong dataOffset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, void*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCompressedTexImage3D"));
    if (!fn) {
        return;
    }
    void* dataPtr = directBufferAddress(env, data, dataOffset);
    if (env->ExceptionCheck()) {
        return;
    }
    fn(target, level, internalformat, width, height, depth, border, imageSize, dataPtr);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCompressedTexImage3DOES(JNIEnv* env, jclass, jint target, jint level, jint internalformat, jint width, jint height, jint depth, jint border, jint imageSize, jlong data) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCompressedTexImage3DOES"));
    if (!fn) {
        return;
    }
    fn(target, level, internalformat, width, height, depth, border, imageSize, data);
}

static void libjglios_gles_glCompressedTexSubImage2D(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint width, jint height, jint format, jint imageSize, jlong data) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCompressedTexSubImage2D"));
    if (!fn) {
        return;
    }
    fn(target, level, xoffset, yoffset, width, height, format, imageSize, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCompressedTexSubImage2D__IIIIIIIILjava_nio_Buffer_2J(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint width, jint height, jint format, jint imageSize, jobject data, jlong dataOffset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, void*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCompressedTexSubImage2D"));
    if (!fn) {
        return;
    }
    void* dataPtr = directBufferAddress(env, data, dataOffset);
    if (env->ExceptionCheck()) {
        return;
    }
    fn(target, level, xoffset, yoffset, width, height, format, imageSize, dataPtr);
}

static void libjglios_gles_glCompressedTexSubImage3D(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint zoffset, jint width, jint height, jint depth, jint format, jint imageSize, jlong data) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCompressedTexSubImage3D"));
    if (!fn) {
        return;
    }
    fn(target, level, xoffset, yoffset, zoffset, width, height, depth, format, imageSize, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCompressedTexSubImage3D__IIIIIIIIIILjava_nio_Buffer_2J(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint zoffset, jint width, jint height, jint depth, jint format, jint imageSize, jobject data, jlong dataOffset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, void*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCompressedTexSubImage3D"));
    if (!fn) {
        return;
    }
    void* dataPtr = directBufferAddress(env, data, dataOffset);
    if (env->ExceptionCheck()) {
        return;
    }
    fn(target, level, xoffset, yoffset, zoffset, width, height, depth, format, imageSize, dataPtr);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCompressedTexSubImage3DOES(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint zoffset, jint width, jint height, jint depth, jint format, jint imageSize, jlong data) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCompressedTexSubImage3DOES"));
    if (!fn) {
        return;
    }
    fn(target, level, xoffset, yoffset, zoffset, width, height, depth, format, imageSize, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glConservativeRasterParameteriNV(JNIEnv* env, jclass, jint pname, jint param) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glConservativeRasterParameteriNV"));
    if (!fn) {
        return;
    }
    fn(pname, param);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCopyBufferSubData(JNIEnv* env, jclass, jint readTarget, jint writeTarget, jlong readOffset, jlong writeOffset, jlong size) {
    using Fn = void (*)(jint, jint, jlong, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCopyBufferSubData"));
    if (!fn) {
        return;
    }
    fn(readTarget, writeTarget, readOffset, writeOffset, size);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCopyBufferSubDataNV(JNIEnv* env, jclass, jint readTarget, jint writeTarget, jlong readOffset, jlong writeOffset, jlong size) {
    using Fn = void (*)(jint, jint, jlong, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCopyBufferSubDataNV"));
    if (!fn) {
        return;
    }
    fn(readTarget, writeTarget, readOffset, writeOffset, size);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCopyImageSubDataEXT(JNIEnv* env, jclass, jint srcName, jint srcTarget, jint srcLevel, jint srcX, jint srcY, jint srcZ, jint dstName, jint dstTarget, jint dstLevel, jint dstX, jint dstY, jint dstZ, jint srcWidth, jint srcHeight, jint srcDepth) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCopyImageSubDataEXT"));
    if (!fn) {
        return;
    }
    fn(srcName, srcTarget, srcLevel, srcX, srcY, srcZ, dstName, dstTarget, dstLevel, dstX, dstY, dstZ, srcWidth, srcHeight, srcDepth);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCopyImageSubDataOES(JNIEnv* env, jclass, jint srcName, jint srcTarget, jint srcLevel, jint srcX, jint srcY, jint srcZ, jint dstName, jint dstTarget, jint dstLevel, jint dstX, jint dstY, jint dstZ, jint srcWidth, jint srcHeight, jint srcDepth) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCopyImageSubDataOES"));
    if (!fn) {
        return;
    }
    fn(srcName, srcTarget, srcLevel, srcX, srcY, srcZ, dstName, dstTarget, dstLevel, dstX, dstY, dstZ, srcWidth, srcHeight, srcDepth);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCopyPathNV(JNIEnv* env, jclass, jint resultPath, jint srcPath) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCopyPathNV"));
    if (!fn) {
        return;
    }
    fn(resultPath, srcPath);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCopyTexImage2D(JNIEnv* env, jclass, jint target, jint level, jint internalformat, jint x, jint y, jint width, jint height, jint border) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCopyTexImage2D"));
    if (!fn) {
        return;
    }
    fn(target, level, internalformat, x, y, width, height, border);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCopyTexSubImage2D(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint x, jint y, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCopyTexSubImage2D"));
    if (!fn) {
        return;
    }
    fn(target, level, xoffset, yoffset, x, y, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCopyTexSubImage3D(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint zoffset, jint x, jint y, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCopyTexSubImage3D"));
    if (!fn) {
        return;
    }
    fn(target, level, xoffset, yoffset, zoffset, x, y, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCopyTexSubImage3DOES(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint zoffset, jint x, jint y, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCopyTexSubImage3DOES"));
    if (!fn) {
        return;
    }
    fn(target, level, xoffset, yoffset, zoffset, x, y, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCopyTextureLevelsAPPLE(JNIEnv* env, jclass, jint destinationTexture, jint sourceTexture, jint sourceBaseLevel, jint sourceLevelCount) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCopyTextureLevelsAPPLE"));
    if (!fn) {
        return;
    }
    fn(destinationTexture, sourceTexture, sourceBaseLevel, sourceLevelCount);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCoverFillPathInstancedNV(JNIEnv* env, jclass, jint numPaths, jint pathNameType, jlong paths, jint pathBase, jint coverMode, jint transformType, jfloatArray transformValues) {
    jfloat* transformValues_elems = env->GetFloatArrayElements(transformValues, nullptr);
    using Fn = void (*)(jint, jint, jlong, jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCoverFillPathInstancedNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(transformValues, transformValues_elems, JNI_ABORT);
        return;
    }
    fn(numPaths, pathNameType, paths, pathBase, coverMode, transformType, reinterpret_cast<jfloat*>(transformValues_elems));
    env->ReleaseFloatArrayElements(transformValues, transformValues_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCoverFillPathNV(JNIEnv* env, jclass, jint path, jint coverMode) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCoverFillPathNV"));
    if (!fn) {
        return;
    }
    fn(path, coverMode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCoverStrokePathInstancedNV(JNIEnv* env, jclass, jint numPaths, jint pathNameType, jlong paths, jint pathBase, jint coverMode, jint transformType, jfloatArray transformValues) {
    jfloat* transformValues_elems = env->GetFloatArrayElements(transformValues, nullptr);
    using Fn = void (*)(jint, jint, jlong, jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCoverStrokePathInstancedNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(transformValues, transformValues_elems, JNI_ABORT);
        return;
    }
    fn(numPaths, pathNameType, paths, pathBase, coverMode, transformType, reinterpret_cast<jfloat*>(transformValues_elems));
    env->ReleaseFloatArrayElements(transformValues, transformValues_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCoverStrokePathNV(JNIEnv* env, jclass, jint path, jint coverMode) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCoverStrokePathNV"));
    if (!fn) {
        return;
    }
    fn(path, coverMode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCoverageMaskNV(JNIEnv* env, jclass, jbyte mask) {
    using Fn = void (*)(jbyte);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCoverageMaskNV"));
    if (!fn) {
        return;
    }
    fn(mask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCoverageModulationNV(JNIEnv* env, jclass, jint components) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCoverageModulationNV"));
    if (!fn) {
        return;
    }
    fn(components);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCoverageModulationTableNV(JNIEnv* env, jclass, jint n, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCoverageModulationTableNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(v, v_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCoverageOperationNV(JNIEnv* env, jclass, jint operation) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCoverageOperationNV"));
    if (!fn) {
        return;
    }
    fn(operation);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCreateMemoryObjectsEXT(JNIEnv* env, jclass, jint n, jintArray memoryObjects) {
    jint* memoryObjects_elems = env->GetIntArrayElements(memoryObjects, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCreateMemoryObjectsEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(memoryObjects, memoryObjects_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(memoryObjects_elems));
    env->ReleaseIntArrayElements(memoryObjects, memoryObjects_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCreatePerfQueryINTEL(JNIEnv* env, jclass, jint queryId, jintArray queryHandle) {
    jint* queryHandle_elems = env->GetIntArrayElements(queryHandle, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCreatePerfQueryINTEL"));
    if (!fn) {
        env->ReleaseIntArrayElements(queryHandle, queryHandle_elems, JNI_ABORT);
        return;
    }
    fn(queryId, reinterpret_cast<jint*>(queryHandle_elems));
    env->ReleaseIntArrayElements(queryHandle, queryHandle_elems, 0);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glCreateProgram(JNIEnv* env, jclass) {
    using Fn = jint (*)(void);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCreateProgram"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn();
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCreateSemaphoresNV(JNIEnv* env, jclass, jint n, jintArray semaphores) {
    jint* semaphores_elems = env->GetIntArrayElements(semaphores, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCreateSemaphoresNV"));
    if (!fn) {
        env->ReleaseIntArrayElements(semaphores, semaphores_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(semaphores_elems));
    env->ReleaseIntArrayElements(semaphores, semaphores_elems, 0);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glCreateShader(JNIEnv* env, jclass, jint type) {
    using Fn = jint (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCreateShader"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn(type);
    return static_cast<jint>(result);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glCreateShaderProgramvEXT(JNIEnv* env, jclass, jint type, jint count, jbyteArray strings) {
    jbyte* strings_elems = env->GetByteArrayElements(strings, nullptr);
    using Fn = jint (*)(jint, jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCreateShaderProgramvEXT"));
    if (!fn) {
        env->ReleaseByteArrayElements(strings, strings_elems, JNI_ABORT);
        return static_cast<jint>(0);
    }
    auto result = fn(type, count, reinterpret_cast<jbyte*>(strings_elems));
    env->ReleaseByteArrayElements(strings, strings_elems, 0);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCullFace(JNIEnv* env, jclass, jint mode) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glCullFace"));
    if (!fn) {
        return;
    }
    fn(mode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDebugMessageCallbackKHR(JNIEnv* env, jclass, jlong callback, jlong userParam) {
    using Fn = void (*)(jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDebugMessageCallbackKHR"));
    if (!fn) {
        return;
    }
    fn(callback, userParam);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDebugMessageControlKHR(JNIEnv* env, jclass, jint source, jint type, jint severity, jint count, jintArray ids, jbyte enabled) {
    jint* ids_elems = env->GetIntArrayElements(ids, nullptr);
    using Fn = void (*)(jint, jint, jint, jint, jint*, jbyte);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDebugMessageControlKHR"));
    if (!fn) {
        env->ReleaseIntArrayElements(ids, ids_elems, JNI_ABORT);
        return;
    }
    fn(source, type, severity, count, reinterpret_cast<jint*>(ids_elems), enabled);
    env->ReleaseIntArrayElements(ids, ids_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDebugMessageInsertKHR(JNIEnv* env, jclass, jint source, jint type, jint id, jint severity, jint length, jbyteArray buf) {
    jbyte* buf_elems = env->GetByteArrayElements(buf, nullptr);
    using Fn = void (*)(jint, jint, jint, jint, jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDebugMessageInsertKHR"));
    if (!fn) {
        env->ReleaseByteArrayElements(buf, buf_elems, JNI_ABORT);
        return;
    }
    fn(source, type, id, severity, length, reinterpret_cast<jbyte*>(buf_elems));
    env->ReleaseByteArrayElements(buf, buf_elems, 0);
}

static void libjglios_gles_glDeleteBuffers(JNIEnv* env, jclass, jint n, jintArray buffers) {
    jint* buffers_elems = env->GetIntArrayElements(buffers, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteBuffers"));
    if (!fn) {
        env->ReleaseIntArrayElements(buffers, buffers_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(buffers_elems));
    env->ReleaseIntArrayElements(buffers, buffers_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteBuffers__ILjava_nio_IntBuffer_2J(JNIEnv* env, jclass, jint n, jobject buffers, jlong buffersOffset) {
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteBuffers"));
    if (!fn) {
        return;
    }
    jint* data = static_cast<jint*>(directBufferAddress(env, buffers, buffersOffset));
    if (env->ExceptionCheck()) {
        return;
    }
    fn(n, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteFencesNV(JNIEnv* env, jclass, jint n, jintArray fences) {
    jint* fences_elems = env->GetIntArrayElements(fences, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteFencesNV"));
    if (!fn) {
        env->ReleaseIntArrayElements(fences, fences_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(fences_elems));
    env->ReleaseIntArrayElements(fences, fences_elems, 0);
}

static void libjglios_gles_glDeleteFramebuffers(JNIEnv* env, jclass, jint n, jintArray framebuffers) {
    jint* framebuffers_elems = env->GetIntArrayElements(framebuffers, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteFramebuffers"));
    if (!fn) {
        env->ReleaseIntArrayElements(framebuffers, framebuffers_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(framebuffers_elems));
    env->ReleaseIntArrayElements(framebuffers, framebuffers_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteFramebuffers__ILjava_nio_IntBuffer_2J(JNIEnv* env, jclass, jint n, jobject framebuffers, jlong framebuffersOffset) {
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteFramebuffers"));
    if (!fn) {
        return;
    }
    jint* data = static_cast<jint*>(directBufferAddress(env, framebuffers, framebuffersOffset));
    if (env->ExceptionCheck()) {
        return;
    }
    fn(n, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteMemoryObjectsEXT(JNIEnv* env, jclass, jint n, jintArray memoryObjects) {
    jint* memoryObjects_elems = env->GetIntArrayElements(memoryObjects, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteMemoryObjectsEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(memoryObjects, memoryObjects_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(memoryObjects_elems));
    env->ReleaseIntArrayElements(memoryObjects, memoryObjects_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeletePathsNV(JNIEnv* env, jclass, jint path, jint range) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeletePathsNV"));
    if (!fn) {
        return;
    }
    fn(path, range);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeletePerfMonitorsAMD(JNIEnv* env, jclass, jint n, jintArray monitors) {
    jint* monitors_elems = env->GetIntArrayElements(monitors, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeletePerfMonitorsAMD"));
    if (!fn) {
        env->ReleaseIntArrayElements(monitors, monitors_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(monitors_elems));
    env->ReleaseIntArrayElements(monitors, monitors_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeletePerfQueryINTEL(JNIEnv* env, jclass, jint queryHandle) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeletePerfQueryINTEL"));
    if (!fn) {
        return;
    }
    fn(queryHandle);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteProgram(JNIEnv* env, jclass, jint program) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteProgram"));
    if (!fn) {
        return;
    }
    fn(program);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteProgramPipelinesEXT(JNIEnv* env, jclass, jint n, jintArray pipelines) {
    jint* pipelines_elems = env->GetIntArrayElements(pipelines, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteProgramPipelinesEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(pipelines, pipelines_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(pipelines_elems));
    env->ReleaseIntArrayElements(pipelines, pipelines_elems, 0);
}

static void libjglios_gles_glDeleteQueries(JNIEnv* env, jclass, jint n, jintArray ids) {
    jint* ids_elems = env->GetIntArrayElements(ids, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteQueries"));
    if (!fn) {
        env->ReleaseIntArrayElements(ids, ids_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(ids_elems));
    env->ReleaseIntArrayElements(ids, ids_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteQueries__ILjava_nio_IntBuffer_2J(JNIEnv* env, jclass, jint n, jobject ids, jlong idsOffset) {
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteQueries"));
    if (!fn) {
        return;
    }
    jint* data = static_cast<jint*>(directBufferAddress(env, ids, idsOffset));
    if (env->ExceptionCheck()) {
        return;
    }
    fn(n, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteQueriesEXT(JNIEnv* env, jclass, jint n, jintArray ids) {
    jint* ids_elems = env->GetIntArrayElements(ids, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteQueriesEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(ids, ids_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(ids_elems));
    env->ReleaseIntArrayElements(ids, ids_elems, 0);
}

static void libjglios_gles_glDeleteRenderbuffers(JNIEnv* env, jclass, jint n, jintArray renderbuffers) {
    jint* renderbuffers_elems = env->GetIntArrayElements(renderbuffers, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteRenderbuffers"));
    if (!fn) {
        env->ReleaseIntArrayElements(renderbuffers, renderbuffers_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(renderbuffers_elems));
    env->ReleaseIntArrayElements(renderbuffers, renderbuffers_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteRenderbuffers__ILjava_nio_IntBuffer_2J(JNIEnv* env, jclass, jint n, jobject renderbuffers, jlong renderbuffersOffset) {
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteRenderbuffers"));
    if (!fn) {
        return;
    }
    jint* data = static_cast<jint*>(directBufferAddress(env, renderbuffers, renderbuffersOffset));
    if (env->ExceptionCheck()) {
        return;
    }
    fn(n, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteSamplers(JNIEnv* env, jclass, jint count, jintArray samplers) {
    jint* samplers_elems = env->GetIntArrayElements(samplers, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteSamplers"));
    if (!fn) {
        env->ReleaseIntArrayElements(samplers, samplers_elems, JNI_ABORT);
        return;
    }
    fn(count, reinterpret_cast<jint*>(samplers_elems));
    env->ReleaseIntArrayElements(samplers, samplers_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteSemaphoresEXT(JNIEnv* env, jclass, jint n, jintArray semaphores) {
    jint* semaphores_elems = env->GetIntArrayElements(semaphores, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteSemaphoresEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(semaphores, semaphores_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(semaphores_elems));
    env->ReleaseIntArrayElements(semaphores, semaphores_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteShader(JNIEnv* env, jclass, jint shader) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteShader"));
    if (!fn) {
        return;
    }
    fn(shader);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteSync(JNIEnv* env, jclass, jlong sync) {
    using Fn = void (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteSync"));
    if (!fn) {
        return;
    }
    fn(sync);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteSyncAPPLE(JNIEnv* env, jclass, jlong sync) {
    using Fn = void (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteSyncAPPLE"));
    if (!fn) {
        return;
    }
    fn(sync);
}

static void libjglios_gles_glDeleteTextures(JNIEnv* env, jclass, jint n, jintArray textures) {
    jint* textures_elems = env->GetIntArrayElements(textures, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteTextures"));
    if (!fn) {
        env->ReleaseIntArrayElements(textures, textures_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(textures_elems));
    env->ReleaseIntArrayElements(textures, textures_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteTextures__ILjava_nio_IntBuffer_2J(JNIEnv* env, jclass, jint n, jobject textures, jlong texturesOffset) {
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteTextures"));
    if (!fn) {
        return;
    }
    jint* data = static_cast<jint*>(directBufferAddress(env, textures, texturesOffset));
    if (env->ExceptionCheck()) {
        return;
    }
    fn(n, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteTransformFeedbacks(JNIEnv* env, jclass, jint n, jintArray ids) {
    jint* ids_elems = env->GetIntArrayElements(ids, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteTransformFeedbacks"));
    if (!fn) {
        env->ReleaseIntArrayElements(ids, ids_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(ids_elems));
    env->ReleaseIntArrayElements(ids, ids_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteVertexArrays(JNIEnv* env, jclass, jint n, jintArray arrays) {
    jint* arrays_elems = env->GetIntArrayElements(arrays, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteVertexArrays"));
    if (!fn) {
        env->ReleaseIntArrayElements(arrays, arrays_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(arrays_elems));
    env->ReleaseIntArrayElements(arrays, arrays_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteVertexArraysOES(JNIEnv* env, jclass, jint n, jintArray arrays) {
    jint* arrays_elems = env->GetIntArrayElements(arrays, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDeleteVertexArraysOES"));
    if (!fn) {
        env->ReleaseIntArrayElements(arrays, arrays_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(arrays_elems));
    env->ReleaseIntArrayElements(arrays, arrays_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDepthFunc(JNIEnv* env, jclass, jint func) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDepthFunc"));
    if (!fn) {
        return;
    }
    fn(func);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDepthMask(JNIEnv* env, jclass, jbyte flag) {
    using Fn = void (*)(jbyte);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDepthMask"));
    if (!fn) {
        return;
    }
    fn(flag);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDepthRangeArrayfvNV(JNIEnv* env, jclass, jint first, jint count, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDepthRangeArrayfvNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(v, v_elems, JNI_ABORT);
        return;
    }
    fn(first, count, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDepthRangeArrayfvOES(JNIEnv* env, jclass, jint first, jint count, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDepthRangeArrayfvOES"));
    if (!fn) {
        env->ReleaseFloatArrayElements(v, v_elems, JNI_ABORT);
        return;
    }
    fn(first, count, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDepthRangeIndexedfNV(JNIEnv* env, jclass, jint index, jfloat n, jfloat f) {
    using Fn = void (*)(jint, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDepthRangeIndexedfNV"));
    if (!fn) {
        return;
    }
    fn(index, n, f);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDepthRangeIndexedfOES(JNIEnv* env, jclass, jint index, jfloat n, jfloat f) {
    using Fn = void (*)(jint, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDepthRangeIndexedfOES"));
    if (!fn) {
        return;
    }
    fn(index, n, f);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDepthRangef(JNIEnv* env, jclass, jfloat n, jfloat f) {
    using Fn = void (*)(jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDepthRangef"));
    if (!fn) {
        return;
    }
    fn(n, f);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDetachShader(JNIEnv* env, jclass, jint program, jint shader) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDetachShader"));
    if (!fn) {
        return;
    }
    fn(program, shader);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDisable(JNIEnv* env, jclass, jint cap) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDisable"));
    if (!fn) {
        return;
    }
    fn(cap);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDisableDriverControlQCOM(JNIEnv* env, jclass, jint driverControl) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDisableDriverControlQCOM"));
    if (!fn) {
        return;
    }
    fn(driverControl);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDisableVertexAttribArray(JNIEnv* env, jclass, jint index) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDisableVertexAttribArray"));
    if (!fn) {
        return;
    }
    fn(index);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDisableiEXT(JNIEnv* env, jclass, jint target, jint index) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDisableiEXT"));
    if (!fn) {
        return;
    }
    fn(target, index);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDisableiNV(JNIEnv* env, jclass, jint target, jint index) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDisableiNV"));
    if (!fn) {
        return;
    }
    fn(target, index);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDisableiOES(JNIEnv* env, jclass, jint target, jint index) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDisableiOES"));
    if (!fn) {
        return;
    }
    fn(target, index);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDiscardFramebufferEXT(JNIEnv* env, jclass, jint target, jint numAttachments, jintArray attachments) {
    jint* attachments_elems = env->GetIntArrayElements(attachments, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDiscardFramebufferEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(attachments, attachments_elems, JNI_ABORT);
        return;
    }
    fn(target, numAttachments, reinterpret_cast<jint*>(attachments_elems));
    env->ReleaseIntArrayElements(attachments, attachments_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawArrays(JNIEnv* env, jclass, jint mode, jint first, jint count) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawArrays"));
    if (!fn) {
        return;
    }
    fn(mode, first, count);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawArraysInstanced(JNIEnv* env, jclass, jint mode, jint first, jint count, jint instancecount) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawArraysInstanced"));
    if (!fn) {
        return;
    }
    fn(mode, first, count, instancecount);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawArraysInstancedANGLE(JNIEnv* env, jclass, jint mode, jint first, jint count, jint primcount) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawArraysInstancedANGLE"));
    if (!fn) {
        return;
    }
    fn(mode, first, count, primcount);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawArraysInstancedBaseInstanceEXT(JNIEnv* env, jclass, jint mode, jint first, jint count, jint instancecount, jint baseinstance) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawArraysInstancedBaseInstanceEXT"));
    if (!fn) {
        return;
    }
    fn(mode, first, count, instancecount, baseinstance);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawArraysInstancedEXT(JNIEnv* env, jclass, jint mode, jint start, jint count, jint primcount) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawArraysInstancedEXT"));
    if (!fn) {
        return;
    }
    fn(mode, start, count, primcount);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawArraysInstancedNV(JNIEnv* env, jclass, jint mode, jint first, jint count, jint primcount) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawArraysInstancedNV"));
    if (!fn) {
        return;
    }
    fn(mode, first, count, primcount);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawBuffers(JNIEnv* env, jclass, jint n, jintArray bufs) {
    jint* bufs_elems = env->GetIntArrayElements(bufs, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawBuffers"));
    if (!fn) {
        env->ReleaseIntArrayElements(bufs, bufs_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(bufs_elems));
    env->ReleaseIntArrayElements(bufs, bufs_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawBuffersEXT(JNIEnv* env, jclass, jint n, jintArray bufs) {
    jint* bufs_elems = env->GetIntArrayElements(bufs, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawBuffersEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(bufs, bufs_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(bufs_elems));
    env->ReleaseIntArrayElements(bufs, bufs_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawBuffersIndexedEXT(JNIEnv* env, jclass, jint n, jintArray location, jintArray indices) {
    jint* location_elems = env->GetIntArrayElements(location, nullptr);
    jint* indices_elems = env->GetIntArrayElements(indices, nullptr);
    using Fn = void (*)(jint, jint*, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawBuffersIndexedEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(location, location_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(indices, indices_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(location_elems), reinterpret_cast<jint*>(indices_elems));
    env->ReleaseIntArrayElements(indices, indices_elems, 0);
    env->ReleaseIntArrayElements(location, location_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawBuffersNV(JNIEnv* env, jclass, jint n, jintArray bufs) {
    jint* bufs_elems = env->GetIntArrayElements(bufs, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawBuffersNV"));
    if (!fn) {
        env->ReleaseIntArrayElements(bufs, bufs_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(bufs_elems));
    env->ReleaseIntArrayElements(bufs, bufs_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawElements(JNIEnv* env, jclass, jint mode, jint count, jint type, jlong indices) {
    using Fn = void (*)(jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawElements"));
    if (!fn) {
        return;
    }
    fn(mode, count, type, indices);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawElementsBaseVertexEXT(JNIEnv* env, jclass, jint mode, jint count, jint type, jlong indices, jint basevertex) {
    using Fn = void (*)(jint, jint, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawElementsBaseVertexEXT"));
    if (!fn) {
        return;
    }
    fn(mode, count, type, indices, basevertex);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawElementsBaseVertexOES(JNIEnv* env, jclass, jint mode, jint count, jint type, jlong indices, jint basevertex) {
    using Fn = void (*)(jint, jint, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawElementsBaseVertexOES"));
    if (!fn) {
        return;
    }
    fn(mode, count, type, indices, basevertex);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawElementsInstanced(JNIEnv* env, jclass, jint mode, jint count, jint type, jlong indices, jint instancecount) {
    using Fn = void (*)(jint, jint, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawElementsInstanced"));
    if (!fn) {
        return;
    }
    fn(mode, count, type, indices, instancecount);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawElementsInstancedANGLE(JNIEnv* env, jclass, jint mode, jint count, jint type, jlong indices, jint primcount) {
    using Fn = void (*)(jint, jint, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawElementsInstancedANGLE"));
    if (!fn) {
        return;
    }
    fn(mode, count, type, indices, primcount);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawElementsInstancedBaseInstanceEXT(JNIEnv* env, jclass, jint mode, jint count, jint type, jlong indices, jint instancecount, jint baseinstance) {
    using Fn = void (*)(jint, jint, jint, jlong, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawElementsInstancedBaseInstanceEXT"));
    if (!fn) {
        return;
    }
    fn(mode, count, type, indices, instancecount, baseinstance);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawElementsInstancedBaseVertexBaseInstanceEXT(JNIEnv* env, jclass, jint mode, jint count, jint type, jlong indices, jint instancecount, jint basevertex, jint baseinstance) {
    using Fn = void (*)(jint, jint, jint, jlong, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawElementsInstancedBaseVertexBaseInstanceEXT"));
    if (!fn) {
        return;
    }
    fn(mode, count, type, indices, instancecount, basevertex, baseinstance);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawElementsInstancedBaseVertexEXT(JNIEnv* env, jclass, jint mode, jint count, jint type, jlong indices, jint instancecount, jint basevertex) {
    using Fn = void (*)(jint, jint, jint, jlong, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawElementsInstancedBaseVertexEXT"));
    if (!fn) {
        return;
    }
    fn(mode, count, type, indices, instancecount, basevertex);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawElementsInstancedBaseVertexOES(JNIEnv* env, jclass, jint mode, jint count, jint type, jlong indices, jint instancecount, jint basevertex) {
    using Fn = void (*)(jint, jint, jint, jlong, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawElementsInstancedBaseVertexOES"));
    if (!fn) {
        return;
    }
    fn(mode, count, type, indices, instancecount, basevertex);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawElementsInstancedEXT(JNIEnv* env, jclass, jint mode, jint count, jint type, jlong indices, jint primcount) {
    using Fn = void (*)(jint, jint, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawElementsInstancedEXT"));
    if (!fn) {
        return;
    }
    fn(mode, count, type, indices, primcount);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawElementsInstancedNV(JNIEnv* env, jclass, jint mode, jint count, jint type, jlong indices, jint primcount) {
    using Fn = void (*)(jint, jint, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawElementsInstancedNV"));
    if (!fn) {
        return;
    }
    fn(mode, count, type, indices, primcount);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawMeshTasksIndirectNV(JNIEnv* env, jclass, jlong indirect) {
    using Fn = void (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawMeshTasksIndirectNV"));
    if (!fn) {
        return;
    }
    fn(indirect);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawMeshTasksNV(JNIEnv* env, jclass, jint first, jint count) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawMeshTasksNV"));
    if (!fn) {
        return;
    }
    fn(first, count);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawRangeElements(JNIEnv* env, jclass, jint mode, jint start, jint end, jint count, jint type, jlong indices) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawRangeElements"));
    if (!fn) {
        return;
    }
    fn(mode, start, end, count, type, indices);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawRangeElementsBaseVertexEXT(JNIEnv* env, jclass, jint mode, jint start, jint end, jint count, jint type, jlong indices, jint basevertex) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawRangeElementsBaseVertexEXT"));
    if (!fn) {
        return;
    }
    fn(mode, start, end, count, type, indices, basevertex);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawRangeElementsBaseVertexOES(JNIEnv* env, jclass, jint mode, jint start, jint end, jint count, jint type, jlong indices, jint basevertex) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawRangeElementsBaseVertexOES"));
    if (!fn) {
        return;
    }
    fn(mode, start, end, count, type, indices, basevertex);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawTransformFeedbackEXT(JNIEnv* env, jclass, jint mode, jint id) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawTransformFeedbackEXT"));
    if (!fn) {
        return;
    }
    fn(mode, id);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawTransformFeedbackInstancedEXT(JNIEnv* env, jclass, jint mode, jint id, jint instancecount) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawTransformFeedbackInstancedEXT"));
    if (!fn) {
        return;
    }
    fn(mode, id, instancecount);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawVkImageNV(JNIEnv* env, jclass, jlong vkImage, jint sampler, jfloat x0, jfloat y0, jfloat x1, jfloat y1, jfloat z, jfloat s0, jfloat t0, jfloat s1, jfloat t1) {
    using Fn = void (*)(jlong, jint, jfloat, jfloat, jfloat, jfloat, jfloat, jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glDrawVkImageNV"));
    if (!fn) {
        return;
    }
    fn(vkImage, sampler, x0, y0, x1, y1, z, s0, t0, s1, t1);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEGLImageTargetRenderbufferStorageOES(JNIEnv* env, jclass, jint target, jlong image) {
    using Fn = void (*)(jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glEGLImageTargetRenderbufferStorageOES"));
    if (!fn) {
        return;
    }
    fn(target, image);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEGLImageTargetTexStorageEXT(JNIEnv* env, jclass, jint target, jlong image, jintArray attrib_list) {
    jint* attrib_list_elems = env->GetIntArrayElements(attrib_list, nullptr);
    using Fn = void (*)(jint, jlong, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glEGLImageTargetTexStorageEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(attrib_list, attrib_list_elems, JNI_ABORT);
        return;
    }
    fn(target, image, reinterpret_cast<jint*>(attrib_list_elems));
    env->ReleaseIntArrayElements(attrib_list, attrib_list_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEGLImageTargetTexture2DOES(JNIEnv* env, jclass, jint target, jlong image) {
    using Fn = void (*)(jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glEGLImageTargetTexture2DOES"));
    if (!fn) {
        return;
    }
    fn(target, image);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEGLImageTargetTextureStorageEXT(JNIEnv* env, jclass, jint texture, jlong image, jintArray attrib_list) {
    jint* attrib_list_elems = env->GetIntArrayElements(attrib_list, nullptr);
    using Fn = void (*)(jint, jlong, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glEGLImageTargetTextureStorageEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(attrib_list, attrib_list_elems, JNI_ABORT);
        return;
    }
    fn(texture, image, reinterpret_cast<jint*>(attrib_list_elems));
    env->ReleaseIntArrayElements(attrib_list, attrib_list_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEnable(JNIEnv* env, jclass, jint cap) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glEnable"));
    if (!fn) {
        return;
    }
    fn(cap);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEnableDriverControlQCOM(JNIEnv* env, jclass, jint driverControl) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glEnableDriverControlQCOM"));
    if (!fn) {
        return;
    }
    fn(driverControl);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEnableVertexAttribArray(JNIEnv* env, jclass, jint index) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glEnableVertexAttribArray"));
    if (!fn) {
        return;
    }
    fn(index);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEnableiEXT(JNIEnv* env, jclass, jint target, jint index) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glEnableiEXT"));
    if (!fn) {
        return;
    }
    fn(target, index);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEnableiNV(JNIEnv* env, jclass, jint target, jint index) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glEnableiNV"));
    if (!fn) {
        return;
    }
    fn(target, index);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEnableiOES(JNIEnv* env, jclass, jint target, jint index) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glEnableiOES"));
    if (!fn) {
        return;
    }
    fn(target, index);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEndConditionalRenderNV(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glEndConditionalRenderNV"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEndPerfMonitorAMD(JNIEnv* env, jclass, jint monitor) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glEndPerfMonitorAMD"));
    if (!fn) {
        return;
    }
    fn(monitor);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEndPerfQueryINTEL(JNIEnv* env, jclass, jint queryHandle) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glEndPerfQueryINTEL"));
    if (!fn) {
        return;
    }
    fn(queryHandle);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEndQuery(JNIEnv* env, jclass, jint target) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glEndQuery"));
    if (!fn) {
        return;
    }
    fn(target);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEndQueryEXT(JNIEnv* env, jclass, jint target) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glEndQueryEXT"));
    if (!fn) {
        return;
    }
    fn(target);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEndTilingQCOM(JNIEnv* env, jclass, jint preserveMask) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glEndTilingQCOM"));
    if (!fn) {
        return;
    }
    fn(preserveMask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEndTransformFeedback(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glEndTransformFeedback"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glExtGetBufferPointervQCOM(JNIEnv* env, jclass, jint target, jlong params) {
    using Fn = void (*)(jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glExtGetBufferPointervQCOM"));
    if (!fn) {
        return;
    }
    fn(target, params);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glExtGetBuffersQCOM(JNIEnv* env, jclass, jintArray buffers, jint maxBuffers, jintArray numBuffers) {
    jint* buffers_elems = env->GetIntArrayElements(buffers, nullptr);
    jint* numBuffers_elems = env->GetIntArrayElements(numBuffers, nullptr);
    using Fn = void (*)(jint*, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glExtGetBuffersQCOM"));
    if (!fn) {
        env->ReleaseIntArrayElements(buffers, buffers_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(numBuffers, numBuffers_elems, JNI_ABORT);
        return;
    }
    fn(reinterpret_cast<jint*>(buffers_elems), maxBuffers, reinterpret_cast<jint*>(numBuffers_elems));
    env->ReleaseIntArrayElements(numBuffers, numBuffers_elems, 0);
    env->ReleaseIntArrayElements(buffers, buffers_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glExtGetFramebuffersQCOM(JNIEnv* env, jclass, jintArray framebuffers, jint maxFramebuffers, jintArray numFramebuffers) {
    jint* framebuffers_elems = env->GetIntArrayElements(framebuffers, nullptr);
    jint* numFramebuffers_elems = env->GetIntArrayElements(numFramebuffers, nullptr);
    using Fn = void (*)(jint*, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glExtGetFramebuffersQCOM"));
    if (!fn) {
        env->ReleaseIntArrayElements(framebuffers, framebuffers_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(numFramebuffers, numFramebuffers_elems, JNI_ABORT);
        return;
    }
    fn(reinterpret_cast<jint*>(framebuffers_elems), maxFramebuffers, reinterpret_cast<jint*>(numFramebuffers_elems));
    env->ReleaseIntArrayElements(numFramebuffers, numFramebuffers_elems, 0);
    env->ReleaseIntArrayElements(framebuffers, framebuffers_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glExtGetProgramBinarySourceQCOM(JNIEnv* env, jclass, jint program, jint shadertype, jbyteArray source, jintArray length) {
    jbyte* source_elems = env->GetByteArrayElements(source, nullptr);
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    using Fn = void (*)(jint, jint, jbyte*, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glExtGetProgramBinarySourceQCOM"));
    if (!fn) {
        env->ReleaseByteArrayElements(source, source_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
        return;
    }
    fn(program, shadertype, reinterpret_cast<jbyte*>(source_elems), reinterpret_cast<jint*>(length_elems));
    env->ReleaseIntArrayElements(length, length_elems, 0);
    env->ReleaseByteArrayElements(source, source_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glExtGetProgramsQCOM(JNIEnv* env, jclass, jintArray programs, jint maxPrograms, jintArray numPrograms) {
    jint* programs_elems = env->GetIntArrayElements(programs, nullptr);
    jint* numPrograms_elems = env->GetIntArrayElements(numPrograms, nullptr);
    using Fn = void (*)(jint*, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glExtGetProgramsQCOM"));
    if (!fn) {
        env->ReleaseIntArrayElements(programs, programs_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(numPrograms, numPrograms_elems, JNI_ABORT);
        return;
    }
    fn(reinterpret_cast<jint*>(programs_elems), maxPrograms, reinterpret_cast<jint*>(numPrograms_elems));
    env->ReleaseIntArrayElements(numPrograms, numPrograms_elems, 0);
    env->ReleaseIntArrayElements(programs, programs_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glExtGetRenderbuffersQCOM(JNIEnv* env, jclass, jintArray renderbuffers, jint maxRenderbuffers, jintArray numRenderbuffers) {
    jint* renderbuffers_elems = env->GetIntArrayElements(renderbuffers, nullptr);
    jint* numRenderbuffers_elems = env->GetIntArrayElements(numRenderbuffers, nullptr);
    using Fn = void (*)(jint*, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glExtGetRenderbuffersQCOM"));
    if (!fn) {
        env->ReleaseIntArrayElements(renderbuffers, renderbuffers_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(numRenderbuffers, numRenderbuffers_elems, JNI_ABORT);
        return;
    }
    fn(reinterpret_cast<jint*>(renderbuffers_elems), maxRenderbuffers, reinterpret_cast<jint*>(numRenderbuffers_elems));
    env->ReleaseIntArrayElements(numRenderbuffers, numRenderbuffers_elems, 0);
    env->ReleaseIntArrayElements(renderbuffers, renderbuffers_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glExtGetShadersQCOM(JNIEnv* env, jclass, jintArray shaders, jint maxShaders, jintArray numShaders) {
    jint* shaders_elems = env->GetIntArrayElements(shaders, nullptr);
    jint* numShaders_elems = env->GetIntArrayElements(numShaders, nullptr);
    using Fn = void (*)(jint*, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glExtGetShadersQCOM"));
    if (!fn) {
        env->ReleaseIntArrayElements(shaders, shaders_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(numShaders, numShaders_elems, JNI_ABORT);
        return;
    }
    fn(reinterpret_cast<jint*>(shaders_elems), maxShaders, reinterpret_cast<jint*>(numShaders_elems));
    env->ReleaseIntArrayElements(numShaders, numShaders_elems, 0);
    env->ReleaseIntArrayElements(shaders, shaders_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glExtGetTexLevelParameterivQCOM(JNIEnv* env, jclass, jint texture, jint face, jint level, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glExtGetTexLevelParameterivQCOM"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(texture, face, level, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glExtGetTexSubImageQCOM(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint zoffset, jint width, jint height, jint depth, jint format, jint type, jlong texels) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glExtGetTexSubImageQCOM"));
    if (!fn) {
        return;
    }
    fn(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, texels);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glExtGetTexturesQCOM(JNIEnv* env, jclass, jintArray textures, jint maxTextures, jintArray numTextures) {
    jint* textures_elems = env->GetIntArrayElements(textures, nullptr);
    jint* numTextures_elems = env->GetIntArrayElements(numTextures, nullptr);
    using Fn = void (*)(jint*, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glExtGetTexturesQCOM"));
    if (!fn) {
        env->ReleaseIntArrayElements(textures, textures_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(numTextures, numTextures_elems, JNI_ABORT);
        return;
    }
    fn(reinterpret_cast<jint*>(textures_elems), maxTextures, reinterpret_cast<jint*>(numTextures_elems));
    env->ReleaseIntArrayElements(numTextures, numTextures_elems, 0);
    env->ReleaseIntArrayElements(textures, textures_elems, 0);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glExtIsProgramBinaryQCOM(JNIEnv* env, jclass, jint program) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glExtIsProgramBinaryQCOM"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(program);
    return static_cast<jbyte>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glExtTexObjectStateOverrideiQCOM(JNIEnv* env, jclass, jint target, jint pname, jint param) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glExtTexObjectStateOverrideiQCOM"));
    if (!fn) {
        return;
    }
    fn(target, pname, param);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glExtrapolateTex2DQCOM(JNIEnv* env, jclass, jint src1, jint src2, jint output, jfloat scaleFactor) {
    using Fn = void (*)(jint, jint, jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glExtrapolateTex2DQCOM"));
    if (!fn) {
        return;
    }
    fn(src1, src2, output, scaleFactor);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_gles_GLES_glFenceSync(JNIEnv* env, jclass, jint condition, jint flags) {
    using Fn = jlong (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFenceSync"));
    if (!fn) {
        return static_cast<jlong>(0);
    }
    auto result = fn(condition, flags);
    return static_cast<jlong>(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_gles_GLES_glFenceSyncAPPLE(JNIEnv* env, jclass, jint condition, jint flags) {
    using Fn = jlong (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFenceSyncAPPLE"));
    if (!fn) {
        return static_cast<jlong>(0);
    }
    auto result = fn(condition, flags);
    return static_cast<jlong>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFinish(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFinish"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFinishFenceNV(JNIEnv* env, jclass, jint fence) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFinishFenceNV"));
    if (!fn) {
        return;
    }
    fn(fence);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFlush(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFlush"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFlushMappedBufferRange(JNIEnv* env, jclass, jint target, jlong offset, jlong length) {
    using Fn = void (*)(jint, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFlushMappedBufferRange"));
    if (!fn) {
        return;
    }
    fn(target, offset, length);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFlushMappedBufferRangeEXT(JNIEnv* env, jclass, jint target, jlong offset, jlong length) {
    using Fn = void (*)(jint, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFlushMappedBufferRangeEXT"));
    if (!fn) {
        return;
    }
    fn(target, offset, length);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFragmentCoverageColorNV(JNIEnv* env, jclass, jint color) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFragmentCoverageColorNV"));
    if (!fn) {
        return;
    }
    fn(color);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferFetchBarrierEXT(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFramebufferFetchBarrierEXT"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferFetchBarrierQCOM(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFramebufferFetchBarrierQCOM"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferFoveationConfigQCOM(JNIEnv* env, jclass, jint framebuffer, jint numLayers, jint focalPointsPerLayer, jint requestedFeatures, jintArray providedFeatures) {
    jint* providedFeatures_elems = env->GetIntArrayElements(providedFeatures, nullptr);
    using Fn = void (*)(jint, jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFramebufferFoveationConfigQCOM"));
    if (!fn) {
        env->ReleaseIntArrayElements(providedFeatures, providedFeatures_elems, JNI_ABORT);
        return;
    }
    fn(framebuffer, numLayers, focalPointsPerLayer, requestedFeatures, reinterpret_cast<jint*>(providedFeatures_elems));
    env->ReleaseIntArrayElements(providedFeatures, providedFeatures_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferFoveationParametersQCOM(JNIEnv* env, jclass, jint framebuffer, jint layer, jint focalPoint, jfloat focalX, jfloat focalY, jfloat gainX, jfloat gainY, jfloat foveaArea) {
    using Fn = void (*)(jint, jint, jint, jfloat, jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFramebufferFoveationParametersQCOM"));
    if (!fn) {
        return;
    }
    fn(framebuffer, layer, focalPoint, focalX, focalY, gainX, gainY, foveaArea);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferParameteriMESA(JNIEnv* env, jclass, jint target, jint pname, jint param) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFramebufferParameteriMESA"));
    if (!fn) {
        return;
    }
    fn(target, pname, param);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferPixelLocalStorageSizeEXT(JNIEnv* env, jclass, jint target, jint size) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFramebufferPixelLocalStorageSizeEXT"));
    if (!fn) {
        return;
    }
    fn(target, size);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferRenderbuffer(JNIEnv* env, jclass, jint target, jint attachment, jint renderbuffertarget, jint renderbuffer) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFramebufferRenderbuffer"));
    if (!fn) {
        return;
    }
    fn(target, attachment, renderbuffertarget, renderbuffer);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferSampleLocationsfvNV(JNIEnv* env, jclass, jint target, jint start, jint count, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFramebufferSampleLocationsfvNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(v, v_elems, JNI_ABORT);
        return;
    }
    fn(target, start, count, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferTexture2D(JNIEnv* env, jclass, jint target, jint attachment, jint textarget, jint texture, jint level) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFramebufferTexture2D"));
    if (!fn) {
        return;
    }
    fn(target, attachment, textarget, texture, level);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferTexture2DDownsampleIMG(JNIEnv* env, jclass, jint target, jint attachment, jint textarget, jint texture, jint level, jint xscale, jint yscale) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFramebufferTexture2DDownsampleIMG"));
    if (!fn) {
        return;
    }
    fn(target, attachment, textarget, texture, level, xscale, yscale);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferTexture2DMultisampleEXT(JNIEnv* env, jclass, jint target, jint attachment, jint textarget, jint texture, jint level, jint samples) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFramebufferTexture2DMultisampleEXT"));
    if (!fn) {
        return;
    }
    fn(target, attachment, textarget, texture, level, samples);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferTexture2DMultisampleIMG(JNIEnv* env, jclass, jint target, jint attachment, jint textarget, jint texture, jint level, jint samples) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFramebufferTexture2DMultisampleIMG"));
    if (!fn) {
        return;
    }
    fn(target, attachment, textarget, texture, level, samples);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferTexture3DOES(JNIEnv* env, jclass, jint target, jint attachment, jint textarget, jint texture, jint level, jint zoffset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFramebufferTexture3DOES"));
    if (!fn) {
        return;
    }
    fn(target, attachment, textarget, texture, level, zoffset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferTextureEXT(JNIEnv* env, jclass, jint target, jint attachment, jint texture, jint level) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFramebufferTextureEXT"));
    if (!fn) {
        return;
    }
    fn(target, attachment, texture, level);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferTextureLayer(JNIEnv* env, jclass, jint target, jint attachment, jint texture, jint level, jint layer) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFramebufferTextureLayer"));
    if (!fn) {
        return;
    }
    fn(target, attachment, texture, level, layer);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferTextureLayerDownsampleIMG(JNIEnv* env, jclass, jint target, jint attachment, jint texture, jint level, jint layer, jint xscale, jint yscale) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFramebufferTextureLayerDownsampleIMG"));
    if (!fn) {
        return;
    }
    fn(target, attachment, texture, level, layer, xscale, yscale);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferTextureMultisampleMultiviewOVR(JNIEnv* env, jclass, jint target, jint attachment, jint texture, jint level, jint samples, jint baseViewIndex, jint numViews) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFramebufferTextureMultisampleMultiviewOVR"));
    if (!fn) {
        return;
    }
    fn(target, attachment, texture, level, samples, baseViewIndex, numViews);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferTextureMultiviewOVR(JNIEnv* env, jclass, jint target, jint attachment, jint texture, jint level, jint baseViewIndex, jint numViews) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFramebufferTextureMultiviewOVR"));
    if (!fn) {
        return;
    }
    fn(target, attachment, texture, level, baseViewIndex, numViews);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferTextureOES(JNIEnv* env, jclass, jint target, jint attachment, jint texture, jint level) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFramebufferTextureOES"));
    if (!fn) {
        return;
    }
    fn(target, attachment, texture, level);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFrontFace(JNIEnv* env, jclass, jint mode) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glFrontFace"));
    if (!fn) {
        return;
    }
    fn(mode);
}

static void libjglios_gles_glGenBuffers(JNIEnv* env, jclass, jint n, jintArray buffers) {
    jint* buffers_elems = env->GetIntArrayElements(buffers, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGenBuffers"));
    if (!fn) {
        env->ReleaseIntArrayElements(buffers, buffers_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(buffers_elems));
    env->ReleaseIntArrayElements(buffers, buffers_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenBuffers__ILjava_nio_IntBuffer_2J(JNIEnv* env, jclass, jint n, jobject buffers, jlong buffersOffset) {
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGenBuffers"));
    if (!fn) {
        return;
    }
    jint* data = static_cast<jint*>(directBufferAddress(env, buffers, buffersOffset));
    if (env->ExceptionCheck()) {
        return;
    }
    fn(n, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenFencesNV(JNIEnv* env, jclass, jint n, jintArray fences) {
    jint* fences_elems = env->GetIntArrayElements(fences, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGenFencesNV"));
    if (!fn) {
        env->ReleaseIntArrayElements(fences, fences_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(fences_elems));
    env->ReleaseIntArrayElements(fences, fences_elems, 0);
}

static void libjglios_gles_glGenFramebuffers(JNIEnv* env, jclass, jint n, jintArray framebuffers) {
    jint* framebuffers_elems = env->GetIntArrayElements(framebuffers, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGenFramebuffers"));
    if (!fn) {
        env->ReleaseIntArrayElements(framebuffers, framebuffers_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(framebuffers_elems));
    env->ReleaseIntArrayElements(framebuffers, framebuffers_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenFramebuffers__ILjava_nio_IntBuffer_2J(JNIEnv* env, jclass, jint n, jobject framebuffers, jlong framebuffersOffset) {
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGenFramebuffers"));
    if (!fn) {
        return;
    }
    jint* data = static_cast<jint*>(directBufferAddress(env, framebuffers, framebuffersOffset));
    if (env->ExceptionCheck()) {
        return;
    }
    fn(n, data);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenPathsNV(JNIEnv* env, jclass, jint range) {
    using Fn = jint (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGenPathsNV"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn(range);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenPerfMonitorsAMD(JNIEnv* env, jclass, jint n, jintArray monitors) {
    jint* monitors_elems = env->GetIntArrayElements(monitors, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGenPerfMonitorsAMD"));
    if (!fn) {
        env->ReleaseIntArrayElements(monitors, monitors_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(monitors_elems));
    env->ReleaseIntArrayElements(monitors, monitors_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenProgramPipelinesEXT(JNIEnv* env, jclass, jint n, jintArray pipelines) {
    jint* pipelines_elems = env->GetIntArrayElements(pipelines, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGenProgramPipelinesEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(pipelines, pipelines_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(pipelines_elems));
    env->ReleaseIntArrayElements(pipelines, pipelines_elems, 0);
}

static void libjglios_gles_glGenQueries(JNIEnv* env, jclass, jint n, jintArray ids) {
    jint* ids_elems = env->GetIntArrayElements(ids, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGenQueries"));
    if (!fn) {
        env->ReleaseIntArrayElements(ids, ids_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(ids_elems));
    env->ReleaseIntArrayElements(ids, ids_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenQueries__ILjava_nio_IntBuffer_2J(JNIEnv* env, jclass, jint n, jobject ids, jlong idsOffset) {
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGenQueries"));
    if (!fn) {
        return;
    }
    jint* data = static_cast<jint*>(directBufferAddress(env, ids, idsOffset));
    if (env->ExceptionCheck()) {
        return;
    }
    fn(n, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenQueriesEXT(JNIEnv* env, jclass, jint n, jintArray ids) {
    jint* ids_elems = env->GetIntArrayElements(ids, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGenQueriesEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(ids, ids_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(ids_elems));
    env->ReleaseIntArrayElements(ids, ids_elems, 0);
}

static void libjglios_gles_glGenRenderbuffers(JNIEnv* env, jclass, jint n, jintArray renderbuffers) {
    jint* renderbuffers_elems = env->GetIntArrayElements(renderbuffers, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGenRenderbuffers"));
    if (!fn) {
        env->ReleaseIntArrayElements(renderbuffers, renderbuffers_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(renderbuffers_elems));
    env->ReleaseIntArrayElements(renderbuffers, renderbuffers_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenRenderbuffers__ILjava_nio_IntBuffer_2J(JNIEnv* env, jclass, jint n, jobject renderbuffers, jlong renderbuffersOffset) {
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGenRenderbuffers"));
    if (!fn) {
        return;
    }
    jint* data = static_cast<jint*>(directBufferAddress(env, renderbuffers, renderbuffersOffset));
    if (env->ExceptionCheck()) {
        return;
    }
    fn(n, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenSamplers(JNIEnv* env, jclass, jint count, jintArray samplers) {
    jint* samplers_elems = env->GetIntArrayElements(samplers, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGenSamplers"));
    if (!fn) {
        env->ReleaseIntArrayElements(samplers, samplers_elems, JNI_ABORT);
        return;
    }
    fn(count, reinterpret_cast<jint*>(samplers_elems));
    env->ReleaseIntArrayElements(samplers, samplers_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenSemaphoresEXT(JNIEnv* env, jclass, jint n, jintArray semaphores) {
    jint* semaphores_elems = env->GetIntArrayElements(semaphores, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGenSemaphoresEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(semaphores, semaphores_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(semaphores_elems));
    env->ReleaseIntArrayElements(semaphores, semaphores_elems, 0);
}

static void libjglios_gles_glGenTextures(JNIEnv* env, jclass, jint n, jintArray textures) {
    jint* textures_elems = env->GetIntArrayElements(textures, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGenTextures"));
    if (!fn) {
        env->ReleaseIntArrayElements(textures, textures_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(textures_elems));
    env->ReleaseIntArrayElements(textures, textures_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenTextures__ILjava_nio_IntBuffer_2J(JNIEnv* env, jclass, jint n, jobject textures, jlong texturesOffset) {
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGenTextures"));
    if (!fn) {
        return;
    }
    jint* data = static_cast<jint*>(directBufferAddress(env, textures, texturesOffset));
    if (env->ExceptionCheck()) {
        return;
    }
    fn(n, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenTransformFeedbacks(JNIEnv* env, jclass, jint n, jintArray ids) {
    jint* ids_elems = env->GetIntArrayElements(ids, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGenTransformFeedbacks"));
    if (!fn) {
        env->ReleaseIntArrayElements(ids, ids_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(ids_elems));
    env->ReleaseIntArrayElements(ids, ids_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenVertexArrays(JNIEnv* env, jclass, jint n, jintArray arrays) {
    jint* arrays_elems = env->GetIntArrayElements(arrays, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGenVertexArrays"));
    if (!fn) {
        env->ReleaseIntArrayElements(arrays, arrays_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(arrays_elems));
    env->ReleaseIntArrayElements(arrays, arrays_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenVertexArraysOES(JNIEnv* env, jclass, jint n, jintArray arrays) {
    jint* arrays_elems = env->GetIntArrayElements(arrays, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGenVertexArraysOES"));
    if (!fn) {
        env->ReleaseIntArrayElements(arrays, arrays_elems, JNI_ABORT);
        return;
    }
    fn(n, reinterpret_cast<jint*>(arrays_elems));
    env->ReleaseIntArrayElements(arrays, arrays_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenerateMipmap(JNIEnv* env, jclass, jint target) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGenerateMipmap"));
    if (!fn) {
        return;
    }
    fn(target);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetActiveAttrib(JNIEnv* env, jclass, jint program, jint index, jint bufSize, jintArray length, jintArray size, jintArray type, jbyteArray name) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jint* size_elems = env->GetIntArrayElements(size, nullptr);
    jint* type_elems = env->GetIntArrayElements(type, nullptr);
    jbyte* name_elems = env->GetByteArrayElements(name, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*, jint*, jint*, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetActiveAttrib"));
    if (!fn) {
        env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(size, size_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(type, type_elems, JNI_ABORT);
        env->ReleaseByteArrayElements(name, name_elems, JNI_ABORT);
        return;
    }
    fn(program, index, bufSize, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jint*>(size_elems), reinterpret_cast<jint*>(type_elems), reinterpret_cast<jbyte*>(name_elems));
    env->ReleaseByteArrayElements(name, name_elems, 0);
    env->ReleaseIntArrayElements(type, type_elems, 0);
    env->ReleaseIntArrayElements(size, size_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetActiveUniform(JNIEnv* env, jclass, jint program, jint index, jint bufSize, jintArray length, jintArray size, jintArray type, jbyteArray name) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jint* size_elems = env->GetIntArrayElements(size, nullptr);
    jint* type_elems = env->GetIntArrayElements(type, nullptr);
    jbyte* name_elems = env->GetByteArrayElements(name, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*, jint*, jint*, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetActiveUniform"));
    if (!fn) {
        env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(size, size_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(type, type_elems, JNI_ABORT);
        env->ReleaseByteArrayElements(name, name_elems, JNI_ABORT);
        return;
    }
    fn(program, index, bufSize, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jint*>(size_elems), reinterpret_cast<jint*>(type_elems), reinterpret_cast<jbyte*>(name_elems));
    env->ReleaseByteArrayElements(name, name_elems, 0);
    env->ReleaseIntArrayElements(type, type_elems, 0);
    env->ReleaseIntArrayElements(size, size_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetActiveUniformBlockName(JNIEnv* env, jclass, jint program, jint uniformBlockIndex, jint bufSize, jintArray length, jbyteArray uniformBlockName) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jbyte* uniformBlockName_elems = env->GetByteArrayElements(uniformBlockName, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetActiveUniformBlockName"));
    if (!fn) {
        env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
        env->ReleaseByteArrayElements(uniformBlockName, uniformBlockName_elems, JNI_ABORT);
        return;
    }
    fn(program, uniformBlockIndex, bufSize, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jbyte*>(uniformBlockName_elems));
    env->ReleaseByteArrayElements(uniformBlockName, uniformBlockName_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetActiveUniformBlockiv(JNIEnv* env, jclass, jint program, jint uniformBlockIndex, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetActiveUniformBlockiv"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(program, uniformBlockIndex, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetActiveUniformsiv(JNIEnv* env, jclass, jint program, jint uniformCount, jintArray uniformIndices, jint pname, jintArray params) {
    jint* uniformIndices_elems = env->GetIntArrayElements(uniformIndices, nullptr);
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetActiveUniformsiv"));
    if (!fn) {
        env->ReleaseIntArrayElements(uniformIndices, uniformIndices_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(program, uniformCount, reinterpret_cast<jint*>(uniformIndices_elems), pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
    env->ReleaseIntArrayElements(uniformIndices, uniformIndices_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetAttachedShaders(JNIEnv* env, jclass, jint program, jint maxCount, jintArray count, jintArray shaders) {
    jint* count_elems = env->GetIntArrayElements(count, nullptr);
    jint* shaders_elems = env->GetIntArrayElements(shaders, nullptr);
    using Fn = void (*)(jint, jint, jint*, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetAttachedShaders"));
    if (!fn) {
        env->ReleaseIntArrayElements(count, count_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(shaders, shaders_elems, JNI_ABORT);
        return;
    }
    fn(program, maxCount, reinterpret_cast<jint*>(count_elems), reinterpret_cast<jint*>(shaders_elems));
    env->ReleaseIntArrayElements(shaders, shaders_elems, 0);
    env->ReleaseIntArrayElements(count, count_elems, 0);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetAttribLocation(JNIEnv* env, jclass, jint program, jbyteArray name) {
    jbyte* name_elems = env->GetByteArrayElements(name, nullptr);
    using Fn = jint (*)(jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetAttribLocation"));
    if (!fn) {
        env->ReleaseByteArrayElements(name, name_elems, JNI_ABORT);
        return static_cast<jint>(0);
    }
    auto result = fn(program, reinterpret_cast<jbyte*>(name_elems));
    env->ReleaseByteArrayElements(name, name_elems, 0);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetBooleanv(JNIEnv* env, jclass, jint pname, jbyteArray data) {
    jbyte* data_elems = env->GetByteArrayElements(data, nullptr);
    using Fn = void (*)(jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetBooleanv"));
    if (!fn) {
        env->ReleaseByteArrayElements(data, data_elems, JNI_ABORT);
        return;
    }
    fn(pname, reinterpret_cast<jbyte*>(data_elems));
    env->ReleaseByteArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetBufferParameteri64v(JNIEnv* env, jclass, jint target, jint pname, jlongArray params) {
    jlong* params_elems = env->GetLongArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetBufferParameteri64v"));
    if (!fn) {
        env->ReleaseLongArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(target, pname, reinterpret_cast<jlong*>(params_elems));
    env->ReleaseLongArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetBufferParameteriv(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetBufferParameteriv"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetBufferPointerv(JNIEnv* env, jclass, jint target, jint pname, jlong params) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetBufferPointerv"));
    if (!fn) {
        return;
    }
    fn(target, pname, params);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetBufferPointervOES(JNIEnv* env, jclass, jint target, jint pname, jlong params) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetBufferPointervOES"));
    if (!fn) {
        return;
    }
    fn(target, pname, params);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetCoverageModulationTableNV(JNIEnv* env, jclass, jint bufSize, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetCoverageModulationTableNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(v, v_elems, JNI_ABORT);
        return;
    }
    fn(bufSize, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetDebugMessageLogKHR(JNIEnv* env, jclass, jint count, jint bufSize, jintArray sources, jintArray types, jintArray ids, jintArray severities, jintArray lengths, jbyteArray messageLog) {
    jint* sources_elems = env->GetIntArrayElements(sources, nullptr);
    jint* types_elems = env->GetIntArrayElements(types, nullptr);
    jint* ids_elems = env->GetIntArrayElements(ids, nullptr);
    jint* severities_elems = env->GetIntArrayElements(severities, nullptr);
    jint* lengths_elems = env->GetIntArrayElements(lengths, nullptr);
    jbyte* messageLog_elems = env->GetByteArrayElements(messageLog, nullptr);
    using Fn = jint (*)(jint, jint, jint*, jint*, jint*, jint*, jint*, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetDebugMessageLogKHR"));
    if (!fn) {
        env->ReleaseIntArrayElements(sources, sources_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(types, types_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(ids, ids_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(severities, severities_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(lengths, lengths_elems, JNI_ABORT);
        env->ReleaseByteArrayElements(messageLog, messageLog_elems, JNI_ABORT);
        return static_cast<jint>(0);
    }
    auto result = fn(count, bufSize, reinterpret_cast<jint*>(sources_elems), reinterpret_cast<jint*>(types_elems), reinterpret_cast<jint*>(ids_elems), reinterpret_cast<jint*>(severities_elems), reinterpret_cast<jint*>(lengths_elems), reinterpret_cast<jbyte*>(messageLog_elems));
    env->ReleaseByteArrayElements(messageLog, messageLog_elems, 0);
    env->ReleaseIntArrayElements(lengths, lengths_elems, 0);
    env->ReleaseIntArrayElements(severities, severities_elems, 0);
    env->ReleaseIntArrayElements(ids, ids_elems, 0);
    env->ReleaseIntArrayElements(types, types_elems, 0);
    env->ReleaseIntArrayElements(sources, sources_elems, 0);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetDriverControlStringQCOM(JNIEnv* env, jclass, jint driverControl, jint bufSize, jintArray length, jbyteArray driverControlString) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jbyte* driverControlString_elems = env->GetByteArrayElements(driverControlString, nullptr);
    using Fn = void (*)(jint, jint, jint*, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetDriverControlStringQCOM"));
    if (!fn) {
        env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
        env->ReleaseByteArrayElements(driverControlString, driverControlString_elems, JNI_ABORT);
        return;
    }
    fn(driverControl, bufSize, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jbyte*>(driverControlString_elems));
    env->ReleaseByteArrayElements(driverControlString, driverControlString_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetDriverControlsQCOM(JNIEnv* env, jclass, jintArray num, jint size, jintArray driverControls) {
    jint* num_elems = env->GetIntArrayElements(num, nullptr);
    jint* driverControls_elems = env->GetIntArrayElements(driverControls, nullptr);
    using Fn = void (*)(jint*, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetDriverControlsQCOM"));
    if (!fn) {
        env->ReleaseIntArrayElements(num, num_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(driverControls, driverControls_elems, JNI_ABORT);
        return;
    }
    fn(reinterpret_cast<jint*>(num_elems), size, reinterpret_cast<jint*>(driverControls_elems));
    env->ReleaseIntArrayElements(driverControls, driverControls_elems, 0);
    env->ReleaseIntArrayElements(num, num_elems, 0);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetError(JNIEnv* env, jclass) {
    using Fn = jint (*)(void);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetError"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn();
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetFenceivNV(JNIEnv* env, jclass, jint fence, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetFenceivNV"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(fence, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetFirstPerfQueryIdINTEL(JNIEnv* env, jclass, jintArray queryId) {
    jint* queryId_elems = env->GetIntArrayElements(queryId, nullptr);
    using Fn = void (*)(jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetFirstPerfQueryIdINTEL"));
    if (!fn) {
        env->ReleaseIntArrayElements(queryId, queryId_elems, JNI_ABORT);
        return;
    }
    fn(reinterpret_cast<jint*>(queryId_elems));
    env->ReleaseIntArrayElements(queryId, queryId_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetFloati_1vNV(JNIEnv* env, jclass, jint target, jint index, jfloatArray data) {
    jfloat* data_elems = env->GetFloatArrayElements(data, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetFloati_vNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(data, data_elems, JNI_ABORT);
        return;
    }
    fn(target, index, reinterpret_cast<jfloat*>(data_elems));
    env->ReleaseFloatArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetFloati_1vOES(JNIEnv* env, jclass, jint target, jint index, jfloatArray data) {
    jfloat* data_elems = env->GetFloatArrayElements(data, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetFloati_vOES"));
    if (!fn) {
        env->ReleaseFloatArrayElements(data, data_elems, JNI_ABORT);
        return;
    }
    fn(target, index, reinterpret_cast<jfloat*>(data_elems));
    env->ReleaseFloatArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetFloatv(JNIEnv* env, jclass, jint pname, jfloatArray data) {
    jfloat* data_elems = env->GetFloatArrayElements(data, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetFloatv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(data, data_elems, JNI_ABORT);
        return;
    }
    fn(pname, reinterpret_cast<jfloat*>(data_elems));
    env->ReleaseFloatArrayElements(data, data_elems, 0);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetFragDataIndexEXT(JNIEnv* env, jclass, jint program, jbyteArray name) {
    jbyte* name_elems = env->GetByteArrayElements(name, nullptr);
    using Fn = jint (*)(jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetFragDataIndexEXT"));
    if (!fn) {
        env->ReleaseByteArrayElements(name, name_elems, JNI_ABORT);
        return static_cast<jint>(0);
    }
    auto result = fn(program, reinterpret_cast<jbyte*>(name_elems));
    env->ReleaseByteArrayElements(name, name_elems, 0);
    return static_cast<jint>(result);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetFragDataLocation(JNIEnv* env, jclass, jint program, jbyteArray name) {
    jbyte* name_elems = env->GetByteArrayElements(name, nullptr);
    using Fn = jint (*)(jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetFragDataLocation"));
    if (!fn) {
        env->ReleaseByteArrayElements(name, name_elems, JNI_ABORT);
        return static_cast<jint>(0);
    }
    auto result = fn(program, reinterpret_cast<jbyte*>(name_elems));
    env->ReleaseByteArrayElements(name, name_elems, 0);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetFramebufferAttachmentParameteriv(JNIEnv* env, jclass, jint target, jint attachment, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetFramebufferAttachmentParameteriv"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(target, attachment, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetFramebufferParameterivMESA(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetFramebufferParameterivMESA"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetFramebufferPixelLocalStorageSizeEXT(JNIEnv* env, jclass, jint target) {
    using Fn = jint (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetFramebufferPixelLocalStorageSizeEXT"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn(target);
    return static_cast<jint>(result);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetGraphicsResetStatusEXT(JNIEnv* env, jclass) {
    using Fn = jint (*)(void);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetGraphicsResetStatusEXT"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn();
    return static_cast<jint>(result);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetGraphicsResetStatusKHR(JNIEnv* env, jclass) {
    using Fn = jint (*)(void);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetGraphicsResetStatusKHR"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn();
    return static_cast<jint>(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetImageHandleNV(JNIEnv* env, jclass, jint texture, jint level, jbyte layered, jint layer, jint format) {
    using Fn = jlong (*)(jint, jint, jbyte, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetImageHandleNV"));
    if (!fn) {
        return static_cast<jlong>(0);
    }
    auto result = fn(texture, level, layered, layer, format);
    return static_cast<jlong>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetInteger64i_1v(JNIEnv* env, jclass, jint target, jint index, jlongArray data) {
    jlong* data_elems = env->GetLongArrayElements(data, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetInteger64i_v"));
    if (!fn) {
        env->ReleaseLongArrayElements(data, data_elems, JNI_ABORT);
        return;
    }
    fn(target, index, reinterpret_cast<jlong*>(data_elems));
    env->ReleaseLongArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetInteger64v(JNIEnv* env, jclass, jint pname, jlongArray data) {
    jlong* data_elems = env->GetLongArrayElements(data, nullptr);
    using Fn = void (*)(jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetInteger64v"));
    if (!fn) {
        env->ReleaseLongArrayElements(data, data_elems, JNI_ABORT);
        return;
    }
    fn(pname, reinterpret_cast<jlong*>(data_elems));
    env->ReleaseLongArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetInteger64vAPPLE(JNIEnv* env, jclass, jint pname, jlongArray params) {
    jlong* params_elems = env->GetLongArrayElements(params, nullptr);
    using Fn = void (*)(jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetInteger64vAPPLE"));
    if (!fn) {
        env->ReleaseLongArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(pname, reinterpret_cast<jlong*>(params_elems));
    env->ReleaseLongArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetInteger64vEXT(JNIEnv* env, jclass, jint pname, jlongArray data) {
    jlong* data_elems = env->GetLongArrayElements(data, nullptr);
    using Fn = void (*)(jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetInteger64vEXT"));
    if (!fn) {
        env->ReleaseLongArrayElements(data, data_elems, JNI_ABORT);
        return;
    }
    fn(pname, reinterpret_cast<jlong*>(data_elems));
    env->ReleaseLongArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetIntegeri_1v(JNIEnv* env, jclass, jint target, jint index, jintArray data) {
    jint* data_elems = env->GetIntArrayElements(data, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetIntegeri_v"));
    if (!fn) {
        env->ReleaseIntArrayElements(data, data_elems, JNI_ABORT);
        return;
    }
    fn(target, index, reinterpret_cast<jint*>(data_elems));
    env->ReleaseIntArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetIntegeri_1vEXT(JNIEnv* env, jclass, jint target, jint index, jintArray data) {
    jint* data_elems = env->GetIntArrayElements(data, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetIntegeri_vEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(data, data_elems, JNI_ABORT);
        return;
    }
    fn(target, index, reinterpret_cast<jint*>(data_elems));
    env->ReleaseIntArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetIntegerv(JNIEnv* env, jclass, jint pname, jintArray data) {
    jint* data_elems = env->GetIntArrayElements(data, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetIntegerv"));
    if (!fn) {
        env->ReleaseIntArrayElements(data, data_elems, JNI_ABORT);
        return;
    }
    fn(pname, reinterpret_cast<jint*>(data_elems));
    env->ReleaseIntArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetInternalformatSampleivNV(JNIEnv* env, jclass, jint target, jint internalformat, jint samples, jint pname, jint count, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetInternalformatSampleivNV"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(target, internalformat, samples, pname, count, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetInternalformativ(JNIEnv* env, jclass, jint target, jint internalformat, jint pname, jint count, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetInternalformativ"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(target, internalformat, pname, count, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetMemoryObjectDetachedResourcesuivNV(JNIEnv* env, jclass, jint memory, jint pname, jint first, jint count, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetMemoryObjectDetachedResourcesuivNV"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(memory, pname, first, count, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetMemoryObjectParameterivEXT(JNIEnv* env, jclass, jint memoryObject, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetMemoryObjectParameterivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(memoryObject, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetNextPerfQueryIdINTEL(JNIEnv* env, jclass, jint queryId, jintArray nextQueryId) {
    jint* nextQueryId_elems = env->GetIntArrayElements(nextQueryId, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetNextPerfQueryIdINTEL"));
    if (!fn) {
        env->ReleaseIntArrayElements(nextQueryId, nextQueryId_elems, JNI_ABORT);
        return;
    }
    fn(queryId, reinterpret_cast<jint*>(nextQueryId_elems));
    env->ReleaseIntArrayElements(nextQueryId, nextQueryId_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetObjectLabelEXT(JNIEnv* env, jclass, jint type, jint object, jint bufSize, jintArray length, jbyteArray label) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jbyte* label_elems = env->GetByteArrayElements(label, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetObjectLabelEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
        env->ReleaseByteArrayElements(label, label_elems, JNI_ABORT);
        return;
    }
    fn(type, object, bufSize, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jbyte*>(label_elems));
    env->ReleaseByteArrayElements(label, label_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetObjectLabelKHR(JNIEnv* env, jclass, jint identifier, jint name, jint bufSize, jintArray length, jbyteArray label) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jbyte* label_elems = env->GetByteArrayElements(label, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetObjectLabelKHR"));
    if (!fn) {
        env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
        env->ReleaseByteArrayElements(label, label_elems, JNI_ABORT);
        return;
    }
    fn(identifier, name, bufSize, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jbyte*>(label_elems));
    env->ReleaseByteArrayElements(label, label_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetObjectPtrLabelKHR(JNIEnv* env, jclass, jlong ptr, jint bufSize, jintArray length, jbyteArray label) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jbyte* label_elems = env->GetByteArrayElements(label, nullptr);
    using Fn = void (*)(jlong, jint, jint*, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetObjectPtrLabelKHR"));
    if (!fn) {
        env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
        env->ReleaseByteArrayElements(label, label_elems, JNI_ABORT);
        return;
    }
    fn(ptr, bufSize, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jbyte*>(label_elems));
    env->ReleaseByteArrayElements(label, label_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPathCommandsNV(JNIEnv* env, jclass, jint path, jbyteArray commands) {
    jbyte* commands_elems = env->GetByteArrayElements(commands, nullptr);
    using Fn = void (*)(jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetPathCommandsNV"));
    if (!fn) {
        env->ReleaseByteArrayElements(commands, commands_elems, JNI_ABORT);
        return;
    }
    fn(path, reinterpret_cast<jbyte*>(commands_elems));
    env->ReleaseByteArrayElements(commands, commands_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPathCoordsNV(JNIEnv* env, jclass, jint path, jfloatArray coords) {
    jfloat* coords_elems = env->GetFloatArrayElements(coords, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetPathCoordsNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(coords, coords_elems, JNI_ABORT);
        return;
    }
    fn(path, reinterpret_cast<jfloat*>(coords_elems));
    env->ReleaseFloatArrayElements(coords, coords_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPathDashArrayNV(JNIEnv* env, jclass, jint path, jfloatArray dashArray) {
    jfloat* dashArray_elems = env->GetFloatArrayElements(dashArray, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetPathDashArrayNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(dashArray, dashArray_elems, JNI_ABORT);
        return;
    }
    fn(path, reinterpret_cast<jfloat*>(dashArray_elems));
    env->ReleaseFloatArrayElements(dashArray, dashArray_elems, 0);
}

JNIEXPORT jfloat JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPathLengthNV(JNIEnv* env, jclass, jint path, jint startSegment, jint numSegments) {
    using Fn = jfloat (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetPathLengthNV"));
    if (!fn) {
        return static_cast<jfloat>(0.0f);
    }
    auto result = fn(path, startSegment, numSegments);
    return static_cast<jfloat>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPathMetricRangeNV(JNIEnv* env, jclass, jint metricQueryMask, jint firstPathName, jint numPaths, jint stride, jfloatArray metrics) {
    jfloat* metrics_elems = env->GetFloatArrayElements(metrics, nullptr);
    using Fn = void (*)(jint, jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetPathMetricRangeNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(metrics, metrics_elems, JNI_ABORT);
        return;
    }
    fn(metricQueryMask, firstPathName, numPaths, stride, reinterpret_cast<jfloat*>(metrics_elems));
    env->ReleaseFloatArrayElements(metrics, metrics_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPathMetricsNV(JNIEnv* env, jclass, jint metricQueryMask, jint numPaths, jint pathNameType, jlong paths, jint pathBase, jint stride, jfloatArray metrics) {
    jfloat* metrics_elems = env->GetFloatArrayElements(metrics, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetPathMetricsNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(metrics, metrics_elems, JNI_ABORT);
        return;
    }
    fn(metricQueryMask, numPaths, pathNameType, paths, pathBase, stride, reinterpret_cast<jfloat*>(metrics_elems));
    env->ReleaseFloatArrayElements(metrics, metrics_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPathParameterfvNV(JNIEnv* env, jclass, jint path, jint pname, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetPathParameterfvNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(path, pname, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPathParameterivNV(JNIEnv* env, jclass, jint path, jint pname, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetPathParameterivNV"));
    if (!fn) {
        env->ReleaseIntArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(path, pname, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPathSpacingNV(JNIEnv* env, jclass, jint pathListMode, jint numPaths, jint pathNameType, jlong paths, jint pathBase, jfloat advanceScale, jfloat kerningScale, jint transformType, jfloatArray returnedSpacing) {
    jfloat* returnedSpacing_elems = env->GetFloatArrayElements(returnedSpacing, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong, jint, jfloat, jfloat, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetPathSpacingNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(returnedSpacing, returnedSpacing_elems, JNI_ABORT);
        return;
    }
    fn(pathListMode, numPaths, pathNameType, paths, pathBase, advanceScale, kerningScale, transformType, reinterpret_cast<jfloat*>(returnedSpacing_elems));
    env->ReleaseFloatArrayElements(returnedSpacing, returnedSpacing_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPerfCounterInfoINTEL(JNIEnv* env, jclass, jint queryId, jint counterId, jint counterNameLength, jbyteArray counterName, jint counterDescLength, jbyteArray counterDesc, jintArray counterOffset, jintArray counterDataSize, jintArray counterTypeEnum, jintArray counterDataTypeEnum, jlongArray rawCounterMaxValue) {
    jbyte* counterName_elems = env->GetByteArrayElements(counterName, nullptr);
    jbyte* counterDesc_elems = env->GetByteArrayElements(counterDesc, nullptr);
    jint* counterOffset_elems = env->GetIntArrayElements(counterOffset, nullptr);
    jint* counterDataSize_elems = env->GetIntArrayElements(counterDataSize, nullptr);
    jint* counterTypeEnum_elems = env->GetIntArrayElements(counterTypeEnum, nullptr);
    jint* counterDataTypeEnum_elems = env->GetIntArrayElements(counterDataTypeEnum, nullptr);
    jlong* rawCounterMaxValue_elems = env->GetLongArrayElements(rawCounterMaxValue, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte*, jint, jbyte*, jint*, jint*, jint*, jint*, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetPerfCounterInfoINTEL"));
    if (!fn) {
        env->ReleaseByteArrayElements(counterName, counterName_elems, JNI_ABORT);
        env->ReleaseByteArrayElements(counterDesc, counterDesc_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(counterOffset, counterOffset_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(counterDataSize, counterDataSize_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(counterTypeEnum, counterTypeEnum_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(counterDataTypeEnum, counterDataTypeEnum_elems, JNI_ABORT);
        env->ReleaseLongArrayElements(rawCounterMaxValue, rawCounterMaxValue_elems, JNI_ABORT);
        return;
    }
    fn(queryId, counterId, counterNameLength, reinterpret_cast<jbyte*>(counterName_elems), counterDescLength, reinterpret_cast<jbyte*>(counterDesc_elems), reinterpret_cast<jint*>(counterOffset_elems), reinterpret_cast<jint*>(counterDataSize_elems), reinterpret_cast<jint*>(counterTypeEnum_elems), reinterpret_cast<jint*>(counterDataTypeEnum_elems), reinterpret_cast<jlong*>(rawCounterMaxValue_elems));
    env->ReleaseLongArrayElements(rawCounterMaxValue, rawCounterMaxValue_elems, 0);
    env->ReleaseIntArrayElements(counterDataTypeEnum, counterDataTypeEnum_elems, 0);
    env->ReleaseIntArrayElements(counterTypeEnum, counterTypeEnum_elems, 0);
    env->ReleaseIntArrayElements(counterDataSize, counterDataSize_elems, 0);
    env->ReleaseIntArrayElements(counterOffset, counterOffset_elems, 0);
    env->ReleaseByteArrayElements(counterDesc, counterDesc_elems, 0);
    env->ReleaseByteArrayElements(counterName, counterName_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPerfMonitorCounterDataAMD(JNIEnv* env, jclass, jint monitor, jint pname, jint dataSize, jintArray data, jintArray bytesWritten) {
    jint* data_elems = env->GetIntArrayElements(data, nullptr);
    jint* bytesWritten_elems = env->GetIntArrayElements(bytesWritten, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetPerfMonitorCounterDataAMD"));
    if (!fn) {
        env->ReleaseIntArrayElements(data, data_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(bytesWritten, bytesWritten_elems, JNI_ABORT);
        return;
    }
    fn(monitor, pname, dataSize, reinterpret_cast<jint*>(data_elems), reinterpret_cast<jint*>(bytesWritten_elems));
    env->ReleaseIntArrayElements(bytesWritten, bytesWritten_elems, 0);
    env->ReleaseIntArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPerfMonitorCounterInfoAMD(JNIEnv* env, jclass, jint group, jint counter, jint pname, jlong data) {
    using Fn = void (*)(jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetPerfMonitorCounterInfoAMD"));
    if (!fn) {
        return;
    }
    fn(group, counter, pname, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPerfMonitorCounterStringAMD(JNIEnv* env, jclass, jint group, jint counter, jint bufSize, jintArray length, jbyteArray counterString) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jbyte* counterString_elems = env->GetByteArrayElements(counterString, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetPerfMonitorCounterStringAMD"));
    if (!fn) {
        env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
        env->ReleaseByteArrayElements(counterString, counterString_elems, JNI_ABORT);
        return;
    }
    fn(group, counter, bufSize, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jbyte*>(counterString_elems));
    env->ReleaseByteArrayElements(counterString, counterString_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPerfMonitorCountersAMD(JNIEnv* env, jclass, jint group, jintArray numCounters, jintArray maxActiveCounters, jint counterSize, jintArray counters) {
    jint* numCounters_elems = env->GetIntArrayElements(numCounters, nullptr);
    jint* maxActiveCounters_elems = env->GetIntArrayElements(maxActiveCounters, nullptr);
    jint* counters_elems = env->GetIntArrayElements(counters, nullptr);
    using Fn = void (*)(jint, jint*, jint*, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetPerfMonitorCountersAMD"));
    if (!fn) {
        env->ReleaseIntArrayElements(numCounters, numCounters_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(maxActiveCounters, maxActiveCounters_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(counters, counters_elems, JNI_ABORT);
        return;
    }
    fn(group, reinterpret_cast<jint*>(numCounters_elems), reinterpret_cast<jint*>(maxActiveCounters_elems), counterSize, reinterpret_cast<jint*>(counters_elems));
    env->ReleaseIntArrayElements(counters, counters_elems, 0);
    env->ReleaseIntArrayElements(maxActiveCounters, maxActiveCounters_elems, 0);
    env->ReleaseIntArrayElements(numCounters, numCounters_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPerfMonitorGroupStringAMD(JNIEnv* env, jclass, jint group, jint bufSize, jintArray length, jbyteArray groupString) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jbyte* groupString_elems = env->GetByteArrayElements(groupString, nullptr);
    using Fn = void (*)(jint, jint, jint*, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetPerfMonitorGroupStringAMD"));
    if (!fn) {
        env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
        env->ReleaseByteArrayElements(groupString, groupString_elems, JNI_ABORT);
        return;
    }
    fn(group, bufSize, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jbyte*>(groupString_elems));
    env->ReleaseByteArrayElements(groupString, groupString_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPerfMonitorGroupsAMD(JNIEnv* env, jclass, jintArray numGroups, jint groupsSize, jintArray groups) {
    jint* numGroups_elems = env->GetIntArrayElements(numGroups, nullptr);
    jint* groups_elems = env->GetIntArrayElements(groups, nullptr);
    using Fn = void (*)(jint*, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetPerfMonitorGroupsAMD"));
    if (!fn) {
        env->ReleaseIntArrayElements(numGroups, numGroups_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(groups, groups_elems, JNI_ABORT);
        return;
    }
    fn(reinterpret_cast<jint*>(numGroups_elems), groupsSize, reinterpret_cast<jint*>(groups_elems));
    env->ReleaseIntArrayElements(groups, groups_elems, 0);
    env->ReleaseIntArrayElements(numGroups, numGroups_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPerfQueryDataINTEL(JNIEnv* env, jclass, jint queryHandle, jint flags, jint dataSize, jlong data, jintArray bytesWritten) {
    jint* bytesWritten_elems = env->GetIntArrayElements(bytesWritten, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetPerfQueryDataINTEL"));
    if (!fn) {
        env->ReleaseIntArrayElements(bytesWritten, bytesWritten_elems, JNI_ABORT);
        return;
    }
    fn(queryHandle, flags, dataSize, data, reinterpret_cast<jint*>(bytesWritten_elems));
    env->ReleaseIntArrayElements(bytesWritten, bytesWritten_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPerfQueryIdByNameINTEL(JNIEnv* env, jclass, jbyteArray queryName, jintArray queryId) {
    jbyte* queryName_elems = env->GetByteArrayElements(queryName, nullptr);
    jint* queryId_elems = env->GetIntArrayElements(queryId, nullptr);
    using Fn = void (*)(jbyte*, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetPerfQueryIdByNameINTEL"));
    if (!fn) {
        env->ReleaseByteArrayElements(queryName, queryName_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(queryId, queryId_elems, JNI_ABORT);
        return;
    }
    fn(reinterpret_cast<jbyte*>(queryName_elems), reinterpret_cast<jint*>(queryId_elems));
    env->ReleaseIntArrayElements(queryId, queryId_elems, 0);
    env->ReleaseByteArrayElements(queryName, queryName_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPerfQueryInfoINTEL(JNIEnv* env, jclass, jint queryId, jint queryNameLength, jbyteArray queryName, jintArray dataSize, jintArray noCounters, jintArray noInstances, jintArray capsMask) {
    jbyte* queryName_elems = env->GetByteArrayElements(queryName, nullptr);
    jint* dataSize_elems = env->GetIntArrayElements(dataSize, nullptr);
    jint* noCounters_elems = env->GetIntArrayElements(noCounters, nullptr);
    jint* noInstances_elems = env->GetIntArrayElements(noInstances, nullptr);
    jint* capsMask_elems = env->GetIntArrayElements(capsMask, nullptr);
    using Fn = void (*)(jint, jint, jbyte*, jint*, jint*, jint*, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetPerfQueryInfoINTEL"));
    if (!fn) {
        env->ReleaseByteArrayElements(queryName, queryName_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(dataSize, dataSize_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(noCounters, noCounters_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(noInstances, noInstances_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(capsMask, capsMask_elems, JNI_ABORT);
        return;
    }
    fn(queryId, queryNameLength, reinterpret_cast<jbyte*>(queryName_elems), reinterpret_cast<jint*>(dataSize_elems), reinterpret_cast<jint*>(noCounters_elems), reinterpret_cast<jint*>(noInstances_elems), reinterpret_cast<jint*>(capsMask_elems));
    env->ReleaseIntArrayElements(capsMask, capsMask_elems, 0);
    env->ReleaseIntArrayElements(noInstances, noInstances_elems, 0);
    env->ReleaseIntArrayElements(noCounters, noCounters_elems, 0);
    env->ReleaseIntArrayElements(dataSize, dataSize_elems, 0);
    env->ReleaseByteArrayElements(queryName, queryName_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPointervKHR(JNIEnv* env, jclass, jint pname, jlong params) {
    using Fn = void (*)(jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetPointervKHR"));
    if (!fn) {
        return;
    }
    fn(pname, params);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetProgramBinary(JNIEnv* env, jclass, jint program, jint bufSize, jintArray length, jintArray binaryFormat, jlong binary) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jint* binaryFormat_elems = env->GetIntArrayElements(binaryFormat, nullptr);
    using Fn = void (*)(jint, jint, jint*, jint*, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetProgramBinary"));
    if (!fn) {
        env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(binaryFormat, binaryFormat_elems, JNI_ABORT);
        return;
    }
    fn(program, bufSize, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jint*>(binaryFormat_elems), binary);
    env->ReleaseIntArrayElements(binaryFormat, binaryFormat_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetProgramBinaryOES(JNIEnv* env, jclass, jint program, jint bufSize, jintArray length, jintArray binaryFormat, jlong binary) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jint* binaryFormat_elems = env->GetIntArrayElements(binaryFormat, nullptr);
    using Fn = void (*)(jint, jint, jint*, jint*, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetProgramBinaryOES"));
    if (!fn) {
        env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(binaryFormat, binaryFormat_elems, JNI_ABORT);
        return;
    }
    fn(program, bufSize, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jint*>(binaryFormat_elems), binary);
    env->ReleaseIntArrayElements(binaryFormat, binaryFormat_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetProgramInfoLog(JNIEnv* env, jclass, jint program, jint bufSize, jintArray length, jbyteArray infoLog) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jbyte* infoLog_elems = env->GetByteArrayElements(infoLog, nullptr);
    using Fn = void (*)(jint, jint, jint*, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetProgramInfoLog"));
    if (!fn) {
        env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
        env->ReleaseByteArrayElements(infoLog, infoLog_elems, JNI_ABORT);
        return;
    }
    fn(program, bufSize, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jbyte*>(infoLog_elems));
    env->ReleaseByteArrayElements(infoLog, infoLog_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetProgramPipelineInfoLogEXT(JNIEnv* env, jclass, jint pipeline, jint bufSize, jintArray length, jbyteArray infoLog) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jbyte* infoLog_elems = env->GetByteArrayElements(infoLog, nullptr);
    using Fn = void (*)(jint, jint, jint*, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetProgramPipelineInfoLogEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
        env->ReleaseByteArrayElements(infoLog, infoLog_elems, JNI_ABORT);
        return;
    }
    fn(pipeline, bufSize, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jbyte*>(infoLog_elems));
    env->ReleaseByteArrayElements(infoLog, infoLog_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetProgramPipelineivEXT(JNIEnv* env, jclass, jint pipeline, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetProgramPipelineivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(pipeline, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetProgramResourceLocationIndexEXT(JNIEnv* env, jclass, jint program, jint programInterface, jbyteArray name) {
    jbyte* name_elems = env->GetByteArrayElements(name, nullptr);
    using Fn = jint (*)(jint, jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetProgramResourceLocationIndexEXT"));
    if (!fn) {
        env->ReleaseByteArrayElements(name, name_elems, JNI_ABORT);
        return static_cast<jint>(0);
    }
    auto result = fn(program, programInterface, reinterpret_cast<jbyte*>(name_elems));
    env->ReleaseByteArrayElements(name, name_elems, 0);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetProgramResourcefvNV(JNIEnv* env, jclass, jint program, jint programInterface, jint index, jint propCount, jintArray props, jint count, jintArray length, jfloatArray params) {
    jint* props_elems = env->GetIntArrayElements(props, nullptr);
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jfloat* params_elems = env->GetFloatArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jint, jint*, jint, jint*, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetProgramResourcefvNV"));
    if (!fn) {
        env->ReleaseIntArrayElements(props, props_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
        env->ReleaseFloatArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(program, programInterface, index, propCount, reinterpret_cast<jint*>(props_elems), count, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jfloat*>(params_elems));
    env->ReleaseFloatArrayElements(params, params_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
    env->ReleaseIntArrayElements(props, props_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetProgramiv(JNIEnv* env, jclass, jint program, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetProgramiv"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(program, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetQueryObjecti64vEXT(JNIEnv* env, jclass, jint id, jint pname, jlongArray params) {
    jlong* params_elems = env->GetLongArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetQueryObjecti64vEXT"));
    if (!fn) {
        env->ReleaseLongArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(id, pname, reinterpret_cast<jlong*>(params_elems));
    env->ReleaseLongArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetQueryObjectivEXT(JNIEnv* env, jclass, jint id, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetQueryObjectivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(id, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetQueryObjectui64vEXT(JNIEnv* env, jclass, jint id, jint pname, jlongArray params) {
    jlong* params_elems = env->GetLongArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetQueryObjectui64vEXT"));
    if (!fn) {
        env->ReleaseLongArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(id, pname, reinterpret_cast<jlong*>(params_elems));
    env->ReleaseLongArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetQueryObjectuiv(JNIEnv* env, jclass, jint id, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetQueryObjectuiv"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(id, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetQueryObjectuivEXT(JNIEnv* env, jclass, jint id, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetQueryObjectuivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(id, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetQueryiv(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetQueryiv"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetQueryivEXT(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetQueryivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetRenderbufferParameteriv(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetRenderbufferParameteriv"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetSamplerParameterIivEXT(JNIEnv* env, jclass, jint sampler, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetSamplerParameterIivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(sampler, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetSamplerParameterIivOES(JNIEnv* env, jclass, jint sampler, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetSamplerParameterIivOES"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(sampler, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetSamplerParameterIuivEXT(JNIEnv* env, jclass, jint sampler, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetSamplerParameterIuivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(sampler, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetSamplerParameterIuivOES(JNIEnv* env, jclass, jint sampler, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetSamplerParameterIuivOES"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(sampler, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetSamplerParameterfv(JNIEnv* env, jclass, jint sampler, jint pname, jfloatArray params) {
    jfloat* params_elems = env->GetFloatArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetSamplerParameterfv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(sampler, pname, reinterpret_cast<jfloat*>(params_elems));
    env->ReleaseFloatArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetSamplerParameteriv(JNIEnv* env, jclass, jint sampler, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetSamplerParameteriv"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(sampler, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetSemaphoreParameterivNV(JNIEnv* env, jclass, jint semaphore, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetSemaphoreParameterivNV"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(semaphore, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetSemaphoreParameterui64vEXT(JNIEnv* env, jclass, jint semaphore, jint pname, jlongArray params) {
    jlong* params_elems = env->GetLongArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetSemaphoreParameterui64vEXT"));
    if (!fn) {
        env->ReleaseLongArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(semaphore, pname, reinterpret_cast<jlong*>(params_elems));
    env->ReleaseLongArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetShaderInfoLog(JNIEnv* env, jclass, jint shader, jint bufSize, jintArray length, jbyteArray infoLog) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jbyte* infoLog_elems = env->GetByteArrayElements(infoLog, nullptr);
    using Fn = void (*)(jint, jint, jint*, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetShaderInfoLog"));
    if (!fn) {
        env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
        env->ReleaseByteArrayElements(infoLog, infoLog_elems, JNI_ABORT);
        return;
    }
    fn(shader, bufSize, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jbyte*>(infoLog_elems));
    env->ReleaseByteArrayElements(infoLog, infoLog_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetShaderPrecisionFormat(JNIEnv* env, jclass, jint shadertype, jint precisiontype, jintArray range, jintArray precision) {
    jint* range_elems = env->GetIntArrayElements(range, nullptr);
    jint* precision_elems = env->GetIntArrayElements(precision, nullptr);
    using Fn = void (*)(jint, jint, jint*, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetShaderPrecisionFormat"));
    if (!fn) {
        env->ReleaseIntArrayElements(range, range_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(precision, precision_elems, JNI_ABORT);
        return;
    }
    fn(shadertype, precisiontype, reinterpret_cast<jint*>(range_elems), reinterpret_cast<jint*>(precision_elems));
    env->ReleaseIntArrayElements(precision, precision_elems, 0);
    env->ReleaseIntArrayElements(range, range_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetShaderSource(JNIEnv* env, jclass, jint shader, jint bufSize, jintArray length, jbyteArray source) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jbyte* source_elems = env->GetByteArrayElements(source, nullptr);
    using Fn = void (*)(jint, jint, jint*, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetShaderSource"));
    if (!fn) {
        env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
        env->ReleaseByteArrayElements(source, source_elems, JNI_ABORT);
        return;
    }
    fn(shader, bufSize, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jbyte*>(source_elems));
    env->ReleaseByteArrayElements(source, source_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetShaderiv(JNIEnv* env, jclass, jint shader, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetShaderiv"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(shader, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetShadingRateImagePaletteNV(JNIEnv* env, jclass, jint viewport, jint entry, jintArray rate) {
    jint* rate_elems = env->GetIntArrayElements(rate, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetShadingRateImagePaletteNV"));
    if (!fn) {
        env->ReleaseIntArrayElements(rate, rate_elems, JNI_ABORT);
        return;
    }
    fn(viewport, entry, reinterpret_cast<jint*>(rate_elems));
    env->ReleaseIntArrayElements(rate, rate_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetShadingRateSampleLocationivNV(JNIEnv* env, jclass, jint rate, jint samples, jint index, jintArray location) {
    jint* location_elems = env->GetIntArrayElements(location, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetShadingRateSampleLocationivNV"));
    if (!fn) {
        env->ReleaseIntArrayElements(location, location_elems, JNI_ABORT);
        return;
    }
    fn(rate, samples, index, reinterpret_cast<jint*>(location_elems));
    env->ReleaseIntArrayElements(location, location_elems, 0);
}

JNIEXPORT jbyteArray JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetString(JNIEnv* env, jclass, jint name) {
    using Fn = const char* (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetString"));
    const char* result = fn ? fn(name) : reinterpret_cast<const char*>(::glGetString(name));
    if (!result) {
        return nullptr;
    }
    size_t len = std::strlen(result);
    jbyteArray out = env->NewByteArray(static_cast<jsize>(len));
    if (!out) {
        return nullptr;
    }
    env->SetByteArrayRegion(out, 0, static_cast<jsize>(len), reinterpret_cast<const jbyte*>(result));
    return out;
}

JNIEXPORT jbyteArray JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetStringi(JNIEnv* env, jclass, jint name, jint index) {
    using Fn = const char* (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetStringi"));
    const char* result = fn ? fn(name, index) : reinterpret_cast<const char*>(::glGetStringi(name, index));
    if (!result) {
        return nullptr;
    }
    size_t len = std::strlen(result);
    jbyteArray out = env->NewByteArray(static_cast<jsize>(len));
    if (!out) {
        return nullptr;
    }
    env->SetByteArrayRegion(out, 0, static_cast<jsize>(len), reinterpret_cast<const jbyte*>(result));
    return out;
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetSynciv(JNIEnv* env, jclass, jlong sync, jint pname, jint count, jintArray length, jintArray values) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jint* values_elems = env->GetIntArrayElements(values, nullptr);
    using Fn = void (*)(jlong, jint, jint, jint*, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetSynciv"));
    if (!fn) {
        env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(values, values_elems, JNI_ABORT);
        return;
    }
    fn(sync, pname, count, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jint*>(values_elems));
    env->ReleaseIntArrayElements(values, values_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetSyncivAPPLE(JNIEnv* env, jclass, jlong sync, jint pname, jint count, jintArray length, jintArray values) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jint* values_elems = env->GetIntArrayElements(values, nullptr);
    using Fn = void (*)(jlong, jint, jint, jint*, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetSyncivAPPLE"));
    if (!fn) {
        env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(values, values_elems, JNI_ABORT);
        return;
    }
    fn(sync, pname, count, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jint*>(values_elems));
    env->ReleaseIntArrayElements(values, values_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetTexParameterIivEXT(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetTexParameterIivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetTexParameterIivOES(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetTexParameterIivOES"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetTexParameterIuivEXT(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetTexParameterIuivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetTexParameterIuivOES(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetTexParameterIuivOES"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetTexParameterfv(JNIEnv* env, jclass, jint target, jint pname, jfloatArray params) {
    jfloat* params_elems = env->GetFloatArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetTexParameterfv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(target, pname, reinterpret_cast<jfloat*>(params_elems));
    env->ReleaseFloatArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetTexParameteriv(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetTexParameteriv"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetTextureHandleIMG(JNIEnv* env, jclass, jint texture) {
    using Fn = jlong (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetTextureHandleIMG"));
    if (!fn) {
        return static_cast<jlong>(0);
    }
    auto result = fn(texture);
    return static_cast<jlong>(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetTextureHandleNV(JNIEnv* env, jclass, jint texture) {
    using Fn = jlong (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetTextureHandleNV"));
    if (!fn) {
        return static_cast<jlong>(0);
    }
    auto result = fn(texture);
    return static_cast<jlong>(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetTextureSamplerHandleIMG(JNIEnv* env, jclass, jint texture, jint sampler) {
    using Fn = jlong (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetTextureSamplerHandleIMG"));
    if (!fn) {
        return static_cast<jlong>(0);
    }
    auto result = fn(texture, sampler);
    return static_cast<jlong>(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetTextureSamplerHandleNV(JNIEnv* env, jclass, jint texture, jint sampler) {
    using Fn = jlong (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetTextureSamplerHandleNV"));
    if (!fn) {
        return static_cast<jlong>(0);
    }
    auto result = fn(texture, sampler);
    return static_cast<jlong>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetTransformFeedbackVarying(JNIEnv* env, jclass, jint program, jint index, jint bufSize, jintArray length, jintArray size, jintArray type, jbyteArray name) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jint* size_elems = env->GetIntArrayElements(size, nullptr);
    jint* type_elems = env->GetIntArrayElements(type, nullptr);
    jbyte* name_elems = env->GetByteArrayElements(name, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*, jint*, jint*, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetTransformFeedbackVarying"));
    if (!fn) {
        env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(size, size_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(type, type_elems, JNI_ABORT);
        env->ReleaseByteArrayElements(name, name_elems, JNI_ABORT);
        return;
    }
    fn(program, index, bufSize, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jint*>(size_elems), reinterpret_cast<jint*>(type_elems), reinterpret_cast<jbyte*>(name_elems));
    env->ReleaseByteArrayElements(name, name_elems, 0);
    env->ReleaseIntArrayElements(type, type_elems, 0);
    env->ReleaseIntArrayElements(size, size_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetTranslatedShaderSourceANGLE(JNIEnv* env, jclass, jint shader, jint bufSize, jintArray length, jbyteArray source) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jbyte* source_elems = env->GetByteArrayElements(source, nullptr);
    using Fn = void (*)(jint, jint, jint*, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetTranslatedShaderSourceANGLE"));
    if (!fn) {
        env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
        env->ReleaseByteArrayElements(source, source_elems, JNI_ABORT);
        return;
    }
    fn(shader, bufSize, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jbyte*>(source_elems));
    env->ReleaseByteArrayElements(source, source_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetUniformBlockIndex(JNIEnv* env, jclass, jint program, jbyteArray uniformBlockName) {
    jbyte* uniformBlockName_elems = env->GetByteArrayElements(uniformBlockName, nullptr);
    using Fn = jint (*)(jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetUniformBlockIndex"));
    if (!fn) {
        env->ReleaseByteArrayElements(uniformBlockName, uniformBlockName_elems, JNI_ABORT);
        return static_cast<jint>(0);
    }
    auto result = fn(program, reinterpret_cast<jbyte*>(uniformBlockName_elems));
    env->ReleaseByteArrayElements(uniformBlockName, uniformBlockName_elems, 0);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetUniformIndices(JNIEnv* env, jclass, jint program, jint uniformCount, jbyteArray uniformNames, jintArray uniformIndices) {
    jbyte* uniformNames_elems = env->GetByteArrayElements(uniformNames, nullptr);
    jint* uniformIndices_elems = env->GetIntArrayElements(uniformIndices, nullptr);
    using Fn = void (*)(jint, jint, jbyte*, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetUniformIndices"));
    if (!fn) {
        env->ReleaseByteArrayElements(uniformNames, uniformNames_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(uniformIndices, uniformIndices_elems, JNI_ABORT);
        return;
    }
    fn(program, uniformCount, reinterpret_cast<jbyte*>(uniformNames_elems), reinterpret_cast<jint*>(uniformIndices_elems));
    env->ReleaseIntArrayElements(uniformIndices, uniformIndices_elems, 0);
    env->ReleaseByteArrayElements(uniformNames, uniformNames_elems, 0);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetUniformLocation(JNIEnv* env, jclass, jint program, jbyteArray name) {
    jbyte* name_elems = env->GetByteArrayElements(name, nullptr);
    using Fn = jint (*)(jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetUniformLocation"));
    if (!fn) {
        env->ReleaseByteArrayElements(name, name_elems, JNI_ABORT);
        return static_cast<jint>(0);
    }
    auto result = fn(program, reinterpret_cast<jbyte*>(name_elems));
    env->ReleaseByteArrayElements(name, name_elems, 0);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetUniformfv(JNIEnv* env, jclass, jint program, jint location, jfloatArray params) {
    jfloat* params_elems = env->GetFloatArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetUniformfv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(program, location, reinterpret_cast<jfloat*>(params_elems));
    env->ReleaseFloatArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetUniformi64vNV(JNIEnv* env, jclass, jint program, jint location, jlongArray params) {
    jlong* params_elems = env->GetLongArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetUniformi64vNV"));
    if (!fn) {
        env->ReleaseLongArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(program, location, reinterpret_cast<jlong*>(params_elems));
    env->ReleaseLongArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetUniformiv(JNIEnv* env, jclass, jint program, jint location, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetUniformiv"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(program, location, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetUniformuiv(JNIEnv* env, jclass, jint program, jint location, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetUniformuiv"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(program, location, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetUnsignedBytei_1vEXT(JNIEnv* env, jclass, jint target, jint index, jbyteArray data) {
    jbyte* data_elems = env->GetByteArrayElements(data, nullptr);
    using Fn = void (*)(jint, jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetUnsignedBytei_vEXT"));
    if (!fn) {
        env->ReleaseByteArrayElements(data, data_elems, JNI_ABORT);
        return;
    }
    fn(target, index, reinterpret_cast<jbyte*>(data_elems));
    env->ReleaseByteArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetUnsignedBytevEXT(JNIEnv* env, jclass, jint pname, jbyteArray data) {
    jbyte* data_elems = env->GetByteArrayElements(data, nullptr);
    using Fn = void (*)(jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetUnsignedBytevEXT"));
    if (!fn) {
        env->ReleaseByteArrayElements(data, data_elems, JNI_ABORT);
        return;
    }
    fn(pname, reinterpret_cast<jbyte*>(data_elems));
    env->ReleaseByteArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetVertexAttribIiv(JNIEnv* env, jclass, jint index, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetVertexAttribIiv"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(index, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetVertexAttribIuiv(JNIEnv* env, jclass, jint index, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetVertexAttribIuiv"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(index, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetVertexAttribPointerv(JNIEnv* env, jclass, jint index, jint pname, jlong pointer) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetVertexAttribPointerv"));
    if (!fn) {
        return;
    }
    fn(index, pname, pointer);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetVertexAttribfv(JNIEnv* env, jclass, jint index, jint pname, jfloatArray params) {
    jfloat* params_elems = env->GetFloatArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetVertexAttribfv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(index, pname, reinterpret_cast<jfloat*>(params_elems));
    env->ReleaseFloatArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetVertexAttribiv(JNIEnv* env, jclass, jint index, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetVertexAttribiv"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(index, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetVkProcAddrNV(JNIEnv* env, jclass, jbyteArray name) {
    jbyte* name_elems = env->GetByteArrayElements(name, nullptr);
    using Fn = jlong (*)(jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetVkProcAddrNV"));
    if (!fn) {
        env->ReleaseByteArrayElements(name, name_elems, JNI_ABORT);
        return static_cast<jlong>(0);
    }
    auto result = fn(reinterpret_cast<jbyte*>(name_elems));
    env->ReleaseByteArrayElements(name, name_elems, 0);
    return static_cast<jlong>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetnUniformfvEXT(JNIEnv* env, jclass, jint program, jint location, jint bufSize, jfloatArray params) {
    jfloat* params_elems = env->GetFloatArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetnUniformfvEXT"));
    if (!fn) {
        env->ReleaseFloatArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(program, location, bufSize, reinterpret_cast<jfloat*>(params_elems));
    env->ReleaseFloatArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetnUniformfvKHR(JNIEnv* env, jclass, jint program, jint location, jint bufSize, jfloatArray params) {
    jfloat* params_elems = env->GetFloatArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetnUniformfvKHR"));
    if (!fn) {
        env->ReleaseFloatArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(program, location, bufSize, reinterpret_cast<jfloat*>(params_elems));
    env->ReleaseFloatArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetnUniformivEXT(JNIEnv* env, jclass, jint program, jint location, jint bufSize, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetnUniformivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(program, location, bufSize, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetnUniformivKHR(JNIEnv* env, jclass, jint program, jint location, jint bufSize, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetnUniformivKHR"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(program, location, bufSize, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetnUniformuivKHR(JNIEnv* env, jclass, jint program, jint location, jint bufSize, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glGetnUniformuivKHR"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(program, location, bufSize, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glHint(JNIEnv* env, jclass, jint target, jint mode) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glHint"));
    if (!fn) {
        return;
    }
    fn(target, mode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glImportMemoryFdEXT(JNIEnv* env, jclass, jint memory, jlong size, jint handleType, jint fd) {
    using Fn = void (*)(jint, jlong, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glImportMemoryFdEXT"));
    if (!fn) {
        return;
    }
    fn(memory, size, handleType, fd);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glImportMemoryWin32HandleEXT(JNIEnv* env, jclass, jint memory, jlong size, jint handleType, jlong handle) {
    using Fn = void (*)(jint, jlong, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glImportMemoryWin32HandleEXT"));
    if (!fn) {
        return;
    }
    fn(memory, size, handleType, handle);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glImportMemoryWin32NameEXT(JNIEnv* env, jclass, jint memory, jlong size, jint handleType, jlong name) {
    using Fn = void (*)(jint, jlong, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glImportMemoryWin32NameEXT"));
    if (!fn) {
        return;
    }
    fn(memory, size, handleType, name);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glImportSemaphoreFdEXT(JNIEnv* env, jclass, jint semaphore, jint handleType, jint fd) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glImportSemaphoreFdEXT"));
    if (!fn) {
        return;
    }
    fn(semaphore, handleType, fd);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glImportSemaphoreWin32HandleEXT(JNIEnv* env, jclass, jint semaphore, jint handleType, jlong handle) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glImportSemaphoreWin32HandleEXT"));
    if (!fn) {
        return;
    }
    fn(semaphore, handleType, handle);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glImportSemaphoreWin32NameEXT(JNIEnv* env, jclass, jint semaphore, jint handleType, jlong name) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glImportSemaphoreWin32NameEXT"));
    if (!fn) {
        return;
    }
    fn(semaphore, handleType, name);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glInsertEventMarkerEXT(JNIEnv* env, jclass, jint length, jbyteArray marker) {
    jbyte* marker_elems = env->GetByteArrayElements(marker, nullptr);
    using Fn = void (*)(jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glInsertEventMarkerEXT"));
    if (!fn) {
        env->ReleaseByteArrayElements(marker, marker_elems, JNI_ABORT);
        return;
    }
    fn(length, reinterpret_cast<jbyte*>(marker_elems));
    env->ReleaseByteArrayElements(marker, marker_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glInterpolatePathsNV(JNIEnv* env, jclass, jint resultPath, jint pathA, jint pathB, jfloat weight) {
    using Fn = void (*)(jint, jint, jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glInterpolatePathsNV"));
    if (!fn) {
        return;
    }
    fn(resultPath, pathA, pathB, weight);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glInvalidateFramebuffer(JNIEnv* env, jclass, jint target, jint numAttachments, jintArray attachments) {
    jint* attachments_elems = env->GetIntArrayElements(attachments, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glInvalidateFramebuffer"));
    if (!fn) {
        env->ReleaseIntArrayElements(attachments, attachments_elems, JNI_ABORT);
        return;
    }
    fn(target, numAttachments, reinterpret_cast<jint*>(attachments_elems));
    env->ReleaseIntArrayElements(attachments, attachments_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glInvalidateSubFramebuffer(JNIEnv* env, jclass, jint target, jint numAttachments, jintArray attachments, jint x, jint y, jint width, jint height) {
    jint* attachments_elems = env->GetIntArrayElements(attachments, nullptr);
    using Fn = void (*)(jint, jint, jint*, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glInvalidateSubFramebuffer"));
    if (!fn) {
        env->ReleaseIntArrayElements(attachments, attachments_elems, JNI_ABORT);
        return;
    }
    fn(target, numAttachments, reinterpret_cast<jint*>(attachments_elems), x, y, width, height);
    env->ReleaseIntArrayElements(attachments, attachments_elems, 0);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsBuffer(JNIEnv* env, jclass, jint buffer) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsBuffer"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(buffer);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsEnabled(JNIEnv* env, jclass, jint cap) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsEnabled"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(cap);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsEnablediEXT(JNIEnv* env, jclass, jint target, jint index) {
    using Fn = jbyte (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsEnablediEXT"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(target, index);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsEnablediNV(JNIEnv* env, jclass, jint target, jint index) {
    using Fn = jbyte (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsEnablediNV"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(target, index);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsEnablediOES(JNIEnv* env, jclass, jint target, jint index) {
    using Fn = jbyte (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsEnablediOES"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(target, index);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsFenceNV(JNIEnv* env, jclass, jint fence) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsFenceNV"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(fence);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsFramebuffer(JNIEnv* env, jclass, jint framebuffer) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsFramebuffer"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(framebuffer);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsImageHandleResidentNV(JNIEnv* env, jclass, jlong handle) {
    using Fn = jbyte (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsImageHandleResidentNV"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(handle);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsMemoryObjectEXT(JNIEnv* env, jclass, jint memoryObject) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsMemoryObjectEXT"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(memoryObject);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsPathNV(JNIEnv* env, jclass, jint path) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsPathNV"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(path);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsPointInFillPathNV(JNIEnv* env, jclass, jint path, jint mask, jfloat x, jfloat y) {
    using Fn = jbyte (*)(jint, jint, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsPointInFillPathNV"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(path, mask, x, y);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsPointInStrokePathNV(JNIEnv* env, jclass, jint path, jfloat x, jfloat y) {
    using Fn = jbyte (*)(jint, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsPointInStrokePathNV"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(path, x, y);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsProgram(JNIEnv* env, jclass, jint program) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsProgram"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(program);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsProgramPipelineEXT(JNIEnv* env, jclass, jint pipeline) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsProgramPipelineEXT"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(pipeline);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsQuery(JNIEnv* env, jclass, jint id) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsQuery"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(id);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsQueryEXT(JNIEnv* env, jclass, jint id) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsQueryEXT"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(id);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsRenderbuffer(JNIEnv* env, jclass, jint renderbuffer) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsRenderbuffer"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(renderbuffer);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsSampler(JNIEnv* env, jclass, jint sampler) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsSampler"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(sampler);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsSemaphoreEXT(JNIEnv* env, jclass, jint semaphore) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsSemaphoreEXT"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(semaphore);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsShader(JNIEnv* env, jclass, jint shader) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsShader"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(shader);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsSync(JNIEnv* env, jclass, jlong sync) {
    using Fn = jbyte (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsSync"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(sync);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsSyncAPPLE(JNIEnv* env, jclass, jlong sync) {
    using Fn = jbyte (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsSyncAPPLE"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(sync);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsTexture(JNIEnv* env, jclass, jint texture) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsTexture"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(texture);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsTextureHandleResidentNV(JNIEnv* env, jclass, jlong handle) {
    using Fn = jbyte (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsTextureHandleResidentNV"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(handle);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsTransformFeedback(JNIEnv* env, jclass, jint id) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsTransformFeedback"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(id);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsVertexArray(JNIEnv* env, jclass, jint array) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsVertexArray"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(array);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsVertexArrayOES(JNIEnv* env, jclass, jint array) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glIsVertexArrayOES"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(array);
    return static_cast<jbyte>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glLabelObjectEXT(JNIEnv* env, jclass, jint type, jint object, jint length, jbyteArray label) {
    jbyte* label_elems = env->GetByteArrayElements(label, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glLabelObjectEXT"));
    if (!fn) {
        env->ReleaseByteArrayElements(label, label_elems, JNI_ABORT);
        return;
    }
    fn(type, object, length, reinterpret_cast<jbyte*>(label_elems));
    env->ReleaseByteArrayElements(label, label_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glLineWidth(JNIEnv* env, jclass, jfloat width) {
    using Fn = void (*)(jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glLineWidth"));
    if (!fn) {
        return;
    }
    fn(width);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glLinkProgram(JNIEnv* env, jclass, jint program) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glLinkProgram"));
    if (!fn) {
        return;
    }
    fn(program);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMakeImageHandleNonResidentNV(JNIEnv* env, jclass, jlong handle) {
    using Fn = void (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMakeImageHandleNonResidentNV"));
    if (!fn) {
        return;
    }
    fn(handle);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMakeImageHandleResidentNV(JNIEnv* env, jclass, jlong handle, jint access) {
    using Fn = void (*)(jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMakeImageHandleResidentNV"));
    if (!fn) {
        return;
    }
    fn(handle, access);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMakeTextureHandleNonResidentNV(JNIEnv* env, jclass, jlong handle) {
    using Fn = void (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMakeTextureHandleNonResidentNV"));
    if (!fn) {
        return;
    }
    fn(handle);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMakeTextureHandleResidentNV(JNIEnv* env, jclass, jlong handle) {
    using Fn = void (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMakeTextureHandleResidentNV"));
    if (!fn) {
        return;
    }
    fn(handle);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_gles_GLES_glMapBufferOES(JNIEnv* env, jclass, jint target, jint access) {
    using Fn = jlong (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMapBufferOES"));
    if (!fn) {
        return static_cast<jlong>(0);
    }
    auto result = fn(target, access);
    return static_cast<jlong>(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_gles_GLES_glMapBufferRange(JNIEnv* env, jclass, jint target, jlong offset, jlong length, jint access) {
    using Fn = jlong (*)(jint, jlong, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMapBufferRange"));
    if (!fn) {
        return static_cast<jlong>(0);
    }
    auto result = fn(target, offset, length, access);
    return static_cast<jlong>(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_gles_GLES_glMapBufferRangeEXT(JNIEnv* env, jclass, jint target, jlong offset, jlong length, jint access) {
    using Fn = jlong (*)(jint, jlong, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMapBufferRangeEXT"));
    if (!fn) {
        return static_cast<jlong>(0);
    }
    auto result = fn(target, offset, length, access);
    return static_cast<jlong>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixFrustumEXT(JNIEnv* env, jclass, jint mode, jdouble left, jdouble right, jdouble bottom, jdouble top, jdouble zNear, jdouble zFar) {
    using Fn = void (*)(jint, jdouble, jdouble, jdouble, jdouble, jdouble, jdouble);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixFrustumEXT"));
    if (!fn) {
        return;
    }
    fn(mode, left, right, bottom, top, zNear, zFar);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixLoad3x2fNV(JNIEnv* env, jclass, jint matrixMode, jfloatArray m) {
    jfloat* m_elems = env->GetFloatArrayElements(m, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixLoad3x2fNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(m, m_elems, JNI_ABORT);
        return;
    }
    fn(matrixMode, reinterpret_cast<jfloat*>(m_elems));
    env->ReleaseFloatArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixLoad3x3fNV(JNIEnv* env, jclass, jint matrixMode, jfloatArray m) {
    jfloat* m_elems = env->GetFloatArrayElements(m, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixLoad3x3fNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(m, m_elems, JNI_ABORT);
        return;
    }
    fn(matrixMode, reinterpret_cast<jfloat*>(m_elems));
    env->ReleaseFloatArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixLoadIdentityEXT(JNIEnv* env, jclass, jint mode) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixLoadIdentityEXT"));
    if (!fn) {
        return;
    }
    fn(mode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixLoadTranspose3x3fNV(JNIEnv* env, jclass, jint matrixMode, jfloatArray m) {
    jfloat* m_elems = env->GetFloatArrayElements(m, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixLoadTranspose3x3fNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(m, m_elems, JNI_ABORT);
        return;
    }
    fn(matrixMode, reinterpret_cast<jfloat*>(m_elems));
    env->ReleaseFloatArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixLoadTransposedEXT(JNIEnv* env, jclass, jint mode, jdoubleArray m) {
    jdouble* m_elems = env->GetDoubleArrayElements(m, nullptr);
    using Fn = void (*)(jint, jdouble*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixLoadTransposedEXT"));
    if (!fn) {
        env->ReleaseDoubleArrayElements(m, m_elems, JNI_ABORT);
        return;
    }
    fn(mode, reinterpret_cast<jdouble*>(m_elems));
    env->ReleaseDoubleArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixLoadTransposefEXT(JNIEnv* env, jclass, jint mode, jfloatArray m) {
    jfloat* m_elems = env->GetFloatArrayElements(m, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixLoadTransposefEXT"));
    if (!fn) {
        env->ReleaseFloatArrayElements(m, m_elems, JNI_ABORT);
        return;
    }
    fn(mode, reinterpret_cast<jfloat*>(m_elems));
    env->ReleaseFloatArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixLoaddEXT(JNIEnv* env, jclass, jint mode, jdoubleArray m) {
    jdouble* m_elems = env->GetDoubleArrayElements(m, nullptr);
    using Fn = void (*)(jint, jdouble*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixLoaddEXT"));
    if (!fn) {
        env->ReleaseDoubleArrayElements(m, m_elems, JNI_ABORT);
        return;
    }
    fn(mode, reinterpret_cast<jdouble*>(m_elems));
    env->ReleaseDoubleArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixLoadfEXT(JNIEnv* env, jclass, jint mode, jfloatArray m) {
    jfloat* m_elems = env->GetFloatArrayElements(m, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixLoadfEXT"));
    if (!fn) {
        env->ReleaseFloatArrayElements(m, m_elems, JNI_ABORT);
        return;
    }
    fn(mode, reinterpret_cast<jfloat*>(m_elems));
    env->ReleaseFloatArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixMult3x2fNV(JNIEnv* env, jclass, jint matrixMode, jfloatArray m) {
    jfloat* m_elems = env->GetFloatArrayElements(m, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixMult3x2fNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(m, m_elems, JNI_ABORT);
        return;
    }
    fn(matrixMode, reinterpret_cast<jfloat*>(m_elems));
    env->ReleaseFloatArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixMult3x3fNV(JNIEnv* env, jclass, jint matrixMode, jfloatArray m) {
    jfloat* m_elems = env->GetFloatArrayElements(m, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixMult3x3fNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(m, m_elems, JNI_ABORT);
        return;
    }
    fn(matrixMode, reinterpret_cast<jfloat*>(m_elems));
    env->ReleaseFloatArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixMultTranspose3x3fNV(JNIEnv* env, jclass, jint matrixMode, jfloatArray m) {
    jfloat* m_elems = env->GetFloatArrayElements(m, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixMultTranspose3x3fNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(m, m_elems, JNI_ABORT);
        return;
    }
    fn(matrixMode, reinterpret_cast<jfloat*>(m_elems));
    env->ReleaseFloatArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixMultTransposedEXT(JNIEnv* env, jclass, jint mode, jdoubleArray m) {
    jdouble* m_elems = env->GetDoubleArrayElements(m, nullptr);
    using Fn = void (*)(jint, jdouble*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixMultTransposedEXT"));
    if (!fn) {
        env->ReleaseDoubleArrayElements(m, m_elems, JNI_ABORT);
        return;
    }
    fn(mode, reinterpret_cast<jdouble*>(m_elems));
    env->ReleaseDoubleArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixMultTransposefEXT(JNIEnv* env, jclass, jint mode, jfloatArray m) {
    jfloat* m_elems = env->GetFloatArrayElements(m, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixMultTransposefEXT"));
    if (!fn) {
        env->ReleaseFloatArrayElements(m, m_elems, JNI_ABORT);
        return;
    }
    fn(mode, reinterpret_cast<jfloat*>(m_elems));
    env->ReleaseFloatArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixMultdEXT(JNIEnv* env, jclass, jint mode, jdoubleArray m) {
    jdouble* m_elems = env->GetDoubleArrayElements(m, nullptr);
    using Fn = void (*)(jint, jdouble*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixMultdEXT"));
    if (!fn) {
        env->ReleaseDoubleArrayElements(m, m_elems, JNI_ABORT);
        return;
    }
    fn(mode, reinterpret_cast<jdouble*>(m_elems));
    env->ReleaseDoubleArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixMultfEXT(JNIEnv* env, jclass, jint mode, jfloatArray m) {
    jfloat* m_elems = env->GetFloatArrayElements(m, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixMultfEXT"));
    if (!fn) {
        env->ReleaseFloatArrayElements(m, m_elems, JNI_ABORT);
        return;
    }
    fn(mode, reinterpret_cast<jfloat*>(m_elems));
    env->ReleaseFloatArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixOrthoEXT(JNIEnv* env, jclass, jint mode, jdouble left, jdouble right, jdouble bottom, jdouble top, jdouble zNear, jdouble zFar) {
    using Fn = void (*)(jint, jdouble, jdouble, jdouble, jdouble, jdouble, jdouble);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixOrthoEXT"));
    if (!fn) {
        return;
    }
    fn(mode, left, right, bottom, top, zNear, zFar);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixPopEXT(JNIEnv* env, jclass, jint mode) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixPopEXT"));
    if (!fn) {
        return;
    }
    fn(mode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixPushEXT(JNIEnv* env, jclass, jint mode) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixPushEXT"));
    if (!fn) {
        return;
    }
    fn(mode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixRotatedEXT(JNIEnv* env, jclass, jint mode, jdouble angle, jdouble x, jdouble y, jdouble z) {
    using Fn = void (*)(jint, jdouble, jdouble, jdouble, jdouble);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixRotatedEXT"));
    if (!fn) {
        return;
    }
    fn(mode, angle, x, y, z);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixRotatefEXT(JNIEnv* env, jclass, jint mode, jfloat angle, jfloat x, jfloat y, jfloat z) {
    using Fn = void (*)(jint, jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixRotatefEXT"));
    if (!fn) {
        return;
    }
    fn(mode, angle, x, y, z);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixScaledEXT(JNIEnv* env, jclass, jint mode, jdouble x, jdouble y, jdouble z) {
    using Fn = void (*)(jint, jdouble, jdouble, jdouble);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixScaledEXT"));
    if (!fn) {
        return;
    }
    fn(mode, x, y, z);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixScalefEXT(JNIEnv* env, jclass, jint mode, jfloat x, jfloat y, jfloat z) {
    using Fn = void (*)(jint, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixScalefEXT"));
    if (!fn) {
        return;
    }
    fn(mode, x, y, z);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixTranslatedEXT(JNIEnv* env, jclass, jint mode, jdouble x, jdouble y, jdouble z) {
    using Fn = void (*)(jint, jdouble, jdouble, jdouble);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixTranslatedEXT"));
    if (!fn) {
        return;
    }
    fn(mode, x, y, z);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixTranslatefEXT(JNIEnv* env, jclass, jint mode, jfloat x, jfloat y, jfloat z) {
    using Fn = void (*)(jint, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMatrixTranslatefEXT"));
    if (!fn) {
        return;
    }
    fn(mode, x, y, z);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMaxShaderCompilerThreadsKHR(JNIEnv* env, jclass, jint count) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMaxShaderCompilerThreadsKHR"));
    if (!fn) {
        return;
    }
    fn(count);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMemoryObjectParameterivEXT(JNIEnv* env, jclass, jint memoryObject, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMemoryObjectParameterivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(memoryObject, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMinSampleShadingOES(JNIEnv* env, jclass, jfloat value) {
    using Fn = void (*)(jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMinSampleShadingOES"));
    if (!fn) {
        return;
    }
    fn(value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMultiDrawArraysEXT(JNIEnv* env, jclass, jint mode, jintArray first, jintArray count, jint primcount) {
    jint* first_elems = env->GetIntArrayElements(first, nullptr);
    jint* count_elems = env->GetIntArrayElements(count, nullptr);
    using Fn = void (*)(jint, jint*, jint*, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMultiDrawArraysEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(first, first_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(count, count_elems, JNI_ABORT);
        return;
    }
    fn(mode, reinterpret_cast<jint*>(first_elems), reinterpret_cast<jint*>(count_elems), primcount);
    env->ReleaseIntArrayElements(count, count_elems, 0);
    env->ReleaseIntArrayElements(first, first_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMultiDrawArraysIndirectEXT(JNIEnv* env, jclass, jint mode, jlong indirect, jint drawcount, jint stride) {
    using Fn = void (*)(jint, jlong, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMultiDrawArraysIndirectEXT"));
    if (!fn) {
        return;
    }
    fn(mode, indirect, drawcount, stride);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMultiDrawElementsBaseVertexEXT(JNIEnv* env, jclass, jint mode, jintArray count, jint type, jlong indices, jint drawcount, jintArray basevertex) {
    jint* count_elems = env->GetIntArrayElements(count, nullptr);
    jint* basevertex_elems = env->GetIntArrayElements(basevertex, nullptr);
    using Fn = void (*)(jint, jint*, jint, jlong, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMultiDrawElementsBaseVertexEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(count, count_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(basevertex, basevertex_elems, JNI_ABORT);
        return;
    }
    fn(mode, reinterpret_cast<jint*>(count_elems), type, indices, drawcount, reinterpret_cast<jint*>(basevertex_elems));
    env->ReleaseIntArrayElements(basevertex, basevertex_elems, 0);
    env->ReleaseIntArrayElements(count, count_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMultiDrawElementsEXT(JNIEnv* env, jclass, jint mode, jintArray count, jint type, jlong indices, jint primcount) {
    jint* count_elems = env->GetIntArrayElements(count, nullptr);
    using Fn = void (*)(jint, jint*, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMultiDrawElementsEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(count, count_elems, JNI_ABORT);
        return;
    }
    fn(mode, reinterpret_cast<jint*>(count_elems), type, indices, primcount);
    env->ReleaseIntArrayElements(count, count_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMultiDrawElementsIndirectEXT(JNIEnv* env, jclass, jint mode, jint type, jlong indirect, jint drawcount, jint stride) {
    using Fn = void (*)(jint, jint, jlong, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMultiDrawElementsIndirectEXT"));
    if (!fn) {
        return;
    }
    fn(mode, type, indirect, drawcount, stride);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMultiDrawMeshTasksIndirectCountNV(JNIEnv* env, jclass, jlong indirect, jlong drawcount, jint maxdrawcount, jint stride) {
    using Fn = void (*)(jlong, jlong, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMultiDrawMeshTasksIndirectCountNV"));
    if (!fn) {
        return;
    }
    fn(indirect, drawcount, maxdrawcount, stride);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMultiDrawMeshTasksIndirectNV(JNIEnv* env, jclass, jlong indirect, jint drawcount, jint stride) {
    using Fn = void (*)(jlong, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glMultiDrawMeshTasksIndirectNV"));
    if (!fn) {
        return;
    }
    fn(indirect, drawcount, stride);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glNamedBufferAttachMemoryNV(JNIEnv* env, jclass, jint buffer, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glNamedBufferAttachMemoryNV"));
    if (!fn) {
        return;
    }
    fn(buffer, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glNamedBufferPageCommitmentMemNV(JNIEnv* env, jclass, jint buffer, jlong offset, jlong size, jint memory, jlong memOffset, jbyte commit) {
    using Fn = void (*)(jint, jlong, jlong, jint, jlong, jbyte);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glNamedBufferPageCommitmentMemNV"));
    if (!fn) {
        return;
    }
    fn(buffer, offset, size, memory, memOffset, commit);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glNamedBufferStorageExternalEXT(JNIEnv* env, jclass, jint buffer, jlong offset, jlong size, jlong clientBuffer, jint flags) {
    using Fn = void (*)(jint, jlong, jlong, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glNamedBufferStorageExternalEXT"));
    if (!fn) {
        return;
    }
    fn(buffer, offset, size, clientBuffer, flags);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glNamedBufferStorageMemEXT(JNIEnv* env, jclass, jint buffer, jlong size, jint memory, jlong offset) {
    using Fn = void (*)(jint, jlong, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glNamedBufferStorageMemEXT"));
    if (!fn) {
        return;
    }
    fn(buffer, size, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glNamedFramebufferSampleLocationsfvNV(JNIEnv* env, jclass, jint framebuffer, jint start, jint count, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glNamedFramebufferSampleLocationsfvNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(v, v_elems, JNI_ABORT);
        return;
    }
    fn(framebuffer, start, count, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glNamedRenderbufferStorageMultisampleAdvancedAMD(JNIEnv* env, jclass, jint renderbuffer, jint samples, jint storageSamples, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glNamedRenderbufferStorageMultisampleAdvancedAMD"));
    if (!fn) {
        return;
    }
    fn(renderbuffer, samples, storageSamples, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glObjectLabelKHR(JNIEnv* env, jclass, jint identifier, jint name, jint length, jbyteArray label) {
    jbyte* label_elems = env->GetByteArrayElements(label, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glObjectLabelKHR"));
    if (!fn) {
        env->ReleaseByteArrayElements(label, label_elems, JNI_ABORT);
        return;
    }
    fn(identifier, name, length, reinterpret_cast<jbyte*>(label_elems));
    env->ReleaseByteArrayElements(label, label_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glObjectPtrLabelKHR(JNIEnv* env, jclass, jlong ptr, jint length, jbyteArray label) {
    jbyte* label_elems = env->GetByteArrayElements(label, nullptr);
    using Fn = void (*)(jlong, jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glObjectPtrLabelKHR"));
    if (!fn) {
        env->ReleaseByteArrayElements(label, label_elems, JNI_ABORT);
        return;
    }
    fn(ptr, length, reinterpret_cast<jbyte*>(label_elems));
    env->ReleaseByteArrayElements(label, label_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPatchParameteriEXT(JNIEnv* env, jclass, jint pname, jint value) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPatchParameteriEXT"));
    if (!fn) {
        return;
    }
    fn(pname, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPatchParameteriOES(JNIEnv* env, jclass, jint pname, jint value) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPatchParameteriOES"));
    if (!fn) {
        return;
    }
    fn(pname, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathCommandsNV(JNIEnv* env, jclass, jint path, jint numCommands, jbyteArray commands, jint numCoords, jint coordType, jlong coords) {
    jbyte* commands_elems = env->GetByteArrayElements(commands, nullptr);
    using Fn = void (*)(jint, jint, jbyte*, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPathCommandsNV"));
    if (!fn) {
        env->ReleaseByteArrayElements(commands, commands_elems, JNI_ABORT);
        return;
    }
    fn(path, numCommands, reinterpret_cast<jbyte*>(commands_elems), numCoords, coordType, coords);
    env->ReleaseByteArrayElements(commands, commands_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathCoordsNV(JNIEnv* env, jclass, jint path, jint numCoords, jint coordType, jlong coords) {
    using Fn = void (*)(jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPathCoordsNV"));
    if (!fn) {
        return;
    }
    fn(path, numCoords, coordType, coords);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathCoverDepthFuncNV(JNIEnv* env, jclass, jint func) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPathCoverDepthFuncNV"));
    if (!fn) {
        return;
    }
    fn(func);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathDashArrayNV(JNIEnv* env, jclass, jint path, jint dashCount, jfloatArray dashArray) {
    jfloat* dashArray_elems = env->GetFloatArrayElements(dashArray, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPathDashArrayNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(dashArray, dashArray_elems, JNI_ABORT);
        return;
    }
    fn(path, dashCount, reinterpret_cast<jfloat*>(dashArray_elems));
    env->ReleaseFloatArrayElements(dashArray, dashArray_elems, 0);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathGlyphIndexArrayNV(JNIEnv* env, jclass, jint firstPathName, jint fontTarget, jlong fontName, jint fontStyle, jint firstGlyphIndex, jint numGlyphs, jint pathParameterTemplate, jfloat emScale) {
    using Fn = jint (*)(jint, jint, jlong, jint, jint, jint, jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPathGlyphIndexArrayNV"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn(firstPathName, fontTarget, fontName, fontStyle, firstGlyphIndex, numGlyphs, pathParameterTemplate, emScale);
    return static_cast<jint>(result);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathGlyphIndexRangeNV(JNIEnv* env, jclass, jint fontTarget, jlong fontName, jint fontStyle, jint pathParameterTemplate, jfloat emScale, jintArray baseAndCount) {
    jint* baseAndCount_elems = env->GetIntArrayElements(baseAndCount, nullptr);
    using Fn = jint (*)(jint, jlong, jint, jint, jfloat, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPathGlyphIndexRangeNV"));
    if (!fn) {
        env->ReleaseIntArrayElements(baseAndCount, baseAndCount_elems, JNI_ABORT);
        return static_cast<jint>(0);
    }
    auto result = fn(fontTarget, fontName, fontStyle, pathParameterTemplate, emScale, reinterpret_cast<jint*>(baseAndCount_elems));
    env->ReleaseIntArrayElements(baseAndCount, baseAndCount_elems, 0);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathGlyphRangeNV(JNIEnv* env, jclass, jint firstPathName, jint fontTarget, jlong fontName, jint fontStyle, jint firstGlyph, jint numGlyphs, jint handleMissingGlyphs, jint pathParameterTemplate, jfloat emScale) {
    using Fn = void (*)(jint, jint, jlong, jint, jint, jint, jint, jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPathGlyphRangeNV"));
    if (!fn) {
        return;
    }
    fn(firstPathName, fontTarget, fontName, fontStyle, firstGlyph, numGlyphs, handleMissingGlyphs, pathParameterTemplate, emScale);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathGlyphsNV(JNIEnv* env, jclass, jint firstPathName, jint fontTarget, jlong fontName, jint fontStyle, jint numGlyphs, jint type, jlong charcodes, jint handleMissingGlyphs, jint pathParameterTemplate, jfloat emScale) {
    using Fn = void (*)(jint, jint, jlong, jint, jint, jint, jlong, jint, jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPathGlyphsNV"));
    if (!fn) {
        return;
    }
    fn(firstPathName, fontTarget, fontName, fontStyle, numGlyphs, type, charcodes, handleMissingGlyphs, pathParameterTemplate, emScale);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathMemoryGlyphIndexArrayNV(JNIEnv* env, jclass, jint firstPathName, jint fontTarget, jlong fontSize, jlong fontData, jint faceIndex, jint firstGlyphIndex, jint numGlyphs, jint pathParameterTemplate, jfloat emScale) {
    using Fn = jint (*)(jint, jint, jlong, jlong, jint, jint, jint, jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPathMemoryGlyphIndexArrayNV"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn(firstPathName, fontTarget, fontSize, fontData, faceIndex, firstGlyphIndex, numGlyphs, pathParameterTemplate, emScale);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathParameterfNV(JNIEnv* env, jclass, jint path, jint pname, jfloat value) {
    using Fn = void (*)(jint, jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPathParameterfNV"));
    if (!fn) {
        return;
    }
    fn(path, pname, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathParameterfvNV(JNIEnv* env, jclass, jint path, jint pname, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPathParameterfvNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(path, pname, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathParameteriNV(JNIEnv* env, jclass, jint path, jint pname, jint value) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPathParameteriNV"));
    if (!fn) {
        return;
    }
    fn(path, pname, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathParameterivNV(JNIEnv* env, jclass, jint path, jint pname, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPathParameterivNV"));
    if (!fn) {
        env->ReleaseIntArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(path, pname, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathStencilDepthOffsetNV(JNIEnv* env, jclass, jfloat factor, jfloat units) {
    using Fn = void (*)(jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPathStencilDepthOffsetNV"));
    if (!fn) {
        return;
    }
    fn(factor, units);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathStencilFuncNV(JNIEnv* env, jclass, jint func, jint ref, jint mask) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPathStencilFuncNV"));
    if (!fn) {
        return;
    }
    fn(func, ref, mask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathStringNV(JNIEnv* env, jclass, jint path, jint format, jint length, jlong pathString) {
    using Fn = void (*)(jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPathStringNV"));
    if (!fn) {
        return;
    }
    fn(path, format, length, pathString);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathSubCommandsNV(JNIEnv* env, jclass, jint path, jint commandStart, jint commandsToDelete, jint numCommands, jbyteArray commands, jint numCoords, jint coordType, jlong coords) {
    jbyte* commands_elems = env->GetByteArrayElements(commands, nullptr);
    using Fn = void (*)(jint, jint, jint, jint, jbyte*, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPathSubCommandsNV"));
    if (!fn) {
        env->ReleaseByteArrayElements(commands, commands_elems, JNI_ABORT);
        return;
    }
    fn(path, commandStart, commandsToDelete, numCommands, reinterpret_cast<jbyte*>(commands_elems), numCoords, coordType, coords);
    env->ReleaseByteArrayElements(commands, commands_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathSubCoordsNV(JNIEnv* env, jclass, jint path, jint coordStart, jint numCoords, jint coordType, jlong coords) {
    using Fn = void (*)(jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPathSubCoordsNV"));
    if (!fn) {
        return;
    }
    fn(path, coordStart, numCoords, coordType, coords);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPauseTransformFeedback(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPauseTransformFeedback"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPixelStorei(JNIEnv* env, jclass, jint pname, jint param) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPixelStorei"));
    if (!fn) {
        return;
    }
    fn(pname, param);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glPointAlongPathNV(JNIEnv* env, jclass, jint path, jint startSegment, jint numSegments, jfloat distance, jfloatArray x, jfloatArray y, jfloatArray tangentX, jfloatArray tangentY) {
    jfloat* x_elems = env->GetFloatArrayElements(x, nullptr);
    jfloat* y_elems = env->GetFloatArrayElements(y, nullptr);
    jfloat* tangentX_elems = env->GetFloatArrayElements(tangentX, nullptr);
    jfloat* tangentY_elems = env->GetFloatArrayElements(tangentY, nullptr);
    using Fn = jbyte (*)(jint, jint, jint, jfloat, jfloat*, jfloat*, jfloat*, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPointAlongPathNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(x, x_elems, JNI_ABORT);
        env->ReleaseFloatArrayElements(y, y_elems, JNI_ABORT);
        env->ReleaseFloatArrayElements(tangentX, tangentX_elems, JNI_ABORT);
        env->ReleaseFloatArrayElements(tangentY, tangentY_elems, JNI_ABORT);
        return static_cast<jbyte>(0);
    }
    auto result = fn(path, startSegment, numSegments, distance, reinterpret_cast<jfloat*>(x_elems), reinterpret_cast<jfloat*>(y_elems), reinterpret_cast<jfloat*>(tangentX_elems), reinterpret_cast<jfloat*>(tangentY_elems));
    env->ReleaseFloatArrayElements(tangentY, tangentY_elems, 0);
    env->ReleaseFloatArrayElements(tangentX, tangentX_elems, 0);
    env->ReleaseFloatArrayElements(y, y_elems, 0);
    env->ReleaseFloatArrayElements(x, x_elems, 0);
    return static_cast<jbyte>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPolygonModeNV(JNIEnv* env, jclass, jint face, jint mode) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPolygonModeNV"));
    if (!fn) {
        return;
    }
    fn(face, mode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPolygonOffset(JNIEnv* env, jclass, jfloat factor, jfloat units) {
    using Fn = void (*)(jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPolygonOffset"));
    if (!fn) {
        return;
    }
    fn(factor, units);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPolygonOffsetClampEXT(JNIEnv* env, jclass, jfloat factor, jfloat units, jfloat clamp) {
    using Fn = void (*)(jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPolygonOffsetClampEXT"));
    if (!fn) {
        return;
    }
    fn(factor, units, clamp);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPopDebugGroupKHR(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPopDebugGroupKHR"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPopGroupMarkerEXT(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPopGroupMarkerEXT"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPrimitiveBoundingBoxEXT(JNIEnv* env, jclass, jfloat minX, jfloat minY, jfloat minZ, jfloat minW, jfloat maxX, jfloat maxY, jfloat maxZ, jfloat maxW) {
    using Fn = void (*)(jfloat, jfloat, jfloat, jfloat, jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPrimitiveBoundingBoxEXT"));
    if (!fn) {
        return;
    }
    fn(minX, minY, minZ, minW, maxX, maxY, maxZ, maxW);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPrimitiveBoundingBoxOES(JNIEnv* env, jclass, jfloat minX, jfloat minY, jfloat minZ, jfloat minW, jfloat maxX, jfloat maxY, jfloat maxZ, jfloat maxW) {
    using Fn = void (*)(jfloat, jfloat, jfloat, jfloat, jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPrimitiveBoundingBoxOES"));
    if (!fn) {
        return;
    }
    fn(minX, minY, minZ, minW, maxX, maxY, maxZ, maxW);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramBinary(JNIEnv* env, jclass, jint program, jint binaryFormat, jlong binary, jint length) {
    using Fn = void (*)(jint, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramBinary"));
    if (!fn) {
        return;
    }
    fn(program, binaryFormat, binary, length);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramBinaryOES(JNIEnv* env, jclass, jint program, jint binaryFormat, jlong binary, jint length) {
    using Fn = void (*)(jint, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramBinaryOES"));
    if (!fn) {
        return;
    }
    fn(program, binaryFormat, binary, length);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramParameteri(JNIEnv* env, jclass, jint program, jint pname, jint value) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramParameteri"));
    if (!fn) {
        return;
    }
    fn(program, pname, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramParameteriEXT(JNIEnv* env, jclass, jint program, jint pname, jint value) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramParameteriEXT"));
    if (!fn) {
        return;
    }
    fn(program, pname, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramPathFragmentInputGenNV(JNIEnv* env, jclass, jint program, jint location, jint genMode, jint components, jfloatArray coeffs) {
    jfloat* coeffs_elems = env->GetFloatArrayElements(coeffs, nullptr);
    using Fn = void (*)(jint, jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramPathFragmentInputGenNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(coeffs, coeffs_elems, JNI_ABORT);
        return;
    }
    fn(program, location, genMode, components, reinterpret_cast<jfloat*>(coeffs_elems));
    env->ReleaseFloatArrayElements(coeffs, coeffs_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform1fEXT(JNIEnv* env, jclass, jint program, jint location, jfloat v0) {
    using Fn = void (*)(jint, jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform1fEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform1fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform1fvEXT"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform1i64NV(JNIEnv* env, jclass, jint program, jint location, jlong x) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform1i64NV"));
    if (!fn) {
        return;
    }
    fn(program, location, x);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform1i64vNV(JNIEnv* env, jclass, jint program, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform1i64vNV"));
    if (!fn) {
        env->ReleaseLongArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform1iEXT(JNIEnv* env, jclass, jint program, jint location, jint v0) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform1iEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform1ivEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform1ivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform1ui64NV(JNIEnv* env, jclass, jint program, jint location, jlong x) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform1ui64NV"));
    if (!fn) {
        return;
    }
    fn(program, location, x);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform1ui64vNV(JNIEnv* env, jclass, jint program, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform1ui64vNV"));
    if (!fn) {
        env->ReleaseLongArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform1uiEXT(JNIEnv* env, jclass, jint program, jint location, jint v0) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform1uiEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform1uivEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform1uivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform2fEXT(JNIEnv* env, jclass, jint program, jint location, jfloat v0, jfloat v1) {
    using Fn = void (*)(jint, jint, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform2fEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0, v1);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform2fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform2fvEXT"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform2i64NV(JNIEnv* env, jclass, jint program, jint location, jlong x, jlong y) {
    using Fn = void (*)(jint, jint, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform2i64NV"));
    if (!fn) {
        return;
    }
    fn(program, location, x, y);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform2i64vNV(JNIEnv* env, jclass, jint program, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform2i64vNV"));
    if (!fn) {
        env->ReleaseLongArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform2iEXT(JNIEnv* env, jclass, jint program, jint location, jint v0, jint v1) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform2iEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0, v1);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform2ivEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform2ivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform2ui64NV(JNIEnv* env, jclass, jint program, jint location, jlong x, jlong y) {
    using Fn = void (*)(jint, jint, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform2ui64NV"));
    if (!fn) {
        return;
    }
    fn(program, location, x, y);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform2ui64vNV(JNIEnv* env, jclass, jint program, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform2ui64vNV"));
    if (!fn) {
        env->ReleaseLongArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform2uiEXT(JNIEnv* env, jclass, jint program, jint location, jint v0, jint v1) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform2uiEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0, v1);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform2uivEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform2uivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform3fEXT(JNIEnv* env, jclass, jint program, jint location, jfloat v0, jfloat v1, jfloat v2) {
    using Fn = void (*)(jint, jint, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform3fEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0, v1, v2);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform3fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform3fvEXT"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform3i64NV(JNIEnv* env, jclass, jint program, jint location, jlong x, jlong y, jlong z) {
    using Fn = void (*)(jint, jint, jlong, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform3i64NV"));
    if (!fn) {
        return;
    }
    fn(program, location, x, y, z);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform3i64vNV(JNIEnv* env, jclass, jint program, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform3i64vNV"));
    if (!fn) {
        env->ReleaseLongArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform3iEXT(JNIEnv* env, jclass, jint program, jint location, jint v0, jint v1, jint v2) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform3iEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0, v1, v2);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform3ivEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform3ivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform3ui64NV(JNIEnv* env, jclass, jint program, jint location, jlong x, jlong y, jlong z) {
    using Fn = void (*)(jint, jint, jlong, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform3ui64NV"));
    if (!fn) {
        return;
    }
    fn(program, location, x, y, z);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform3ui64vNV(JNIEnv* env, jclass, jint program, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform3ui64vNV"));
    if (!fn) {
        env->ReleaseLongArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform3uiEXT(JNIEnv* env, jclass, jint program, jint location, jint v0, jint v1, jint v2) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform3uiEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0, v1, v2);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform3uivEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform3uivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform4fEXT(JNIEnv* env, jclass, jint program, jint location, jfloat v0, jfloat v1, jfloat v2, jfloat v3) {
    using Fn = void (*)(jint, jint, jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform4fEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0, v1, v2, v3);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform4fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform4fvEXT"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform4i64NV(JNIEnv* env, jclass, jint program, jint location, jlong x, jlong y, jlong z, jlong w) {
    using Fn = void (*)(jint, jint, jlong, jlong, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform4i64NV"));
    if (!fn) {
        return;
    }
    fn(program, location, x, y, z, w);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform4i64vNV(JNIEnv* env, jclass, jint program, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform4i64vNV"));
    if (!fn) {
        env->ReleaseLongArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform4iEXT(JNIEnv* env, jclass, jint program, jint location, jint v0, jint v1, jint v2, jint v3) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform4iEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0, v1, v2, v3);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform4ivEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform4ivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform4ui64NV(JNIEnv* env, jclass, jint program, jint location, jlong x, jlong y, jlong z, jlong w) {
    using Fn = void (*)(jint, jint, jlong, jlong, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform4ui64NV"));
    if (!fn) {
        return;
    }
    fn(program, location, x, y, z, w);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform4ui64vNV(JNIEnv* env, jclass, jint program, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform4ui64vNV"));
    if (!fn) {
        env->ReleaseLongArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform4uiEXT(JNIEnv* env, jclass, jint program, jint location, jint v0, jint v1, jint v2, jint v3) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform4uiEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0, v1, v2, v3);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform4uivEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniform4uivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformHandleui64IMG(JNIEnv* env, jclass, jint program, jint location, jlong value) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniformHandleui64IMG"));
    if (!fn) {
        return;
    }
    fn(program, location, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformHandleui64NV(JNIEnv* env, jclass, jint program, jint location, jlong value) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniformHandleui64NV"));
    if (!fn) {
        return;
    }
    fn(program, location, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformHandleui64vIMG(JNIEnv* env, jclass, jint program, jint location, jint count, jlongArray values) {
    jlong* values_elems = env->GetLongArrayElements(values, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniformHandleui64vIMG"));
    if (!fn) {
        env->ReleaseLongArrayElements(values, values_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, reinterpret_cast<jlong*>(values_elems));
    env->ReleaseLongArrayElements(values, values_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformHandleui64vNV(JNIEnv* env, jclass, jint program, jint location, jint count, jlongArray values) {
    jlong* values_elems = env->GetLongArrayElements(values, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniformHandleui64vNV"));
    if (!fn) {
        env->ReleaseLongArrayElements(values, values_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, reinterpret_cast<jlong*>(values_elems));
    env->ReleaseLongArrayElements(values, values_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformMatrix2fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniformMatrix2fvEXT"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformMatrix2x3fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniformMatrix2x3fvEXT"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformMatrix2x4fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniformMatrix2x4fvEXT"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformMatrix3fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniformMatrix3fvEXT"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformMatrix3x2fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniformMatrix3x2fvEXT"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformMatrix3x4fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniformMatrix3x4fvEXT"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformMatrix4fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniformMatrix4fvEXT"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformMatrix4x2fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniformMatrix4x2fvEXT"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformMatrix4x3fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glProgramUniformMatrix4x3fvEXT"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(program, location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPushDebugGroupKHR(JNIEnv* env, jclass, jint source, jint id, jint length, jbyteArray message) {
    jbyte* message_elems = env->GetByteArrayElements(message, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPushDebugGroupKHR"));
    if (!fn) {
        env->ReleaseByteArrayElements(message, message_elems, JNI_ABORT);
        return;
    }
    fn(source, id, length, reinterpret_cast<jbyte*>(message_elems));
    env->ReleaseByteArrayElements(message, message_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPushGroupMarkerEXT(JNIEnv* env, jclass, jint length, jbyteArray marker) {
    jbyte* marker_elems = env->GetByteArrayElements(marker, nullptr);
    using Fn = void (*)(jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glPushGroupMarkerEXT"));
    if (!fn) {
        env->ReleaseByteArrayElements(marker, marker_elems, JNI_ABORT);
        return;
    }
    fn(length, reinterpret_cast<jbyte*>(marker_elems));
    env->ReleaseByteArrayElements(marker, marker_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glQueryCounterEXT(JNIEnv* env, jclass, jint id, jint target) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glQueryCounterEXT"));
    if (!fn) {
        return;
    }
    fn(id, target);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glRasterSamplesEXT(JNIEnv* env, jclass, jint samples, jbyte fixedsamplelocations) {
    using Fn = void (*)(jint, jbyte);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glRasterSamplesEXT"));
    if (!fn) {
        return;
    }
    fn(samples, fixedsamplelocations);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glReadBuffer(JNIEnv* env, jclass, jint src) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glReadBuffer"));
    if (!fn) {
        return;
    }
    fn(src);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glReadBufferIndexedEXT(JNIEnv* env, jclass, jint src, jint index) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glReadBufferIndexedEXT"));
    if (!fn) {
        return;
    }
    fn(src, index);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glReadBufferNV(JNIEnv* env, jclass, jint mode) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glReadBufferNV"));
    if (!fn) {
        return;
    }
    fn(mode);
}

static void libjglios_gles_glReadPixels(JNIEnv* env, jclass, jint x, jint y, jint width, jint height, jint format, jint type, jlong pixels) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glReadPixels"));
    if (!fn) {
        return;
    }
    fn(x, y, width, height, format, type, pixels);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glReadPixels__IIIIIILjava_nio_Buffer_2J(JNIEnv* env, jclass, jint x, jint y, jint width, jint height, jint format, jint type, jobject pixels, jlong pixelsOffset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, void*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glReadPixels"));
    if (!fn) {
        return;
    }
    void* pixelsPtr = directBufferAddress(env, pixels, pixelsOffset);
    if (env->ExceptionCheck()) {
        return;
    }
    fn(x, y, width, height, format, type, pixelsPtr);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glReadnPixelsEXT(JNIEnv* env, jclass, jint x, jint y, jint width, jint height, jint format, jint type, jint bufSize, jlong data) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glReadnPixelsEXT"));
    if (!fn) {
        return;
    }
    fn(x, y, width, height, format, type, bufSize, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glReadnPixelsKHR(JNIEnv* env, jclass, jint x, jint y, jint width, jint height, jint format, jint type, jint bufSize, jlong data) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glReadnPixelsKHR"));
    if (!fn) {
        return;
    }
    fn(x, y, width, height, format, type, bufSize, data);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glReleaseKeyedMutexWin32EXT(JNIEnv* env, jclass, jint memory, jlong key) {
    using Fn = jbyte (*)(jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glReleaseKeyedMutexWin32EXT"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(memory, key);
    return static_cast<jbyte>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glReleaseShaderCompiler(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glReleaseShaderCompiler"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glRenderbufferStorage(JNIEnv* env, jclass, jint target, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glRenderbufferStorage"));
    if (!fn) {
        return;
    }
    fn(target, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glRenderbufferStorageMultisample(JNIEnv* env, jclass, jint target, jint samples, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glRenderbufferStorageMultisample"));
    if (!fn) {
        return;
    }
    fn(target, samples, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glRenderbufferStorageMultisampleANGLE(JNIEnv* env, jclass, jint target, jint samples, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glRenderbufferStorageMultisampleANGLE"));
    if (!fn) {
        return;
    }
    fn(target, samples, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glRenderbufferStorageMultisampleAPPLE(JNIEnv* env, jclass, jint target, jint samples, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glRenderbufferStorageMultisampleAPPLE"));
    if (!fn) {
        return;
    }
    fn(target, samples, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glRenderbufferStorageMultisampleAdvancedAMD(JNIEnv* env, jclass, jint target, jint samples, jint storageSamples, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glRenderbufferStorageMultisampleAdvancedAMD"));
    if (!fn) {
        return;
    }
    fn(target, samples, storageSamples, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glRenderbufferStorageMultisampleEXT(JNIEnv* env, jclass, jint target, jint samples, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glRenderbufferStorageMultisampleEXT"));
    if (!fn) {
        return;
    }
    fn(target, samples, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glRenderbufferStorageMultisampleIMG(JNIEnv* env, jclass, jint target, jint samples, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glRenderbufferStorageMultisampleIMG"));
    if (!fn) {
        return;
    }
    fn(target, samples, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glRenderbufferStorageMultisampleNV(JNIEnv* env, jclass, jint target, jint samples, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glRenderbufferStorageMultisampleNV"));
    if (!fn) {
        return;
    }
    fn(target, samples, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glResetMemoryObjectParameterNV(JNIEnv* env, jclass, jint memory, jint pname) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glResetMemoryObjectParameterNV"));
    if (!fn) {
        return;
    }
    fn(memory, pname);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glResolveDepthValuesNV(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glResolveDepthValuesNV"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glResolveMultisampleFramebufferAPPLE(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glResolveMultisampleFramebufferAPPLE"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glResumeTransformFeedback(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glResumeTransformFeedback"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSampleCoverage(JNIEnv* env, jclass, jfloat value, jbyte invert) {
    using Fn = void (*)(jfloat, jbyte);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glSampleCoverage"));
    if (!fn) {
        return;
    }
    fn(value, invert);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSamplerParameterIivEXT(JNIEnv* env, jclass, jint sampler, jint pname, jintArray param) {
    jint* param_elems = env->GetIntArrayElements(param, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glSamplerParameterIivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(param, param_elems, JNI_ABORT);
        return;
    }
    fn(sampler, pname, reinterpret_cast<jint*>(param_elems));
    env->ReleaseIntArrayElements(param, param_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSamplerParameterIivOES(JNIEnv* env, jclass, jint sampler, jint pname, jintArray param) {
    jint* param_elems = env->GetIntArrayElements(param, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glSamplerParameterIivOES"));
    if (!fn) {
        env->ReleaseIntArrayElements(param, param_elems, JNI_ABORT);
        return;
    }
    fn(sampler, pname, reinterpret_cast<jint*>(param_elems));
    env->ReleaseIntArrayElements(param, param_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSamplerParameterIuivEXT(JNIEnv* env, jclass, jint sampler, jint pname, jintArray param) {
    jint* param_elems = env->GetIntArrayElements(param, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glSamplerParameterIuivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(param, param_elems, JNI_ABORT);
        return;
    }
    fn(sampler, pname, reinterpret_cast<jint*>(param_elems));
    env->ReleaseIntArrayElements(param, param_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSamplerParameterIuivOES(JNIEnv* env, jclass, jint sampler, jint pname, jintArray param) {
    jint* param_elems = env->GetIntArrayElements(param, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glSamplerParameterIuivOES"));
    if (!fn) {
        env->ReleaseIntArrayElements(param, param_elems, JNI_ABORT);
        return;
    }
    fn(sampler, pname, reinterpret_cast<jint*>(param_elems));
    env->ReleaseIntArrayElements(param, param_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSamplerParameterf(JNIEnv* env, jclass, jint sampler, jint pname, jfloat param) {
    using Fn = void (*)(jint, jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glSamplerParameterf"));
    if (!fn) {
        return;
    }
    fn(sampler, pname, param);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSamplerParameterfv(JNIEnv* env, jclass, jint sampler, jint pname, jfloatArray param) {
    jfloat* param_elems = env->GetFloatArrayElements(param, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glSamplerParameterfv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(param, param_elems, JNI_ABORT);
        return;
    }
    fn(sampler, pname, reinterpret_cast<jfloat*>(param_elems));
    env->ReleaseFloatArrayElements(param, param_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSamplerParameteri(JNIEnv* env, jclass, jint sampler, jint pname, jint param) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glSamplerParameteri"));
    if (!fn) {
        return;
    }
    fn(sampler, pname, param);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSamplerParameteriv(JNIEnv* env, jclass, jint sampler, jint pname, jintArray param) {
    jint* param_elems = env->GetIntArrayElements(param, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glSamplerParameteriv"));
    if (!fn) {
        env->ReleaseIntArrayElements(param, param_elems, JNI_ABORT);
        return;
    }
    fn(sampler, pname, reinterpret_cast<jint*>(param_elems));
    env->ReleaseIntArrayElements(param, param_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glScissor(JNIEnv* env, jclass, jint x, jint y, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glScissor"));
    if (!fn) {
        return;
    }
    fn(x, y, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glScissorArrayvNV(JNIEnv* env, jclass, jint first, jint count, jintArray v) {
    jint* v_elems = env->GetIntArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glScissorArrayvNV"));
    if (!fn) {
        env->ReleaseIntArrayElements(v, v_elems, JNI_ABORT);
        return;
    }
    fn(first, count, reinterpret_cast<jint*>(v_elems));
    env->ReleaseIntArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glScissorArrayvOES(JNIEnv* env, jclass, jint first, jint count, jintArray v) {
    jint* v_elems = env->GetIntArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glScissorArrayvOES"));
    if (!fn) {
        env->ReleaseIntArrayElements(v, v_elems, JNI_ABORT);
        return;
    }
    fn(first, count, reinterpret_cast<jint*>(v_elems));
    env->ReleaseIntArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glScissorExclusiveArrayvNV(JNIEnv* env, jclass, jint first, jint count, jintArray v) {
    jint* v_elems = env->GetIntArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glScissorExclusiveArrayvNV"));
    if (!fn) {
        env->ReleaseIntArrayElements(v, v_elems, JNI_ABORT);
        return;
    }
    fn(first, count, reinterpret_cast<jint*>(v_elems));
    env->ReleaseIntArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glScissorExclusiveNV(JNIEnv* env, jclass, jint x, jint y, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glScissorExclusiveNV"));
    if (!fn) {
        return;
    }
    fn(x, y, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glScissorIndexedNV(JNIEnv* env, jclass, jint index, jint left, jint bottom, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glScissorIndexedNV"));
    if (!fn) {
        return;
    }
    fn(index, left, bottom, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glScissorIndexedOES(JNIEnv* env, jclass, jint index, jint left, jint bottom, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glScissorIndexedOES"));
    if (!fn) {
        return;
    }
    fn(index, left, bottom, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glScissorIndexedvNV(JNIEnv* env, jclass, jint index, jintArray v) {
    jint* v_elems = env->GetIntArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glScissorIndexedvNV"));
    if (!fn) {
        env->ReleaseIntArrayElements(v, v_elems, JNI_ABORT);
        return;
    }
    fn(index, reinterpret_cast<jint*>(v_elems));
    env->ReleaseIntArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glScissorIndexedvOES(JNIEnv* env, jclass, jint index, jintArray v) {
    jint* v_elems = env->GetIntArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glScissorIndexedvOES"));
    if (!fn) {
        env->ReleaseIntArrayElements(v, v_elems, JNI_ABORT);
        return;
    }
    fn(index, reinterpret_cast<jint*>(v_elems));
    env->ReleaseIntArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSelectPerfMonitorCountersAMD(JNIEnv* env, jclass, jint monitor, jbyte enable, jint group, jint numCounters, jintArray counterList) {
    jint* counterList_elems = env->GetIntArrayElements(counterList, nullptr);
    using Fn = void (*)(jint, jbyte, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glSelectPerfMonitorCountersAMD"));
    if (!fn) {
        env->ReleaseIntArrayElements(counterList, counterList_elems, JNI_ABORT);
        return;
    }
    fn(monitor, enable, group, numCounters, reinterpret_cast<jint*>(counterList_elems));
    env->ReleaseIntArrayElements(counterList, counterList_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSemaphoreParameterivNV(JNIEnv* env, jclass, jint semaphore, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glSemaphoreParameterivNV"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(semaphore, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSemaphoreParameterui64vEXT(JNIEnv* env, jclass, jint semaphore, jint pname, jlongArray params) {
    jlong* params_elems = env->GetLongArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glSemaphoreParameterui64vEXT"));
    if (!fn) {
        env->ReleaseLongArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(semaphore, pname, reinterpret_cast<jlong*>(params_elems));
    env->ReleaseLongArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSetFenceNV(JNIEnv* env, jclass, jint fence, jint condition) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glSetFenceNV"));
    if (!fn) {
        return;
    }
    fn(fence, condition);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glShaderBinary(JNIEnv* env, jclass, jint count, jintArray shaders, jint binaryFormat, jlong binary, jint length) {
    jint* shaders_elems = env->GetIntArrayElements(shaders, nullptr);
    using Fn = void (*)(jint, jint*, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glShaderBinary"));
    if (!fn) {
        env->ReleaseIntArrayElements(shaders, shaders_elems, JNI_ABORT);
        return;
    }
    fn(count, reinterpret_cast<jint*>(shaders_elems), binaryFormat, binary, length);
    env->ReleaseIntArrayElements(shaders, shaders_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glShaderSource(JNIEnv* env, jclass, jint shader, jint count, jbyteArray string, jintArray length) {
    jbyte* string_elems = env->GetByteArrayElements(string, nullptr);
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    const char* src = reinterpret_cast<const char*>(string_elems);
    const char* sources[1] = {src};
    using Fn = void (*)(jint, jint, const char* const*, const jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glShaderSource"));
    if (!fn) {
        env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
        env->ReleaseByteArrayElements(string, string_elems, JNI_ABORT);
        return;
    }
    fn(shader, count, sources, reinterpret_cast<const jint*>(length_elems));
    env->ReleaseIntArrayElements(length, length_elems, JNI_ABORT);
    env->ReleaseByteArrayElements(string, string_elems, JNI_ABORT);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glShadingRateImageBarrierNV(JNIEnv* env, jclass, jbyte synchronize) {
    using Fn = void (*)(jbyte);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glShadingRateImageBarrierNV"));
    if (!fn) {
        return;
    }
    fn(synchronize);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glShadingRateImagePaletteNV(JNIEnv* env, jclass, jint viewport, jint first, jint count, jintArray rates) {
    jint* rates_elems = env->GetIntArrayElements(rates, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glShadingRateImagePaletteNV"));
    if (!fn) {
        env->ReleaseIntArrayElements(rates, rates_elems, JNI_ABORT);
        return;
    }
    fn(viewport, first, count, reinterpret_cast<jint*>(rates_elems));
    env->ReleaseIntArrayElements(rates, rates_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glShadingRateQCOM(JNIEnv* env, jclass, jint rate) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glShadingRateQCOM"));
    if (!fn) {
        return;
    }
    fn(rate);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glShadingRateSampleOrderCustomNV(JNIEnv* env, jclass, jint rate, jint samples, jintArray locations) {
    jint* locations_elems = env->GetIntArrayElements(locations, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glShadingRateSampleOrderCustomNV"));
    if (!fn) {
        env->ReleaseIntArrayElements(locations, locations_elems, JNI_ABORT);
        return;
    }
    fn(rate, samples, reinterpret_cast<jint*>(locations_elems));
    env->ReleaseIntArrayElements(locations, locations_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glShadingRateSampleOrderNV(JNIEnv* env, jclass, jint order) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glShadingRateSampleOrderNV"));
    if (!fn) {
        return;
    }
    fn(order);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSignalSemaphoreEXT(JNIEnv* env, jclass, jint semaphore, jint numBufferBarriers, jintArray buffers, jint numTextureBarriers, jintArray textures, jintArray dstLayouts) {
    jint* buffers_elems = env->GetIntArrayElements(buffers, nullptr);
    jint* textures_elems = env->GetIntArrayElements(textures, nullptr);
    jint* dstLayouts_elems = env->GetIntArrayElements(dstLayouts, nullptr);
    using Fn = void (*)(jint, jint, jint*, jint, jint*, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glSignalSemaphoreEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(buffers, buffers_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(textures, textures_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(dstLayouts, dstLayouts_elems, JNI_ABORT);
        return;
    }
    fn(semaphore, numBufferBarriers, reinterpret_cast<jint*>(buffers_elems), numTextureBarriers, reinterpret_cast<jint*>(textures_elems), reinterpret_cast<jint*>(dstLayouts_elems));
    env->ReleaseIntArrayElements(dstLayouts, dstLayouts_elems, 0);
    env->ReleaseIntArrayElements(textures, textures_elems, 0);
    env->ReleaseIntArrayElements(buffers, buffers_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSignalVkFenceNV(JNIEnv* env, jclass, jlong vkFence) {
    using Fn = void (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glSignalVkFenceNV"));
    if (!fn) {
        return;
    }
    fn(vkFence);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSignalVkSemaphoreNV(JNIEnv* env, jclass, jlong vkSemaphore) {
    using Fn = void (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glSignalVkSemaphoreNV"));
    if (!fn) {
        return;
    }
    fn(vkSemaphore);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStartTilingQCOM(JNIEnv* env, jclass, jint x, jint y, jint width, jint height, jint preserveMask) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glStartTilingQCOM"));
    if (!fn) {
        return;
    }
    fn(x, y, width, height, preserveMask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilFillPathInstancedNV(JNIEnv* env, jclass, jint numPaths, jint pathNameType, jlong paths, jint pathBase, jint fillMode, jint mask, jint transformType, jfloatArray transformValues) {
    jfloat* transformValues_elems = env->GetFloatArrayElements(transformValues, nullptr);
    using Fn = void (*)(jint, jint, jlong, jint, jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glStencilFillPathInstancedNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(transformValues, transformValues_elems, JNI_ABORT);
        return;
    }
    fn(numPaths, pathNameType, paths, pathBase, fillMode, mask, transformType, reinterpret_cast<jfloat*>(transformValues_elems));
    env->ReleaseFloatArrayElements(transformValues, transformValues_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilFillPathNV(JNIEnv* env, jclass, jint path, jint fillMode, jint mask) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glStencilFillPathNV"));
    if (!fn) {
        return;
    }
    fn(path, fillMode, mask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilFunc(JNIEnv* env, jclass, jint func, jint ref, jint mask) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glStencilFunc"));
    if (!fn) {
        return;
    }
    fn(func, ref, mask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilFuncSeparate(JNIEnv* env, jclass, jint face, jint func, jint ref, jint mask) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glStencilFuncSeparate"));
    if (!fn) {
        return;
    }
    fn(face, func, ref, mask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilMask(JNIEnv* env, jclass, jint mask) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glStencilMask"));
    if (!fn) {
        return;
    }
    fn(mask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilMaskSeparate(JNIEnv* env, jclass, jint face, jint mask) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glStencilMaskSeparate"));
    if (!fn) {
        return;
    }
    fn(face, mask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilOp(JNIEnv* env, jclass, jint fail, jint zfail, jint zpass) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glStencilOp"));
    if (!fn) {
        return;
    }
    fn(fail, zfail, zpass);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilOpSeparate(JNIEnv* env, jclass, jint face, jint sfail, jint dpfail, jint dppass) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glStencilOpSeparate"));
    if (!fn) {
        return;
    }
    fn(face, sfail, dpfail, dppass);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilStrokePathInstancedNV(JNIEnv* env, jclass, jint numPaths, jint pathNameType, jlong paths, jint pathBase, jint reference, jint mask, jint transformType, jfloatArray transformValues) {
    jfloat* transformValues_elems = env->GetFloatArrayElements(transformValues, nullptr);
    using Fn = void (*)(jint, jint, jlong, jint, jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glStencilStrokePathInstancedNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(transformValues, transformValues_elems, JNI_ABORT);
        return;
    }
    fn(numPaths, pathNameType, paths, pathBase, reference, mask, transformType, reinterpret_cast<jfloat*>(transformValues_elems));
    env->ReleaseFloatArrayElements(transformValues, transformValues_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilStrokePathNV(JNIEnv* env, jclass, jint path, jint reference, jint mask) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glStencilStrokePathNV"));
    if (!fn) {
        return;
    }
    fn(path, reference, mask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilThenCoverFillPathInstancedNV(JNIEnv* env, jclass, jint numPaths, jint pathNameType, jlong paths, jint pathBase, jint fillMode, jint mask, jint coverMode, jint transformType, jfloatArray transformValues) {
    jfloat* transformValues_elems = env->GetFloatArrayElements(transformValues, nullptr);
    using Fn = void (*)(jint, jint, jlong, jint, jint, jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glStencilThenCoverFillPathInstancedNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(transformValues, transformValues_elems, JNI_ABORT);
        return;
    }
    fn(numPaths, pathNameType, paths, pathBase, fillMode, mask, coverMode, transformType, reinterpret_cast<jfloat*>(transformValues_elems));
    env->ReleaseFloatArrayElements(transformValues, transformValues_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilThenCoverFillPathNV(JNIEnv* env, jclass, jint path, jint fillMode, jint mask, jint coverMode) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glStencilThenCoverFillPathNV"));
    if (!fn) {
        return;
    }
    fn(path, fillMode, mask, coverMode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilThenCoverStrokePathInstancedNV(JNIEnv* env, jclass, jint numPaths, jint pathNameType, jlong paths, jint pathBase, jint reference, jint mask, jint coverMode, jint transformType, jfloatArray transformValues) {
    jfloat* transformValues_elems = env->GetFloatArrayElements(transformValues, nullptr);
    using Fn = void (*)(jint, jint, jlong, jint, jint, jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glStencilThenCoverStrokePathInstancedNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(transformValues, transformValues_elems, JNI_ABORT);
        return;
    }
    fn(numPaths, pathNameType, paths, pathBase, reference, mask, coverMode, transformType, reinterpret_cast<jfloat*>(transformValues_elems));
    env->ReleaseFloatArrayElements(transformValues, transformValues_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilThenCoverStrokePathNV(JNIEnv* env, jclass, jint path, jint reference, jint mask, jint coverMode) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glStencilThenCoverStrokePathNV"));
    if (!fn) {
        return;
    }
    fn(path, reference, mask, coverMode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSubpixelPrecisionBiasNV(JNIEnv* env, jclass, jint xbits, jint ybits) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glSubpixelPrecisionBiasNV"));
    if (!fn) {
        return;
    }
    fn(xbits, ybits);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glTestFenceNV(JNIEnv* env, jclass, jint fence) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTestFenceNV"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(fence);
    return static_cast<jbyte>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexAttachMemoryNV(JNIEnv* env, jclass, jint target, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexAttachMemoryNV"));
    if (!fn) {
        return;
    }
    fn(target, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexBufferEXT(JNIEnv* env, jclass, jint target, jint internalformat, jint buffer) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexBufferEXT"));
    if (!fn) {
        return;
    }
    fn(target, internalformat, buffer);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexBufferOES(JNIEnv* env, jclass, jint target, jint internalformat, jint buffer) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexBufferOES"));
    if (!fn) {
        return;
    }
    fn(target, internalformat, buffer);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexBufferRangeEXT(JNIEnv* env, jclass, jint target, jint internalformat, jint buffer, jlong offset, jlong size) {
    using Fn = void (*)(jint, jint, jint, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexBufferRangeEXT"));
    if (!fn) {
        return;
    }
    fn(target, internalformat, buffer, offset, size);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexBufferRangeOES(JNIEnv* env, jclass, jint target, jint internalformat, jint buffer, jlong offset, jlong size) {
    using Fn = void (*)(jint, jint, jint, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexBufferRangeOES"));
    if (!fn) {
        return;
    }
    fn(target, internalformat, buffer, offset, size);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexEstimateMotionQCOM(JNIEnv* env, jclass, jint ref, jint target, jint output) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexEstimateMotionQCOM"));
    if (!fn) {
        return;
    }
    fn(ref, target, output);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexEstimateMotionRegionsQCOM(JNIEnv* env, jclass, jint ref, jint target, jint output, jint mask) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexEstimateMotionRegionsQCOM"));
    if (!fn) {
        return;
    }
    fn(ref, target, output, mask);
}

static void libjglios_gles_glTexImage2D(JNIEnv* env, jclass, jint target, jint level, jint internalformat, jint width, jint height, jint border, jint format, jint type, jlong pixels) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexImage2D"));
    if (!fn) {
        return;
    }
    fn(target, level, internalformat, width, height, border, format, type, pixels);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexImage2D__IIIIIIII_3B(JNIEnv* env, jclass, jint target, jint level, jint internalformat, jint width, jint height, jint border, jint format, jint type, jbyteArray pixels) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, void*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexImage2D"));
    if (!fn) {
        return;
    }
    jbyte* pixels_elems = env->GetByteArrayElements(pixels, nullptr);
    fn(target, level, internalformat, width, height, border, format, type, pixels_elems);
    env->ReleaseByteArrayElements(pixels, pixels_elems, JNI_ABORT);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexImage2D__IIIIIIIILjava_nio_Buffer_2J(JNIEnv* env, jclass, jint target, jint level, jint internalformat, jint width, jint height, jint border, jint format, jint type, jobject pixels, jlong pixelsOffset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, void*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexImage2D"));
    if (!fn) {
        return;
    }
    void* pixelsPtr = directBufferAddress(env, pixels, pixelsOffset);
    if (env->ExceptionCheck()) {
        return;
    }
    fn(target, level, internalformat, width, height, border, format, type, pixelsPtr);
}

static void libjglios_gles_glTexImage3D(JNIEnv* env, jclass, jint target, jint level, jint internalformat, jint width, jint height, jint depth, jint border, jint format, jint type, jlong pixels) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexImage3D"));
    if (!fn) {
        return;
    }
    fn(target, level, internalformat, width, height, depth, border, format, type, pixels);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexImage3D__IIIIIIIIILjava_nio_Buffer_2J(JNIEnv* env, jclass, jint target, jint level, jint internalformat, jint width, jint height, jint depth, jint border, jint format, jint type, jobject pixels, jlong pixelsOffset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, void*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexImage3D"));
    if (!fn) {
        return;
    }
    void* pixelsPtr = directBufferAddress(env, pixels, pixelsOffset);
    if (env->ExceptionCheck()) {
        return;
    }
    fn(target, level, internalformat, width, height, depth, border, format, type, pixelsPtr);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexImage3DOES(JNIEnv* env, jclass, jint target, jint level, jint internalformat, jint width, jint height, jint depth, jint border, jint format, jint type, jlong pixels) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexImage3DOES"));
    if (!fn) {
        return;
    }
    fn(target, level, internalformat, width, height, depth, border, format, type, pixels);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexPageCommitmentEXT(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint zoffset, jint width, jint height, jint depth, jbyte commit) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jbyte);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexPageCommitmentEXT"));
    if (!fn) {
        return;
    }
    fn(target, level, xoffset, yoffset, zoffset, width, height, depth, commit);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexPageCommitmentMemNV(JNIEnv* env, jclass, jint target, jint layer, jint level, jint xoffset, jint yoffset, jint zoffset, jint width, jint height, jint depth, jint memory, jlong offset, jbyte commit) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jlong, jbyte);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexPageCommitmentMemNV"));
    if (!fn) {
        return;
    }
    fn(target, layer, level, xoffset, yoffset, zoffset, width, height, depth, memory, offset, commit);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexParameterIivEXT(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexParameterIivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexParameterIivOES(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexParameterIivOES"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexParameterIuivEXT(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexParameterIuivEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexParameterIuivOES(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexParameterIuivOES"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexParameterf(JNIEnv* env, jclass, jint target, jint pname, jfloat param) {
    using Fn = void (*)(jint, jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexParameterf"));
    if (!fn) {
        return;
    }
    fn(target, pname, param);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexParameterfv(JNIEnv* env, jclass, jint target, jint pname, jfloatArray params) {
    jfloat* params_elems = env->GetFloatArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexParameterfv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(target, pname, reinterpret_cast<jfloat*>(params_elems));
    env->ReleaseFloatArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexParameteri(JNIEnv* env, jclass, jint target, jint pname, jint param) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexParameteri"));
    if (!fn) {
        return;
    }
    fn(target, pname, param);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexParameteriv(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexParameteriv"));
    if (!fn) {
        env->ReleaseIntArrayElements(params, params_elems, JNI_ABORT);
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexStorage1DEXT(JNIEnv* env, jclass, jint target, jint levels, jint internalformat, jint width) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexStorage1DEXT"));
    if (!fn) {
        return;
    }
    fn(target, levels, internalformat, width);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexStorage2D(JNIEnv* env, jclass, jint target, jint levels, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexStorage2D"));
    if (!fn) {
        return;
    }
    fn(target, levels, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexStorage2DEXT(JNIEnv* env, jclass, jint target, jint levels, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexStorage2DEXT"));
    if (!fn) {
        return;
    }
    fn(target, levels, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexStorage3D(JNIEnv* env, jclass, jint target, jint levels, jint internalformat, jint width, jint height, jint depth) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexStorage3D"));
    if (!fn) {
        return;
    }
    fn(target, levels, internalformat, width, height, depth);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexStorage3DEXT(JNIEnv* env, jclass, jint target, jint levels, jint internalformat, jint width, jint height, jint depth) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexStorage3DEXT"));
    if (!fn) {
        return;
    }
    fn(target, levels, internalformat, width, height, depth);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexStorage3DMultisampleOES(JNIEnv* env, jclass, jint target, jint samples, jint internalformat, jint width, jint height, jint depth, jbyte fixedsamplelocations) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jbyte);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexStorage3DMultisampleOES"));
    if (!fn) {
        return;
    }
    fn(target, samples, internalformat, width, height, depth, fixedsamplelocations);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexStorageMem2DEXT(JNIEnv* env, jclass, jint target, jint levels, jint internalFormat, jint width, jint height, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexStorageMem2DEXT"));
    if (!fn) {
        return;
    }
    fn(target, levels, internalFormat, width, height, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexStorageMem2DMultisampleEXT(JNIEnv* env, jclass, jint target, jint samples, jint internalFormat, jint width, jint height, jbyte fixedSampleLocations, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jbyte, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexStorageMem2DMultisampleEXT"));
    if (!fn) {
        return;
    }
    fn(target, samples, internalFormat, width, height, fixedSampleLocations, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexStorageMem3DEXT(JNIEnv* env, jclass, jint target, jint levels, jint internalFormat, jint width, jint height, jint depth, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexStorageMem3DEXT"));
    if (!fn) {
        return;
    }
    fn(target, levels, internalFormat, width, height, depth, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexStorageMem3DMultisampleEXT(JNIEnv* env, jclass, jint target, jint samples, jint internalFormat, jint width, jint height, jint depth, jbyte fixedSampleLocations, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jbyte, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexStorageMem3DMultisampleEXT"));
    if (!fn) {
        return;
    }
    fn(target, samples, internalFormat, width, height, depth, fixedSampleLocations, memory, offset);
}

static void libjglios_gles_glTexSubImage2D(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint width, jint height, jint format, jint type, jlong pixels) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexSubImage2D"));
    if (!fn) {
        return;
    }
    fn(target, level, xoffset, yoffset, width, height, format, type, pixels);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexSubImage2D__IIIIIIII_3B(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint width, jint height, jint format, jint type, jbyteArray pixels) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, void*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexSubImage2D"));
    if (!fn) {
        return;
    }
    jbyte* pixels_elems = env->GetByteArrayElements(pixels, nullptr);
    fn(target, level, xoffset, yoffset, width, height, format, type, pixels_elems);
    env->ReleaseByteArrayElements(pixels, pixels_elems, JNI_ABORT);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexSubImage2D__IIIIIIIILjava_nio_Buffer_2J(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint width, jint height, jint format, jint type, jobject pixels, jlong pixelsOffset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, void*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexSubImage2D"));
    if (!fn) {
        return;
    }
    void* pixelsPtr = directBufferAddress(env, pixels, pixelsOffset);
    if (env->ExceptionCheck()) {
        return;
    }
    fn(target, level, xoffset, yoffset, width, height, format, type, pixelsPtr);
}

static void libjglios_gles_glTexSubImage3D(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint zoffset, jint width, jint height, jint depth, jint format, jint type, jlong pixels) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexSubImage3D"));
    if (!fn) {
        return;
    }
    fn(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, pixels);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexSubImage3D__IIIIIIIIIILjava_nio_Buffer_2J(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint zoffset, jint width, jint height, jint depth, jint format, jint type, jobject pixels, jlong pixelsOffset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, void*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexSubImage3D"));
    if (!fn) {
        return;
    }
    void* pixelsPtr = directBufferAddress(env, pixels, pixelsOffset);
    if (env->ExceptionCheck()) {
        return;
    }
    fn(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, pixelsPtr);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexSubImage3DOES(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint zoffset, jint width, jint height, jint depth, jint format, jint type, jlong pixels) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexSubImage3DOES"));
    if (!fn) {
        return;
    }
    fn(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, pixels);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTextureAttachMemoryNV(JNIEnv* env, jclass, jint texture, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTextureAttachMemoryNV"));
    if (!fn) {
        return;
    }
    fn(texture, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTextureFoveationParametersQCOM(JNIEnv* env, jclass, jint texture, jint layer, jint focalPoint, jfloat focalX, jfloat focalY, jfloat gainX, jfloat gainY, jfloat foveaArea) {
    using Fn = void (*)(jint, jint, jint, jfloat, jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTextureFoveationParametersQCOM"));
    if (!fn) {
        return;
    }
    fn(texture, layer, focalPoint, focalX, focalY, gainX, gainY, foveaArea);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexturePageCommitmentMemNV(JNIEnv* env, jclass, jint texture, jint layer, jint level, jint xoffset, jint yoffset, jint zoffset, jint width, jint height, jint depth, jint memory, jlong offset, jbyte commit) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jlong, jbyte);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTexturePageCommitmentMemNV"));
    if (!fn) {
        return;
    }
    fn(texture, layer, level, xoffset, yoffset, zoffset, width, height, depth, memory, offset, commit);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTextureStorage1DEXT(JNIEnv* env, jclass, jint texture, jint target, jint levels, jint internalformat, jint width) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTextureStorage1DEXT"));
    if (!fn) {
        return;
    }
    fn(texture, target, levels, internalformat, width);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTextureStorage2DEXT(JNIEnv* env, jclass, jint texture, jint target, jint levels, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTextureStorage2DEXT"));
    if (!fn) {
        return;
    }
    fn(texture, target, levels, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTextureStorage3DEXT(JNIEnv* env, jclass, jint texture, jint target, jint levels, jint internalformat, jint width, jint height, jint depth) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTextureStorage3DEXT"));
    if (!fn) {
        return;
    }
    fn(texture, target, levels, internalformat, width, height, depth);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTextureStorageMem2DEXT(JNIEnv* env, jclass, jint texture, jint levels, jint internalFormat, jint width, jint height, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTextureStorageMem2DEXT"));
    if (!fn) {
        return;
    }
    fn(texture, levels, internalFormat, width, height, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTextureStorageMem2DMultisampleEXT(JNIEnv* env, jclass, jint texture, jint samples, jint internalFormat, jint width, jint height, jbyte fixedSampleLocations, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jbyte, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTextureStorageMem2DMultisampleEXT"));
    if (!fn) {
        return;
    }
    fn(texture, samples, internalFormat, width, height, fixedSampleLocations, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTextureStorageMem3DEXT(JNIEnv* env, jclass, jint texture, jint levels, jint internalFormat, jint width, jint height, jint depth, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTextureStorageMem3DEXT"));
    if (!fn) {
        return;
    }
    fn(texture, levels, internalFormat, width, height, depth, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTextureStorageMem3DMultisampleEXT(JNIEnv* env, jclass, jint texture, jint samples, jint internalFormat, jint width, jint height, jint depth, jbyte fixedSampleLocations, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jbyte, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTextureStorageMem3DMultisampleEXT"));
    if (!fn) {
        return;
    }
    fn(texture, samples, internalFormat, width, height, depth, fixedSampleLocations, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTextureViewEXT(JNIEnv* env, jclass, jint texture, jint target, jint origtexture, jint internalformat, jint minlevel, jint numlevels, jint minlayer, jint numlayers) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTextureViewEXT"));
    if (!fn) {
        return;
    }
    fn(texture, target, origtexture, internalformat, minlevel, numlevels, minlayer, numlayers);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTextureViewOES(JNIEnv* env, jclass, jint texture, jint target, jint origtexture, jint internalformat, jint minlevel, jint numlevels, jint minlayer, jint numlayers) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTextureViewOES"));
    if (!fn) {
        return;
    }
    fn(texture, target, origtexture, internalformat, minlevel, numlevels, minlayer, numlayers);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTransformFeedbackVaryings(JNIEnv* env, jclass, jint program, jint count, jbyteArray varyings, jint bufferMode) {
    jbyte* varyings_elems = env->GetByteArrayElements(varyings, nullptr);
    using Fn = void (*)(jint, jint, jbyte*, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTransformFeedbackVaryings"));
    if (!fn) {
        env->ReleaseByteArrayElements(varyings, varyings_elems, JNI_ABORT);
        return;
    }
    fn(program, count, reinterpret_cast<jbyte*>(varyings_elems), bufferMode);
    env->ReleaseByteArrayElements(varyings, varyings_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTransformPathNV(JNIEnv* env, jclass, jint resultPath, jint srcPath, jint transformType, jfloatArray transformValues) {
    jfloat* transformValues_elems = env->GetFloatArrayElements(transformValues, nullptr);
    using Fn = void (*)(jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glTransformPathNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(transformValues, transformValues_elems, JNI_ABORT);
        return;
    }
    fn(resultPath, srcPath, transformType, reinterpret_cast<jfloat*>(transformValues_elems));
    env->ReleaseFloatArrayElements(transformValues, transformValues_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform1f(JNIEnv* env, jclass, jint location, jfloat v0) {
    using Fn = void (*)(jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform1f"));
    if (!fn) {
        return;
    }
    fn(location, v0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform1fv(JNIEnv* env, jclass, jint location, jint count, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform1fv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform1i(JNIEnv* env, jclass, jint location, jint v0) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform1i"));
    if (!fn) {
        return;
    }
    fn(location, v0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform1i64NV(JNIEnv* env, jclass, jint location, jlong x) {
    using Fn = void (*)(jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform1i64NV"));
    if (!fn) {
        return;
    }
    fn(location, x);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform1i64vNV(JNIEnv* env, jclass, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform1i64vNV"));
    if (!fn) {
        env->ReleaseLongArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform1iv(JNIEnv* env, jclass, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform1iv"));
    if (!fn) {
        env->ReleaseIntArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform1ui(JNIEnv* env, jclass, jint location, jint v0) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform1ui"));
    if (!fn) {
        return;
    }
    fn(location, v0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform1ui64NV(JNIEnv* env, jclass, jint location, jlong x) {
    using Fn = void (*)(jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform1ui64NV"));
    if (!fn) {
        return;
    }
    fn(location, x);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform1ui64vNV(JNIEnv* env, jclass, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform1ui64vNV"));
    if (!fn) {
        env->ReleaseLongArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform1uiv(JNIEnv* env, jclass, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform1uiv"));
    if (!fn) {
        env->ReleaseIntArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform2f(JNIEnv* env, jclass, jint location, jfloat v0, jfloat v1) {
    using Fn = void (*)(jint, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform2f"));
    if (!fn) {
        return;
    }
    fn(location, v0, v1);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform2fv(JNIEnv* env, jclass, jint location, jint count, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform2fv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform2i(JNIEnv* env, jclass, jint location, jint v0, jint v1) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform2i"));
    if (!fn) {
        return;
    }
    fn(location, v0, v1);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform2i64NV(JNIEnv* env, jclass, jint location, jlong x, jlong y) {
    using Fn = void (*)(jint, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform2i64NV"));
    if (!fn) {
        return;
    }
    fn(location, x, y);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform2i64vNV(JNIEnv* env, jclass, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform2i64vNV"));
    if (!fn) {
        env->ReleaseLongArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform2iv(JNIEnv* env, jclass, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform2iv"));
    if (!fn) {
        env->ReleaseIntArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform2ui(JNIEnv* env, jclass, jint location, jint v0, jint v1) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform2ui"));
    if (!fn) {
        return;
    }
    fn(location, v0, v1);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform2ui64NV(JNIEnv* env, jclass, jint location, jlong x, jlong y) {
    using Fn = void (*)(jint, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform2ui64NV"));
    if (!fn) {
        return;
    }
    fn(location, x, y);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform2ui64vNV(JNIEnv* env, jclass, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform2ui64vNV"));
    if (!fn) {
        env->ReleaseLongArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform2uiv(JNIEnv* env, jclass, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform2uiv"));
    if (!fn) {
        env->ReleaseIntArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform3f(JNIEnv* env, jclass, jint location, jfloat v0, jfloat v1, jfloat v2) {
    using Fn = void (*)(jint, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform3f"));
    if (!fn) {
        return;
    }
    fn(location, v0, v1, v2);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform3fv(JNIEnv* env, jclass, jint location, jint count, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform3fv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform3i(JNIEnv* env, jclass, jint location, jint v0, jint v1, jint v2) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform3i"));
    if (!fn) {
        return;
    }
    fn(location, v0, v1, v2);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform3i64NV(JNIEnv* env, jclass, jint location, jlong x, jlong y, jlong z) {
    using Fn = void (*)(jint, jlong, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform3i64NV"));
    if (!fn) {
        return;
    }
    fn(location, x, y, z);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform3i64vNV(JNIEnv* env, jclass, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform3i64vNV"));
    if (!fn) {
        env->ReleaseLongArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform3iv(JNIEnv* env, jclass, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform3iv"));
    if (!fn) {
        env->ReleaseIntArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform3ui(JNIEnv* env, jclass, jint location, jint v0, jint v1, jint v2) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform3ui"));
    if (!fn) {
        return;
    }
    fn(location, v0, v1, v2);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform3ui64NV(JNIEnv* env, jclass, jint location, jlong x, jlong y, jlong z) {
    using Fn = void (*)(jint, jlong, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform3ui64NV"));
    if (!fn) {
        return;
    }
    fn(location, x, y, z);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform3ui64vNV(JNIEnv* env, jclass, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform3ui64vNV"));
    if (!fn) {
        env->ReleaseLongArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform3uiv(JNIEnv* env, jclass, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform3uiv"));
    if (!fn) {
        env->ReleaseIntArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform4f(JNIEnv* env, jclass, jint location, jfloat v0, jfloat v1, jfloat v2, jfloat v3) {
    using Fn = void (*)(jint, jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform4f"));
    if (!fn) {
        return;
    }
    fn(location, v0, v1, v2, v3);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform4fv(JNIEnv* env, jclass, jint location, jint count, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform4fv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform4i(JNIEnv* env, jclass, jint location, jint v0, jint v1, jint v2, jint v3) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform4i"));
    if (!fn) {
        return;
    }
    fn(location, v0, v1, v2, v3);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform4i64NV(JNIEnv* env, jclass, jint location, jlong x, jlong y, jlong z, jlong w) {
    using Fn = void (*)(jint, jlong, jlong, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform4i64NV"));
    if (!fn) {
        return;
    }
    fn(location, x, y, z, w);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform4i64vNV(JNIEnv* env, jclass, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform4i64vNV"));
    if (!fn) {
        env->ReleaseLongArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform4iv(JNIEnv* env, jclass, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform4iv"));
    if (!fn) {
        env->ReleaseIntArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform4ui(JNIEnv* env, jclass, jint location, jint v0, jint v1, jint v2, jint v3) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform4ui"));
    if (!fn) {
        return;
    }
    fn(location, v0, v1, v2, v3);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform4ui64NV(JNIEnv* env, jclass, jint location, jlong x, jlong y, jlong z, jlong w) {
    using Fn = void (*)(jint, jlong, jlong, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform4ui64NV"));
    if (!fn) {
        return;
    }
    fn(location, x, y, z, w);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform4ui64vNV(JNIEnv* env, jclass, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform4ui64vNV"));
    if (!fn) {
        env->ReleaseLongArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform4uiv(JNIEnv* env, jclass, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniform4uiv"));
    if (!fn) {
        env->ReleaseIntArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformBlockBinding(JNIEnv* env, jclass, jint program, jint uniformBlockIndex, jint uniformBlockBinding) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniformBlockBinding"));
    if (!fn) {
        return;
    }
    fn(program, uniformBlockIndex, uniformBlockBinding);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformHandleui64IMG(JNIEnv* env, jclass, jint location, jlong value) {
    using Fn = void (*)(jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniformHandleui64IMG"));
    if (!fn) {
        return;
    }
    fn(location, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformHandleui64NV(JNIEnv* env, jclass, jint location, jlong value) {
    using Fn = void (*)(jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniformHandleui64NV"));
    if (!fn) {
        return;
    }
    fn(location, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformHandleui64vIMG(JNIEnv* env, jclass, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniformHandleui64vIMG"));
    if (!fn) {
        env->ReleaseLongArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformHandleui64vNV(JNIEnv* env, jclass, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniformHandleui64vNV"));
    if (!fn) {
        env->ReleaseLongArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix2fv(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniformMatrix2fv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix2x3fv(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniformMatrix2x3fv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix2x3fvNV(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniformMatrix2x3fvNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix2x4fv(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniformMatrix2x4fv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix2x4fvNV(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniformMatrix2x4fvNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix3fv(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniformMatrix3fv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix3x2fv(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniformMatrix3x2fv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix3x2fvNV(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniformMatrix3x2fvNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix3x4fv(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniformMatrix3x4fv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix3x4fvNV(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniformMatrix3x4fvNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix4fv(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniformMatrix4fv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix4x2fv(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniformMatrix4x2fv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix4x2fvNV(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniformMatrix4x2fvNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix4x3fv(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniformMatrix4x3fv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix4x3fvNV(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUniformMatrix4x3fvNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(value, value_elems, JNI_ABORT);
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glUnmapBuffer(JNIEnv* env, jclass, jint target) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUnmapBuffer"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(target);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glUnmapBufferOES(JNIEnv* env, jclass, jint target) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUnmapBufferOES"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(target);
    return static_cast<jbyte>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUseProgram(JNIEnv* env, jclass, jint program) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUseProgram"));
    if (!fn) {
        return;
    }
    fn(program);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUseProgramStagesEXT(JNIEnv* env, jclass, jint pipeline, jint stages, jint program) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glUseProgramStagesEXT"));
    if (!fn) {
        return;
    }
    fn(pipeline, stages, program);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glValidateProgram(JNIEnv* env, jclass, jint program) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glValidateProgram"));
    if (!fn) {
        return;
    }
    fn(program);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glValidateProgramPipelineEXT(JNIEnv* env, jclass, jint pipeline) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glValidateProgramPipelineEXT"));
    if (!fn) {
        return;
    }
    fn(pipeline);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttrib1f(JNIEnv* env, jclass, jint index, jfloat x) {
    using Fn = void (*)(jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glVertexAttrib1f"));
    if (!fn) {
        return;
    }
    fn(index, x);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttrib1fv(JNIEnv* env, jclass, jint index, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glVertexAttrib1fv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(v, v_elems, JNI_ABORT);
        return;
    }
    fn(index, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttrib2f(JNIEnv* env, jclass, jint index, jfloat x, jfloat y) {
    using Fn = void (*)(jint, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glVertexAttrib2f"));
    if (!fn) {
        return;
    }
    fn(index, x, y);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttrib2fv(JNIEnv* env, jclass, jint index, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glVertexAttrib2fv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(v, v_elems, JNI_ABORT);
        return;
    }
    fn(index, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttrib3f(JNIEnv* env, jclass, jint index, jfloat x, jfloat y, jfloat z) {
    using Fn = void (*)(jint, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glVertexAttrib3f"));
    if (!fn) {
        return;
    }
    fn(index, x, y, z);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttrib3fv(JNIEnv* env, jclass, jint index, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glVertexAttrib3fv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(v, v_elems, JNI_ABORT);
        return;
    }
    fn(index, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttrib4f(JNIEnv* env, jclass, jint index, jfloat x, jfloat y, jfloat z, jfloat w) {
    using Fn = void (*)(jint, jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glVertexAttrib4f"));
    if (!fn) {
        return;
    }
    fn(index, x, y, z, w);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttrib4fv(JNIEnv* env, jclass, jint index, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glVertexAttrib4fv"));
    if (!fn) {
        env->ReleaseFloatArrayElements(v, v_elems, JNI_ABORT);
        return;
    }
    fn(index, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttribDivisor(JNIEnv* env, jclass, jint index, jint divisor) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glVertexAttribDivisor"));
    if (!fn) {
        return;
    }
    fn(index, divisor);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttribDivisorANGLE(JNIEnv* env, jclass, jint index, jint divisor) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glVertexAttribDivisorANGLE"));
    if (!fn) {
        return;
    }
    fn(index, divisor);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttribDivisorEXT(JNIEnv* env, jclass, jint index, jint divisor) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glVertexAttribDivisorEXT"));
    if (!fn) {
        return;
    }
    fn(index, divisor);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttribDivisorNV(JNIEnv* env, jclass, jint index, jint divisor) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glVertexAttribDivisorNV"));
    if (!fn) {
        return;
    }
    fn(index, divisor);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttribI4i(JNIEnv* env, jclass, jint index, jint x, jint y, jint z, jint w) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glVertexAttribI4i"));
    if (!fn) {
        return;
    }
    fn(index, x, y, z, w);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttribI4iv(JNIEnv* env, jclass, jint index, jintArray v) {
    jint* v_elems = env->GetIntArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glVertexAttribI4iv"));
    if (!fn) {
        env->ReleaseIntArrayElements(v, v_elems, JNI_ABORT);
        return;
    }
    fn(index, reinterpret_cast<jint*>(v_elems));
    env->ReleaseIntArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttribI4ui(JNIEnv* env, jclass, jint index, jint x, jint y, jint z, jint w) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glVertexAttribI4ui"));
    if (!fn) {
        return;
    }
    fn(index, x, y, z, w);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttribI4uiv(JNIEnv* env, jclass, jint index, jintArray v) {
    jint* v_elems = env->GetIntArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glVertexAttribI4uiv"));
    if (!fn) {
        env->ReleaseIntArrayElements(v, v_elems, JNI_ABORT);
        return;
    }
    fn(index, reinterpret_cast<jint*>(v_elems));
    env->ReleaseIntArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttribIPointer(JNIEnv* env, jclass, jint index, jint size, jint type, jint stride, jlong pointer) {
    using Fn = void (*)(jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glVertexAttribIPointer"));
    if (!fn) {
        return;
    }
    fn(index, size, type, stride, pointer);
}

static void libjglios_gles_glVertexAttribPointer(JNIEnv* env, jclass, jint index, jint size, jint type, jbyte normalized, jint stride, jlong pointer) {
    using Fn = void (*)(jint, jint, jint, jbyte, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glVertexAttribPointer"));
    if (!fn) {
        return;
    }
    fn(index, size, type, normalized, stride, pointer);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttribPointer__IIIBILjava_nio_Buffer_2J(JNIEnv* env, jclass, jint index, jint size, jint type, jbyte normalized, jint stride, jobject pointer, jlong pointerOffset) {
    using Fn = void (*)(jint, jint, jint, jbyte, jint, void*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glVertexAttribPointer"));
    if (!fn) {
        return;
    }
    void* pointerPtr = directBufferAddress(env, pointer, pointerOffset);
    if (env->ExceptionCheck()) {
        return;
    }
    fn(index, size, type, normalized, stride, pointerPtr);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glViewport(JNIEnv* env, jclass, jint x, jint y, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glViewport"));
    if (!fn) {
        return;
    }
    fn(x, y, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glViewportArrayvNV(JNIEnv* env, jclass, jint first, jint count, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glViewportArrayvNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(v, v_elems, JNI_ABORT);
        return;
    }
    fn(first, count, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glViewportArrayvOES(JNIEnv* env, jclass, jint first, jint count, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glViewportArrayvOES"));
    if (!fn) {
        env->ReleaseFloatArrayElements(v, v_elems, JNI_ABORT);
        return;
    }
    fn(first, count, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glViewportIndexedfNV(JNIEnv* env, jclass, jint index, jfloat x, jfloat y, jfloat w, jfloat h) {
    using Fn = void (*)(jint, jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glViewportIndexedfNV"));
    if (!fn) {
        return;
    }
    fn(index, x, y, w, h);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glViewportIndexedfOES(JNIEnv* env, jclass, jint index, jfloat x, jfloat y, jfloat w, jfloat h) {
    using Fn = void (*)(jint, jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glViewportIndexedfOES"));
    if (!fn) {
        return;
    }
    fn(index, x, y, w, h);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glViewportIndexedfvNV(JNIEnv* env, jclass, jint index, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glViewportIndexedfvNV"));
    if (!fn) {
        env->ReleaseFloatArrayElements(v, v_elems, JNI_ABORT);
        return;
    }
    fn(index, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glViewportIndexedfvOES(JNIEnv* env, jclass, jint index, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glViewportIndexedfvOES"));
    if (!fn) {
        env->ReleaseFloatArrayElements(v, v_elems, JNI_ABORT);
        return;
    }
    fn(index, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glViewportPositionWScaleNV(JNIEnv* env, jclass, jint index, jfloat xcoeff, jfloat ycoeff) {
    using Fn = void (*)(jint, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glViewportPositionWScaleNV"));
    if (!fn) {
        return;
    }
    fn(index, xcoeff, ycoeff);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glViewportSwizzleNV(JNIEnv* env, jclass, jint index, jint swizzlex, jint swizzley, jint swizzlez, jint swizzlew) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glViewportSwizzleNV"));
    if (!fn) {
        return;
    }
    fn(index, swizzlex, swizzley, swizzlez, swizzlew);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glWaitSemaphoreEXT(JNIEnv* env, jclass, jint semaphore, jint numBufferBarriers, jintArray buffers, jint numTextureBarriers, jintArray textures, jintArray srcLayouts) {
    jint* buffers_elems = env->GetIntArrayElements(buffers, nullptr);
    jint* textures_elems = env->GetIntArrayElements(textures, nullptr);
    jint* srcLayouts_elems = env->GetIntArrayElements(srcLayouts, nullptr);
    using Fn = void (*)(jint, jint, jint*, jint, jint*, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glWaitSemaphoreEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(buffers, buffers_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(textures, textures_elems, JNI_ABORT);
        env->ReleaseIntArrayElements(srcLayouts, srcLayouts_elems, JNI_ABORT);
        return;
    }
    fn(semaphore, numBufferBarriers, reinterpret_cast<jint*>(buffers_elems), numTextureBarriers, reinterpret_cast<jint*>(textures_elems), reinterpret_cast<jint*>(srcLayouts_elems));
    env->ReleaseIntArrayElements(srcLayouts, srcLayouts_elems, 0);
    env->ReleaseIntArrayElements(textures, textures_elems, 0);
    env->ReleaseIntArrayElements(buffers, buffers_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glWaitSync(JNIEnv* env, jclass, jlong sync, jint flags, jlong timeout) {
    using Fn = void (*)(jlong, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glWaitSync"));
    if (!fn) {
        return;
    }
    fn(sync, flags, timeout);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glWaitSyncAPPLE(JNIEnv* env, jclass, jlong sync, jint flags, jlong timeout) {
    using Fn = void (*)(jlong, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glWaitSyncAPPLE"));
    if (!fn) {
        return;
    }
    fn(sync, flags, timeout);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glWaitVkSemaphoreNV(JNIEnv* env, jclass, jlong vkSemaphore) {
    using Fn = void (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glWaitVkSemaphoreNV"));
    if (!fn) {
        return;
    }
    fn(vkSemaphore);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glWeightPathsNV(JNIEnv* env, jclass, jint resultPath, jint numPaths, jintArray paths, jfloatArray weights) {
    jint* paths_elems = env->GetIntArrayElements(paths, nullptr);
    jfloat* weights_elems = env->GetFloatArrayElements(weights, nullptr);
    using Fn = void (*)(jint, jint, jint*, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glWeightPathsNV"));
    if (!fn) {
        env->ReleaseIntArrayElements(paths, paths_elems, JNI_ABORT);
        env->ReleaseFloatArrayElements(weights, weights_elems, JNI_ABORT);
        return;
    }
    fn(resultPath, numPaths, reinterpret_cast<jint*>(paths_elems), reinterpret_cast<jfloat*>(weights_elems));
    env->ReleaseFloatArrayElements(weights, weights_elems, 0);
    env->ReleaseIntArrayElements(paths, paths_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glWindowRectanglesEXT(JNIEnv* env, jclass, jint mode, jint count, jintArray box) {
    jint* box_elems = env->GetIntArrayElements(box, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("glWindowRectanglesEXT"));
    if (!fn) {
        env->ReleaseIntArrayElements(box, box_elems, JNI_ABORT);
        return;
    }
    fn(mode, count, reinterpret_cast<jint*>(box_elems));
    env->ReleaseIntArrayElements(box, box_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBufferData__IJJI(JNIEnv* env, jclass clazz, jint target, jlong size, jlong data, jint usage) { libjglios_gles_glBufferData(env, clazz, target, size, data, usage); }
JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBufferSubData__IJJJ(JNIEnv* env, jclass clazz, jint target, jlong offset, jlong size, jlong data) { libjglios_gles_glBufferSubData(env, clazz, target, offset, size, data); }
JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCompressedTexImage2D__IIIIIIIJ(JNIEnv* env, jclass clazz, jint target, jint level, jint internalformat, jint width, jint height, jint border, jint imageSize, jlong data) { libjglios_gles_glCompressedTexImage2D(env, clazz, target, level, internalformat, width, height, border, imageSize, data); }
JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCompressedTexImage3D__IIIIIIIIJ(JNIEnv* env, jclass clazz, jint target, jint level, jint internalformat, jint width, jint height, jint depth, jint border, jint imageSize, jlong data) { libjglios_gles_glCompressedTexImage3D(env, clazz, target, level, internalformat, width, height, depth, border, imageSize, data); }
JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCompressedTexSubImage2D__IIIIIIIIJ(JNIEnv* env, jclass clazz, jint target, jint level, jint xoffset, jint yoffset, jint width, jint height, jint format, jint imageSize, jlong data) { libjglios_gles_glCompressedTexSubImage2D(env, clazz, target, level, xoffset, yoffset, width, height, format, imageSize, data); }
JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCompressedTexSubImage3D__IIIIIIIIIIJ(JNIEnv* env, jclass clazz, jint target, jint level, jint xoffset, jint yoffset, jint zoffset, jint width, jint height, jint depth, jint format, jint imageSize, jlong data) { libjglios_gles_glCompressedTexSubImage3D(env, clazz, target, level, xoffset, yoffset, zoffset, width, height, depth, format, imageSize, data); }
JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glReadPixels__IIIIIIJ(JNIEnv* env, jclass clazz, jint x, jint y, jint width, jint height, jint format, jint type, jlong pixels) { libjglios_gles_glReadPixels(env, clazz, x, y, width, height, format, type, pixels); }
JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexImage2D__IIIIIIIIJ(JNIEnv* env, jclass clazz, jint target, jint level, jint internalformat, jint width, jint height, jint border, jint format, jint type, jlong pixels) { libjglios_gles_glTexImage2D(env, clazz, target, level, internalformat, width, height, border, format, type, pixels); }
JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexImage3D__IIIIIIIIIJ(JNIEnv* env, jclass clazz, jint target, jint level, jint internalformat, jint width, jint height, jint depth, jint border, jint format, jint type, jlong pixels) { libjglios_gles_glTexImage3D(env, clazz, target, level, internalformat, width, height, depth, border, format, type, pixels); }
JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexSubImage2D__IIIIIIIIJ(JNIEnv* env, jclass clazz, jint target, jint level, jint xoffset, jint yoffset, jint width, jint height, jint format, jint type, jlong pixels) { libjglios_gles_glTexSubImage2D(env, clazz, target, level, xoffset, yoffset, width, height, format, type, pixels); }
JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexSubImage3D__IIIIIIIIIIJ(JNIEnv* env, jclass clazz, jint target, jint level, jint xoffset, jint yoffset, jint zoffset, jint width, jint height, jint depth, jint format, jint type, jlong pixels) { libjglios_gles_glTexSubImage3D(env, clazz, target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, pixels); }
JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttribPointer__IIIBIJ(JNIEnv* env, jclass clazz, jint index, jint size, jint type, jbyte normalized, jint stride, jlong pointer) { libjglios_gles_glVertexAttribPointer(env, clazz, index, size, type, normalized, stride, pointer); }

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteBuffers__I_3I(JNIEnv* env, jclass clazz, jint n, jintArray buffers) { libjglios_gles_glDeleteBuffers(env, clazz, n, buffers); }
JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteFramebuffers__I_3I(JNIEnv* env, jclass clazz, jint n, jintArray framebuffers) { libjglios_gles_glDeleteFramebuffers(env, clazz, n, framebuffers); }
JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteQueries__I_3I(JNIEnv* env, jclass clazz, jint n, jintArray ids) { libjglios_gles_glDeleteQueries(env, clazz, n, ids); }
JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteRenderbuffers__I_3I(JNIEnv* env, jclass clazz, jint n, jintArray renderbuffers) { libjglios_gles_glDeleteRenderbuffers(env, clazz, n, renderbuffers); }
JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteTextures__I_3I(JNIEnv* env, jclass clazz, jint n, jintArray textures) { libjglios_gles_glDeleteTextures(env, clazz, n, textures); }
JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenBuffers__I_3I(JNIEnv* env, jclass clazz, jint n, jintArray buffers) { libjglios_gles_glGenBuffers(env, clazz, n, buffers); }
JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenFramebuffers__I_3I(JNIEnv* env, jclass clazz, jint n, jintArray framebuffers) { libjglios_gles_glGenFramebuffers(env, clazz, n, framebuffers); }
JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenQueries__I_3I(JNIEnv* env, jclass clazz, jint n, jintArray ids) { libjglios_gles_glGenQueries(env, clazz, n, ids); }
JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenRenderbuffers__I_3I(JNIEnv* env, jclass clazz, jint n, jintArray renderbuffers) { libjglios_gles_glGenRenderbuffers(env, clazz, n, renderbuffers); }
JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenTextures__I_3I(JNIEnv* env, jclass clazz, jint n, jintArray textures) { libjglios_gles_glGenTextures(env, clazz, n, textures); }

}
