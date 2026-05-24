package org.ngengine.libjglios.core;

public final class LibJGLIOSEglBridge {
    private LibJGLIOSEglBridge() {
    }

    public static native int initWithMetalLayer(long metalLayer);

    public static native boolean makeCurrent();

    public static native void swapBuffers();

    public static native int framebufferWidth();

    public static native int framebufferHeight();

    public static native int windowWidth();

    public static native int windowHeight();

    public static native float displayScale();

    public static native String lastError();

    public static native void shutdown();
}
