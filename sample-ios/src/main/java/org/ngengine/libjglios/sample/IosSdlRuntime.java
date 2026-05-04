package org.ngengine.libjglios.sample;

import org.ngengine.libjglios.core.LibJGLIOSEglBridge;

public final class IosSdlRuntime {
    private static int framebufferWidth;
    private static int framebufferHeight;
    private static String lastError = "";

    private IosSdlRuntime() {
    }

    public static int init(int width, int height) {
        if (!LibJGLIOSEglBridge.makeCurrent()) {
            lastError = LibJGLIOSEglBridge.lastError();
            return -1;
        }

        updateFramebufferSize();
        lastError = "";
        return 0;
    }

    public static void pollEvents() {
        updateFramebufferSize();
    }

    public static void swapBuffers() {
        LibJGLIOSEglBridge.swapBuffers();
    }

    public static int framebufferWidth() {
        return framebufferWidth;
    }

    public static int framebufferHeight() {
        return framebufferHeight;
    }

    public static String lastError() {
        return lastError;
    }

    public static void shutdown() {
    }

    private static void updateFramebufferSize() {
        framebufferWidth = Math.max(1, LibJGLIOSEglBridge.framebufferWidth());
        framebufferHeight = Math.max(1, LibJGLIOSEglBridge.framebufferHeight());
    }
}
