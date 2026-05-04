package org.ngengine.libjglios.core;

public final class LibJGLIOSEglBridge {
    private LibJGLIOSEglBridge() {
    }

    public static native int initWithMetalLayer(long metalLayer);

    public static native boolean makeCurrent();

    public static native void swapBuffers();

    public static native int framebufferWidth();

    public static native int framebufferHeight();

    public static native String lastError();

    public static native void shutdown();
}
