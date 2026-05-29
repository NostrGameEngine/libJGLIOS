package org.ngengine.libjglios.core;

public final class LibJGLIOSPlatformBridge {
    private LibJGLIOSPlatformBridge() {
    }

    public static native boolean setClipboardString(String value);

    public static native String getClipboardString();

    public static native boolean openURL(String url);
}
