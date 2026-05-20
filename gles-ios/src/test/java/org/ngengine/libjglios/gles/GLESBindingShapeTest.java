package org.ngengine.libjglios.gles;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.nio.Buffer;
import java.nio.IntBuffer;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

class GLESBindingShapeTest {
    @Test
    void exposesCoreEglAndGlesApis() throws Exception {
        assertEquals(0x00004000, GLES.GL_COLOR_BUFFER_BIT);
        assertEquals(0x0004, GLES.GL_TRIANGLES);
        assertEquals(0, GLES.GL_NO_ERROR);

        assertNative("glActiveTexture", int.class);
        assertNative("glBindTexture", int.class, int.class);
        assertNative("glClear", int.class);
        assertNative("glDrawArrays", int.class, int.class, int.class);
        assertNative("glShaderSource", int.class, int.class, byte[].class, int[].class);

        assertNative("glGenBuffers", int.class, IntBuffer.class);
        assertNative("glGenFramebuffers", int.class, IntBuffer.class);
        assertNative("glGenRenderbuffers", int.class, IntBuffer.class);
        assertNative("glGenTextures", int.class, IntBuffer.class);
        assertNative("glGenQueries", int.class, IntBuffer.class);
        assertNative("glDeleteBuffers", int.class, IntBuffer.class);
        assertNative("glDeleteFramebuffers", int.class, IntBuffer.class);
        assertNative("glDeleteRenderbuffers", int.class, IntBuffer.class);
        assertNative("glDeleteTextures", int.class, IntBuffer.class);
        assertNative("glDeleteQueries", int.class, IntBuffer.class);
        assertNative("glBufferData", int.class, long.class, Buffer.class, int.class);
    }

    private static void assertNative(String name, Class<?>... parameterTypes) throws Exception {
        Method method = GLES.class.getDeclaredMethod(name, parameterTypes);
        int modifiers = method.getModifiers();
        assertTrue(Modifier.isStatic(modifiers), name + " must be static");
        assertTrue(Modifier.isNative(modifiers), name + " must be native");
    }
}
