package org.ngengine.libjglios.core;

public final class LibJGLIOSInputBridge {
    public static final int EVENT_NONE = 0;
    public static final int EVENT_TOUCH_DOWN = 1;
    public static final int EVENT_TOUCH_UP = 2;
    public static final int EVENT_TOUCH_MOVE = 3;
    public static final int EVENT_MOUSE_BUTTON = 4;
    public static final int EVENT_MOUSE_MOTION = 5;
    public static final int EVENT_KEY = 6;
    public static final int EVENT_GAMEPAD_ADDED = 7;
    public static final int EVENT_GAMEPAD_REMOVED = 8;
    public static final int EVENT_GAMEPAD_AXIS = 9;
    public static final int EVENT_GAMEPAD_BUTTON = 10;
    public static final int EVENT_TEXT_INPUT = 11;

    private LibJGLIOSInputBridge() {
    }

    public static native boolean pollEvent(int[] intData, float[] floatData);
}
