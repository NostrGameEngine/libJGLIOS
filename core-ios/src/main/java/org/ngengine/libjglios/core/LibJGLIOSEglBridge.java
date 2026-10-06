package org.ngengine.libjglios.core;

public final class LibJGLIOSEglBridge {
    private LibJGLIOSEglBridge() {
    }

    public static native int initWithMetalLayer(long metalLayer);

    public static native int initializeGraphics();

    public static native boolean isInitialized();

    public static native void configureWindow(boolean highPixelDensity);

    /** Request EDR before initializing graphics; requires matching native core and HDR-capable ANGLE. */
    public static native void configureHdr(boolean enabled);

    public static native boolean isHdrOutputEnabled();

    /** Current, not potential, headroom above diffuse white. May change with brightness/thermal limits. */
    public static native float hdrHeadroom();

    public static native void configureDefaultFramebuffer(
            int redBits,
            int greenBits,
            int blueBits,
            int alphaBits,
            int depthBits,
            int stencilBits,
            int samples);

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
