package org.ngengine.libjglios.core;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class LibJGLIOSDeviceBridgeTest {
    @Test
    void exposesNativeMobileClassification() throws Exception {
        Method method = LibJGLIOSDeviceBridge.class.getDeclaredMethod("isMobileDevice");
        assertEquals(boolean.class, method.getReturnType());
        assertTrue(Modifier.isPublic(method.getModifiers()));
        assertTrue(Modifier.isStatic(method.getModifiers()));
        assertTrue(Modifier.isNative(method.getModifiers()));
    }
}
