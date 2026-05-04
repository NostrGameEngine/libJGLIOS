package org.ngengine.libjglios.openal.ios;

import java.nio.IntBuffer;

public final class IosEFX {
    private IosEFX() {
    }

    public static native void alGenAuxiliaryEffectSlots(int numSlots, IntBuffer buffers);
    public static native void alGenEffects(int numEffects, IntBuffer buffers);
    public static native void alEffecti(int effect, int param, int value);
    public static native void alAuxiliaryEffectSloti(int effectSlot, int param, int value);
    public static native void alDeleteEffects(int numEffects, IntBuffer buffers);
    public static native void alDeleteAuxiliaryEffectSlots(int numEffectSlots, IntBuffer buffers);
    public static native void alGenFilters(int numFilters, IntBuffer buffers);
    public static native void alFilteri(int filter, int param, int value);
    public static native void alFilterf(int filter, int param, float value);
    public static native void alDeleteFilters(int numFilters, IntBuffer buffers);
    public static native void alEffectf(int effect, int param, float value);
}
