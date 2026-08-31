package org.ngengine.libjglios.core;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class LibJGLIOSInputBridgeTest {
    @Test
    void exposesKeyboardIdentityInTheInputPayload() {
        assertEquals(6, LibJGLIOSInputBridge.INT_DATA_SIZE);
        assertEquals(5, LibJGLIOSInputBridge.KEY_EVENT_KEYBOARD_ID_INDEX);
        assertEquals(4, LibJGLIOSInputBridge.FLOAT_DATA_SIZE);
    }
}
