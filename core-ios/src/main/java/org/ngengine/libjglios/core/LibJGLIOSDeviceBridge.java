package org.ngengine.libjglios.core;

public final class LibJGLIOSDeviceBridge {
    private LibJGLIOSDeviceBridge() {
    }

    /** Returns true for the phone and tablet device families, not TV or Mac. */
    public static native boolean isMobileDevice();

    public static native boolean isRumbleSupported();

    public static native void rumble(float amountHigh, float amountLow, float duration);

    public static native void stopRumble();
}
