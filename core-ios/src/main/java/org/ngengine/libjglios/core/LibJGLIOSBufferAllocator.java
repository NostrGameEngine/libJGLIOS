package org.ngengine.libjglios.core;

import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.DoubleBuffer;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;
import java.nio.LongBuffer;
import java.nio.ShortBuffer;

public final class LibJGLIOSBufferAllocator {
    private LibJGLIOSBufferAllocator() {
    }

    public static native ByteBuffer allocate(int size);

    public static native void free(Buffer buffer);

    public static long address(Buffer buffer) {
        long baseAddress = baseAddress(buffer);
        if (baseAddress == 0 || buffer == null) {
            return 0;
        }
        return baseAddress + (long) buffer.position() * elementSize(buffer);
    }

    private static int elementSize(Buffer buffer) {
        if (buffer instanceof ByteBuffer) {
            return 1;
        } else if (buffer instanceof ShortBuffer || buffer instanceof CharBuffer) {
            return 2;
        } else if (buffer instanceof IntBuffer || buffer instanceof FloatBuffer) {
            return 4;
        } else if (buffer instanceof LongBuffer || buffer instanceof DoubleBuffer) {
            return 8;
        }
        throw new IllegalArgumentException("Unsupported direct buffer type: " + buffer.getClass().getName());
    }

    private static native long baseAddress(Buffer buffer);
}
