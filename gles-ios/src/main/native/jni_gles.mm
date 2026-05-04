#include <jni.h>
#include <cstdint>
#include <cstring>

#include <EGL/egl.h>
#include <GLES2/gl2.h>
#include <GLES2/gl2ext.h>
#include <GLES3/gl3.h>

extern "C" {

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glAcquireKeyedMutexWin32EXT(JNIEnv* env, jclass, jint memory, jlong key, jint timeout) {
    using Fn = jbyte (*)(jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glAcquireKeyedMutexWin32EXT"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(memory, key, timeout);
    return static_cast<jbyte>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glActiveShaderProgramEXT(JNIEnv* env, jclass, jint pipeline, jint program) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glActiveShaderProgramEXT"));
    if (!fn) {
        return;
    }
    fn(pipeline, program);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glActiveTexture(JNIEnv* env, jclass, jint texture) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glActiveTexture"));
    if (!fn) {
        return;
    }
    fn(texture);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glAlphaFuncQCOM(JNIEnv* env, jclass, jint func, jfloat ref) {
    using Fn = void (*)(jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glAlphaFuncQCOM"));
    if (!fn) {
        return;
    }
    fn(func, ref);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glApplyFramebufferAttachmentCMAAINTEL(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glApplyFramebufferAttachmentCMAAINTEL"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glAttachShader(JNIEnv* env, jclass, jint program, jint shader) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glAttachShader"));
    if (!fn) {
        return;
    }
    fn(program, shader);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBeginConditionalRenderNV(JNIEnv* env, jclass, jint id, jint mode) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBeginConditionalRenderNV"));
    if (!fn) {
        return;
    }
    fn(id, mode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBeginPerfMonitorAMD(JNIEnv* env, jclass, jint monitor) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBeginPerfMonitorAMD"));
    if (!fn) {
        return;
    }
    fn(monitor);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBeginPerfQueryINTEL(JNIEnv* env, jclass, jint queryHandle) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBeginPerfQueryINTEL"));
    if (!fn) {
        return;
    }
    fn(queryHandle);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBeginQuery(JNIEnv* env, jclass, jint target, jint id) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBeginQuery"));
    if (!fn) {
        return;
    }
    fn(target, id);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBeginQueryEXT(JNIEnv* env, jclass, jint target, jint id) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBeginQueryEXT"));
    if (!fn) {
        return;
    }
    fn(target, id);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBeginTransformFeedback(JNIEnv* env, jclass, jint primitiveMode) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBeginTransformFeedback"));
    if (!fn) {
        return;
    }
    fn(primitiveMode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindAttribLocation(JNIEnv* env, jclass, jint program, jint index, jbyteArray name) {
    jbyte* name_elems = env->GetByteArrayElements(name, nullptr);
    using Fn = void (*)(jint, jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBindAttribLocation"));
    if (!fn) {
        return;
    }
    fn(program, index, reinterpret_cast<jbyte*>(name_elems));
    env->ReleaseByteArrayElements(name, name_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindBuffer(JNIEnv* env, jclass, jint target, jint buffer) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBindBuffer"));
    if (!fn) {
        return;
    }
    fn(target, buffer);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindBufferBase(JNIEnv* env, jclass, jint target, jint index, jint buffer) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBindBufferBase"));
    if (!fn) {
        return;
    }
    fn(target, index, buffer);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindBufferRange(JNIEnv* env, jclass, jint target, jint index, jint buffer, jlong offset, jlong size) {
    using Fn = void (*)(jint, jint, jint, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBindBufferRange"));
    if (!fn) {
        return;
    }
    fn(target, index, buffer, offset, size);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindFragDataLocationEXT(JNIEnv* env, jclass, jint program, jint color, jbyteArray name) {
    jbyte* name_elems = env->GetByteArrayElements(name, nullptr);
    using Fn = void (*)(jint, jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBindFragDataLocationEXT"));
    if (!fn) {
        return;
    }
    fn(program, color, reinterpret_cast<jbyte*>(name_elems));
    env->ReleaseByteArrayElements(name, name_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindFragDataLocationIndexedEXT(JNIEnv* env, jclass, jint program, jint colorNumber, jint index, jbyteArray name) {
    jbyte* name_elems = env->GetByteArrayElements(name, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBindFragDataLocationIndexedEXT"));
    if (!fn) {
        return;
    }
    fn(program, colorNumber, index, reinterpret_cast<jbyte*>(name_elems));
    env->ReleaseByteArrayElements(name, name_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindFramebuffer(JNIEnv* env, jclass, jint target, jint framebuffer) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBindFramebuffer"));
    if (!fn) {
        return;
    }
    fn(target, framebuffer);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindProgramPipelineEXT(JNIEnv* env, jclass, jint pipeline) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBindProgramPipelineEXT"));
    if (!fn) {
        return;
    }
    fn(pipeline);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindRenderbuffer(JNIEnv* env, jclass, jint target, jint renderbuffer) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBindRenderbuffer"));
    if (!fn) {
        return;
    }
    fn(target, renderbuffer);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindSampler(JNIEnv* env, jclass, jint unit, jint sampler) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBindSampler"));
    if (!fn) {
        return;
    }
    fn(unit, sampler);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindShadingRateImageNV(JNIEnv* env, jclass, jint texture) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBindShadingRateImageNV"));
    if (!fn) {
        return;
    }
    fn(texture);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindTexture(JNIEnv* env, jclass, jint target, jint texture) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBindTexture"));
    if (!fn) {
        return;
    }
    fn(target, texture);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindTransformFeedback(JNIEnv* env, jclass, jint target, jint id) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBindTransformFeedback"));
    if (!fn) {
        return;
    }
    fn(target, id);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindVertexArray(JNIEnv* env, jclass, jint array) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBindVertexArray"));
    if (!fn) {
        return;
    }
    fn(array);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBindVertexArrayOES(JNIEnv* env, jclass, jint array) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBindVertexArrayOES"));
    if (!fn) {
        return;
    }
    fn(array);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendBarrierKHR(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBlendBarrierKHR"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendBarrierNV(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBlendBarrierNV"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendColor(JNIEnv* env, jclass, jfloat red, jfloat green, jfloat blue, jfloat alpha) {
    using Fn = void (*)(jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBlendColor"));
    if (!fn) {
        return;
    }
    fn(red, green, blue, alpha);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendEquation(JNIEnv* env, jclass, jint mode) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBlendEquation"));
    if (!fn) {
        return;
    }
    fn(mode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendEquationSeparate(JNIEnv* env, jclass, jint modeRGB, jint modeAlpha) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBlendEquationSeparate"));
    if (!fn) {
        return;
    }
    fn(modeRGB, modeAlpha);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendEquationSeparateiEXT(JNIEnv* env, jclass, jint buf, jint modeRGB, jint modeAlpha) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBlendEquationSeparateiEXT"));
    if (!fn) {
        return;
    }
    fn(buf, modeRGB, modeAlpha);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendEquationSeparateiOES(JNIEnv* env, jclass, jint buf, jint modeRGB, jint modeAlpha) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBlendEquationSeparateiOES"));
    if (!fn) {
        return;
    }
    fn(buf, modeRGB, modeAlpha);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendEquationiEXT(JNIEnv* env, jclass, jint buf, jint mode) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBlendEquationiEXT"));
    if (!fn) {
        return;
    }
    fn(buf, mode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendEquationiOES(JNIEnv* env, jclass, jint buf, jint mode) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBlendEquationiOES"));
    if (!fn) {
        return;
    }
    fn(buf, mode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendFunc(JNIEnv* env, jclass, jint sfactor, jint dfactor) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBlendFunc"));
    if (!fn) {
        return;
    }
    fn(sfactor, dfactor);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendFuncSeparate(JNIEnv* env, jclass, jint sfactorRGB, jint dfactorRGB, jint sfactorAlpha, jint dfactorAlpha) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBlendFuncSeparate"));
    if (!fn) {
        return;
    }
    fn(sfactorRGB, dfactorRGB, sfactorAlpha, dfactorAlpha);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendFuncSeparateiEXT(JNIEnv* env, jclass, jint buf, jint srcRGB, jint dstRGB, jint srcAlpha, jint dstAlpha) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBlendFuncSeparateiEXT"));
    if (!fn) {
        return;
    }
    fn(buf, srcRGB, dstRGB, srcAlpha, dstAlpha);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendFuncSeparateiOES(JNIEnv* env, jclass, jint buf, jint srcRGB, jint dstRGB, jint srcAlpha, jint dstAlpha) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBlendFuncSeparateiOES"));
    if (!fn) {
        return;
    }
    fn(buf, srcRGB, dstRGB, srcAlpha, dstAlpha);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendFunciEXT(JNIEnv* env, jclass, jint buf, jint src, jint dst) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBlendFunciEXT"));
    if (!fn) {
        return;
    }
    fn(buf, src, dst);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendFunciOES(JNIEnv* env, jclass, jint buf, jint src, jint dst) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBlendFunciOES"));
    if (!fn) {
        return;
    }
    fn(buf, src, dst);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlendParameteriNV(JNIEnv* env, jclass, jint pname, jint value) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBlendParameteriNV"));
    if (!fn) {
        return;
    }
    fn(pname, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlitFramebuffer(JNIEnv* env, jclass, jint srcX0, jint srcY0, jint srcX1, jint srcY1, jint dstX0, jint dstY0, jint dstX1, jint dstY1, jint mask, jint filter) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBlitFramebuffer"));
    if (!fn) {
        return;
    }
    fn(srcX0, srcY0, srcX1, srcY1, dstX0, dstY0, dstX1, dstY1, mask, filter);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlitFramebufferANGLE(JNIEnv* env, jclass, jint srcX0, jint srcY0, jint srcX1, jint srcY1, jint dstX0, jint dstY0, jint dstX1, jint dstY1, jint mask, jint filter) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBlitFramebufferANGLE"));
    if (!fn) {
        return;
    }
    fn(srcX0, srcY0, srcX1, srcY1, dstX0, dstY0, dstX1, dstY1, mask, filter);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBlitFramebufferNV(JNIEnv* env, jclass, jint srcX0, jint srcY0, jint srcX1, jint srcY1, jint dstX0, jint dstY0, jint dstX1, jint dstY1, jint mask, jint filter) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBlitFramebufferNV"));
    if (!fn) {
        return;
    }
    fn(srcX0, srcY0, srcX1, srcY1, dstX0, dstY0, dstX1, dstY1, mask, filter);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBufferAttachMemoryNV(JNIEnv* env, jclass, jint target, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBufferAttachMemoryNV"));
    if (!fn) {
        return;
    }
    fn(target, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBufferData(JNIEnv* env, jclass, jint target, jlong size, jlong data, jint usage) {
    using Fn = void (*)(jint, jlong, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBufferData"));
    if (!fn) {
        return;
    }
    fn(target, size, data, usage);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBufferPageCommitmentMemNV(JNIEnv* env, jclass, jint target, jlong offset, jlong size, jint memory, jlong memOffset, jbyte commit) {
    using Fn = void (*)(jint, jlong, jlong, jint, jlong, jbyte);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBufferPageCommitmentMemNV"));
    if (!fn) {
        return;
    }
    fn(target, offset, size, memory, memOffset, commit);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBufferStorageEXT(JNIEnv* env, jclass, jint target, jlong size, jlong data, jint flags) {
    using Fn = void (*)(jint, jlong, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBufferStorageEXT"));
    if (!fn) {
        return;
    }
    fn(target, size, data, flags);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBufferStorageExternalEXT(JNIEnv* env, jclass, jint target, jlong offset, jlong size, jlong clientBuffer, jint flags) {
    using Fn = void (*)(jint, jlong, jlong, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBufferStorageExternalEXT"));
    if (!fn) {
        return;
    }
    fn(target, offset, size, clientBuffer, flags);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBufferStorageMemEXT(JNIEnv* env, jclass, jint target, jlong size, jint memory, jlong offset) {
    using Fn = void (*)(jint, jlong, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBufferStorageMemEXT"));
    if (!fn) {
        return;
    }
    fn(target, size, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glBufferSubData(JNIEnv* env, jclass, jint target, jlong offset, jlong size, jlong data) {
    using Fn = void (*)(jint, jlong, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glBufferSubData"));
    if (!fn) {
        return;
    }
    fn(target, offset, size, data);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glCheckFramebufferStatus(JNIEnv* env, jclass, jint target) {
    using Fn = jint (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCheckFramebufferStatus"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn(target);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClear(JNIEnv* env, jclass, jint mask) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glClear"));
    if (!fn) {
        return;
    }
    fn(mask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClearBufferfi(JNIEnv* env, jclass, jint buffer, jint drawbuffer, jfloat depth, jint stencil) {
    using Fn = void (*)(jint, jint, jfloat, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glClearBufferfi"));
    if (!fn) {
        return;
    }
    fn(buffer, drawbuffer, depth, stencil);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClearBufferfv(JNIEnv* env, jclass, jint buffer, jint drawbuffer, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glClearBufferfv"));
    if (!fn) {
        return;
    }
    fn(buffer, drawbuffer, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClearBufferiv(JNIEnv* env, jclass, jint buffer, jint drawbuffer, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glClearBufferiv"));
    if (!fn) {
        return;
    }
    fn(buffer, drawbuffer, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClearBufferuiv(JNIEnv* env, jclass, jint buffer, jint drawbuffer, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glClearBufferuiv"));
    if (!fn) {
        return;
    }
    fn(buffer, drawbuffer, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClearColor(JNIEnv* env, jclass, jfloat red, jfloat green, jfloat blue, jfloat alpha) {
    using Fn = void (*)(jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glClearColor"));
    if (!fn) {
        return;
    }
    fn(red, green, blue, alpha);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClearDepthf(JNIEnv* env, jclass, jfloat d) {
    using Fn = void (*)(jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glClearDepthf"));
    if (!fn) {
        return;
    }
    fn(d);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClearPixelLocalStorageuiEXT(JNIEnv* env, jclass, jint offset, jint n, jintArray values) {
    jint* values_elems = env->GetIntArrayElements(values, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glClearPixelLocalStorageuiEXT"));
    if (!fn) {
        return;
    }
    fn(offset, n, reinterpret_cast<jint*>(values_elems));
    env->ReleaseIntArrayElements(values, values_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClearStencil(JNIEnv* env, jclass, jint s) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glClearStencil"));
    if (!fn) {
        return;
    }
    fn(s);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClearTexImageEXT(JNIEnv* env, jclass, jint texture, jint level, jint format, jint type, jlong data) {
    using Fn = void (*)(jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glClearTexImageEXT"));
    if (!fn) {
        return;
    }
    fn(texture, level, format, type, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClearTexSubImageEXT(JNIEnv* env, jclass, jint texture, jint level, jint xoffset, jint yoffset, jint zoffset, jint width, jint height, jint depth, jint format, jint type, jlong data) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glClearTexSubImageEXT"));
    if (!fn) {
        return;
    }
    fn(texture, level, xoffset, yoffset, zoffset, width, height, depth, format, type, data);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glClientWaitSync(JNIEnv* env, jclass, jlong sync, jint flags, jlong timeout) {
    using Fn = jint (*)(jlong, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glClientWaitSync"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn(sync, flags, timeout);
    return static_cast<jint>(result);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glClientWaitSyncAPPLE(JNIEnv* env, jclass, jlong sync, jint flags, jlong timeout) {
    using Fn = jint (*)(jlong, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glClientWaitSyncAPPLE"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn(sync, flags, timeout);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glClipControlEXT(JNIEnv* env, jclass, jint origin, jint depth) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glClipControlEXT"));
    if (!fn) {
        return;
    }
    fn(origin, depth);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glColorMask(JNIEnv* env, jclass, jbyte red, jbyte green, jbyte blue, jbyte alpha) {
    using Fn = void (*)(jbyte, jbyte, jbyte, jbyte);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glColorMask"));
    if (!fn) {
        return;
    }
    fn(red, green, blue, alpha);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glColorMaskiEXT(JNIEnv* env, jclass, jint index, jbyte r, jbyte g, jbyte b, jbyte a) {
    using Fn = void (*)(jint, jbyte, jbyte, jbyte, jbyte);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glColorMaskiEXT"));
    if (!fn) {
        return;
    }
    fn(index, r, g, b, a);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glColorMaskiOES(JNIEnv* env, jclass, jint index, jbyte r, jbyte g, jbyte b, jbyte a) {
    using Fn = void (*)(jint, jbyte, jbyte, jbyte, jbyte);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glColorMaskiOES"));
    if (!fn) {
        return;
    }
    fn(index, r, g, b, a);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCompileShader(JNIEnv* env, jclass, jint shader) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCompileShader"));
    if (!fn) {
        return;
    }
    fn(shader);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCompressedTexImage2D(JNIEnv* env, jclass, jint target, jint level, jint internalformat, jint width, jint height, jint border, jint imageSize, jlong data) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCompressedTexImage2D"));
    if (!fn) {
        return;
    }
    fn(target, level, internalformat, width, height, border, imageSize, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCompressedTexImage3D(JNIEnv* env, jclass, jint target, jint level, jint internalformat, jint width, jint height, jint depth, jint border, jint imageSize, jlong data) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCompressedTexImage3D"));
    if (!fn) {
        return;
    }
    fn(target, level, internalformat, width, height, depth, border, imageSize, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCompressedTexImage3DOES(JNIEnv* env, jclass, jint target, jint level, jint internalformat, jint width, jint height, jint depth, jint border, jint imageSize, jlong data) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCompressedTexImage3DOES"));
    if (!fn) {
        return;
    }
    fn(target, level, internalformat, width, height, depth, border, imageSize, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCompressedTexSubImage2D(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint width, jint height, jint format, jint imageSize, jlong data) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCompressedTexSubImage2D"));
    if (!fn) {
        return;
    }
    fn(target, level, xoffset, yoffset, width, height, format, imageSize, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCompressedTexSubImage3D(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint zoffset, jint width, jint height, jint depth, jint format, jint imageSize, jlong data) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCompressedTexSubImage3D"));
    if (!fn) {
        return;
    }
    fn(target, level, xoffset, yoffset, zoffset, width, height, depth, format, imageSize, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCompressedTexSubImage3DOES(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint zoffset, jint width, jint height, jint depth, jint format, jint imageSize, jlong data) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCompressedTexSubImage3DOES"));
    if (!fn) {
        return;
    }
    fn(target, level, xoffset, yoffset, zoffset, width, height, depth, format, imageSize, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glConservativeRasterParameteriNV(JNIEnv* env, jclass, jint pname, jint param) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glConservativeRasterParameteriNV"));
    if (!fn) {
        return;
    }
    fn(pname, param);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCopyBufferSubData(JNIEnv* env, jclass, jint readTarget, jint writeTarget, jlong readOffset, jlong writeOffset, jlong size) {
    using Fn = void (*)(jint, jint, jlong, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCopyBufferSubData"));
    if (!fn) {
        return;
    }
    fn(readTarget, writeTarget, readOffset, writeOffset, size);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCopyBufferSubDataNV(JNIEnv* env, jclass, jint readTarget, jint writeTarget, jlong readOffset, jlong writeOffset, jlong size) {
    using Fn = void (*)(jint, jint, jlong, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCopyBufferSubDataNV"));
    if (!fn) {
        return;
    }
    fn(readTarget, writeTarget, readOffset, writeOffset, size);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCopyImageSubDataEXT(JNIEnv* env, jclass, jint srcName, jint srcTarget, jint srcLevel, jint srcX, jint srcY, jint srcZ, jint dstName, jint dstTarget, jint dstLevel, jint dstX, jint dstY, jint dstZ, jint srcWidth, jint srcHeight, jint srcDepth) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCopyImageSubDataEXT"));
    if (!fn) {
        return;
    }
    fn(srcName, srcTarget, srcLevel, srcX, srcY, srcZ, dstName, dstTarget, dstLevel, dstX, dstY, dstZ, srcWidth, srcHeight, srcDepth);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCopyImageSubDataOES(JNIEnv* env, jclass, jint srcName, jint srcTarget, jint srcLevel, jint srcX, jint srcY, jint srcZ, jint dstName, jint dstTarget, jint dstLevel, jint dstX, jint dstY, jint dstZ, jint srcWidth, jint srcHeight, jint srcDepth) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCopyImageSubDataOES"));
    if (!fn) {
        return;
    }
    fn(srcName, srcTarget, srcLevel, srcX, srcY, srcZ, dstName, dstTarget, dstLevel, dstX, dstY, dstZ, srcWidth, srcHeight, srcDepth);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCopyPathNV(JNIEnv* env, jclass, jint resultPath, jint srcPath) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCopyPathNV"));
    if (!fn) {
        return;
    }
    fn(resultPath, srcPath);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCopyTexImage2D(JNIEnv* env, jclass, jint target, jint level, jint internalformat, jint x, jint y, jint width, jint height, jint border) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCopyTexImage2D"));
    if (!fn) {
        return;
    }
    fn(target, level, internalformat, x, y, width, height, border);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCopyTexSubImage2D(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint x, jint y, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCopyTexSubImage2D"));
    if (!fn) {
        return;
    }
    fn(target, level, xoffset, yoffset, x, y, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCopyTexSubImage3D(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint zoffset, jint x, jint y, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCopyTexSubImage3D"));
    if (!fn) {
        return;
    }
    fn(target, level, xoffset, yoffset, zoffset, x, y, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCopyTexSubImage3DOES(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint zoffset, jint x, jint y, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCopyTexSubImage3DOES"));
    if (!fn) {
        return;
    }
    fn(target, level, xoffset, yoffset, zoffset, x, y, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCopyTextureLevelsAPPLE(JNIEnv* env, jclass, jint destinationTexture, jint sourceTexture, jint sourceBaseLevel, jint sourceLevelCount) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCopyTextureLevelsAPPLE"));
    if (!fn) {
        return;
    }
    fn(destinationTexture, sourceTexture, sourceBaseLevel, sourceLevelCount);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCoverFillPathInstancedNV(JNIEnv* env, jclass, jint numPaths, jint pathNameType, jlong paths, jint pathBase, jint coverMode, jint transformType, jfloatArray transformValues) {
    jfloat* transformValues_elems = env->GetFloatArrayElements(transformValues, nullptr);
    using Fn = void (*)(jint, jint, jlong, jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCoverFillPathInstancedNV"));
    if (!fn) {
        return;
    }
    fn(numPaths, pathNameType, paths, pathBase, coverMode, transformType, reinterpret_cast<jfloat*>(transformValues_elems));
    env->ReleaseFloatArrayElements(transformValues, transformValues_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCoverFillPathNV(JNIEnv* env, jclass, jint path, jint coverMode) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCoverFillPathNV"));
    if (!fn) {
        return;
    }
    fn(path, coverMode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCoverStrokePathInstancedNV(JNIEnv* env, jclass, jint numPaths, jint pathNameType, jlong paths, jint pathBase, jint coverMode, jint transformType, jfloatArray transformValues) {
    jfloat* transformValues_elems = env->GetFloatArrayElements(transformValues, nullptr);
    using Fn = void (*)(jint, jint, jlong, jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCoverStrokePathInstancedNV"));
    if (!fn) {
        return;
    }
    fn(numPaths, pathNameType, paths, pathBase, coverMode, transformType, reinterpret_cast<jfloat*>(transformValues_elems));
    env->ReleaseFloatArrayElements(transformValues, transformValues_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCoverStrokePathNV(JNIEnv* env, jclass, jint path, jint coverMode) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCoverStrokePathNV"));
    if (!fn) {
        return;
    }
    fn(path, coverMode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCoverageMaskNV(JNIEnv* env, jclass, jbyte mask) {
    using Fn = void (*)(jbyte);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCoverageMaskNV"));
    if (!fn) {
        return;
    }
    fn(mask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCoverageModulationNV(JNIEnv* env, jclass, jint components) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCoverageModulationNV"));
    if (!fn) {
        return;
    }
    fn(components);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCoverageModulationTableNV(JNIEnv* env, jclass, jint n, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCoverageModulationTableNV"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCoverageOperationNV(JNIEnv* env, jclass, jint operation) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCoverageOperationNV"));
    if (!fn) {
        return;
    }
    fn(operation);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCreateMemoryObjectsEXT(JNIEnv* env, jclass, jint n, jintArray memoryObjects) {
    jint* memoryObjects_elems = env->GetIntArrayElements(memoryObjects, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCreateMemoryObjectsEXT"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(memoryObjects_elems));
    env->ReleaseIntArrayElements(memoryObjects, memoryObjects_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCreatePerfQueryINTEL(JNIEnv* env, jclass, jint queryId, jintArray queryHandle) {
    jint* queryHandle_elems = env->GetIntArrayElements(queryHandle, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCreatePerfQueryINTEL"));
    if (!fn) {
        return;
    }
    fn(queryId, reinterpret_cast<jint*>(queryHandle_elems));
    env->ReleaseIntArrayElements(queryHandle, queryHandle_elems, 0);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glCreateProgram(JNIEnv* env, jclass) {
    using Fn = jint (*)(void);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCreateProgram"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn();
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCreateSemaphoresNV(JNIEnv* env, jclass, jint n, jintArray semaphores) {
    jint* semaphores_elems = env->GetIntArrayElements(semaphores, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCreateSemaphoresNV"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(semaphores_elems));
    env->ReleaseIntArrayElements(semaphores, semaphores_elems, 0);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glCreateShader(JNIEnv* env, jclass, jint type) {
    using Fn = jint (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCreateShader"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn(type);
    return static_cast<jint>(result);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glCreateShaderProgramvEXT(JNIEnv* env, jclass, jint type, jint count, jbyteArray strings) {
    jbyte* strings_elems = env->GetByteArrayElements(strings, nullptr);
    using Fn = jint (*)(jint, jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCreateShaderProgramvEXT"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn(type, count, reinterpret_cast<jbyte*>(strings_elems));
    env->ReleaseByteArrayElements(strings, strings_elems, 0);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glCullFace(JNIEnv* env, jclass, jint mode) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glCullFace"));
    if (!fn) {
        return;
    }
    fn(mode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDebugMessageCallbackKHR(JNIEnv* env, jclass, jlong callback, jlong userParam) {
    using Fn = void (*)(jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDebugMessageCallbackKHR"));
    if (!fn) {
        return;
    }
    fn(callback, userParam);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDebugMessageControlKHR(JNIEnv* env, jclass, jint source, jint type, jint severity, jint count, jintArray ids, jbyte enabled) {
    jint* ids_elems = env->GetIntArrayElements(ids, nullptr);
    using Fn = void (*)(jint, jint, jint, jint, jint*, jbyte);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDebugMessageControlKHR"));
    if (!fn) {
        return;
    }
    fn(source, type, severity, count, reinterpret_cast<jint*>(ids_elems), enabled);
    env->ReleaseIntArrayElements(ids, ids_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDebugMessageInsertKHR(JNIEnv* env, jclass, jint source, jint type, jint id, jint severity, jint length, jbyteArray buf) {
    jbyte* buf_elems = env->GetByteArrayElements(buf, nullptr);
    using Fn = void (*)(jint, jint, jint, jint, jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDebugMessageInsertKHR"));
    if (!fn) {
        return;
    }
    fn(source, type, id, severity, length, reinterpret_cast<jbyte*>(buf_elems));
    env->ReleaseByteArrayElements(buf, buf_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteBuffers(JNIEnv* env, jclass, jint n, jintArray buffers) {
    jint* buffers_elems = env->GetIntArrayElements(buffers, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDeleteBuffers"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(buffers_elems));
    env->ReleaseIntArrayElements(buffers, buffers_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteFencesNV(JNIEnv* env, jclass, jint n, jintArray fences) {
    jint* fences_elems = env->GetIntArrayElements(fences, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDeleteFencesNV"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(fences_elems));
    env->ReleaseIntArrayElements(fences, fences_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteFramebuffers(JNIEnv* env, jclass, jint n, jintArray framebuffers) {
    jint* framebuffers_elems = env->GetIntArrayElements(framebuffers, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDeleteFramebuffers"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(framebuffers_elems));
    env->ReleaseIntArrayElements(framebuffers, framebuffers_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteMemoryObjectsEXT(JNIEnv* env, jclass, jint n, jintArray memoryObjects) {
    jint* memoryObjects_elems = env->GetIntArrayElements(memoryObjects, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDeleteMemoryObjectsEXT"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(memoryObjects_elems));
    env->ReleaseIntArrayElements(memoryObjects, memoryObjects_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeletePathsNV(JNIEnv* env, jclass, jint path, jint range) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDeletePathsNV"));
    if (!fn) {
        return;
    }
    fn(path, range);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeletePerfMonitorsAMD(JNIEnv* env, jclass, jint n, jintArray monitors) {
    jint* monitors_elems = env->GetIntArrayElements(monitors, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDeletePerfMonitorsAMD"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(monitors_elems));
    env->ReleaseIntArrayElements(monitors, monitors_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeletePerfQueryINTEL(JNIEnv* env, jclass, jint queryHandle) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDeletePerfQueryINTEL"));
    if (!fn) {
        return;
    }
    fn(queryHandle);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteProgram(JNIEnv* env, jclass, jint program) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDeleteProgram"));
    if (!fn) {
        return;
    }
    fn(program);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteProgramPipelinesEXT(JNIEnv* env, jclass, jint n, jintArray pipelines) {
    jint* pipelines_elems = env->GetIntArrayElements(pipelines, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDeleteProgramPipelinesEXT"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(pipelines_elems));
    env->ReleaseIntArrayElements(pipelines, pipelines_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteQueries(JNIEnv* env, jclass, jint n, jintArray ids) {
    jint* ids_elems = env->GetIntArrayElements(ids, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDeleteQueries"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(ids_elems));
    env->ReleaseIntArrayElements(ids, ids_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteQueriesEXT(JNIEnv* env, jclass, jint n, jintArray ids) {
    jint* ids_elems = env->GetIntArrayElements(ids, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDeleteQueriesEXT"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(ids_elems));
    env->ReleaseIntArrayElements(ids, ids_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteRenderbuffers(JNIEnv* env, jclass, jint n, jintArray renderbuffers) {
    jint* renderbuffers_elems = env->GetIntArrayElements(renderbuffers, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDeleteRenderbuffers"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(renderbuffers_elems));
    env->ReleaseIntArrayElements(renderbuffers, renderbuffers_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteSamplers(JNIEnv* env, jclass, jint count, jintArray samplers) {
    jint* samplers_elems = env->GetIntArrayElements(samplers, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDeleteSamplers"));
    if (!fn) {
        return;
    }
    fn(count, reinterpret_cast<jint*>(samplers_elems));
    env->ReleaseIntArrayElements(samplers, samplers_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteSemaphoresEXT(JNIEnv* env, jclass, jint n, jintArray semaphores) {
    jint* semaphores_elems = env->GetIntArrayElements(semaphores, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDeleteSemaphoresEXT"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(semaphores_elems));
    env->ReleaseIntArrayElements(semaphores, semaphores_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteShader(JNIEnv* env, jclass, jint shader) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDeleteShader"));
    if (!fn) {
        return;
    }
    fn(shader);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteSync(JNIEnv* env, jclass, jlong sync) {
    using Fn = void (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDeleteSync"));
    if (!fn) {
        return;
    }
    fn(sync);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteSyncAPPLE(JNIEnv* env, jclass, jlong sync) {
    using Fn = void (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDeleteSyncAPPLE"));
    if (!fn) {
        return;
    }
    fn(sync);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteTextures(JNIEnv* env, jclass, jint n, jintArray textures) {
    jint* textures_elems = env->GetIntArrayElements(textures, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDeleteTextures"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(textures_elems));
    env->ReleaseIntArrayElements(textures, textures_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteTransformFeedbacks(JNIEnv* env, jclass, jint n, jintArray ids) {
    jint* ids_elems = env->GetIntArrayElements(ids, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDeleteTransformFeedbacks"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(ids_elems));
    env->ReleaseIntArrayElements(ids, ids_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteVertexArrays(JNIEnv* env, jclass, jint n, jintArray arrays) {
    jint* arrays_elems = env->GetIntArrayElements(arrays, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDeleteVertexArrays"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(arrays_elems));
    env->ReleaseIntArrayElements(arrays, arrays_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDeleteVertexArraysOES(JNIEnv* env, jclass, jint n, jintArray arrays) {
    jint* arrays_elems = env->GetIntArrayElements(arrays, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDeleteVertexArraysOES"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(arrays_elems));
    env->ReleaseIntArrayElements(arrays, arrays_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDepthFunc(JNIEnv* env, jclass, jint func) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDepthFunc"));
    if (!fn) {
        return;
    }
    fn(func);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDepthMask(JNIEnv* env, jclass, jbyte flag) {
    using Fn = void (*)(jbyte);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDepthMask"));
    if (!fn) {
        return;
    }
    fn(flag);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDepthRangeArrayfvNV(JNIEnv* env, jclass, jint first, jint count, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDepthRangeArrayfvNV"));
    if (!fn) {
        return;
    }
    fn(first, count, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDepthRangeArrayfvOES(JNIEnv* env, jclass, jint first, jint count, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDepthRangeArrayfvOES"));
    if (!fn) {
        return;
    }
    fn(first, count, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDepthRangeIndexedfNV(JNIEnv* env, jclass, jint index, jfloat n, jfloat f) {
    using Fn = void (*)(jint, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDepthRangeIndexedfNV"));
    if (!fn) {
        return;
    }
    fn(index, n, f);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDepthRangeIndexedfOES(JNIEnv* env, jclass, jint index, jfloat n, jfloat f) {
    using Fn = void (*)(jint, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDepthRangeIndexedfOES"));
    if (!fn) {
        return;
    }
    fn(index, n, f);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDepthRangef(JNIEnv* env, jclass, jfloat n, jfloat f) {
    using Fn = void (*)(jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDepthRangef"));
    if (!fn) {
        return;
    }
    fn(n, f);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDetachShader(JNIEnv* env, jclass, jint program, jint shader) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDetachShader"));
    if (!fn) {
        return;
    }
    fn(program, shader);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDisable(JNIEnv* env, jclass, jint cap) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDisable"));
    if (!fn) {
        return;
    }
    fn(cap);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDisableDriverControlQCOM(JNIEnv* env, jclass, jint driverControl) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDisableDriverControlQCOM"));
    if (!fn) {
        return;
    }
    fn(driverControl);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDisableVertexAttribArray(JNIEnv* env, jclass, jint index) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDisableVertexAttribArray"));
    if (!fn) {
        return;
    }
    fn(index);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDisableiEXT(JNIEnv* env, jclass, jint target, jint index) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDisableiEXT"));
    if (!fn) {
        return;
    }
    fn(target, index);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDisableiNV(JNIEnv* env, jclass, jint target, jint index) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDisableiNV"));
    if (!fn) {
        return;
    }
    fn(target, index);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDisableiOES(JNIEnv* env, jclass, jint target, jint index) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDisableiOES"));
    if (!fn) {
        return;
    }
    fn(target, index);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDiscardFramebufferEXT(JNIEnv* env, jclass, jint target, jint numAttachments, jintArray attachments) {
    jint* attachments_elems = env->GetIntArrayElements(attachments, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDiscardFramebufferEXT"));
    if (!fn) {
        return;
    }
    fn(target, numAttachments, reinterpret_cast<jint*>(attachments_elems));
    env->ReleaseIntArrayElements(attachments, attachments_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawArrays(JNIEnv* env, jclass, jint mode, jint first, jint count) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawArrays"));
    if (!fn) {
        return;
    }
    fn(mode, first, count);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawArraysInstanced(JNIEnv* env, jclass, jint mode, jint first, jint count, jint instancecount) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawArraysInstanced"));
    if (!fn) {
        return;
    }
    fn(mode, first, count, instancecount);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawArraysInstancedANGLE(JNIEnv* env, jclass, jint mode, jint first, jint count, jint primcount) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawArraysInstancedANGLE"));
    if (!fn) {
        return;
    }
    fn(mode, first, count, primcount);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawArraysInstancedBaseInstanceEXT(JNIEnv* env, jclass, jint mode, jint first, jint count, jint instancecount, jint baseinstance) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawArraysInstancedBaseInstanceEXT"));
    if (!fn) {
        return;
    }
    fn(mode, first, count, instancecount, baseinstance);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawArraysInstancedEXT(JNIEnv* env, jclass, jint mode, jint start, jint count, jint primcount) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawArraysInstancedEXT"));
    if (!fn) {
        return;
    }
    fn(mode, start, count, primcount);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawArraysInstancedNV(JNIEnv* env, jclass, jint mode, jint first, jint count, jint primcount) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawArraysInstancedNV"));
    if (!fn) {
        return;
    }
    fn(mode, first, count, primcount);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawBuffers(JNIEnv* env, jclass, jint n, jintArray bufs) {
    jint* bufs_elems = env->GetIntArrayElements(bufs, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawBuffers"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(bufs_elems));
    env->ReleaseIntArrayElements(bufs, bufs_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawBuffersEXT(JNIEnv* env, jclass, jint n, jintArray bufs) {
    jint* bufs_elems = env->GetIntArrayElements(bufs, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawBuffersEXT"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(bufs_elems));
    env->ReleaseIntArrayElements(bufs, bufs_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawBuffersIndexedEXT(JNIEnv* env, jclass, jint n, jintArray location, jintArray indices) {
    jint* location_elems = env->GetIntArrayElements(location, nullptr);
    jint* indices_elems = env->GetIntArrayElements(indices, nullptr);
    using Fn = void (*)(jint, jint*, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawBuffersIndexedEXT"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(location_elems), reinterpret_cast<jint*>(indices_elems));
    env->ReleaseIntArrayElements(indices, indices_elems, 0);
    env->ReleaseIntArrayElements(location, location_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawBuffersNV(JNIEnv* env, jclass, jint n, jintArray bufs) {
    jint* bufs_elems = env->GetIntArrayElements(bufs, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawBuffersNV"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(bufs_elems));
    env->ReleaseIntArrayElements(bufs, bufs_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawElements(JNIEnv* env, jclass, jint mode, jint count, jint type, jlong indices) {
    using Fn = void (*)(jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawElements"));
    if (!fn) {
        return;
    }
    fn(mode, count, type, indices);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawElementsBaseVertexEXT(JNIEnv* env, jclass, jint mode, jint count, jint type, jlong indices, jint basevertex) {
    using Fn = void (*)(jint, jint, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawElementsBaseVertexEXT"));
    if (!fn) {
        return;
    }
    fn(mode, count, type, indices, basevertex);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawElementsBaseVertexOES(JNIEnv* env, jclass, jint mode, jint count, jint type, jlong indices, jint basevertex) {
    using Fn = void (*)(jint, jint, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawElementsBaseVertexOES"));
    if (!fn) {
        return;
    }
    fn(mode, count, type, indices, basevertex);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawElementsInstanced(JNIEnv* env, jclass, jint mode, jint count, jint type, jlong indices, jint instancecount) {
    using Fn = void (*)(jint, jint, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawElementsInstanced"));
    if (!fn) {
        return;
    }
    fn(mode, count, type, indices, instancecount);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawElementsInstancedANGLE(JNIEnv* env, jclass, jint mode, jint count, jint type, jlong indices, jint primcount) {
    using Fn = void (*)(jint, jint, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawElementsInstancedANGLE"));
    if (!fn) {
        return;
    }
    fn(mode, count, type, indices, primcount);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawElementsInstancedBaseInstanceEXT(JNIEnv* env, jclass, jint mode, jint count, jint type, jlong indices, jint instancecount, jint baseinstance) {
    using Fn = void (*)(jint, jint, jint, jlong, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawElementsInstancedBaseInstanceEXT"));
    if (!fn) {
        return;
    }
    fn(mode, count, type, indices, instancecount, baseinstance);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawElementsInstancedBaseVertexBaseInstanceEXT(JNIEnv* env, jclass, jint mode, jint count, jint type, jlong indices, jint instancecount, jint basevertex, jint baseinstance) {
    using Fn = void (*)(jint, jint, jint, jlong, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawElementsInstancedBaseVertexBaseInstanceEXT"));
    if (!fn) {
        return;
    }
    fn(mode, count, type, indices, instancecount, basevertex, baseinstance);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawElementsInstancedBaseVertexEXT(JNIEnv* env, jclass, jint mode, jint count, jint type, jlong indices, jint instancecount, jint basevertex) {
    using Fn = void (*)(jint, jint, jint, jlong, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawElementsInstancedBaseVertexEXT"));
    if (!fn) {
        return;
    }
    fn(mode, count, type, indices, instancecount, basevertex);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawElementsInstancedBaseVertexOES(JNIEnv* env, jclass, jint mode, jint count, jint type, jlong indices, jint instancecount, jint basevertex) {
    using Fn = void (*)(jint, jint, jint, jlong, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawElementsInstancedBaseVertexOES"));
    if (!fn) {
        return;
    }
    fn(mode, count, type, indices, instancecount, basevertex);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawElementsInstancedEXT(JNIEnv* env, jclass, jint mode, jint count, jint type, jlong indices, jint primcount) {
    using Fn = void (*)(jint, jint, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawElementsInstancedEXT"));
    if (!fn) {
        return;
    }
    fn(mode, count, type, indices, primcount);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawElementsInstancedNV(JNIEnv* env, jclass, jint mode, jint count, jint type, jlong indices, jint primcount) {
    using Fn = void (*)(jint, jint, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawElementsInstancedNV"));
    if (!fn) {
        return;
    }
    fn(mode, count, type, indices, primcount);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawMeshTasksIndirectNV(JNIEnv* env, jclass, jlong indirect) {
    using Fn = void (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawMeshTasksIndirectNV"));
    if (!fn) {
        return;
    }
    fn(indirect);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawMeshTasksNV(JNIEnv* env, jclass, jint first, jint count) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawMeshTasksNV"));
    if (!fn) {
        return;
    }
    fn(first, count);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawRangeElements(JNIEnv* env, jclass, jint mode, jint start, jint end, jint count, jint type, jlong indices) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawRangeElements"));
    if (!fn) {
        return;
    }
    fn(mode, start, end, count, type, indices);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawRangeElementsBaseVertexEXT(JNIEnv* env, jclass, jint mode, jint start, jint end, jint count, jint type, jlong indices, jint basevertex) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawRangeElementsBaseVertexEXT"));
    if (!fn) {
        return;
    }
    fn(mode, start, end, count, type, indices, basevertex);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawRangeElementsBaseVertexOES(JNIEnv* env, jclass, jint mode, jint start, jint end, jint count, jint type, jlong indices, jint basevertex) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawRangeElementsBaseVertexOES"));
    if (!fn) {
        return;
    }
    fn(mode, start, end, count, type, indices, basevertex);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawTransformFeedbackEXT(JNIEnv* env, jclass, jint mode, jint id) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawTransformFeedbackEXT"));
    if (!fn) {
        return;
    }
    fn(mode, id);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawTransformFeedbackInstancedEXT(JNIEnv* env, jclass, jint mode, jint id, jint instancecount) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawTransformFeedbackInstancedEXT"));
    if (!fn) {
        return;
    }
    fn(mode, id, instancecount);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glDrawVkImageNV(JNIEnv* env, jclass, jlong vkImage, jint sampler, jfloat x0, jfloat y0, jfloat x1, jfloat y1, jfloat z, jfloat s0, jfloat t0, jfloat s1, jfloat t1) {
    using Fn = void (*)(jlong, jint, jfloat, jfloat, jfloat, jfloat, jfloat, jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glDrawVkImageNV"));
    if (!fn) {
        return;
    }
    fn(vkImage, sampler, x0, y0, x1, y1, z, s0, t0, s1, t1);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEGLImageTargetRenderbufferStorageOES(JNIEnv* env, jclass, jint target, jlong image) {
    using Fn = void (*)(jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glEGLImageTargetRenderbufferStorageOES"));
    if (!fn) {
        return;
    }
    fn(target, image);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEGLImageTargetTexStorageEXT(JNIEnv* env, jclass, jint target, jlong image, jintArray attrib_list) {
    jint* attrib_list_elems = env->GetIntArrayElements(attrib_list, nullptr);
    using Fn = void (*)(jint, jlong, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glEGLImageTargetTexStorageEXT"));
    if (!fn) {
        return;
    }
    fn(target, image, reinterpret_cast<jint*>(attrib_list_elems));
    env->ReleaseIntArrayElements(attrib_list, attrib_list_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEGLImageTargetTexture2DOES(JNIEnv* env, jclass, jint target, jlong image) {
    using Fn = void (*)(jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glEGLImageTargetTexture2DOES"));
    if (!fn) {
        return;
    }
    fn(target, image);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEGLImageTargetTextureStorageEXT(JNIEnv* env, jclass, jint texture, jlong image, jintArray attrib_list) {
    jint* attrib_list_elems = env->GetIntArrayElements(attrib_list, nullptr);
    using Fn = void (*)(jint, jlong, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glEGLImageTargetTextureStorageEXT"));
    if (!fn) {
        return;
    }
    fn(texture, image, reinterpret_cast<jint*>(attrib_list_elems));
    env->ReleaseIntArrayElements(attrib_list, attrib_list_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEnable(JNIEnv* env, jclass, jint cap) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glEnable"));
    if (!fn) {
        return;
    }
    fn(cap);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEnableDriverControlQCOM(JNIEnv* env, jclass, jint driverControl) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glEnableDriverControlQCOM"));
    if (!fn) {
        return;
    }
    fn(driverControl);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEnableVertexAttribArray(JNIEnv* env, jclass, jint index) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glEnableVertexAttribArray"));
    if (!fn) {
        return;
    }
    fn(index);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEnableiEXT(JNIEnv* env, jclass, jint target, jint index) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glEnableiEXT"));
    if (!fn) {
        return;
    }
    fn(target, index);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEnableiNV(JNIEnv* env, jclass, jint target, jint index) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glEnableiNV"));
    if (!fn) {
        return;
    }
    fn(target, index);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEnableiOES(JNIEnv* env, jclass, jint target, jint index) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glEnableiOES"));
    if (!fn) {
        return;
    }
    fn(target, index);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEndConditionalRenderNV(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glEndConditionalRenderNV"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEndPerfMonitorAMD(JNIEnv* env, jclass, jint monitor) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glEndPerfMonitorAMD"));
    if (!fn) {
        return;
    }
    fn(monitor);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEndPerfQueryINTEL(JNIEnv* env, jclass, jint queryHandle) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glEndPerfQueryINTEL"));
    if (!fn) {
        return;
    }
    fn(queryHandle);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEndQuery(JNIEnv* env, jclass, jint target) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glEndQuery"));
    if (!fn) {
        return;
    }
    fn(target);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEndQueryEXT(JNIEnv* env, jclass, jint target) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glEndQueryEXT"));
    if (!fn) {
        return;
    }
    fn(target);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEndTilingQCOM(JNIEnv* env, jclass, jint preserveMask) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glEndTilingQCOM"));
    if (!fn) {
        return;
    }
    fn(preserveMask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glEndTransformFeedback(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glEndTransformFeedback"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glExtGetBufferPointervQCOM(JNIEnv* env, jclass, jint target, jlong params) {
    using Fn = void (*)(jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glExtGetBufferPointervQCOM"));
    if (!fn) {
        return;
    }
    fn(target, params);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glExtGetBuffersQCOM(JNIEnv* env, jclass, jintArray buffers, jint maxBuffers, jintArray numBuffers) {
    jint* buffers_elems = env->GetIntArrayElements(buffers, nullptr);
    jint* numBuffers_elems = env->GetIntArrayElements(numBuffers, nullptr);
    using Fn = void (*)(jint*, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glExtGetBuffersQCOM"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glExtGetFramebuffersQCOM"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glExtGetProgramBinarySourceQCOM"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glExtGetProgramsQCOM"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glExtGetRenderbuffersQCOM"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glExtGetShadersQCOM"));
    if (!fn) {
        return;
    }
    fn(reinterpret_cast<jint*>(shaders_elems), maxShaders, reinterpret_cast<jint*>(numShaders_elems));
    env->ReleaseIntArrayElements(numShaders, numShaders_elems, 0);
    env->ReleaseIntArrayElements(shaders, shaders_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glExtGetTexLevelParameterivQCOM(JNIEnv* env, jclass, jint texture, jint face, jint level, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glExtGetTexLevelParameterivQCOM"));
    if (!fn) {
        return;
    }
    fn(texture, face, level, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glExtGetTexSubImageQCOM(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint zoffset, jint width, jint height, jint depth, jint format, jint type, jlong texels) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glExtGetTexSubImageQCOM"));
    if (!fn) {
        return;
    }
    fn(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, texels);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glExtGetTexturesQCOM(JNIEnv* env, jclass, jintArray textures, jint maxTextures, jintArray numTextures) {
    jint* textures_elems = env->GetIntArrayElements(textures, nullptr);
    jint* numTextures_elems = env->GetIntArrayElements(numTextures, nullptr);
    using Fn = void (*)(jint*, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glExtGetTexturesQCOM"));
    if (!fn) {
        return;
    }
    fn(reinterpret_cast<jint*>(textures_elems), maxTextures, reinterpret_cast<jint*>(numTextures_elems));
    env->ReleaseIntArrayElements(numTextures, numTextures_elems, 0);
    env->ReleaseIntArrayElements(textures, textures_elems, 0);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glExtIsProgramBinaryQCOM(JNIEnv* env, jclass, jint program) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glExtIsProgramBinaryQCOM"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(program);
    return static_cast<jbyte>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glExtTexObjectStateOverrideiQCOM(JNIEnv* env, jclass, jint target, jint pname, jint param) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glExtTexObjectStateOverrideiQCOM"));
    if (!fn) {
        return;
    }
    fn(target, pname, param);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glExtrapolateTex2DQCOM(JNIEnv* env, jclass, jint src1, jint src2, jint output, jfloat scaleFactor) {
    using Fn = void (*)(jint, jint, jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glExtrapolateTex2DQCOM"));
    if (!fn) {
        return;
    }
    fn(src1, src2, output, scaleFactor);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_gles_GLES_glFenceSync(JNIEnv* env, jclass, jint condition, jint flags) {
    using Fn = jlong (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFenceSync"));
    if (!fn) {
        return static_cast<jlong>(0);
    }
    auto result = fn(condition, flags);
    return static_cast<jlong>(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_gles_GLES_glFenceSyncAPPLE(JNIEnv* env, jclass, jint condition, jint flags) {
    using Fn = jlong (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFenceSyncAPPLE"));
    if (!fn) {
        return static_cast<jlong>(0);
    }
    auto result = fn(condition, flags);
    return static_cast<jlong>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFinish(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFinish"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFinishFenceNV(JNIEnv* env, jclass, jint fence) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFinishFenceNV"));
    if (!fn) {
        return;
    }
    fn(fence);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFlush(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFlush"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFlushMappedBufferRange(JNIEnv* env, jclass, jint target, jlong offset, jlong length) {
    using Fn = void (*)(jint, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFlushMappedBufferRange"));
    if (!fn) {
        return;
    }
    fn(target, offset, length);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFlushMappedBufferRangeEXT(JNIEnv* env, jclass, jint target, jlong offset, jlong length) {
    using Fn = void (*)(jint, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFlushMappedBufferRangeEXT"));
    if (!fn) {
        return;
    }
    fn(target, offset, length);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFragmentCoverageColorNV(JNIEnv* env, jclass, jint color) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFragmentCoverageColorNV"));
    if (!fn) {
        return;
    }
    fn(color);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferFetchBarrierEXT(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFramebufferFetchBarrierEXT"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferFetchBarrierQCOM(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFramebufferFetchBarrierQCOM"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferFoveationConfigQCOM(JNIEnv* env, jclass, jint framebuffer, jint numLayers, jint focalPointsPerLayer, jint requestedFeatures, jintArray providedFeatures) {
    jint* providedFeatures_elems = env->GetIntArrayElements(providedFeatures, nullptr);
    using Fn = void (*)(jint, jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFramebufferFoveationConfigQCOM"));
    if (!fn) {
        return;
    }
    fn(framebuffer, numLayers, focalPointsPerLayer, requestedFeatures, reinterpret_cast<jint*>(providedFeatures_elems));
    env->ReleaseIntArrayElements(providedFeatures, providedFeatures_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferFoveationParametersQCOM(JNIEnv* env, jclass, jint framebuffer, jint layer, jint focalPoint, jfloat focalX, jfloat focalY, jfloat gainX, jfloat gainY, jfloat foveaArea) {
    using Fn = void (*)(jint, jint, jint, jfloat, jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFramebufferFoveationParametersQCOM"));
    if (!fn) {
        return;
    }
    fn(framebuffer, layer, focalPoint, focalX, focalY, gainX, gainY, foveaArea);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferParameteriMESA(JNIEnv* env, jclass, jint target, jint pname, jint param) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFramebufferParameteriMESA"));
    if (!fn) {
        return;
    }
    fn(target, pname, param);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferPixelLocalStorageSizeEXT(JNIEnv* env, jclass, jint target, jint size) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFramebufferPixelLocalStorageSizeEXT"));
    if (!fn) {
        return;
    }
    fn(target, size);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferRenderbuffer(JNIEnv* env, jclass, jint target, jint attachment, jint renderbuffertarget, jint renderbuffer) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFramebufferRenderbuffer"));
    if (!fn) {
        return;
    }
    fn(target, attachment, renderbuffertarget, renderbuffer);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferSampleLocationsfvNV(JNIEnv* env, jclass, jint target, jint start, jint count, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFramebufferSampleLocationsfvNV"));
    if (!fn) {
        return;
    }
    fn(target, start, count, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferTexture2D(JNIEnv* env, jclass, jint target, jint attachment, jint textarget, jint texture, jint level) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFramebufferTexture2D"));
    if (!fn) {
        return;
    }
    fn(target, attachment, textarget, texture, level);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferTexture2DDownsampleIMG(JNIEnv* env, jclass, jint target, jint attachment, jint textarget, jint texture, jint level, jint xscale, jint yscale) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFramebufferTexture2DDownsampleIMG"));
    if (!fn) {
        return;
    }
    fn(target, attachment, textarget, texture, level, xscale, yscale);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferTexture2DMultisampleEXT(JNIEnv* env, jclass, jint target, jint attachment, jint textarget, jint texture, jint level, jint samples) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFramebufferTexture2DMultisampleEXT"));
    if (!fn) {
        return;
    }
    fn(target, attachment, textarget, texture, level, samples);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferTexture2DMultisampleIMG(JNIEnv* env, jclass, jint target, jint attachment, jint textarget, jint texture, jint level, jint samples) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFramebufferTexture2DMultisampleIMG"));
    if (!fn) {
        return;
    }
    fn(target, attachment, textarget, texture, level, samples);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferTexture3DOES(JNIEnv* env, jclass, jint target, jint attachment, jint textarget, jint texture, jint level, jint zoffset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFramebufferTexture3DOES"));
    if (!fn) {
        return;
    }
    fn(target, attachment, textarget, texture, level, zoffset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferTextureEXT(JNIEnv* env, jclass, jint target, jint attachment, jint texture, jint level) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFramebufferTextureEXT"));
    if (!fn) {
        return;
    }
    fn(target, attachment, texture, level);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferTextureLayer(JNIEnv* env, jclass, jint target, jint attachment, jint texture, jint level, jint layer) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFramebufferTextureLayer"));
    if (!fn) {
        return;
    }
    fn(target, attachment, texture, level, layer);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferTextureLayerDownsampleIMG(JNIEnv* env, jclass, jint target, jint attachment, jint texture, jint level, jint layer, jint xscale, jint yscale) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFramebufferTextureLayerDownsampleIMG"));
    if (!fn) {
        return;
    }
    fn(target, attachment, texture, level, layer, xscale, yscale);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferTextureMultisampleMultiviewOVR(JNIEnv* env, jclass, jint target, jint attachment, jint texture, jint level, jint samples, jint baseViewIndex, jint numViews) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFramebufferTextureMultisampleMultiviewOVR"));
    if (!fn) {
        return;
    }
    fn(target, attachment, texture, level, samples, baseViewIndex, numViews);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferTextureMultiviewOVR(JNIEnv* env, jclass, jint target, jint attachment, jint texture, jint level, jint baseViewIndex, jint numViews) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFramebufferTextureMultiviewOVR"));
    if (!fn) {
        return;
    }
    fn(target, attachment, texture, level, baseViewIndex, numViews);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFramebufferTextureOES(JNIEnv* env, jclass, jint target, jint attachment, jint texture, jint level) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFramebufferTextureOES"));
    if (!fn) {
        return;
    }
    fn(target, attachment, texture, level);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glFrontFace(JNIEnv* env, jclass, jint mode) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glFrontFace"));
    if (!fn) {
        return;
    }
    fn(mode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenBuffers(JNIEnv* env, jclass, jint n, jintArray buffers) {
    jint* buffers_elems = env->GetIntArrayElements(buffers, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGenBuffers"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(buffers_elems));
    env->ReleaseIntArrayElements(buffers, buffers_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenFencesNV(JNIEnv* env, jclass, jint n, jintArray fences) {
    jint* fences_elems = env->GetIntArrayElements(fences, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGenFencesNV"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(fences_elems));
    env->ReleaseIntArrayElements(fences, fences_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenFramebuffers(JNIEnv* env, jclass, jint n, jintArray framebuffers) {
    jint* framebuffers_elems = env->GetIntArrayElements(framebuffers, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGenFramebuffers"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(framebuffers_elems));
    env->ReleaseIntArrayElements(framebuffers, framebuffers_elems, 0);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenPathsNV(JNIEnv* env, jclass, jint range) {
    using Fn = jint (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGenPathsNV"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn(range);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenPerfMonitorsAMD(JNIEnv* env, jclass, jint n, jintArray monitors) {
    jint* monitors_elems = env->GetIntArrayElements(monitors, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGenPerfMonitorsAMD"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(monitors_elems));
    env->ReleaseIntArrayElements(monitors, monitors_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenProgramPipelinesEXT(JNIEnv* env, jclass, jint n, jintArray pipelines) {
    jint* pipelines_elems = env->GetIntArrayElements(pipelines, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGenProgramPipelinesEXT"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(pipelines_elems));
    env->ReleaseIntArrayElements(pipelines, pipelines_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenQueries(JNIEnv* env, jclass, jint n, jintArray ids) {
    jint* ids_elems = env->GetIntArrayElements(ids, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGenQueries"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(ids_elems));
    env->ReleaseIntArrayElements(ids, ids_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenQueriesEXT(JNIEnv* env, jclass, jint n, jintArray ids) {
    jint* ids_elems = env->GetIntArrayElements(ids, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGenQueriesEXT"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(ids_elems));
    env->ReleaseIntArrayElements(ids, ids_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenRenderbuffers(JNIEnv* env, jclass, jint n, jintArray renderbuffers) {
    jint* renderbuffers_elems = env->GetIntArrayElements(renderbuffers, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGenRenderbuffers"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(renderbuffers_elems));
    env->ReleaseIntArrayElements(renderbuffers, renderbuffers_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenSamplers(JNIEnv* env, jclass, jint count, jintArray samplers) {
    jint* samplers_elems = env->GetIntArrayElements(samplers, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGenSamplers"));
    if (!fn) {
        return;
    }
    fn(count, reinterpret_cast<jint*>(samplers_elems));
    env->ReleaseIntArrayElements(samplers, samplers_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenSemaphoresEXT(JNIEnv* env, jclass, jint n, jintArray semaphores) {
    jint* semaphores_elems = env->GetIntArrayElements(semaphores, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGenSemaphoresEXT"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(semaphores_elems));
    env->ReleaseIntArrayElements(semaphores, semaphores_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenTextures(JNIEnv* env, jclass, jint n, jintArray textures) {
    jint* textures_elems = env->GetIntArrayElements(textures, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGenTextures"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(textures_elems));
    env->ReleaseIntArrayElements(textures, textures_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenTransformFeedbacks(JNIEnv* env, jclass, jint n, jintArray ids) {
    jint* ids_elems = env->GetIntArrayElements(ids, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGenTransformFeedbacks"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(ids_elems));
    env->ReleaseIntArrayElements(ids, ids_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenVertexArrays(JNIEnv* env, jclass, jint n, jintArray arrays) {
    jint* arrays_elems = env->GetIntArrayElements(arrays, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGenVertexArrays"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(arrays_elems));
    env->ReleaseIntArrayElements(arrays, arrays_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenVertexArraysOES(JNIEnv* env, jclass, jint n, jintArray arrays) {
    jint* arrays_elems = env->GetIntArrayElements(arrays, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGenVertexArraysOES"));
    if (!fn) {
        return;
    }
    fn(n, reinterpret_cast<jint*>(arrays_elems));
    env->ReleaseIntArrayElements(arrays, arrays_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGenerateMipmap(JNIEnv* env, jclass, jint target) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGenerateMipmap"));
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetActiveAttrib"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetActiveUniform"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetActiveUniformBlockName"));
    if (!fn) {
        return;
    }
    fn(program, uniformBlockIndex, bufSize, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jbyte*>(uniformBlockName_elems));
    env->ReleaseByteArrayElements(uniformBlockName, uniformBlockName_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetActiveUniformBlockiv(JNIEnv* env, jclass, jint program, jint uniformBlockIndex, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetActiveUniformBlockiv"));
    if (!fn) {
        return;
    }
    fn(program, uniformBlockIndex, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetActiveUniformsiv(JNIEnv* env, jclass, jint program, jint uniformCount, jintArray uniformIndices, jint pname, jintArray params) {
    jint* uniformIndices_elems = env->GetIntArrayElements(uniformIndices, nullptr);
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetActiveUniformsiv"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetAttachedShaders"));
    if (!fn) {
        return;
    }
    fn(program, maxCount, reinterpret_cast<jint*>(count_elems), reinterpret_cast<jint*>(shaders_elems));
    env->ReleaseIntArrayElements(shaders, shaders_elems, 0);
    env->ReleaseIntArrayElements(count, count_elems, 0);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetAttribLocation(JNIEnv* env, jclass, jint program, jbyteArray name) {
    jbyte* name_elems = env->GetByteArrayElements(name, nullptr);
    using Fn = jint (*)(jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetAttribLocation"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn(program, reinterpret_cast<jbyte*>(name_elems));
    env->ReleaseByteArrayElements(name, name_elems, 0);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetBooleanv(JNIEnv* env, jclass, jint pname, jbyteArray data) {
    jbyte* data_elems = env->GetByteArrayElements(data, nullptr);
    using Fn = void (*)(jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetBooleanv"));
    if (!fn) {
        return;
    }
    fn(pname, reinterpret_cast<jbyte*>(data_elems));
    env->ReleaseByteArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetBufferParameteri64v(JNIEnv* env, jclass, jint target, jint pname, jlongArray params) {
    jlong* params_elems = env->GetLongArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetBufferParameteri64v"));
    if (!fn) {
        return;
    }
    fn(target, pname, reinterpret_cast<jlong*>(params_elems));
    env->ReleaseLongArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetBufferParameteriv(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetBufferParameteriv"));
    if (!fn) {
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetBufferPointerv(JNIEnv* env, jclass, jint target, jint pname, jlong params) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetBufferPointerv"));
    if (!fn) {
        return;
    }
    fn(target, pname, params);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetBufferPointervOES(JNIEnv* env, jclass, jint target, jint pname, jlong params) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetBufferPointervOES"));
    if (!fn) {
        return;
    }
    fn(target, pname, params);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetCoverageModulationTableNV(JNIEnv* env, jclass, jint bufSize, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetCoverageModulationTableNV"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetDebugMessageLogKHR"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetDriverControlStringQCOM"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetDriverControlsQCOM"));
    if (!fn) {
        return;
    }
    fn(reinterpret_cast<jint*>(num_elems), size, reinterpret_cast<jint*>(driverControls_elems));
    env->ReleaseIntArrayElements(driverControls, driverControls_elems, 0);
    env->ReleaseIntArrayElements(num, num_elems, 0);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetError(JNIEnv* env, jclass) {
    using Fn = jint (*)(void);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetError"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn();
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetFenceivNV(JNIEnv* env, jclass, jint fence, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetFenceivNV"));
    if (!fn) {
        return;
    }
    fn(fence, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetFirstPerfQueryIdINTEL(JNIEnv* env, jclass, jintArray queryId) {
    jint* queryId_elems = env->GetIntArrayElements(queryId, nullptr);
    using Fn = void (*)(jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetFirstPerfQueryIdINTEL"));
    if (!fn) {
        return;
    }
    fn(reinterpret_cast<jint*>(queryId_elems));
    env->ReleaseIntArrayElements(queryId, queryId_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetFloati_1vNV(JNIEnv* env, jclass, jint target, jint index, jfloatArray data) {
    jfloat* data_elems = env->GetFloatArrayElements(data, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetFloati_vNV"));
    if (!fn) {
        return;
    }
    fn(target, index, reinterpret_cast<jfloat*>(data_elems));
    env->ReleaseFloatArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetFloati_1vOES(JNIEnv* env, jclass, jint target, jint index, jfloatArray data) {
    jfloat* data_elems = env->GetFloatArrayElements(data, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetFloati_vOES"));
    if (!fn) {
        return;
    }
    fn(target, index, reinterpret_cast<jfloat*>(data_elems));
    env->ReleaseFloatArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetFloatv(JNIEnv* env, jclass, jint pname, jfloatArray data) {
    jfloat* data_elems = env->GetFloatArrayElements(data, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetFloatv"));
    if (!fn) {
        return;
    }
    fn(pname, reinterpret_cast<jfloat*>(data_elems));
    env->ReleaseFloatArrayElements(data, data_elems, 0);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetFragDataIndexEXT(JNIEnv* env, jclass, jint program, jbyteArray name) {
    jbyte* name_elems = env->GetByteArrayElements(name, nullptr);
    using Fn = jint (*)(jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetFragDataIndexEXT"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn(program, reinterpret_cast<jbyte*>(name_elems));
    env->ReleaseByteArrayElements(name, name_elems, 0);
    return static_cast<jint>(result);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetFragDataLocation(JNIEnv* env, jclass, jint program, jbyteArray name) {
    jbyte* name_elems = env->GetByteArrayElements(name, nullptr);
    using Fn = jint (*)(jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetFragDataLocation"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn(program, reinterpret_cast<jbyte*>(name_elems));
    env->ReleaseByteArrayElements(name, name_elems, 0);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetFramebufferAttachmentParameteriv(JNIEnv* env, jclass, jint target, jint attachment, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetFramebufferAttachmentParameteriv"));
    if (!fn) {
        return;
    }
    fn(target, attachment, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetFramebufferParameterivMESA(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetFramebufferParameterivMESA"));
    if (!fn) {
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetFramebufferPixelLocalStorageSizeEXT(JNIEnv* env, jclass, jint target) {
    using Fn = jint (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetFramebufferPixelLocalStorageSizeEXT"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn(target);
    return static_cast<jint>(result);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetGraphicsResetStatusEXT(JNIEnv* env, jclass) {
    using Fn = jint (*)(void);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetGraphicsResetStatusEXT"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn();
    return static_cast<jint>(result);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetGraphicsResetStatusKHR(JNIEnv* env, jclass) {
    using Fn = jint (*)(void);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetGraphicsResetStatusKHR"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn();
    return static_cast<jint>(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetImageHandleNV(JNIEnv* env, jclass, jint texture, jint level, jbyte layered, jint layer, jint format) {
    using Fn = jlong (*)(jint, jint, jbyte, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetImageHandleNV"));
    if (!fn) {
        return static_cast<jlong>(0);
    }
    auto result = fn(texture, level, layered, layer, format);
    return static_cast<jlong>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetInteger64i_1v(JNIEnv* env, jclass, jint target, jint index, jlongArray data) {
    jlong* data_elems = env->GetLongArrayElements(data, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetInteger64i_v"));
    if (!fn) {
        return;
    }
    fn(target, index, reinterpret_cast<jlong*>(data_elems));
    env->ReleaseLongArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetInteger64v(JNIEnv* env, jclass, jint pname, jlongArray data) {
    jlong* data_elems = env->GetLongArrayElements(data, nullptr);
    using Fn = void (*)(jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetInteger64v"));
    if (!fn) {
        return;
    }
    fn(pname, reinterpret_cast<jlong*>(data_elems));
    env->ReleaseLongArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetInteger64vAPPLE(JNIEnv* env, jclass, jint pname, jlongArray params) {
    jlong* params_elems = env->GetLongArrayElements(params, nullptr);
    using Fn = void (*)(jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetInteger64vAPPLE"));
    if (!fn) {
        return;
    }
    fn(pname, reinterpret_cast<jlong*>(params_elems));
    env->ReleaseLongArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetInteger64vEXT(JNIEnv* env, jclass, jint pname, jlongArray data) {
    jlong* data_elems = env->GetLongArrayElements(data, nullptr);
    using Fn = void (*)(jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetInteger64vEXT"));
    if (!fn) {
        return;
    }
    fn(pname, reinterpret_cast<jlong*>(data_elems));
    env->ReleaseLongArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetIntegeri_1v(JNIEnv* env, jclass, jint target, jint index, jintArray data) {
    jint* data_elems = env->GetIntArrayElements(data, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetIntegeri_v"));
    if (!fn) {
        return;
    }
    fn(target, index, reinterpret_cast<jint*>(data_elems));
    env->ReleaseIntArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetIntegeri_1vEXT(JNIEnv* env, jclass, jint target, jint index, jintArray data) {
    jint* data_elems = env->GetIntArrayElements(data, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetIntegeri_vEXT"));
    if (!fn) {
        return;
    }
    fn(target, index, reinterpret_cast<jint*>(data_elems));
    env->ReleaseIntArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetIntegerv(JNIEnv* env, jclass, jint pname, jintArray data) {
    jint* data_elems = env->GetIntArrayElements(data, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetIntegerv"));
    if (!fn) {
        return;
    }
    fn(pname, reinterpret_cast<jint*>(data_elems));
    env->ReleaseIntArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetInternalformatSampleivNV(JNIEnv* env, jclass, jint target, jint internalformat, jint samples, jint pname, jint count, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetInternalformatSampleivNV"));
    if (!fn) {
        return;
    }
    fn(target, internalformat, samples, pname, count, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetInternalformativ(JNIEnv* env, jclass, jint target, jint internalformat, jint pname, jint count, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetInternalformativ"));
    if (!fn) {
        return;
    }
    fn(target, internalformat, pname, count, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetMemoryObjectDetachedResourcesuivNV(JNIEnv* env, jclass, jint memory, jint pname, jint first, jint count, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetMemoryObjectDetachedResourcesuivNV"));
    if (!fn) {
        return;
    }
    fn(memory, pname, first, count, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetMemoryObjectParameterivEXT(JNIEnv* env, jclass, jint memoryObject, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetMemoryObjectParameterivEXT"));
    if (!fn) {
        return;
    }
    fn(memoryObject, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetNextPerfQueryIdINTEL(JNIEnv* env, jclass, jint queryId, jintArray nextQueryId) {
    jint* nextQueryId_elems = env->GetIntArrayElements(nextQueryId, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetNextPerfQueryIdINTEL"));
    if (!fn) {
        return;
    }
    fn(queryId, reinterpret_cast<jint*>(nextQueryId_elems));
    env->ReleaseIntArrayElements(nextQueryId, nextQueryId_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetObjectLabelEXT(JNIEnv* env, jclass, jint type, jint object, jint bufSize, jintArray length, jbyteArray label) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jbyte* label_elems = env->GetByteArrayElements(label, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetObjectLabelEXT"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetObjectLabelKHR"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetObjectPtrLabelKHR"));
    if (!fn) {
        return;
    }
    fn(ptr, bufSize, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jbyte*>(label_elems));
    env->ReleaseByteArrayElements(label, label_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPathCommandsNV(JNIEnv* env, jclass, jint path, jbyteArray commands) {
    jbyte* commands_elems = env->GetByteArrayElements(commands, nullptr);
    using Fn = void (*)(jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetPathCommandsNV"));
    if (!fn) {
        return;
    }
    fn(path, reinterpret_cast<jbyte*>(commands_elems));
    env->ReleaseByteArrayElements(commands, commands_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPathCoordsNV(JNIEnv* env, jclass, jint path, jfloatArray coords) {
    jfloat* coords_elems = env->GetFloatArrayElements(coords, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetPathCoordsNV"));
    if (!fn) {
        return;
    }
    fn(path, reinterpret_cast<jfloat*>(coords_elems));
    env->ReleaseFloatArrayElements(coords, coords_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPathDashArrayNV(JNIEnv* env, jclass, jint path, jfloatArray dashArray) {
    jfloat* dashArray_elems = env->GetFloatArrayElements(dashArray, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetPathDashArrayNV"));
    if (!fn) {
        return;
    }
    fn(path, reinterpret_cast<jfloat*>(dashArray_elems));
    env->ReleaseFloatArrayElements(dashArray, dashArray_elems, 0);
}

JNIEXPORT jfloat JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPathLengthNV(JNIEnv* env, jclass, jint path, jint startSegment, jint numSegments) {
    using Fn = jfloat (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetPathLengthNV"));
    if (!fn) {
        return static_cast<jfloat>(0.0f);
    }
    auto result = fn(path, startSegment, numSegments);
    return static_cast<jfloat>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPathMetricRangeNV(JNIEnv* env, jclass, jint metricQueryMask, jint firstPathName, jint numPaths, jint stride, jfloatArray metrics) {
    jfloat* metrics_elems = env->GetFloatArrayElements(metrics, nullptr);
    using Fn = void (*)(jint, jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetPathMetricRangeNV"));
    if (!fn) {
        return;
    }
    fn(metricQueryMask, firstPathName, numPaths, stride, reinterpret_cast<jfloat*>(metrics_elems));
    env->ReleaseFloatArrayElements(metrics, metrics_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPathMetricsNV(JNIEnv* env, jclass, jint metricQueryMask, jint numPaths, jint pathNameType, jlong paths, jint pathBase, jint stride, jfloatArray metrics) {
    jfloat* metrics_elems = env->GetFloatArrayElements(metrics, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetPathMetricsNV"));
    if (!fn) {
        return;
    }
    fn(metricQueryMask, numPaths, pathNameType, paths, pathBase, stride, reinterpret_cast<jfloat*>(metrics_elems));
    env->ReleaseFloatArrayElements(metrics, metrics_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPathParameterfvNV(JNIEnv* env, jclass, jint path, jint pname, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetPathParameterfvNV"));
    if (!fn) {
        return;
    }
    fn(path, pname, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPathParameterivNV(JNIEnv* env, jclass, jint path, jint pname, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetPathParameterivNV"));
    if (!fn) {
        return;
    }
    fn(path, pname, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPathSpacingNV(JNIEnv* env, jclass, jint pathListMode, jint numPaths, jint pathNameType, jlong paths, jint pathBase, jfloat advanceScale, jfloat kerningScale, jint transformType, jfloatArray returnedSpacing) {
    jfloat* returnedSpacing_elems = env->GetFloatArrayElements(returnedSpacing, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong, jint, jfloat, jfloat, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetPathSpacingNV"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetPerfCounterInfoINTEL"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetPerfMonitorCounterDataAMD"));
    if (!fn) {
        return;
    }
    fn(monitor, pname, dataSize, reinterpret_cast<jint*>(data_elems), reinterpret_cast<jint*>(bytesWritten_elems));
    env->ReleaseIntArrayElements(bytesWritten, bytesWritten_elems, 0);
    env->ReleaseIntArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPerfMonitorCounterInfoAMD(JNIEnv* env, jclass, jint group, jint counter, jint pname, jlong data) {
    using Fn = void (*)(jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetPerfMonitorCounterInfoAMD"));
    if (!fn) {
        return;
    }
    fn(group, counter, pname, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPerfMonitorCounterStringAMD(JNIEnv* env, jclass, jint group, jint counter, jint bufSize, jintArray length, jbyteArray counterString) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jbyte* counterString_elems = env->GetByteArrayElements(counterString, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetPerfMonitorCounterStringAMD"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetPerfMonitorCountersAMD"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetPerfMonitorGroupStringAMD"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetPerfMonitorGroupsAMD"));
    if (!fn) {
        return;
    }
    fn(reinterpret_cast<jint*>(numGroups_elems), groupsSize, reinterpret_cast<jint*>(groups_elems));
    env->ReleaseIntArrayElements(groups, groups_elems, 0);
    env->ReleaseIntArrayElements(numGroups, numGroups_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPerfQueryDataINTEL(JNIEnv* env, jclass, jint queryHandle, jint flags, jint dataSize, jlong data, jintArray bytesWritten) {
    jint* bytesWritten_elems = env->GetIntArrayElements(bytesWritten, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetPerfQueryDataINTEL"));
    if (!fn) {
        return;
    }
    fn(queryHandle, flags, dataSize, data, reinterpret_cast<jint*>(bytesWritten_elems));
    env->ReleaseIntArrayElements(bytesWritten, bytesWritten_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetPerfQueryIdByNameINTEL(JNIEnv* env, jclass, jbyteArray queryName, jintArray queryId) {
    jbyte* queryName_elems = env->GetByteArrayElements(queryName, nullptr);
    jint* queryId_elems = env->GetIntArrayElements(queryId, nullptr);
    using Fn = void (*)(jbyte*, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetPerfQueryIdByNameINTEL"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetPerfQueryInfoINTEL"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetPointervKHR"));
    if (!fn) {
        return;
    }
    fn(pname, params);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetProgramBinary(JNIEnv* env, jclass, jint program, jint bufSize, jintArray length, jintArray binaryFormat, jlong binary) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jint* binaryFormat_elems = env->GetIntArrayElements(binaryFormat, nullptr);
    using Fn = void (*)(jint, jint, jint*, jint*, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetProgramBinary"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetProgramBinaryOES"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetProgramInfoLog"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetProgramPipelineInfoLogEXT"));
    if (!fn) {
        return;
    }
    fn(pipeline, bufSize, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jbyte*>(infoLog_elems));
    env->ReleaseByteArrayElements(infoLog, infoLog_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetProgramPipelineivEXT(JNIEnv* env, jclass, jint pipeline, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetProgramPipelineivEXT"));
    if (!fn) {
        return;
    }
    fn(pipeline, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetProgramResourceLocationIndexEXT(JNIEnv* env, jclass, jint program, jint programInterface, jbyteArray name) {
    jbyte* name_elems = env->GetByteArrayElements(name, nullptr);
    using Fn = jint (*)(jint, jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetProgramResourceLocationIndexEXT"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetProgramResourcefvNV"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetProgramiv"));
    if (!fn) {
        return;
    }
    fn(program, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetQueryObjecti64vEXT(JNIEnv* env, jclass, jint id, jint pname, jlongArray params) {
    jlong* params_elems = env->GetLongArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetQueryObjecti64vEXT"));
    if (!fn) {
        return;
    }
    fn(id, pname, reinterpret_cast<jlong*>(params_elems));
    env->ReleaseLongArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetQueryObjectivEXT(JNIEnv* env, jclass, jint id, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetQueryObjectivEXT"));
    if (!fn) {
        return;
    }
    fn(id, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetQueryObjectui64vEXT(JNIEnv* env, jclass, jint id, jint pname, jlongArray params) {
    jlong* params_elems = env->GetLongArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetQueryObjectui64vEXT"));
    if (!fn) {
        return;
    }
    fn(id, pname, reinterpret_cast<jlong*>(params_elems));
    env->ReleaseLongArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetQueryObjectuiv(JNIEnv* env, jclass, jint id, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetQueryObjectuiv"));
    if (!fn) {
        return;
    }
    fn(id, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetQueryObjectuivEXT(JNIEnv* env, jclass, jint id, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetQueryObjectuivEXT"));
    if (!fn) {
        return;
    }
    fn(id, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetQueryiv(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetQueryiv"));
    if (!fn) {
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetQueryivEXT(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetQueryivEXT"));
    if (!fn) {
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetRenderbufferParameteriv(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetRenderbufferParameteriv"));
    if (!fn) {
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetSamplerParameterIivEXT(JNIEnv* env, jclass, jint sampler, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetSamplerParameterIivEXT"));
    if (!fn) {
        return;
    }
    fn(sampler, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetSamplerParameterIivOES(JNIEnv* env, jclass, jint sampler, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetSamplerParameterIivOES"));
    if (!fn) {
        return;
    }
    fn(sampler, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetSamplerParameterIuivEXT(JNIEnv* env, jclass, jint sampler, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetSamplerParameterIuivEXT"));
    if (!fn) {
        return;
    }
    fn(sampler, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetSamplerParameterIuivOES(JNIEnv* env, jclass, jint sampler, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetSamplerParameterIuivOES"));
    if (!fn) {
        return;
    }
    fn(sampler, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetSamplerParameterfv(JNIEnv* env, jclass, jint sampler, jint pname, jfloatArray params) {
    jfloat* params_elems = env->GetFloatArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetSamplerParameterfv"));
    if (!fn) {
        return;
    }
    fn(sampler, pname, reinterpret_cast<jfloat*>(params_elems));
    env->ReleaseFloatArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetSamplerParameteriv(JNIEnv* env, jclass, jint sampler, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetSamplerParameteriv"));
    if (!fn) {
        return;
    }
    fn(sampler, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetSemaphoreParameterivNV(JNIEnv* env, jclass, jint semaphore, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetSemaphoreParameterivNV"));
    if (!fn) {
        return;
    }
    fn(semaphore, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetSemaphoreParameterui64vEXT(JNIEnv* env, jclass, jint semaphore, jint pname, jlongArray params) {
    jlong* params_elems = env->GetLongArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetSemaphoreParameterui64vEXT"));
    if (!fn) {
        return;
    }
    fn(semaphore, pname, reinterpret_cast<jlong*>(params_elems));
    env->ReleaseLongArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetShaderInfoLog(JNIEnv* env, jclass, jint shader, jint bufSize, jintArray length, jbyteArray infoLog) {
    jint* length_elems = env->GetIntArrayElements(length, nullptr);
    jbyte* infoLog_elems = env->GetByteArrayElements(infoLog, nullptr);
    using Fn = void (*)(jint, jint, jint*, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetShaderInfoLog"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetShaderPrecisionFormat"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetShaderSource"));
    if (!fn) {
        return;
    }
    fn(shader, bufSize, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jbyte*>(source_elems));
    env->ReleaseByteArrayElements(source, source_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetShaderiv(JNIEnv* env, jclass, jint shader, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetShaderiv"));
    if (!fn) {
        return;
    }
    fn(shader, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetShadingRateImagePaletteNV(JNIEnv* env, jclass, jint viewport, jint entry, jintArray rate) {
    jint* rate_elems = env->GetIntArrayElements(rate, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetShadingRateImagePaletteNV"));
    if (!fn) {
        return;
    }
    fn(viewport, entry, reinterpret_cast<jint*>(rate_elems));
    env->ReleaseIntArrayElements(rate, rate_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetShadingRateSampleLocationivNV(JNIEnv* env, jclass, jint rate, jint samples, jint index, jintArray location) {
    jint* location_elems = env->GetIntArrayElements(location, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetShadingRateSampleLocationivNV"));
    if (!fn) {
        return;
    }
    fn(rate, samples, index, reinterpret_cast<jint*>(location_elems));
    env->ReleaseIntArrayElements(location, location_elems, 0);
}

JNIEXPORT jbyteArray JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetString(JNIEnv* env, jclass, jint name) {
    using Fn = const char* (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetString"));
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetStringi"));
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetSynciv"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetSyncivAPPLE"));
    if (!fn) {
        return;
    }
    fn(sync, pname, count, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jint*>(values_elems));
    env->ReleaseIntArrayElements(values, values_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetTexParameterIivEXT(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetTexParameterIivEXT"));
    if (!fn) {
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetTexParameterIivOES(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetTexParameterIivOES"));
    if (!fn) {
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetTexParameterIuivEXT(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetTexParameterIuivEXT"));
    if (!fn) {
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetTexParameterIuivOES(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetTexParameterIuivOES"));
    if (!fn) {
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetTexParameterfv(JNIEnv* env, jclass, jint target, jint pname, jfloatArray params) {
    jfloat* params_elems = env->GetFloatArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetTexParameterfv"));
    if (!fn) {
        return;
    }
    fn(target, pname, reinterpret_cast<jfloat*>(params_elems));
    env->ReleaseFloatArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetTexParameteriv(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetTexParameteriv"));
    if (!fn) {
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetTextureHandleIMG(JNIEnv* env, jclass, jint texture) {
    using Fn = jlong (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetTextureHandleIMG"));
    if (!fn) {
        return static_cast<jlong>(0);
    }
    auto result = fn(texture);
    return static_cast<jlong>(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetTextureHandleNV(JNIEnv* env, jclass, jint texture) {
    using Fn = jlong (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetTextureHandleNV"));
    if (!fn) {
        return static_cast<jlong>(0);
    }
    auto result = fn(texture);
    return static_cast<jlong>(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetTextureSamplerHandleIMG(JNIEnv* env, jclass, jint texture, jint sampler) {
    using Fn = jlong (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetTextureSamplerHandleIMG"));
    if (!fn) {
        return static_cast<jlong>(0);
    }
    auto result = fn(texture, sampler);
    return static_cast<jlong>(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetTextureSamplerHandleNV(JNIEnv* env, jclass, jint texture, jint sampler) {
    using Fn = jlong (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetTextureSamplerHandleNV"));
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetTransformFeedbackVarying"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetTranslatedShaderSourceANGLE"));
    if (!fn) {
        return;
    }
    fn(shader, bufSize, reinterpret_cast<jint*>(length_elems), reinterpret_cast<jbyte*>(source_elems));
    env->ReleaseByteArrayElements(source, source_elems, 0);
    env->ReleaseIntArrayElements(length, length_elems, 0);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetUniformBlockIndex(JNIEnv* env, jclass, jint program, jbyteArray uniformBlockName) {
    jbyte* uniformBlockName_elems = env->GetByteArrayElements(uniformBlockName, nullptr);
    using Fn = jint (*)(jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetUniformBlockIndex"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetUniformIndices"));
    if (!fn) {
        return;
    }
    fn(program, uniformCount, reinterpret_cast<jbyte*>(uniformNames_elems), reinterpret_cast<jint*>(uniformIndices_elems));
    env->ReleaseIntArrayElements(uniformIndices, uniformIndices_elems, 0);
    env->ReleaseByteArrayElements(uniformNames, uniformNames_elems, 0);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetUniformLocation(JNIEnv* env, jclass, jint program, jbyteArray name) {
    jbyte* name_elems = env->GetByteArrayElements(name, nullptr);
    using Fn = jint (*)(jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetUniformLocation"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn(program, reinterpret_cast<jbyte*>(name_elems));
    env->ReleaseByteArrayElements(name, name_elems, 0);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetUniformfv(JNIEnv* env, jclass, jint program, jint location, jfloatArray params) {
    jfloat* params_elems = env->GetFloatArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetUniformfv"));
    if (!fn) {
        return;
    }
    fn(program, location, reinterpret_cast<jfloat*>(params_elems));
    env->ReleaseFloatArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetUniformi64vNV(JNIEnv* env, jclass, jint program, jint location, jlongArray params) {
    jlong* params_elems = env->GetLongArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetUniformi64vNV"));
    if (!fn) {
        return;
    }
    fn(program, location, reinterpret_cast<jlong*>(params_elems));
    env->ReleaseLongArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetUniformiv(JNIEnv* env, jclass, jint program, jint location, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetUniformiv"));
    if (!fn) {
        return;
    }
    fn(program, location, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetUniformuiv(JNIEnv* env, jclass, jint program, jint location, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetUniformuiv"));
    if (!fn) {
        return;
    }
    fn(program, location, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetUnsignedBytei_1vEXT(JNIEnv* env, jclass, jint target, jint index, jbyteArray data) {
    jbyte* data_elems = env->GetByteArrayElements(data, nullptr);
    using Fn = void (*)(jint, jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetUnsignedBytei_vEXT"));
    if (!fn) {
        return;
    }
    fn(target, index, reinterpret_cast<jbyte*>(data_elems));
    env->ReleaseByteArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetUnsignedBytevEXT(JNIEnv* env, jclass, jint pname, jbyteArray data) {
    jbyte* data_elems = env->GetByteArrayElements(data, nullptr);
    using Fn = void (*)(jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetUnsignedBytevEXT"));
    if (!fn) {
        return;
    }
    fn(pname, reinterpret_cast<jbyte*>(data_elems));
    env->ReleaseByteArrayElements(data, data_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetVertexAttribIiv(JNIEnv* env, jclass, jint index, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetVertexAttribIiv"));
    if (!fn) {
        return;
    }
    fn(index, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetVertexAttribIuiv(JNIEnv* env, jclass, jint index, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetVertexAttribIuiv"));
    if (!fn) {
        return;
    }
    fn(index, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetVertexAttribPointerv(JNIEnv* env, jclass, jint index, jint pname, jlong pointer) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetVertexAttribPointerv"));
    if (!fn) {
        return;
    }
    fn(index, pname, pointer);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetVertexAttribfv(JNIEnv* env, jclass, jint index, jint pname, jfloatArray params) {
    jfloat* params_elems = env->GetFloatArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetVertexAttribfv"));
    if (!fn) {
        return;
    }
    fn(index, pname, reinterpret_cast<jfloat*>(params_elems));
    env->ReleaseFloatArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetVertexAttribiv(JNIEnv* env, jclass, jint index, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetVertexAttribiv"));
    if (!fn) {
        return;
    }
    fn(index, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetVkProcAddrNV(JNIEnv* env, jclass, jbyteArray name) {
    jbyte* name_elems = env->GetByteArrayElements(name, nullptr);
    using Fn = jlong (*)(jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetVkProcAddrNV"));
    if (!fn) {
        return static_cast<jlong>(0);
    }
    auto result = fn(reinterpret_cast<jbyte*>(name_elems));
    env->ReleaseByteArrayElements(name, name_elems, 0);
    return static_cast<jlong>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetnUniformfvEXT(JNIEnv* env, jclass, jint program, jint location, jint bufSize, jfloatArray params) {
    jfloat* params_elems = env->GetFloatArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetnUniformfvEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, bufSize, reinterpret_cast<jfloat*>(params_elems));
    env->ReleaseFloatArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetnUniformfvKHR(JNIEnv* env, jclass, jint program, jint location, jint bufSize, jfloatArray params) {
    jfloat* params_elems = env->GetFloatArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetnUniformfvKHR"));
    if (!fn) {
        return;
    }
    fn(program, location, bufSize, reinterpret_cast<jfloat*>(params_elems));
    env->ReleaseFloatArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetnUniformivEXT(JNIEnv* env, jclass, jint program, jint location, jint bufSize, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetnUniformivEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, bufSize, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetnUniformivKHR(JNIEnv* env, jclass, jint program, jint location, jint bufSize, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetnUniformivKHR"));
    if (!fn) {
        return;
    }
    fn(program, location, bufSize, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glGetnUniformuivKHR(JNIEnv* env, jclass, jint program, jint location, jint bufSize, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glGetnUniformuivKHR"));
    if (!fn) {
        return;
    }
    fn(program, location, bufSize, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glHint(JNIEnv* env, jclass, jint target, jint mode) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glHint"));
    if (!fn) {
        return;
    }
    fn(target, mode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glImportMemoryFdEXT(JNIEnv* env, jclass, jint memory, jlong size, jint handleType, jint fd) {
    using Fn = void (*)(jint, jlong, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glImportMemoryFdEXT"));
    if (!fn) {
        return;
    }
    fn(memory, size, handleType, fd);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glImportMemoryWin32HandleEXT(JNIEnv* env, jclass, jint memory, jlong size, jint handleType, jlong handle) {
    using Fn = void (*)(jint, jlong, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glImportMemoryWin32HandleEXT"));
    if (!fn) {
        return;
    }
    fn(memory, size, handleType, handle);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glImportMemoryWin32NameEXT(JNIEnv* env, jclass, jint memory, jlong size, jint handleType, jlong name) {
    using Fn = void (*)(jint, jlong, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glImportMemoryWin32NameEXT"));
    if (!fn) {
        return;
    }
    fn(memory, size, handleType, name);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glImportSemaphoreFdEXT(JNIEnv* env, jclass, jint semaphore, jint handleType, jint fd) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glImportSemaphoreFdEXT"));
    if (!fn) {
        return;
    }
    fn(semaphore, handleType, fd);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glImportSemaphoreWin32HandleEXT(JNIEnv* env, jclass, jint semaphore, jint handleType, jlong handle) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glImportSemaphoreWin32HandleEXT"));
    if (!fn) {
        return;
    }
    fn(semaphore, handleType, handle);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glImportSemaphoreWin32NameEXT(JNIEnv* env, jclass, jint semaphore, jint handleType, jlong name) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glImportSemaphoreWin32NameEXT"));
    if (!fn) {
        return;
    }
    fn(semaphore, handleType, name);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glInsertEventMarkerEXT(JNIEnv* env, jclass, jint length, jbyteArray marker) {
    jbyte* marker_elems = env->GetByteArrayElements(marker, nullptr);
    using Fn = void (*)(jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glInsertEventMarkerEXT"));
    if (!fn) {
        return;
    }
    fn(length, reinterpret_cast<jbyte*>(marker_elems));
    env->ReleaseByteArrayElements(marker, marker_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glInterpolatePathsNV(JNIEnv* env, jclass, jint resultPath, jint pathA, jint pathB, jfloat weight) {
    using Fn = void (*)(jint, jint, jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glInterpolatePathsNV"));
    if (!fn) {
        return;
    }
    fn(resultPath, pathA, pathB, weight);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glInvalidateFramebuffer(JNIEnv* env, jclass, jint target, jint numAttachments, jintArray attachments) {
    jint* attachments_elems = env->GetIntArrayElements(attachments, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glInvalidateFramebuffer"));
    if (!fn) {
        return;
    }
    fn(target, numAttachments, reinterpret_cast<jint*>(attachments_elems));
    env->ReleaseIntArrayElements(attachments, attachments_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glInvalidateSubFramebuffer(JNIEnv* env, jclass, jint target, jint numAttachments, jintArray attachments, jint x, jint y, jint width, jint height) {
    jint* attachments_elems = env->GetIntArrayElements(attachments, nullptr);
    using Fn = void (*)(jint, jint, jint*, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glInvalidateSubFramebuffer"));
    if (!fn) {
        return;
    }
    fn(target, numAttachments, reinterpret_cast<jint*>(attachments_elems), x, y, width, height);
    env->ReleaseIntArrayElements(attachments, attachments_elems, 0);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsBuffer(JNIEnv* env, jclass, jint buffer) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsBuffer"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(buffer);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsEnabled(JNIEnv* env, jclass, jint cap) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsEnabled"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(cap);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsEnablediEXT(JNIEnv* env, jclass, jint target, jint index) {
    using Fn = jbyte (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsEnablediEXT"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(target, index);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsEnablediNV(JNIEnv* env, jclass, jint target, jint index) {
    using Fn = jbyte (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsEnablediNV"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(target, index);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsEnablediOES(JNIEnv* env, jclass, jint target, jint index) {
    using Fn = jbyte (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsEnablediOES"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(target, index);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsFenceNV(JNIEnv* env, jclass, jint fence) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsFenceNV"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(fence);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsFramebuffer(JNIEnv* env, jclass, jint framebuffer) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsFramebuffer"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(framebuffer);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsImageHandleResidentNV(JNIEnv* env, jclass, jlong handle) {
    using Fn = jbyte (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsImageHandleResidentNV"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(handle);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsMemoryObjectEXT(JNIEnv* env, jclass, jint memoryObject) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsMemoryObjectEXT"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(memoryObject);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsPathNV(JNIEnv* env, jclass, jint path) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsPathNV"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(path);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsPointInFillPathNV(JNIEnv* env, jclass, jint path, jint mask, jfloat x, jfloat y) {
    using Fn = jbyte (*)(jint, jint, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsPointInFillPathNV"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(path, mask, x, y);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsPointInStrokePathNV(JNIEnv* env, jclass, jint path, jfloat x, jfloat y) {
    using Fn = jbyte (*)(jint, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsPointInStrokePathNV"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(path, x, y);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsProgram(JNIEnv* env, jclass, jint program) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsProgram"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(program);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsProgramPipelineEXT(JNIEnv* env, jclass, jint pipeline) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsProgramPipelineEXT"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(pipeline);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsQuery(JNIEnv* env, jclass, jint id) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsQuery"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(id);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsQueryEXT(JNIEnv* env, jclass, jint id) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsQueryEXT"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(id);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsRenderbuffer(JNIEnv* env, jclass, jint renderbuffer) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsRenderbuffer"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(renderbuffer);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsSampler(JNIEnv* env, jclass, jint sampler) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsSampler"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(sampler);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsSemaphoreEXT(JNIEnv* env, jclass, jint semaphore) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsSemaphoreEXT"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(semaphore);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsShader(JNIEnv* env, jclass, jint shader) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsShader"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(shader);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsSync(JNIEnv* env, jclass, jlong sync) {
    using Fn = jbyte (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsSync"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(sync);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsSyncAPPLE(JNIEnv* env, jclass, jlong sync) {
    using Fn = jbyte (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsSyncAPPLE"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(sync);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsTexture(JNIEnv* env, jclass, jint texture) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsTexture"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(texture);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsTextureHandleResidentNV(JNIEnv* env, jclass, jlong handle) {
    using Fn = jbyte (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsTextureHandleResidentNV"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(handle);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsTransformFeedback(JNIEnv* env, jclass, jint id) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsTransformFeedback"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(id);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsVertexArray(JNIEnv* env, jclass, jint array) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsVertexArray"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(array);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glIsVertexArrayOES(JNIEnv* env, jclass, jint array) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glIsVertexArrayOES"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(array);
    return static_cast<jbyte>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glLabelObjectEXT(JNIEnv* env, jclass, jint type, jint object, jint length, jbyteArray label) {
    jbyte* label_elems = env->GetByteArrayElements(label, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glLabelObjectEXT"));
    if (!fn) {
        return;
    }
    fn(type, object, length, reinterpret_cast<jbyte*>(label_elems));
    env->ReleaseByteArrayElements(label, label_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glLineWidth(JNIEnv* env, jclass, jfloat width) {
    using Fn = void (*)(jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glLineWidth"));
    if (!fn) {
        return;
    }
    fn(width);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glLinkProgram(JNIEnv* env, jclass, jint program) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glLinkProgram"));
    if (!fn) {
        return;
    }
    fn(program);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMakeImageHandleNonResidentNV(JNIEnv* env, jclass, jlong handle) {
    using Fn = void (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMakeImageHandleNonResidentNV"));
    if (!fn) {
        return;
    }
    fn(handle);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMakeImageHandleResidentNV(JNIEnv* env, jclass, jlong handle, jint access) {
    using Fn = void (*)(jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMakeImageHandleResidentNV"));
    if (!fn) {
        return;
    }
    fn(handle, access);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMakeTextureHandleNonResidentNV(JNIEnv* env, jclass, jlong handle) {
    using Fn = void (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMakeTextureHandleNonResidentNV"));
    if (!fn) {
        return;
    }
    fn(handle);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMakeTextureHandleResidentNV(JNIEnv* env, jclass, jlong handle) {
    using Fn = void (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMakeTextureHandleResidentNV"));
    if (!fn) {
        return;
    }
    fn(handle);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_gles_GLES_glMapBufferOES(JNIEnv* env, jclass, jint target, jint access) {
    using Fn = jlong (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMapBufferOES"));
    if (!fn) {
        return static_cast<jlong>(0);
    }
    auto result = fn(target, access);
    return static_cast<jlong>(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_gles_GLES_glMapBufferRange(JNIEnv* env, jclass, jint target, jlong offset, jlong length, jint access) {
    using Fn = jlong (*)(jint, jlong, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMapBufferRange"));
    if (!fn) {
        return static_cast<jlong>(0);
    }
    auto result = fn(target, offset, length, access);
    return static_cast<jlong>(result);
}

JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_gles_GLES_glMapBufferRangeEXT(JNIEnv* env, jclass, jint target, jlong offset, jlong length, jint access) {
    using Fn = jlong (*)(jint, jlong, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMapBufferRangeEXT"));
    if (!fn) {
        return static_cast<jlong>(0);
    }
    auto result = fn(target, offset, length, access);
    return static_cast<jlong>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixFrustumEXT(JNIEnv* env, jclass, jint mode, jdouble left, jdouble right, jdouble bottom, jdouble top, jdouble zNear, jdouble zFar) {
    using Fn = void (*)(jint, jdouble, jdouble, jdouble, jdouble, jdouble, jdouble);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixFrustumEXT"));
    if (!fn) {
        return;
    }
    fn(mode, left, right, bottom, top, zNear, zFar);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixLoad3x2fNV(JNIEnv* env, jclass, jint matrixMode, jfloatArray m) {
    jfloat* m_elems = env->GetFloatArrayElements(m, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixLoad3x2fNV"));
    if (!fn) {
        return;
    }
    fn(matrixMode, reinterpret_cast<jfloat*>(m_elems));
    env->ReleaseFloatArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixLoad3x3fNV(JNIEnv* env, jclass, jint matrixMode, jfloatArray m) {
    jfloat* m_elems = env->GetFloatArrayElements(m, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixLoad3x3fNV"));
    if (!fn) {
        return;
    }
    fn(matrixMode, reinterpret_cast<jfloat*>(m_elems));
    env->ReleaseFloatArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixLoadIdentityEXT(JNIEnv* env, jclass, jint mode) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixLoadIdentityEXT"));
    if (!fn) {
        return;
    }
    fn(mode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixLoadTranspose3x3fNV(JNIEnv* env, jclass, jint matrixMode, jfloatArray m) {
    jfloat* m_elems = env->GetFloatArrayElements(m, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixLoadTranspose3x3fNV"));
    if (!fn) {
        return;
    }
    fn(matrixMode, reinterpret_cast<jfloat*>(m_elems));
    env->ReleaseFloatArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixLoadTransposedEXT(JNIEnv* env, jclass, jint mode, jdoubleArray m) {
    jdouble* m_elems = env->GetDoubleArrayElements(m, nullptr);
    using Fn = void (*)(jint, jdouble*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixLoadTransposedEXT"));
    if (!fn) {
        return;
    }
    fn(mode, reinterpret_cast<jdouble*>(m_elems));
    env->ReleaseDoubleArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixLoadTransposefEXT(JNIEnv* env, jclass, jint mode, jfloatArray m) {
    jfloat* m_elems = env->GetFloatArrayElements(m, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixLoadTransposefEXT"));
    if (!fn) {
        return;
    }
    fn(mode, reinterpret_cast<jfloat*>(m_elems));
    env->ReleaseFloatArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixLoaddEXT(JNIEnv* env, jclass, jint mode, jdoubleArray m) {
    jdouble* m_elems = env->GetDoubleArrayElements(m, nullptr);
    using Fn = void (*)(jint, jdouble*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixLoaddEXT"));
    if (!fn) {
        return;
    }
    fn(mode, reinterpret_cast<jdouble*>(m_elems));
    env->ReleaseDoubleArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixLoadfEXT(JNIEnv* env, jclass, jint mode, jfloatArray m) {
    jfloat* m_elems = env->GetFloatArrayElements(m, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixLoadfEXT"));
    if (!fn) {
        return;
    }
    fn(mode, reinterpret_cast<jfloat*>(m_elems));
    env->ReleaseFloatArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixMult3x2fNV(JNIEnv* env, jclass, jint matrixMode, jfloatArray m) {
    jfloat* m_elems = env->GetFloatArrayElements(m, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixMult3x2fNV"));
    if (!fn) {
        return;
    }
    fn(matrixMode, reinterpret_cast<jfloat*>(m_elems));
    env->ReleaseFloatArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixMult3x3fNV(JNIEnv* env, jclass, jint matrixMode, jfloatArray m) {
    jfloat* m_elems = env->GetFloatArrayElements(m, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixMult3x3fNV"));
    if (!fn) {
        return;
    }
    fn(matrixMode, reinterpret_cast<jfloat*>(m_elems));
    env->ReleaseFloatArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixMultTranspose3x3fNV(JNIEnv* env, jclass, jint matrixMode, jfloatArray m) {
    jfloat* m_elems = env->GetFloatArrayElements(m, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixMultTranspose3x3fNV"));
    if (!fn) {
        return;
    }
    fn(matrixMode, reinterpret_cast<jfloat*>(m_elems));
    env->ReleaseFloatArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixMultTransposedEXT(JNIEnv* env, jclass, jint mode, jdoubleArray m) {
    jdouble* m_elems = env->GetDoubleArrayElements(m, nullptr);
    using Fn = void (*)(jint, jdouble*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixMultTransposedEXT"));
    if (!fn) {
        return;
    }
    fn(mode, reinterpret_cast<jdouble*>(m_elems));
    env->ReleaseDoubleArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixMultTransposefEXT(JNIEnv* env, jclass, jint mode, jfloatArray m) {
    jfloat* m_elems = env->GetFloatArrayElements(m, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixMultTransposefEXT"));
    if (!fn) {
        return;
    }
    fn(mode, reinterpret_cast<jfloat*>(m_elems));
    env->ReleaseFloatArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixMultdEXT(JNIEnv* env, jclass, jint mode, jdoubleArray m) {
    jdouble* m_elems = env->GetDoubleArrayElements(m, nullptr);
    using Fn = void (*)(jint, jdouble*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixMultdEXT"));
    if (!fn) {
        return;
    }
    fn(mode, reinterpret_cast<jdouble*>(m_elems));
    env->ReleaseDoubleArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixMultfEXT(JNIEnv* env, jclass, jint mode, jfloatArray m) {
    jfloat* m_elems = env->GetFloatArrayElements(m, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixMultfEXT"));
    if (!fn) {
        return;
    }
    fn(mode, reinterpret_cast<jfloat*>(m_elems));
    env->ReleaseFloatArrayElements(m, m_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixOrthoEXT(JNIEnv* env, jclass, jint mode, jdouble left, jdouble right, jdouble bottom, jdouble top, jdouble zNear, jdouble zFar) {
    using Fn = void (*)(jint, jdouble, jdouble, jdouble, jdouble, jdouble, jdouble);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixOrthoEXT"));
    if (!fn) {
        return;
    }
    fn(mode, left, right, bottom, top, zNear, zFar);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixPopEXT(JNIEnv* env, jclass, jint mode) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixPopEXT"));
    if (!fn) {
        return;
    }
    fn(mode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixPushEXT(JNIEnv* env, jclass, jint mode) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixPushEXT"));
    if (!fn) {
        return;
    }
    fn(mode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixRotatedEXT(JNIEnv* env, jclass, jint mode, jdouble angle, jdouble x, jdouble y, jdouble z) {
    using Fn = void (*)(jint, jdouble, jdouble, jdouble, jdouble);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixRotatedEXT"));
    if (!fn) {
        return;
    }
    fn(mode, angle, x, y, z);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixRotatefEXT(JNIEnv* env, jclass, jint mode, jfloat angle, jfloat x, jfloat y, jfloat z) {
    using Fn = void (*)(jint, jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixRotatefEXT"));
    if (!fn) {
        return;
    }
    fn(mode, angle, x, y, z);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixScaledEXT(JNIEnv* env, jclass, jint mode, jdouble x, jdouble y, jdouble z) {
    using Fn = void (*)(jint, jdouble, jdouble, jdouble);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixScaledEXT"));
    if (!fn) {
        return;
    }
    fn(mode, x, y, z);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixScalefEXT(JNIEnv* env, jclass, jint mode, jfloat x, jfloat y, jfloat z) {
    using Fn = void (*)(jint, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixScalefEXT"));
    if (!fn) {
        return;
    }
    fn(mode, x, y, z);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixTranslatedEXT(JNIEnv* env, jclass, jint mode, jdouble x, jdouble y, jdouble z) {
    using Fn = void (*)(jint, jdouble, jdouble, jdouble);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixTranslatedEXT"));
    if (!fn) {
        return;
    }
    fn(mode, x, y, z);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMatrixTranslatefEXT(JNIEnv* env, jclass, jint mode, jfloat x, jfloat y, jfloat z) {
    using Fn = void (*)(jint, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMatrixTranslatefEXT"));
    if (!fn) {
        return;
    }
    fn(mode, x, y, z);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMaxShaderCompilerThreadsKHR(JNIEnv* env, jclass, jint count) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMaxShaderCompilerThreadsKHR"));
    if (!fn) {
        return;
    }
    fn(count);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMemoryObjectParameterivEXT(JNIEnv* env, jclass, jint memoryObject, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMemoryObjectParameterivEXT"));
    if (!fn) {
        return;
    }
    fn(memoryObject, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMinSampleShadingOES(JNIEnv* env, jclass, jfloat value) {
    using Fn = void (*)(jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMinSampleShadingOES"));
    if (!fn) {
        return;
    }
    fn(value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMultiDrawArraysEXT(JNIEnv* env, jclass, jint mode, jintArray first, jintArray count, jint primcount) {
    jint* first_elems = env->GetIntArrayElements(first, nullptr);
    jint* count_elems = env->GetIntArrayElements(count, nullptr);
    using Fn = void (*)(jint, jint*, jint*, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMultiDrawArraysEXT"));
    if (!fn) {
        return;
    }
    fn(mode, reinterpret_cast<jint*>(first_elems), reinterpret_cast<jint*>(count_elems), primcount);
    env->ReleaseIntArrayElements(count, count_elems, 0);
    env->ReleaseIntArrayElements(first, first_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMultiDrawArraysIndirectEXT(JNIEnv* env, jclass, jint mode, jlong indirect, jint drawcount, jint stride) {
    using Fn = void (*)(jint, jlong, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMultiDrawArraysIndirectEXT"));
    if (!fn) {
        return;
    }
    fn(mode, indirect, drawcount, stride);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMultiDrawElementsBaseVertexEXT(JNIEnv* env, jclass, jint mode, jintArray count, jint type, jlong indices, jint drawcount, jintArray basevertex) {
    jint* count_elems = env->GetIntArrayElements(count, nullptr);
    jint* basevertex_elems = env->GetIntArrayElements(basevertex, nullptr);
    using Fn = void (*)(jint, jint*, jint, jlong, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMultiDrawElementsBaseVertexEXT"));
    if (!fn) {
        return;
    }
    fn(mode, reinterpret_cast<jint*>(count_elems), type, indices, drawcount, reinterpret_cast<jint*>(basevertex_elems));
    env->ReleaseIntArrayElements(basevertex, basevertex_elems, 0);
    env->ReleaseIntArrayElements(count, count_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMultiDrawElementsEXT(JNIEnv* env, jclass, jint mode, jintArray count, jint type, jlong indices, jint primcount) {
    jint* count_elems = env->GetIntArrayElements(count, nullptr);
    using Fn = void (*)(jint, jint*, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMultiDrawElementsEXT"));
    if (!fn) {
        return;
    }
    fn(mode, reinterpret_cast<jint*>(count_elems), type, indices, primcount);
    env->ReleaseIntArrayElements(count, count_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMultiDrawElementsIndirectEXT(JNIEnv* env, jclass, jint mode, jint type, jlong indirect, jint drawcount, jint stride) {
    using Fn = void (*)(jint, jint, jlong, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMultiDrawElementsIndirectEXT"));
    if (!fn) {
        return;
    }
    fn(mode, type, indirect, drawcount, stride);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMultiDrawMeshTasksIndirectCountNV(JNIEnv* env, jclass, jlong indirect, jlong drawcount, jint maxdrawcount, jint stride) {
    using Fn = void (*)(jlong, jlong, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMultiDrawMeshTasksIndirectCountNV"));
    if (!fn) {
        return;
    }
    fn(indirect, drawcount, maxdrawcount, stride);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glMultiDrawMeshTasksIndirectNV(JNIEnv* env, jclass, jlong indirect, jint drawcount, jint stride) {
    using Fn = void (*)(jlong, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glMultiDrawMeshTasksIndirectNV"));
    if (!fn) {
        return;
    }
    fn(indirect, drawcount, stride);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glNamedBufferAttachMemoryNV(JNIEnv* env, jclass, jint buffer, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glNamedBufferAttachMemoryNV"));
    if (!fn) {
        return;
    }
    fn(buffer, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glNamedBufferPageCommitmentMemNV(JNIEnv* env, jclass, jint buffer, jlong offset, jlong size, jint memory, jlong memOffset, jbyte commit) {
    using Fn = void (*)(jint, jlong, jlong, jint, jlong, jbyte);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glNamedBufferPageCommitmentMemNV"));
    if (!fn) {
        return;
    }
    fn(buffer, offset, size, memory, memOffset, commit);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glNamedBufferStorageExternalEXT(JNIEnv* env, jclass, jint buffer, jlong offset, jlong size, jlong clientBuffer, jint flags) {
    using Fn = void (*)(jint, jlong, jlong, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glNamedBufferStorageExternalEXT"));
    if (!fn) {
        return;
    }
    fn(buffer, offset, size, clientBuffer, flags);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glNamedBufferStorageMemEXT(JNIEnv* env, jclass, jint buffer, jlong size, jint memory, jlong offset) {
    using Fn = void (*)(jint, jlong, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glNamedBufferStorageMemEXT"));
    if (!fn) {
        return;
    }
    fn(buffer, size, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glNamedFramebufferSampleLocationsfvNV(JNIEnv* env, jclass, jint framebuffer, jint start, jint count, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glNamedFramebufferSampleLocationsfvNV"));
    if (!fn) {
        return;
    }
    fn(framebuffer, start, count, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glNamedRenderbufferStorageMultisampleAdvancedAMD(JNIEnv* env, jclass, jint renderbuffer, jint samples, jint storageSamples, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glNamedRenderbufferStorageMultisampleAdvancedAMD"));
    if (!fn) {
        return;
    }
    fn(renderbuffer, samples, storageSamples, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glObjectLabelKHR(JNIEnv* env, jclass, jint identifier, jint name, jint length, jbyteArray label) {
    jbyte* label_elems = env->GetByteArrayElements(label, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glObjectLabelKHR"));
    if (!fn) {
        return;
    }
    fn(identifier, name, length, reinterpret_cast<jbyte*>(label_elems));
    env->ReleaseByteArrayElements(label, label_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glObjectPtrLabelKHR(JNIEnv* env, jclass, jlong ptr, jint length, jbyteArray label) {
    jbyte* label_elems = env->GetByteArrayElements(label, nullptr);
    using Fn = void (*)(jlong, jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glObjectPtrLabelKHR"));
    if (!fn) {
        return;
    }
    fn(ptr, length, reinterpret_cast<jbyte*>(label_elems));
    env->ReleaseByteArrayElements(label, label_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPatchParameteriEXT(JNIEnv* env, jclass, jint pname, jint value) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPatchParameteriEXT"));
    if (!fn) {
        return;
    }
    fn(pname, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPatchParameteriOES(JNIEnv* env, jclass, jint pname, jint value) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPatchParameteriOES"));
    if (!fn) {
        return;
    }
    fn(pname, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathCommandsNV(JNIEnv* env, jclass, jint path, jint numCommands, jbyteArray commands, jint numCoords, jint coordType, jlong coords) {
    jbyte* commands_elems = env->GetByteArrayElements(commands, nullptr);
    using Fn = void (*)(jint, jint, jbyte*, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPathCommandsNV"));
    if (!fn) {
        return;
    }
    fn(path, numCommands, reinterpret_cast<jbyte*>(commands_elems), numCoords, coordType, coords);
    env->ReleaseByteArrayElements(commands, commands_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathCoordsNV(JNIEnv* env, jclass, jint path, jint numCoords, jint coordType, jlong coords) {
    using Fn = void (*)(jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPathCoordsNV"));
    if (!fn) {
        return;
    }
    fn(path, numCoords, coordType, coords);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathCoverDepthFuncNV(JNIEnv* env, jclass, jint func) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPathCoverDepthFuncNV"));
    if (!fn) {
        return;
    }
    fn(func);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathDashArrayNV(JNIEnv* env, jclass, jint path, jint dashCount, jfloatArray dashArray) {
    jfloat* dashArray_elems = env->GetFloatArrayElements(dashArray, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPathDashArrayNV"));
    if (!fn) {
        return;
    }
    fn(path, dashCount, reinterpret_cast<jfloat*>(dashArray_elems));
    env->ReleaseFloatArrayElements(dashArray, dashArray_elems, 0);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathGlyphIndexArrayNV(JNIEnv* env, jclass, jint firstPathName, jint fontTarget, jlong fontName, jint fontStyle, jint firstGlyphIndex, jint numGlyphs, jint pathParameterTemplate, jfloat emScale) {
    using Fn = jint (*)(jint, jint, jlong, jint, jint, jint, jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPathGlyphIndexArrayNV"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn(firstPathName, fontTarget, fontName, fontStyle, firstGlyphIndex, numGlyphs, pathParameterTemplate, emScale);
    return static_cast<jint>(result);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathGlyphIndexRangeNV(JNIEnv* env, jclass, jint fontTarget, jlong fontName, jint fontStyle, jint pathParameterTemplate, jfloat emScale, jintArray baseAndCount) {
    jint* baseAndCount_elems = env->GetIntArrayElements(baseAndCount, nullptr);
    using Fn = jint (*)(jint, jlong, jint, jint, jfloat, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPathGlyphIndexRangeNV"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn(fontTarget, fontName, fontStyle, pathParameterTemplate, emScale, reinterpret_cast<jint*>(baseAndCount_elems));
    env->ReleaseIntArrayElements(baseAndCount, baseAndCount_elems, 0);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathGlyphRangeNV(JNIEnv* env, jclass, jint firstPathName, jint fontTarget, jlong fontName, jint fontStyle, jint firstGlyph, jint numGlyphs, jint handleMissingGlyphs, jint pathParameterTemplate, jfloat emScale) {
    using Fn = void (*)(jint, jint, jlong, jint, jint, jint, jint, jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPathGlyphRangeNV"));
    if (!fn) {
        return;
    }
    fn(firstPathName, fontTarget, fontName, fontStyle, firstGlyph, numGlyphs, handleMissingGlyphs, pathParameterTemplate, emScale);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathGlyphsNV(JNIEnv* env, jclass, jint firstPathName, jint fontTarget, jlong fontName, jint fontStyle, jint numGlyphs, jint type, jlong charcodes, jint handleMissingGlyphs, jint pathParameterTemplate, jfloat emScale) {
    using Fn = void (*)(jint, jint, jlong, jint, jint, jint, jlong, jint, jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPathGlyphsNV"));
    if (!fn) {
        return;
    }
    fn(firstPathName, fontTarget, fontName, fontStyle, numGlyphs, type, charcodes, handleMissingGlyphs, pathParameterTemplate, emScale);
}

JNIEXPORT jint JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathMemoryGlyphIndexArrayNV(JNIEnv* env, jclass, jint firstPathName, jint fontTarget, jlong fontSize, jlong fontData, jint faceIndex, jint firstGlyphIndex, jint numGlyphs, jint pathParameterTemplate, jfloat emScale) {
    using Fn = jint (*)(jint, jint, jlong, jlong, jint, jint, jint, jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPathMemoryGlyphIndexArrayNV"));
    if (!fn) {
        return static_cast<jint>(0);
    }
    auto result = fn(firstPathName, fontTarget, fontSize, fontData, faceIndex, firstGlyphIndex, numGlyphs, pathParameterTemplate, emScale);
    return static_cast<jint>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathParameterfNV(JNIEnv* env, jclass, jint path, jint pname, jfloat value) {
    using Fn = void (*)(jint, jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPathParameterfNV"));
    if (!fn) {
        return;
    }
    fn(path, pname, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathParameterfvNV(JNIEnv* env, jclass, jint path, jint pname, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPathParameterfvNV"));
    if (!fn) {
        return;
    }
    fn(path, pname, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathParameteriNV(JNIEnv* env, jclass, jint path, jint pname, jint value) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPathParameteriNV"));
    if (!fn) {
        return;
    }
    fn(path, pname, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathParameterivNV(JNIEnv* env, jclass, jint path, jint pname, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPathParameterivNV"));
    if (!fn) {
        return;
    }
    fn(path, pname, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathStencilDepthOffsetNV(JNIEnv* env, jclass, jfloat factor, jfloat units) {
    using Fn = void (*)(jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPathStencilDepthOffsetNV"));
    if (!fn) {
        return;
    }
    fn(factor, units);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathStencilFuncNV(JNIEnv* env, jclass, jint func, jint ref, jint mask) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPathStencilFuncNV"));
    if (!fn) {
        return;
    }
    fn(func, ref, mask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathStringNV(JNIEnv* env, jclass, jint path, jint format, jint length, jlong pathString) {
    using Fn = void (*)(jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPathStringNV"));
    if (!fn) {
        return;
    }
    fn(path, format, length, pathString);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathSubCommandsNV(JNIEnv* env, jclass, jint path, jint commandStart, jint commandsToDelete, jint numCommands, jbyteArray commands, jint numCoords, jint coordType, jlong coords) {
    jbyte* commands_elems = env->GetByteArrayElements(commands, nullptr);
    using Fn = void (*)(jint, jint, jint, jint, jbyte*, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPathSubCommandsNV"));
    if (!fn) {
        return;
    }
    fn(path, commandStart, commandsToDelete, numCommands, reinterpret_cast<jbyte*>(commands_elems), numCoords, coordType, coords);
    env->ReleaseByteArrayElements(commands, commands_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPathSubCoordsNV(JNIEnv* env, jclass, jint path, jint coordStart, jint numCoords, jint coordType, jlong coords) {
    using Fn = void (*)(jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPathSubCoordsNV"));
    if (!fn) {
        return;
    }
    fn(path, coordStart, numCoords, coordType, coords);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPauseTransformFeedback(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPauseTransformFeedback"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPixelStorei(JNIEnv* env, jclass, jint pname, jint param) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPixelStorei"));
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPointAlongPathNV"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPolygonModeNV"));
    if (!fn) {
        return;
    }
    fn(face, mode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPolygonOffset(JNIEnv* env, jclass, jfloat factor, jfloat units) {
    using Fn = void (*)(jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPolygonOffset"));
    if (!fn) {
        return;
    }
    fn(factor, units);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPolygonOffsetClampEXT(JNIEnv* env, jclass, jfloat factor, jfloat units, jfloat clamp) {
    using Fn = void (*)(jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPolygonOffsetClampEXT"));
    if (!fn) {
        return;
    }
    fn(factor, units, clamp);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPopDebugGroupKHR(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPopDebugGroupKHR"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPopGroupMarkerEXT(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPopGroupMarkerEXT"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPrimitiveBoundingBoxEXT(JNIEnv* env, jclass, jfloat minX, jfloat minY, jfloat minZ, jfloat minW, jfloat maxX, jfloat maxY, jfloat maxZ, jfloat maxW) {
    using Fn = void (*)(jfloat, jfloat, jfloat, jfloat, jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPrimitiveBoundingBoxEXT"));
    if (!fn) {
        return;
    }
    fn(minX, minY, minZ, minW, maxX, maxY, maxZ, maxW);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPrimitiveBoundingBoxOES(JNIEnv* env, jclass, jfloat minX, jfloat minY, jfloat minZ, jfloat minW, jfloat maxX, jfloat maxY, jfloat maxZ, jfloat maxW) {
    using Fn = void (*)(jfloat, jfloat, jfloat, jfloat, jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPrimitiveBoundingBoxOES"));
    if (!fn) {
        return;
    }
    fn(minX, minY, minZ, minW, maxX, maxY, maxZ, maxW);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramBinary(JNIEnv* env, jclass, jint program, jint binaryFormat, jlong binary, jint length) {
    using Fn = void (*)(jint, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramBinary"));
    if (!fn) {
        return;
    }
    fn(program, binaryFormat, binary, length);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramBinaryOES(JNIEnv* env, jclass, jint program, jint binaryFormat, jlong binary, jint length) {
    using Fn = void (*)(jint, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramBinaryOES"));
    if (!fn) {
        return;
    }
    fn(program, binaryFormat, binary, length);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramParameteri(JNIEnv* env, jclass, jint program, jint pname, jint value) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramParameteri"));
    if (!fn) {
        return;
    }
    fn(program, pname, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramParameteriEXT(JNIEnv* env, jclass, jint program, jint pname, jint value) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramParameteriEXT"));
    if (!fn) {
        return;
    }
    fn(program, pname, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramPathFragmentInputGenNV(JNIEnv* env, jclass, jint program, jint location, jint genMode, jint components, jfloatArray coeffs) {
    jfloat* coeffs_elems = env->GetFloatArrayElements(coeffs, nullptr);
    using Fn = void (*)(jint, jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramPathFragmentInputGenNV"));
    if (!fn) {
        return;
    }
    fn(program, location, genMode, components, reinterpret_cast<jfloat*>(coeffs_elems));
    env->ReleaseFloatArrayElements(coeffs, coeffs_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform1fEXT(JNIEnv* env, jclass, jint program, jint location, jfloat v0) {
    using Fn = void (*)(jint, jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform1fEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform1fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform1fvEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, count, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform1i64NV(JNIEnv* env, jclass, jint program, jint location, jlong x) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform1i64NV"));
    if (!fn) {
        return;
    }
    fn(program, location, x);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform1i64vNV(JNIEnv* env, jclass, jint program, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform1i64vNV"));
    if (!fn) {
        return;
    }
    fn(program, location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform1iEXT(JNIEnv* env, jclass, jint program, jint location, jint v0) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform1iEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform1ivEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform1ivEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform1ui64NV(JNIEnv* env, jclass, jint program, jint location, jlong x) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform1ui64NV"));
    if (!fn) {
        return;
    }
    fn(program, location, x);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform1ui64vNV(JNIEnv* env, jclass, jint program, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform1ui64vNV"));
    if (!fn) {
        return;
    }
    fn(program, location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform1uiEXT(JNIEnv* env, jclass, jint program, jint location, jint v0) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform1uiEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform1uivEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform1uivEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform2fEXT(JNIEnv* env, jclass, jint program, jint location, jfloat v0, jfloat v1) {
    using Fn = void (*)(jint, jint, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform2fEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0, v1);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform2fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform2fvEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, count, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform2i64NV(JNIEnv* env, jclass, jint program, jint location, jlong x, jlong y) {
    using Fn = void (*)(jint, jint, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform2i64NV"));
    if (!fn) {
        return;
    }
    fn(program, location, x, y);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform2i64vNV(JNIEnv* env, jclass, jint program, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform2i64vNV"));
    if (!fn) {
        return;
    }
    fn(program, location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform2iEXT(JNIEnv* env, jclass, jint program, jint location, jint v0, jint v1) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform2iEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0, v1);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform2ivEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform2ivEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform2ui64NV(JNIEnv* env, jclass, jint program, jint location, jlong x, jlong y) {
    using Fn = void (*)(jint, jint, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform2ui64NV"));
    if (!fn) {
        return;
    }
    fn(program, location, x, y);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform2ui64vNV(JNIEnv* env, jclass, jint program, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform2ui64vNV"));
    if (!fn) {
        return;
    }
    fn(program, location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform2uiEXT(JNIEnv* env, jclass, jint program, jint location, jint v0, jint v1) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform2uiEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0, v1);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform2uivEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform2uivEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform3fEXT(JNIEnv* env, jclass, jint program, jint location, jfloat v0, jfloat v1, jfloat v2) {
    using Fn = void (*)(jint, jint, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform3fEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0, v1, v2);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform3fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform3fvEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, count, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform3i64NV(JNIEnv* env, jclass, jint program, jint location, jlong x, jlong y, jlong z) {
    using Fn = void (*)(jint, jint, jlong, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform3i64NV"));
    if (!fn) {
        return;
    }
    fn(program, location, x, y, z);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform3i64vNV(JNIEnv* env, jclass, jint program, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform3i64vNV"));
    if (!fn) {
        return;
    }
    fn(program, location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform3iEXT(JNIEnv* env, jclass, jint program, jint location, jint v0, jint v1, jint v2) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform3iEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0, v1, v2);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform3ivEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform3ivEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform3ui64NV(JNIEnv* env, jclass, jint program, jint location, jlong x, jlong y, jlong z) {
    using Fn = void (*)(jint, jint, jlong, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform3ui64NV"));
    if (!fn) {
        return;
    }
    fn(program, location, x, y, z);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform3ui64vNV(JNIEnv* env, jclass, jint program, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform3ui64vNV"));
    if (!fn) {
        return;
    }
    fn(program, location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform3uiEXT(JNIEnv* env, jclass, jint program, jint location, jint v0, jint v1, jint v2) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform3uiEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0, v1, v2);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform3uivEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform3uivEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform4fEXT(JNIEnv* env, jclass, jint program, jint location, jfloat v0, jfloat v1, jfloat v2, jfloat v3) {
    using Fn = void (*)(jint, jint, jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform4fEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0, v1, v2, v3);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform4fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform4fvEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, count, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform4i64NV(JNIEnv* env, jclass, jint program, jint location, jlong x, jlong y, jlong z, jlong w) {
    using Fn = void (*)(jint, jint, jlong, jlong, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform4i64NV"));
    if (!fn) {
        return;
    }
    fn(program, location, x, y, z, w);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform4i64vNV(JNIEnv* env, jclass, jint program, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform4i64vNV"));
    if (!fn) {
        return;
    }
    fn(program, location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform4iEXT(JNIEnv* env, jclass, jint program, jint location, jint v0, jint v1, jint v2, jint v3) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform4iEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0, v1, v2, v3);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform4ivEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform4ivEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform4ui64NV(JNIEnv* env, jclass, jint program, jint location, jlong x, jlong y, jlong z, jlong w) {
    using Fn = void (*)(jint, jint, jlong, jlong, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform4ui64NV"));
    if (!fn) {
        return;
    }
    fn(program, location, x, y, z, w);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform4ui64vNV(JNIEnv* env, jclass, jint program, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform4ui64vNV"));
    if (!fn) {
        return;
    }
    fn(program, location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform4uiEXT(JNIEnv* env, jclass, jint program, jint location, jint v0, jint v1, jint v2, jint v3) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform4uiEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, v0, v1, v2, v3);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniform4uivEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniform4uivEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformHandleui64IMG(JNIEnv* env, jclass, jint program, jint location, jlong value) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniformHandleui64IMG"));
    if (!fn) {
        return;
    }
    fn(program, location, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformHandleui64NV(JNIEnv* env, jclass, jint program, jint location, jlong value) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniformHandleui64NV"));
    if (!fn) {
        return;
    }
    fn(program, location, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformHandleui64vIMG(JNIEnv* env, jclass, jint program, jint location, jint count, jlongArray values) {
    jlong* values_elems = env->GetLongArrayElements(values, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniformHandleui64vIMG"));
    if (!fn) {
        return;
    }
    fn(program, location, count, reinterpret_cast<jlong*>(values_elems));
    env->ReleaseLongArrayElements(values, values_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformHandleui64vNV(JNIEnv* env, jclass, jint program, jint location, jint count, jlongArray values) {
    jlong* values_elems = env->GetLongArrayElements(values, nullptr);
    using Fn = void (*)(jint, jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniformHandleui64vNV"));
    if (!fn) {
        return;
    }
    fn(program, location, count, reinterpret_cast<jlong*>(values_elems));
    env->ReleaseLongArrayElements(values, values_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformMatrix2fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniformMatrix2fvEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformMatrix2x3fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniformMatrix2x3fvEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformMatrix2x4fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniformMatrix2x4fvEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformMatrix3fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniformMatrix3fvEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformMatrix3x2fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniformMatrix3x2fvEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformMatrix3x4fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniformMatrix3x4fvEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformMatrix4fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniformMatrix4fvEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformMatrix4x2fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniformMatrix4x2fvEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glProgramUniformMatrix4x3fvEXT(JNIEnv* env, jclass, jint program, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glProgramUniformMatrix4x3fvEXT"));
    if (!fn) {
        return;
    }
    fn(program, location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPushDebugGroupKHR(JNIEnv* env, jclass, jint source, jint id, jint length, jbyteArray message) {
    jbyte* message_elems = env->GetByteArrayElements(message, nullptr);
    using Fn = void (*)(jint, jint, jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPushDebugGroupKHR"));
    if (!fn) {
        return;
    }
    fn(source, id, length, reinterpret_cast<jbyte*>(message_elems));
    env->ReleaseByteArrayElements(message, message_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glPushGroupMarkerEXT(JNIEnv* env, jclass, jint length, jbyteArray marker) {
    jbyte* marker_elems = env->GetByteArrayElements(marker, nullptr);
    using Fn = void (*)(jint, jbyte*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glPushGroupMarkerEXT"));
    if (!fn) {
        return;
    }
    fn(length, reinterpret_cast<jbyte*>(marker_elems));
    env->ReleaseByteArrayElements(marker, marker_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glQueryCounterEXT(JNIEnv* env, jclass, jint id, jint target) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glQueryCounterEXT"));
    if (!fn) {
        return;
    }
    fn(id, target);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glRasterSamplesEXT(JNIEnv* env, jclass, jint samples, jbyte fixedsamplelocations) {
    using Fn = void (*)(jint, jbyte);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glRasterSamplesEXT"));
    if (!fn) {
        return;
    }
    fn(samples, fixedsamplelocations);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glReadBuffer(JNIEnv* env, jclass, jint src) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glReadBuffer"));
    if (!fn) {
        return;
    }
    fn(src);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glReadBufferIndexedEXT(JNIEnv* env, jclass, jint src, jint index) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glReadBufferIndexedEXT"));
    if (!fn) {
        return;
    }
    fn(src, index);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glReadBufferNV(JNIEnv* env, jclass, jint mode) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glReadBufferNV"));
    if (!fn) {
        return;
    }
    fn(mode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glReadPixels(JNIEnv* env, jclass, jint x, jint y, jint width, jint height, jint format, jint type, jlong pixels) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glReadPixels"));
    if (!fn) {
        return;
    }
    fn(x, y, width, height, format, type, pixels);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glReadnPixelsEXT(JNIEnv* env, jclass, jint x, jint y, jint width, jint height, jint format, jint type, jint bufSize, jlong data) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glReadnPixelsEXT"));
    if (!fn) {
        return;
    }
    fn(x, y, width, height, format, type, bufSize, data);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glReadnPixelsKHR(JNIEnv* env, jclass, jint x, jint y, jint width, jint height, jint format, jint type, jint bufSize, jlong data) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glReadnPixelsKHR"));
    if (!fn) {
        return;
    }
    fn(x, y, width, height, format, type, bufSize, data);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glReleaseKeyedMutexWin32EXT(JNIEnv* env, jclass, jint memory, jlong key) {
    using Fn = jbyte (*)(jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glReleaseKeyedMutexWin32EXT"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(memory, key);
    return static_cast<jbyte>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glReleaseShaderCompiler(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glReleaseShaderCompiler"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glRenderbufferStorage(JNIEnv* env, jclass, jint target, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glRenderbufferStorage"));
    if (!fn) {
        return;
    }
    fn(target, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glRenderbufferStorageMultisample(JNIEnv* env, jclass, jint target, jint samples, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glRenderbufferStorageMultisample"));
    if (!fn) {
        return;
    }
    fn(target, samples, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glRenderbufferStorageMultisampleANGLE(JNIEnv* env, jclass, jint target, jint samples, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glRenderbufferStorageMultisampleANGLE"));
    if (!fn) {
        return;
    }
    fn(target, samples, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glRenderbufferStorageMultisampleAPPLE(JNIEnv* env, jclass, jint target, jint samples, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glRenderbufferStorageMultisampleAPPLE"));
    if (!fn) {
        return;
    }
    fn(target, samples, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glRenderbufferStorageMultisampleAdvancedAMD(JNIEnv* env, jclass, jint target, jint samples, jint storageSamples, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glRenderbufferStorageMultisampleAdvancedAMD"));
    if (!fn) {
        return;
    }
    fn(target, samples, storageSamples, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glRenderbufferStorageMultisampleEXT(JNIEnv* env, jclass, jint target, jint samples, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glRenderbufferStorageMultisampleEXT"));
    if (!fn) {
        return;
    }
    fn(target, samples, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glRenderbufferStorageMultisampleIMG(JNIEnv* env, jclass, jint target, jint samples, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glRenderbufferStorageMultisampleIMG"));
    if (!fn) {
        return;
    }
    fn(target, samples, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glRenderbufferStorageMultisampleNV(JNIEnv* env, jclass, jint target, jint samples, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glRenderbufferStorageMultisampleNV"));
    if (!fn) {
        return;
    }
    fn(target, samples, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glResetMemoryObjectParameterNV(JNIEnv* env, jclass, jint memory, jint pname) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glResetMemoryObjectParameterNV"));
    if (!fn) {
        return;
    }
    fn(memory, pname);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glResolveDepthValuesNV(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glResolveDepthValuesNV"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glResolveMultisampleFramebufferAPPLE(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glResolveMultisampleFramebufferAPPLE"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glResumeTransformFeedback(JNIEnv* env, jclass) {
    using Fn = void (*)(void);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glResumeTransformFeedback"));
    if (!fn) {
        return;
    }
    fn();
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSampleCoverage(JNIEnv* env, jclass, jfloat value, jbyte invert) {
    using Fn = void (*)(jfloat, jbyte);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glSampleCoverage"));
    if (!fn) {
        return;
    }
    fn(value, invert);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSamplerParameterIivEXT(JNIEnv* env, jclass, jint sampler, jint pname, jintArray param) {
    jint* param_elems = env->GetIntArrayElements(param, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glSamplerParameterIivEXT"));
    if (!fn) {
        return;
    }
    fn(sampler, pname, reinterpret_cast<jint*>(param_elems));
    env->ReleaseIntArrayElements(param, param_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSamplerParameterIivOES(JNIEnv* env, jclass, jint sampler, jint pname, jintArray param) {
    jint* param_elems = env->GetIntArrayElements(param, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glSamplerParameterIivOES"));
    if (!fn) {
        return;
    }
    fn(sampler, pname, reinterpret_cast<jint*>(param_elems));
    env->ReleaseIntArrayElements(param, param_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSamplerParameterIuivEXT(JNIEnv* env, jclass, jint sampler, jint pname, jintArray param) {
    jint* param_elems = env->GetIntArrayElements(param, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glSamplerParameterIuivEXT"));
    if (!fn) {
        return;
    }
    fn(sampler, pname, reinterpret_cast<jint*>(param_elems));
    env->ReleaseIntArrayElements(param, param_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSamplerParameterIuivOES(JNIEnv* env, jclass, jint sampler, jint pname, jintArray param) {
    jint* param_elems = env->GetIntArrayElements(param, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glSamplerParameterIuivOES"));
    if (!fn) {
        return;
    }
    fn(sampler, pname, reinterpret_cast<jint*>(param_elems));
    env->ReleaseIntArrayElements(param, param_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSamplerParameterf(JNIEnv* env, jclass, jint sampler, jint pname, jfloat param) {
    using Fn = void (*)(jint, jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glSamplerParameterf"));
    if (!fn) {
        return;
    }
    fn(sampler, pname, param);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSamplerParameterfv(JNIEnv* env, jclass, jint sampler, jint pname, jfloatArray param) {
    jfloat* param_elems = env->GetFloatArrayElements(param, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glSamplerParameterfv"));
    if (!fn) {
        return;
    }
    fn(sampler, pname, reinterpret_cast<jfloat*>(param_elems));
    env->ReleaseFloatArrayElements(param, param_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSamplerParameteri(JNIEnv* env, jclass, jint sampler, jint pname, jint param) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glSamplerParameteri"));
    if (!fn) {
        return;
    }
    fn(sampler, pname, param);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSamplerParameteriv(JNIEnv* env, jclass, jint sampler, jint pname, jintArray param) {
    jint* param_elems = env->GetIntArrayElements(param, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glSamplerParameteriv"));
    if (!fn) {
        return;
    }
    fn(sampler, pname, reinterpret_cast<jint*>(param_elems));
    env->ReleaseIntArrayElements(param, param_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glScissor(JNIEnv* env, jclass, jint x, jint y, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glScissor"));
    if (!fn) {
        return;
    }
    fn(x, y, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glScissorArrayvNV(JNIEnv* env, jclass, jint first, jint count, jintArray v) {
    jint* v_elems = env->GetIntArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glScissorArrayvNV"));
    if (!fn) {
        return;
    }
    fn(first, count, reinterpret_cast<jint*>(v_elems));
    env->ReleaseIntArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glScissorArrayvOES(JNIEnv* env, jclass, jint first, jint count, jintArray v) {
    jint* v_elems = env->GetIntArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glScissorArrayvOES"));
    if (!fn) {
        return;
    }
    fn(first, count, reinterpret_cast<jint*>(v_elems));
    env->ReleaseIntArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glScissorExclusiveArrayvNV(JNIEnv* env, jclass, jint first, jint count, jintArray v) {
    jint* v_elems = env->GetIntArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glScissorExclusiveArrayvNV"));
    if (!fn) {
        return;
    }
    fn(first, count, reinterpret_cast<jint*>(v_elems));
    env->ReleaseIntArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glScissorExclusiveNV(JNIEnv* env, jclass, jint x, jint y, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glScissorExclusiveNV"));
    if (!fn) {
        return;
    }
    fn(x, y, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glScissorIndexedNV(JNIEnv* env, jclass, jint index, jint left, jint bottom, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glScissorIndexedNV"));
    if (!fn) {
        return;
    }
    fn(index, left, bottom, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glScissorIndexedOES(JNIEnv* env, jclass, jint index, jint left, jint bottom, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glScissorIndexedOES"));
    if (!fn) {
        return;
    }
    fn(index, left, bottom, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glScissorIndexedvNV(JNIEnv* env, jclass, jint index, jintArray v) {
    jint* v_elems = env->GetIntArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glScissorIndexedvNV"));
    if (!fn) {
        return;
    }
    fn(index, reinterpret_cast<jint*>(v_elems));
    env->ReleaseIntArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glScissorIndexedvOES(JNIEnv* env, jclass, jint index, jintArray v) {
    jint* v_elems = env->GetIntArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glScissorIndexedvOES"));
    if (!fn) {
        return;
    }
    fn(index, reinterpret_cast<jint*>(v_elems));
    env->ReleaseIntArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSelectPerfMonitorCountersAMD(JNIEnv* env, jclass, jint monitor, jbyte enable, jint group, jint numCounters, jintArray counterList) {
    jint* counterList_elems = env->GetIntArrayElements(counterList, nullptr);
    using Fn = void (*)(jint, jbyte, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glSelectPerfMonitorCountersAMD"));
    if (!fn) {
        return;
    }
    fn(monitor, enable, group, numCounters, reinterpret_cast<jint*>(counterList_elems));
    env->ReleaseIntArrayElements(counterList, counterList_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSemaphoreParameterivNV(JNIEnv* env, jclass, jint semaphore, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glSemaphoreParameterivNV"));
    if (!fn) {
        return;
    }
    fn(semaphore, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSemaphoreParameterui64vEXT(JNIEnv* env, jclass, jint semaphore, jint pname, jlongArray params) {
    jlong* params_elems = env->GetLongArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glSemaphoreParameterui64vEXT"));
    if (!fn) {
        return;
    }
    fn(semaphore, pname, reinterpret_cast<jlong*>(params_elems));
    env->ReleaseLongArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSetFenceNV(JNIEnv* env, jclass, jint fence, jint condition) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glSetFenceNV"));
    if (!fn) {
        return;
    }
    fn(fence, condition);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glShaderBinary(JNIEnv* env, jclass, jint count, jintArray shaders, jint binaryFormat, jlong binary, jint length) {
    jint* shaders_elems = env->GetIntArrayElements(shaders, nullptr);
    using Fn = void (*)(jint, jint*, jint, jlong, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glShaderBinary"));
    if (!fn) {
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glShaderSource"));
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glShadingRateImageBarrierNV"));
    if (!fn) {
        return;
    }
    fn(synchronize);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glShadingRateImagePaletteNV(JNIEnv* env, jclass, jint viewport, jint first, jint count, jintArray rates) {
    jint* rates_elems = env->GetIntArrayElements(rates, nullptr);
    using Fn = void (*)(jint, jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glShadingRateImagePaletteNV"));
    if (!fn) {
        return;
    }
    fn(viewport, first, count, reinterpret_cast<jint*>(rates_elems));
    env->ReleaseIntArrayElements(rates, rates_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glShadingRateQCOM(JNIEnv* env, jclass, jint rate) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glShadingRateQCOM"));
    if (!fn) {
        return;
    }
    fn(rate);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glShadingRateSampleOrderCustomNV(JNIEnv* env, jclass, jint rate, jint samples, jintArray locations) {
    jint* locations_elems = env->GetIntArrayElements(locations, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glShadingRateSampleOrderCustomNV"));
    if (!fn) {
        return;
    }
    fn(rate, samples, reinterpret_cast<jint*>(locations_elems));
    env->ReleaseIntArrayElements(locations, locations_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glShadingRateSampleOrderNV(JNIEnv* env, jclass, jint order) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glShadingRateSampleOrderNV"));
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glSignalSemaphoreEXT"));
    if (!fn) {
        return;
    }
    fn(semaphore, numBufferBarriers, reinterpret_cast<jint*>(buffers_elems), numTextureBarriers, reinterpret_cast<jint*>(textures_elems), reinterpret_cast<jint*>(dstLayouts_elems));
    env->ReleaseIntArrayElements(dstLayouts, dstLayouts_elems, 0);
    env->ReleaseIntArrayElements(textures, textures_elems, 0);
    env->ReleaseIntArrayElements(buffers, buffers_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSignalVkFenceNV(JNIEnv* env, jclass, jlong vkFence) {
    using Fn = void (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glSignalVkFenceNV"));
    if (!fn) {
        return;
    }
    fn(vkFence);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSignalVkSemaphoreNV(JNIEnv* env, jclass, jlong vkSemaphore) {
    using Fn = void (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glSignalVkSemaphoreNV"));
    if (!fn) {
        return;
    }
    fn(vkSemaphore);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStartTilingQCOM(JNIEnv* env, jclass, jint x, jint y, jint width, jint height, jint preserveMask) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glStartTilingQCOM"));
    if (!fn) {
        return;
    }
    fn(x, y, width, height, preserveMask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilFillPathInstancedNV(JNIEnv* env, jclass, jint numPaths, jint pathNameType, jlong paths, jint pathBase, jint fillMode, jint mask, jint transformType, jfloatArray transformValues) {
    jfloat* transformValues_elems = env->GetFloatArrayElements(transformValues, nullptr);
    using Fn = void (*)(jint, jint, jlong, jint, jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glStencilFillPathInstancedNV"));
    if (!fn) {
        return;
    }
    fn(numPaths, pathNameType, paths, pathBase, fillMode, mask, transformType, reinterpret_cast<jfloat*>(transformValues_elems));
    env->ReleaseFloatArrayElements(transformValues, transformValues_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilFillPathNV(JNIEnv* env, jclass, jint path, jint fillMode, jint mask) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glStencilFillPathNV"));
    if (!fn) {
        return;
    }
    fn(path, fillMode, mask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilFunc(JNIEnv* env, jclass, jint func, jint ref, jint mask) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glStencilFunc"));
    if (!fn) {
        return;
    }
    fn(func, ref, mask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilFuncSeparate(JNIEnv* env, jclass, jint face, jint func, jint ref, jint mask) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glStencilFuncSeparate"));
    if (!fn) {
        return;
    }
    fn(face, func, ref, mask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilMask(JNIEnv* env, jclass, jint mask) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glStencilMask"));
    if (!fn) {
        return;
    }
    fn(mask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilMaskSeparate(JNIEnv* env, jclass, jint face, jint mask) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glStencilMaskSeparate"));
    if (!fn) {
        return;
    }
    fn(face, mask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilOp(JNIEnv* env, jclass, jint fail, jint zfail, jint zpass) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glStencilOp"));
    if (!fn) {
        return;
    }
    fn(fail, zfail, zpass);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilOpSeparate(JNIEnv* env, jclass, jint face, jint sfail, jint dpfail, jint dppass) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glStencilOpSeparate"));
    if (!fn) {
        return;
    }
    fn(face, sfail, dpfail, dppass);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilStrokePathInstancedNV(JNIEnv* env, jclass, jint numPaths, jint pathNameType, jlong paths, jint pathBase, jint reference, jint mask, jint transformType, jfloatArray transformValues) {
    jfloat* transformValues_elems = env->GetFloatArrayElements(transformValues, nullptr);
    using Fn = void (*)(jint, jint, jlong, jint, jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glStencilStrokePathInstancedNV"));
    if (!fn) {
        return;
    }
    fn(numPaths, pathNameType, paths, pathBase, reference, mask, transformType, reinterpret_cast<jfloat*>(transformValues_elems));
    env->ReleaseFloatArrayElements(transformValues, transformValues_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilStrokePathNV(JNIEnv* env, jclass, jint path, jint reference, jint mask) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glStencilStrokePathNV"));
    if (!fn) {
        return;
    }
    fn(path, reference, mask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilThenCoverFillPathInstancedNV(JNIEnv* env, jclass, jint numPaths, jint pathNameType, jlong paths, jint pathBase, jint fillMode, jint mask, jint coverMode, jint transformType, jfloatArray transformValues) {
    jfloat* transformValues_elems = env->GetFloatArrayElements(transformValues, nullptr);
    using Fn = void (*)(jint, jint, jlong, jint, jint, jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glStencilThenCoverFillPathInstancedNV"));
    if (!fn) {
        return;
    }
    fn(numPaths, pathNameType, paths, pathBase, fillMode, mask, coverMode, transformType, reinterpret_cast<jfloat*>(transformValues_elems));
    env->ReleaseFloatArrayElements(transformValues, transformValues_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilThenCoverFillPathNV(JNIEnv* env, jclass, jint path, jint fillMode, jint mask, jint coverMode) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glStencilThenCoverFillPathNV"));
    if (!fn) {
        return;
    }
    fn(path, fillMode, mask, coverMode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilThenCoverStrokePathInstancedNV(JNIEnv* env, jclass, jint numPaths, jint pathNameType, jlong paths, jint pathBase, jint reference, jint mask, jint coverMode, jint transformType, jfloatArray transformValues) {
    jfloat* transformValues_elems = env->GetFloatArrayElements(transformValues, nullptr);
    using Fn = void (*)(jint, jint, jlong, jint, jint, jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glStencilThenCoverStrokePathInstancedNV"));
    if (!fn) {
        return;
    }
    fn(numPaths, pathNameType, paths, pathBase, reference, mask, coverMode, transformType, reinterpret_cast<jfloat*>(transformValues_elems));
    env->ReleaseFloatArrayElements(transformValues, transformValues_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glStencilThenCoverStrokePathNV(JNIEnv* env, jclass, jint path, jint reference, jint mask, jint coverMode) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glStencilThenCoverStrokePathNV"));
    if (!fn) {
        return;
    }
    fn(path, reference, mask, coverMode);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glSubpixelPrecisionBiasNV(JNIEnv* env, jclass, jint xbits, jint ybits) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glSubpixelPrecisionBiasNV"));
    if (!fn) {
        return;
    }
    fn(xbits, ybits);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glTestFenceNV(JNIEnv* env, jclass, jint fence) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTestFenceNV"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(fence);
    return static_cast<jbyte>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexAttachMemoryNV(JNIEnv* env, jclass, jint target, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexAttachMemoryNV"));
    if (!fn) {
        return;
    }
    fn(target, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexBufferEXT(JNIEnv* env, jclass, jint target, jint internalformat, jint buffer) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexBufferEXT"));
    if (!fn) {
        return;
    }
    fn(target, internalformat, buffer);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexBufferOES(JNIEnv* env, jclass, jint target, jint internalformat, jint buffer) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexBufferOES"));
    if (!fn) {
        return;
    }
    fn(target, internalformat, buffer);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexBufferRangeEXT(JNIEnv* env, jclass, jint target, jint internalformat, jint buffer, jlong offset, jlong size) {
    using Fn = void (*)(jint, jint, jint, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexBufferRangeEXT"));
    if (!fn) {
        return;
    }
    fn(target, internalformat, buffer, offset, size);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexBufferRangeOES(JNIEnv* env, jclass, jint target, jint internalformat, jint buffer, jlong offset, jlong size) {
    using Fn = void (*)(jint, jint, jint, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexBufferRangeOES"));
    if (!fn) {
        return;
    }
    fn(target, internalformat, buffer, offset, size);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexEstimateMotionQCOM(JNIEnv* env, jclass, jint ref, jint target, jint output) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexEstimateMotionQCOM"));
    if (!fn) {
        return;
    }
    fn(ref, target, output);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexEstimateMotionRegionsQCOM(JNIEnv* env, jclass, jint ref, jint target, jint output, jint mask) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexEstimateMotionRegionsQCOM"));
    if (!fn) {
        return;
    }
    fn(ref, target, output, mask);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexImage2D(JNIEnv* env, jclass, jint target, jint level, jint internalformat, jint width, jint height, jint border, jint format, jint type, jlong pixels) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexImage2D"));
    if (!fn) {
        return;
    }
    fn(target, level, internalformat, width, height, border, format, type, pixels);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexImage3D(JNIEnv* env, jclass, jint target, jint level, jint internalformat, jint width, jint height, jint depth, jint border, jint format, jint type, jlong pixels) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexImage3D"));
    if (!fn) {
        return;
    }
    fn(target, level, internalformat, width, height, depth, border, format, type, pixels);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexImage3DOES(JNIEnv* env, jclass, jint target, jint level, jint internalformat, jint width, jint height, jint depth, jint border, jint format, jint type, jlong pixels) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexImage3DOES"));
    if (!fn) {
        return;
    }
    fn(target, level, internalformat, width, height, depth, border, format, type, pixels);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexPageCommitmentEXT(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint zoffset, jint width, jint height, jint depth, jbyte commit) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jbyte);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexPageCommitmentEXT"));
    if (!fn) {
        return;
    }
    fn(target, level, xoffset, yoffset, zoffset, width, height, depth, commit);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexPageCommitmentMemNV(JNIEnv* env, jclass, jint target, jint layer, jint level, jint xoffset, jint yoffset, jint zoffset, jint width, jint height, jint depth, jint memory, jlong offset, jbyte commit) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jlong, jbyte);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexPageCommitmentMemNV"));
    if (!fn) {
        return;
    }
    fn(target, layer, level, xoffset, yoffset, zoffset, width, height, depth, memory, offset, commit);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexParameterIivEXT(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexParameterIivEXT"));
    if (!fn) {
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexParameterIivOES(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexParameterIivOES"));
    if (!fn) {
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexParameterIuivEXT(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexParameterIuivEXT"));
    if (!fn) {
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexParameterIuivOES(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexParameterIuivOES"));
    if (!fn) {
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexParameterf(JNIEnv* env, jclass, jint target, jint pname, jfloat param) {
    using Fn = void (*)(jint, jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexParameterf"));
    if (!fn) {
        return;
    }
    fn(target, pname, param);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexParameterfv(JNIEnv* env, jclass, jint target, jint pname, jfloatArray params) {
    jfloat* params_elems = env->GetFloatArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexParameterfv"));
    if (!fn) {
        return;
    }
    fn(target, pname, reinterpret_cast<jfloat*>(params_elems));
    env->ReleaseFloatArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexParameteri(JNIEnv* env, jclass, jint target, jint pname, jint param) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexParameteri"));
    if (!fn) {
        return;
    }
    fn(target, pname, param);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexParameteriv(JNIEnv* env, jclass, jint target, jint pname, jintArray params) {
    jint* params_elems = env->GetIntArrayElements(params, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexParameteriv"));
    if (!fn) {
        return;
    }
    fn(target, pname, reinterpret_cast<jint*>(params_elems));
    env->ReleaseIntArrayElements(params, params_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexStorage1DEXT(JNIEnv* env, jclass, jint target, jint levels, jint internalformat, jint width) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexStorage1DEXT"));
    if (!fn) {
        return;
    }
    fn(target, levels, internalformat, width);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexStorage2D(JNIEnv* env, jclass, jint target, jint levels, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexStorage2D"));
    if (!fn) {
        return;
    }
    fn(target, levels, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexStorage2DEXT(JNIEnv* env, jclass, jint target, jint levels, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexStorage2DEXT"));
    if (!fn) {
        return;
    }
    fn(target, levels, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexStorage3D(JNIEnv* env, jclass, jint target, jint levels, jint internalformat, jint width, jint height, jint depth) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexStorage3D"));
    if (!fn) {
        return;
    }
    fn(target, levels, internalformat, width, height, depth);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexStorage3DEXT(JNIEnv* env, jclass, jint target, jint levels, jint internalformat, jint width, jint height, jint depth) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexStorage3DEXT"));
    if (!fn) {
        return;
    }
    fn(target, levels, internalformat, width, height, depth);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexStorage3DMultisampleOES(JNIEnv* env, jclass, jint target, jint samples, jint internalformat, jint width, jint height, jint depth, jbyte fixedsamplelocations) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jbyte);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexStorage3DMultisampleOES"));
    if (!fn) {
        return;
    }
    fn(target, samples, internalformat, width, height, depth, fixedsamplelocations);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexStorageMem2DEXT(JNIEnv* env, jclass, jint target, jint levels, jint internalFormat, jint width, jint height, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexStorageMem2DEXT"));
    if (!fn) {
        return;
    }
    fn(target, levels, internalFormat, width, height, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexStorageMem2DMultisampleEXT(JNIEnv* env, jclass, jint target, jint samples, jint internalFormat, jint width, jint height, jbyte fixedSampleLocations, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jbyte, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexStorageMem2DMultisampleEXT"));
    if (!fn) {
        return;
    }
    fn(target, samples, internalFormat, width, height, fixedSampleLocations, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexStorageMem3DEXT(JNIEnv* env, jclass, jint target, jint levels, jint internalFormat, jint width, jint height, jint depth, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexStorageMem3DEXT"));
    if (!fn) {
        return;
    }
    fn(target, levels, internalFormat, width, height, depth, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexStorageMem3DMultisampleEXT(JNIEnv* env, jclass, jint target, jint samples, jint internalFormat, jint width, jint height, jint depth, jbyte fixedSampleLocations, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jbyte, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexStorageMem3DMultisampleEXT"));
    if (!fn) {
        return;
    }
    fn(target, samples, internalFormat, width, height, depth, fixedSampleLocations, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexSubImage2D(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint width, jint height, jint format, jint type, jlong pixels) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexSubImage2D"));
    if (!fn) {
        return;
    }
    fn(target, level, xoffset, yoffset, width, height, format, type, pixels);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexSubImage3D(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint zoffset, jint width, jint height, jint depth, jint format, jint type, jlong pixels) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexSubImage3D"));
    if (!fn) {
        return;
    }
    fn(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, pixels);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexSubImage3DOES(JNIEnv* env, jclass, jint target, jint level, jint xoffset, jint yoffset, jint zoffset, jint width, jint height, jint depth, jint format, jint type, jlong pixels) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexSubImage3DOES"));
    if (!fn) {
        return;
    }
    fn(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, pixels);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTextureAttachMemoryNV(JNIEnv* env, jclass, jint texture, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTextureAttachMemoryNV"));
    if (!fn) {
        return;
    }
    fn(texture, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTextureFoveationParametersQCOM(JNIEnv* env, jclass, jint texture, jint layer, jint focalPoint, jfloat focalX, jfloat focalY, jfloat gainX, jfloat gainY, jfloat foveaArea) {
    using Fn = void (*)(jint, jint, jint, jfloat, jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTextureFoveationParametersQCOM"));
    if (!fn) {
        return;
    }
    fn(texture, layer, focalPoint, focalX, focalY, gainX, gainY, foveaArea);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTexturePageCommitmentMemNV(JNIEnv* env, jclass, jint texture, jint layer, jint level, jint xoffset, jint yoffset, jint zoffset, jint width, jint height, jint depth, jint memory, jlong offset, jbyte commit) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint, jint, jint, jlong, jbyte);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTexturePageCommitmentMemNV"));
    if (!fn) {
        return;
    }
    fn(texture, layer, level, xoffset, yoffset, zoffset, width, height, depth, memory, offset, commit);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTextureStorage1DEXT(JNIEnv* env, jclass, jint texture, jint target, jint levels, jint internalformat, jint width) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTextureStorage1DEXT"));
    if (!fn) {
        return;
    }
    fn(texture, target, levels, internalformat, width);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTextureStorage2DEXT(JNIEnv* env, jclass, jint texture, jint target, jint levels, jint internalformat, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTextureStorage2DEXT"));
    if (!fn) {
        return;
    }
    fn(texture, target, levels, internalformat, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTextureStorage3DEXT(JNIEnv* env, jclass, jint texture, jint target, jint levels, jint internalformat, jint width, jint height, jint depth) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTextureStorage3DEXT"));
    if (!fn) {
        return;
    }
    fn(texture, target, levels, internalformat, width, height, depth);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTextureStorageMem2DEXT(JNIEnv* env, jclass, jint texture, jint levels, jint internalFormat, jint width, jint height, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTextureStorageMem2DEXT"));
    if (!fn) {
        return;
    }
    fn(texture, levels, internalFormat, width, height, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTextureStorageMem2DMultisampleEXT(JNIEnv* env, jclass, jint texture, jint samples, jint internalFormat, jint width, jint height, jbyte fixedSampleLocations, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jbyte, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTextureStorageMem2DMultisampleEXT"));
    if (!fn) {
        return;
    }
    fn(texture, samples, internalFormat, width, height, fixedSampleLocations, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTextureStorageMem3DEXT(JNIEnv* env, jclass, jint texture, jint levels, jint internalFormat, jint width, jint height, jint depth, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTextureStorageMem3DEXT"));
    if (!fn) {
        return;
    }
    fn(texture, levels, internalFormat, width, height, depth, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTextureStorageMem3DMultisampleEXT(JNIEnv* env, jclass, jint texture, jint samples, jint internalFormat, jint width, jint height, jint depth, jbyte fixedSampleLocations, jint memory, jlong offset) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jbyte, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTextureStorageMem3DMultisampleEXT"));
    if (!fn) {
        return;
    }
    fn(texture, samples, internalFormat, width, height, depth, fixedSampleLocations, memory, offset);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTextureViewEXT(JNIEnv* env, jclass, jint texture, jint target, jint origtexture, jint internalformat, jint minlevel, jint numlevels, jint minlayer, jint numlayers) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTextureViewEXT"));
    if (!fn) {
        return;
    }
    fn(texture, target, origtexture, internalformat, minlevel, numlevels, minlayer, numlayers);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTextureViewOES(JNIEnv* env, jclass, jint texture, jint target, jint origtexture, jint internalformat, jint minlevel, jint numlevels, jint minlayer, jint numlayers) {
    using Fn = void (*)(jint, jint, jint, jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTextureViewOES"));
    if (!fn) {
        return;
    }
    fn(texture, target, origtexture, internalformat, minlevel, numlevels, minlayer, numlayers);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTransformFeedbackVaryings(JNIEnv* env, jclass, jint program, jint count, jbyteArray varyings, jint bufferMode) {
    jbyte* varyings_elems = env->GetByteArrayElements(varyings, nullptr);
    using Fn = void (*)(jint, jint, jbyte*, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTransformFeedbackVaryings"));
    if (!fn) {
        return;
    }
    fn(program, count, reinterpret_cast<jbyte*>(varyings_elems), bufferMode);
    env->ReleaseByteArrayElements(varyings, varyings_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glTransformPathNV(JNIEnv* env, jclass, jint resultPath, jint srcPath, jint transformType, jfloatArray transformValues) {
    jfloat* transformValues_elems = env->GetFloatArrayElements(transformValues, nullptr);
    using Fn = void (*)(jint, jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glTransformPathNV"));
    if (!fn) {
        return;
    }
    fn(resultPath, srcPath, transformType, reinterpret_cast<jfloat*>(transformValues_elems));
    env->ReleaseFloatArrayElements(transformValues, transformValues_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform1f(JNIEnv* env, jclass, jint location, jfloat v0) {
    using Fn = void (*)(jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform1f"));
    if (!fn) {
        return;
    }
    fn(location, v0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform1fv(JNIEnv* env, jclass, jint location, jint count, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform1fv"));
    if (!fn) {
        return;
    }
    fn(location, count, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform1i(JNIEnv* env, jclass, jint location, jint v0) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform1i"));
    if (!fn) {
        return;
    }
    fn(location, v0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform1i64NV(JNIEnv* env, jclass, jint location, jlong x) {
    using Fn = void (*)(jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform1i64NV"));
    if (!fn) {
        return;
    }
    fn(location, x);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform1i64vNV(JNIEnv* env, jclass, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform1i64vNV"));
    if (!fn) {
        return;
    }
    fn(location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform1iv(JNIEnv* env, jclass, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform1iv"));
    if (!fn) {
        return;
    }
    fn(location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform1ui(JNIEnv* env, jclass, jint location, jint v0) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform1ui"));
    if (!fn) {
        return;
    }
    fn(location, v0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform1ui64NV(JNIEnv* env, jclass, jint location, jlong x) {
    using Fn = void (*)(jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform1ui64NV"));
    if (!fn) {
        return;
    }
    fn(location, x);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform1ui64vNV(JNIEnv* env, jclass, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform1ui64vNV"));
    if (!fn) {
        return;
    }
    fn(location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform1uiv(JNIEnv* env, jclass, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform1uiv"));
    if (!fn) {
        return;
    }
    fn(location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform2f(JNIEnv* env, jclass, jint location, jfloat v0, jfloat v1) {
    using Fn = void (*)(jint, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform2f"));
    if (!fn) {
        return;
    }
    fn(location, v0, v1);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform2fv(JNIEnv* env, jclass, jint location, jint count, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform2fv"));
    if (!fn) {
        return;
    }
    fn(location, count, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform2i(JNIEnv* env, jclass, jint location, jint v0, jint v1) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform2i"));
    if (!fn) {
        return;
    }
    fn(location, v0, v1);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform2i64NV(JNIEnv* env, jclass, jint location, jlong x, jlong y) {
    using Fn = void (*)(jint, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform2i64NV"));
    if (!fn) {
        return;
    }
    fn(location, x, y);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform2i64vNV(JNIEnv* env, jclass, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform2i64vNV"));
    if (!fn) {
        return;
    }
    fn(location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform2iv(JNIEnv* env, jclass, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform2iv"));
    if (!fn) {
        return;
    }
    fn(location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform2ui(JNIEnv* env, jclass, jint location, jint v0, jint v1) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform2ui"));
    if (!fn) {
        return;
    }
    fn(location, v0, v1);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform2ui64NV(JNIEnv* env, jclass, jint location, jlong x, jlong y) {
    using Fn = void (*)(jint, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform2ui64NV"));
    if (!fn) {
        return;
    }
    fn(location, x, y);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform2ui64vNV(JNIEnv* env, jclass, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform2ui64vNV"));
    if (!fn) {
        return;
    }
    fn(location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform2uiv(JNIEnv* env, jclass, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform2uiv"));
    if (!fn) {
        return;
    }
    fn(location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform3f(JNIEnv* env, jclass, jint location, jfloat v0, jfloat v1, jfloat v2) {
    using Fn = void (*)(jint, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform3f"));
    if (!fn) {
        return;
    }
    fn(location, v0, v1, v2);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform3fv(JNIEnv* env, jclass, jint location, jint count, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform3fv"));
    if (!fn) {
        return;
    }
    fn(location, count, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform3i(JNIEnv* env, jclass, jint location, jint v0, jint v1, jint v2) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform3i"));
    if (!fn) {
        return;
    }
    fn(location, v0, v1, v2);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform3i64NV(JNIEnv* env, jclass, jint location, jlong x, jlong y, jlong z) {
    using Fn = void (*)(jint, jlong, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform3i64NV"));
    if (!fn) {
        return;
    }
    fn(location, x, y, z);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform3i64vNV(JNIEnv* env, jclass, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform3i64vNV"));
    if (!fn) {
        return;
    }
    fn(location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform3iv(JNIEnv* env, jclass, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform3iv"));
    if (!fn) {
        return;
    }
    fn(location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform3ui(JNIEnv* env, jclass, jint location, jint v0, jint v1, jint v2) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform3ui"));
    if (!fn) {
        return;
    }
    fn(location, v0, v1, v2);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform3ui64NV(JNIEnv* env, jclass, jint location, jlong x, jlong y, jlong z) {
    using Fn = void (*)(jint, jlong, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform3ui64NV"));
    if (!fn) {
        return;
    }
    fn(location, x, y, z);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform3ui64vNV(JNIEnv* env, jclass, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform3ui64vNV"));
    if (!fn) {
        return;
    }
    fn(location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform3uiv(JNIEnv* env, jclass, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform3uiv"));
    if (!fn) {
        return;
    }
    fn(location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform4f(JNIEnv* env, jclass, jint location, jfloat v0, jfloat v1, jfloat v2, jfloat v3) {
    using Fn = void (*)(jint, jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform4f"));
    if (!fn) {
        return;
    }
    fn(location, v0, v1, v2, v3);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform4fv(JNIEnv* env, jclass, jint location, jint count, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform4fv"));
    if (!fn) {
        return;
    }
    fn(location, count, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform4i(JNIEnv* env, jclass, jint location, jint v0, jint v1, jint v2, jint v3) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform4i"));
    if (!fn) {
        return;
    }
    fn(location, v0, v1, v2, v3);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform4i64NV(JNIEnv* env, jclass, jint location, jlong x, jlong y, jlong z, jlong w) {
    using Fn = void (*)(jint, jlong, jlong, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform4i64NV"));
    if (!fn) {
        return;
    }
    fn(location, x, y, z, w);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform4i64vNV(JNIEnv* env, jclass, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform4i64vNV"));
    if (!fn) {
        return;
    }
    fn(location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform4iv(JNIEnv* env, jclass, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform4iv"));
    if (!fn) {
        return;
    }
    fn(location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform4ui(JNIEnv* env, jclass, jint location, jint v0, jint v1, jint v2, jint v3) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform4ui"));
    if (!fn) {
        return;
    }
    fn(location, v0, v1, v2, v3);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform4ui64NV(JNIEnv* env, jclass, jint location, jlong x, jlong y, jlong z, jlong w) {
    using Fn = void (*)(jint, jlong, jlong, jlong, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform4ui64NV"));
    if (!fn) {
        return;
    }
    fn(location, x, y, z, w);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform4ui64vNV(JNIEnv* env, jclass, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform4ui64vNV"));
    if (!fn) {
        return;
    }
    fn(location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniform4uiv(JNIEnv* env, jclass, jint location, jint count, jintArray value) {
    jint* value_elems = env->GetIntArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniform4uiv"));
    if (!fn) {
        return;
    }
    fn(location, count, reinterpret_cast<jint*>(value_elems));
    env->ReleaseIntArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformBlockBinding(JNIEnv* env, jclass, jint program, jint uniformBlockIndex, jint uniformBlockBinding) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniformBlockBinding"));
    if (!fn) {
        return;
    }
    fn(program, uniformBlockIndex, uniformBlockBinding);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformHandleui64IMG(JNIEnv* env, jclass, jint location, jlong value) {
    using Fn = void (*)(jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniformHandleui64IMG"));
    if (!fn) {
        return;
    }
    fn(location, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformHandleui64NV(JNIEnv* env, jclass, jint location, jlong value) {
    using Fn = void (*)(jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniformHandleui64NV"));
    if (!fn) {
        return;
    }
    fn(location, value);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformHandleui64vIMG(JNIEnv* env, jclass, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniformHandleui64vIMG"));
    if (!fn) {
        return;
    }
    fn(location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformHandleui64vNV(JNIEnv* env, jclass, jint location, jint count, jlongArray value) {
    jlong* value_elems = env->GetLongArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jlong*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniformHandleui64vNV"));
    if (!fn) {
        return;
    }
    fn(location, count, reinterpret_cast<jlong*>(value_elems));
    env->ReleaseLongArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix2fv(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniformMatrix2fv"));
    if (!fn) {
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix2x3fv(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniformMatrix2x3fv"));
    if (!fn) {
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix2x3fvNV(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniformMatrix2x3fvNV"));
    if (!fn) {
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix2x4fv(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniformMatrix2x4fv"));
    if (!fn) {
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix2x4fvNV(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniformMatrix2x4fvNV"));
    if (!fn) {
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix3fv(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniformMatrix3fv"));
    if (!fn) {
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix3x2fv(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniformMatrix3x2fv"));
    if (!fn) {
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix3x2fvNV(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniformMatrix3x2fvNV"));
    if (!fn) {
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix3x4fv(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniformMatrix3x4fv"));
    if (!fn) {
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix3x4fvNV(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniformMatrix3x4fvNV"));
    if (!fn) {
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix4fv(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniformMatrix4fv"));
    if (!fn) {
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix4x2fv(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniformMatrix4x2fv"));
    if (!fn) {
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix4x2fvNV(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniformMatrix4x2fvNV"));
    if (!fn) {
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix4x3fv(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniformMatrix4x3fv"));
    if (!fn) {
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUniformMatrix4x3fvNV(JNIEnv* env, jclass, jint location, jint count, jbyte transpose, jfloatArray value) {
    jfloat* value_elems = env->GetFloatArrayElements(value, nullptr);
    using Fn = void (*)(jint, jint, jbyte, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUniformMatrix4x3fvNV"));
    if (!fn) {
        return;
    }
    fn(location, count, transpose, reinterpret_cast<jfloat*>(value_elems));
    env->ReleaseFloatArrayElements(value, value_elems, 0);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glUnmapBuffer(JNIEnv* env, jclass, jint target) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUnmapBuffer"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(target);
    return static_cast<jbyte>(result);
}

JNIEXPORT jbyte JNICALL Java_org_ngengine_libjglios_gles_GLES_glUnmapBufferOES(JNIEnv* env, jclass, jint target) {
    using Fn = jbyte (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUnmapBufferOES"));
    if (!fn) {
        return static_cast<jbyte>(0);
    }
    auto result = fn(target);
    return static_cast<jbyte>(result);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUseProgram(JNIEnv* env, jclass, jint program) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUseProgram"));
    if (!fn) {
        return;
    }
    fn(program);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glUseProgramStagesEXT(JNIEnv* env, jclass, jint pipeline, jint stages, jint program) {
    using Fn = void (*)(jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glUseProgramStagesEXT"));
    if (!fn) {
        return;
    }
    fn(pipeline, stages, program);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glValidateProgram(JNIEnv* env, jclass, jint program) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glValidateProgram"));
    if (!fn) {
        return;
    }
    fn(program);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glValidateProgramPipelineEXT(JNIEnv* env, jclass, jint pipeline) {
    using Fn = void (*)(jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glValidateProgramPipelineEXT"));
    if (!fn) {
        return;
    }
    fn(pipeline);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttrib1f(JNIEnv* env, jclass, jint index, jfloat x) {
    using Fn = void (*)(jint, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glVertexAttrib1f"));
    if (!fn) {
        return;
    }
    fn(index, x);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttrib1fv(JNIEnv* env, jclass, jint index, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glVertexAttrib1fv"));
    if (!fn) {
        return;
    }
    fn(index, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttrib2f(JNIEnv* env, jclass, jint index, jfloat x, jfloat y) {
    using Fn = void (*)(jint, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glVertexAttrib2f"));
    if (!fn) {
        return;
    }
    fn(index, x, y);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttrib2fv(JNIEnv* env, jclass, jint index, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glVertexAttrib2fv"));
    if (!fn) {
        return;
    }
    fn(index, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttrib3f(JNIEnv* env, jclass, jint index, jfloat x, jfloat y, jfloat z) {
    using Fn = void (*)(jint, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glVertexAttrib3f"));
    if (!fn) {
        return;
    }
    fn(index, x, y, z);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttrib3fv(JNIEnv* env, jclass, jint index, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glVertexAttrib3fv"));
    if (!fn) {
        return;
    }
    fn(index, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttrib4f(JNIEnv* env, jclass, jint index, jfloat x, jfloat y, jfloat z, jfloat w) {
    using Fn = void (*)(jint, jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glVertexAttrib4f"));
    if (!fn) {
        return;
    }
    fn(index, x, y, z, w);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttrib4fv(JNIEnv* env, jclass, jint index, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glVertexAttrib4fv"));
    if (!fn) {
        return;
    }
    fn(index, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttribDivisor(JNIEnv* env, jclass, jint index, jint divisor) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glVertexAttribDivisor"));
    if (!fn) {
        return;
    }
    fn(index, divisor);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttribDivisorANGLE(JNIEnv* env, jclass, jint index, jint divisor) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glVertexAttribDivisorANGLE"));
    if (!fn) {
        return;
    }
    fn(index, divisor);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttribDivisorEXT(JNIEnv* env, jclass, jint index, jint divisor) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glVertexAttribDivisorEXT"));
    if (!fn) {
        return;
    }
    fn(index, divisor);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttribDivisorNV(JNIEnv* env, jclass, jint index, jint divisor) {
    using Fn = void (*)(jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glVertexAttribDivisorNV"));
    if (!fn) {
        return;
    }
    fn(index, divisor);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttribI4i(JNIEnv* env, jclass, jint index, jint x, jint y, jint z, jint w) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glVertexAttribI4i"));
    if (!fn) {
        return;
    }
    fn(index, x, y, z, w);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttribI4iv(JNIEnv* env, jclass, jint index, jintArray v) {
    jint* v_elems = env->GetIntArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glVertexAttribI4iv"));
    if (!fn) {
        return;
    }
    fn(index, reinterpret_cast<jint*>(v_elems));
    env->ReleaseIntArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttribI4ui(JNIEnv* env, jclass, jint index, jint x, jint y, jint z, jint w) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glVertexAttribI4ui"));
    if (!fn) {
        return;
    }
    fn(index, x, y, z, w);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttribI4uiv(JNIEnv* env, jclass, jint index, jintArray v) {
    jint* v_elems = env->GetIntArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glVertexAttribI4uiv"));
    if (!fn) {
        return;
    }
    fn(index, reinterpret_cast<jint*>(v_elems));
    env->ReleaseIntArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttribIPointer(JNIEnv* env, jclass, jint index, jint size, jint type, jint stride, jlong pointer) {
    using Fn = void (*)(jint, jint, jint, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glVertexAttribIPointer"));
    if (!fn) {
        return;
    }
    fn(index, size, type, stride, pointer);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glVertexAttribPointer(JNIEnv* env, jclass, jint index, jint size, jint type, jbyte normalized, jint stride, jlong pointer) {
    using Fn = void (*)(jint, jint, jint, jbyte, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glVertexAttribPointer"));
    if (!fn) {
        return;
    }
    fn(index, size, type, normalized, stride, pointer);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glViewport(JNIEnv* env, jclass, jint x, jint y, jint width, jint height) {
    using Fn = void (*)(jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glViewport"));
    if (!fn) {
        return;
    }
    fn(x, y, width, height);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glViewportArrayvNV(JNIEnv* env, jclass, jint first, jint count, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glViewportArrayvNV"));
    if (!fn) {
        return;
    }
    fn(first, count, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glViewportArrayvOES(JNIEnv* env, jclass, jint first, jint count, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glViewportArrayvOES"));
    if (!fn) {
        return;
    }
    fn(first, count, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glViewportIndexedfNV(JNIEnv* env, jclass, jint index, jfloat x, jfloat y, jfloat w, jfloat h) {
    using Fn = void (*)(jint, jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glViewportIndexedfNV"));
    if (!fn) {
        return;
    }
    fn(index, x, y, w, h);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glViewportIndexedfOES(JNIEnv* env, jclass, jint index, jfloat x, jfloat y, jfloat w, jfloat h) {
    using Fn = void (*)(jint, jfloat, jfloat, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glViewportIndexedfOES"));
    if (!fn) {
        return;
    }
    fn(index, x, y, w, h);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glViewportIndexedfvNV(JNIEnv* env, jclass, jint index, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glViewportIndexedfvNV"));
    if (!fn) {
        return;
    }
    fn(index, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glViewportIndexedfvOES(JNIEnv* env, jclass, jint index, jfloatArray v) {
    jfloat* v_elems = env->GetFloatArrayElements(v, nullptr);
    using Fn = void (*)(jint, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glViewportIndexedfvOES"));
    if (!fn) {
        return;
    }
    fn(index, reinterpret_cast<jfloat*>(v_elems));
    env->ReleaseFloatArrayElements(v, v_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glViewportPositionWScaleNV(JNIEnv* env, jclass, jint index, jfloat xcoeff, jfloat ycoeff) {
    using Fn = void (*)(jint, jfloat, jfloat);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glViewportPositionWScaleNV"));
    if (!fn) {
        return;
    }
    fn(index, xcoeff, ycoeff);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glViewportSwizzleNV(JNIEnv* env, jclass, jint index, jint swizzlex, jint swizzley, jint swizzlez, jint swizzlew) {
    using Fn = void (*)(jint, jint, jint, jint, jint);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glViewportSwizzleNV"));
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
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glWaitSemaphoreEXT"));
    if (!fn) {
        return;
    }
    fn(semaphore, numBufferBarriers, reinterpret_cast<jint*>(buffers_elems), numTextureBarriers, reinterpret_cast<jint*>(textures_elems), reinterpret_cast<jint*>(srcLayouts_elems));
    env->ReleaseIntArrayElements(srcLayouts, srcLayouts_elems, 0);
    env->ReleaseIntArrayElements(textures, textures_elems, 0);
    env->ReleaseIntArrayElements(buffers, buffers_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glWaitSync(JNIEnv* env, jclass, jlong sync, jint flags, jlong timeout) {
    using Fn = void (*)(jlong, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glWaitSync"));
    if (!fn) {
        return;
    }
    fn(sync, flags, timeout);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glWaitSyncAPPLE(JNIEnv* env, jclass, jlong sync, jint flags, jlong timeout) {
    using Fn = void (*)(jlong, jint, jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glWaitSyncAPPLE"));
    if (!fn) {
        return;
    }
    fn(sync, flags, timeout);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glWaitVkSemaphoreNV(JNIEnv* env, jclass, jlong vkSemaphore) {
    using Fn = void (*)(jlong);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glWaitVkSemaphoreNV"));
    if (!fn) {
        return;
    }
    fn(vkSemaphore);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glWeightPathsNV(JNIEnv* env, jclass, jint resultPath, jint numPaths, jintArray paths, jfloatArray weights) {
    jint* paths_elems = env->GetIntArrayElements(paths, nullptr);
    jfloat* weights_elems = env->GetFloatArrayElements(weights, nullptr);
    using Fn = void (*)(jint, jint, jint*, jfloat*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glWeightPathsNV"));
    if (!fn) {
        return;
    }
    fn(resultPath, numPaths, reinterpret_cast<jint*>(paths_elems), reinterpret_cast<jfloat*>(weights_elems));
    env->ReleaseFloatArrayElements(weights, weights_elems, 0);
    env->ReleaseIntArrayElements(paths, paths_elems, 0);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLES_glWindowRectanglesEXT(JNIEnv* env, jclass, jint mode, jint count, jintArray box) {
    jint* box_elems = env->GetIntArrayElements(box, nullptr);
    using Fn = void (*)(jint, jint, jint*);
    static Fn fn = reinterpret_cast<Fn>(eglGetProcAddress("glWindowRectanglesEXT"));
    if (!fn) {
        return;
    }
    fn(mode, count, reinterpret_cast<jint*>(box_elems));
    env->ReleaseIntArrayElements(box, box_elems, 0);
}

}
