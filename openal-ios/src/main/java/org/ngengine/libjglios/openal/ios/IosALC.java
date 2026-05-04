package org.ngengine.libjglios.openal.ios;

import java.nio.IntBuffer;

public final class IosALC {
    private IosALC() {
    }

    public static native void createALC();
    public static native void destroyALC();
    public static native boolean isCreated();
    public static native String alcGetString(int parameter);
    public static native boolean alcIsExtensionPresent(String extension);
    public static native void alcGetInteger(int param, IntBuffer buffer, int size);
    public static native void alcDevicePauseSOFT();
    public static native void alcDeviceResumeSOFT();
}
