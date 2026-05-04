package org.ngengine.libjglios.openal.ios;

import java.nio.ByteBuffer;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;

public final class IosAL {
    private IosAL() {
    }

    public static native String alGetString(int parameter);
    public static native int alGenSources();
    public static native int alGetError();
    public static native void alDeleteSources(int numSources, IntBuffer sources);
    public static native void alGenBuffers(int numBuffers, IntBuffer buffers);
    public static native void alDeleteBuffers(int numBuffers, IntBuffer buffers);
    public static native void alSourceStop(int source);
    public static native void alSourcei(int source, int param, int value);
    public static native void alBufferData(int buffer, int format, ByteBuffer data, int size, int frequency);
    public static native void alSourcePlay(int source);
    public static native void alSourcePause(int source);
    public static native void alSourcef(int source, int param, float value);
    public static native void alSource3f(int source, int param, float value1, float value2, float value3);
    public static native int alGetSourcei(int source, int param);
    public static native void alSourceUnqueueBuffers(int source, int numBuffers, IntBuffer buffers);
    public static native void alSourceQueueBuffers(int source, int numBuffers, IntBuffer buffers);
    public static native void alListener(int param, FloatBuffer data);
    public static native void alListenerf(int param, float value);
    public static native void alListener3f(int param, float value1, float value2, float value3);
    public static native void alSource3i(int source, int param, int value1, int value2, int value3);
}
