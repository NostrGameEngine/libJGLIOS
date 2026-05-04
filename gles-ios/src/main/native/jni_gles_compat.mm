#include <jni.h>

#include <GLES2/gl2.h>
#include <GLES3/gl3.h>

extern "C" {

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLESCompat_glBufferDataFloats
  (JNIEnv* env, jclass, jint target, jfloatArray dataArray, jint usage) {
    jsize count = env->GetArrayLength(dataArray);
    jfloat* values = env->GetFloatArrayElements(dataArray, nullptr);
    glBufferData(static_cast<GLenum>(target), static_cast<GLsizeiptr>(count * sizeof(jfloat)), values, static_cast<GLenum>(usage));
    env->ReleaseFloatArrayElements(dataArray, values, JNI_ABORT);
}

JNIEXPORT void JNICALL Java_org_ngengine_libjglios_gles_GLESCompat_glBufferDataShorts
  (JNIEnv* env, jclass, jint target, jshortArray dataArray, jint usage) {
    jsize count = env->GetArrayLength(dataArray);
    jshort* values = env->GetShortArrayElements(dataArray, nullptr);
    glBufferData(static_cast<GLenum>(target), static_cast<GLsizeiptr>(count * sizeof(jshort)), values, static_cast<GLenum>(usage));
    env->ReleaseShortArrayElements(dataArray, values, JNI_ABORT);
}

}
