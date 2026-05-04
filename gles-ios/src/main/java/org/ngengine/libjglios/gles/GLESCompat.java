package org.ngengine.libjglios.gles;

public final class GLESCompat {
    private GLESCompat() {
    }

    public static native void glBufferDataFloats(int target, float[] data, int usage);
    public static native void glBufferDataShorts(int target, short[] data, int usage);

    public static void glShaderSourceString(int shader, String source) {
        byte[] bytes = source.getBytes(java.nio.charset.StandardCharsets.UTF_8);
        int[] length = {bytes.length};
        org.ngengine.libjglios.gles.GLES.glShaderSource(shader, 1, bytes, length);
    }
}
