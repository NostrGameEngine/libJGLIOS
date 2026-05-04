package org.ngengine.libjglios.core;

public final class LibJGLIOSKeyboardBridge {
    private LibJGLIOSKeyboardBridge() {
    }

    public static native boolean setSoftwareKeyboardVisible(boolean visible);
}
