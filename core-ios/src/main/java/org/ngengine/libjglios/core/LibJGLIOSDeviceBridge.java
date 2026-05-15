package org.ngengine.libjglios.core;

public final class LibJGLIOSDeviceBridge {
    private LibJGLIOSDeviceBridge() {
    }

    public static native boolean isRumbleSupported();

    public static native void setRumble(float amount);
}
