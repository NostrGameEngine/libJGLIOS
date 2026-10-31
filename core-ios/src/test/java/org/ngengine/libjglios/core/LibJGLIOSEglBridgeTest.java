package org.ngengine.libjglios.core;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

class LibJGLIOSEglBridgeTest {
    @Test
    void exposesExactContextVersionSelection() throws Exception {
        Method method = LibJGLIOSEglBridge.class.getDeclaredMethod(
                "configureGlesVersion", int.class, int.class);
        assertEquals(void.class, method.getReturnType());
        assertTrue(Modifier.isPublic(method.getModifiers()));
        assertTrue(Modifier.isStatic(method.getModifiers()));
        assertTrue(Modifier.isNative(method.getModifiers()));
    }
}
