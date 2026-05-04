package org.ngengine.libjglios.core;

public final class LibJGLIOSLifecycleBridge {
    private LibJGLIOSLifecycleBridge() {
    }

    public static native void requestQuit();

    public static native void showError(String title, String message);
}
