package org.ngengine.libjglios.sdl3;

public final class SDL3 {
    private SDL3() {
    }

                                            public static final int
                                                SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK = 0xFFFFFFFF,
                                                SDL_AUDIO_DEVICE_DEFAULT_RECORDING = 0xFFFFFFFE,
                                                SDL_AUDIO_F32BE = 0x9120,
                                                SDL_AUDIO_F32LE = 0x8120,
                                                SDL_AUDIO_S16BE = 0x9010,
                                                SDL_AUDIO_S16LE = 0x8010,
                                                SDL_AUDIO_S32BE = 0x9020,
                                                SDL_AUDIO_S32LE = 0x8020,
                                                SDL_AUDIO_S8 = 0x8008,
                                                SDL_AUDIO_U8 = 0x0008,
                                                SDL_AUDIO_UNKNOWN = 0x0000,
                                                SDL_AUDIO_S16 = SDL_AUDIO_S16LE,
                                                SDL_AUDIO_S32 = SDL_AUDIO_S32LE,
                                                SDL_AUDIO_F32 = SDL_AUDIO_F32LE,
                                                SDL_BUTTON_LEFT = 1,
                                                SDL_BUTTON_MIDDLE = 2,
                                                SDL_BUTTON_RIGHT = 3,
                                                SDL_EVENT_FINGER_DOWN = 0x700,
                                                SDL_EVENT_FINGER_MOTION = 0x702,
                                                SDL_EVENT_FINGER_UP = 0x701,
                                                SDL_EVENT_GAMEPAD_ADDED = 1619,
                                                SDL_EVENT_GAMEPAD_AXIS_MOTION = 0x650,
                                                SDL_EVENT_GAMEPAD_BUTTON_DOWN = 0x651,
                                                SDL_EVENT_GAMEPAD_BUTTON_UP = 0x652,
                                                SDL_EVENT_GAMEPAD_REMOVED = 1620,
                                                SDL_GAMEPAD_AXIS_LEFTX = 0,
                                                SDL_GAMEPAD_AXIS_LEFTY = 1,
                                                SDL_GAMEPAD_AXIS_RIGHTX = 2,
                                                SDL_GAMEPAD_AXIS_RIGHTY = 3,
                                                SDL_GAMEPAD_AXIS_LEFT_TRIGGER = 4,
                                                SDL_GAMEPAD_AXIS_RIGHT_TRIGGER = 5,
                                                SDL_GAMEPAD_AXIS_COUNT = 6,
                                                SDL_GAMEPAD_BUTTON_SOUTH = 0,
                                                SDL_GAMEPAD_BUTTON_EAST = 1,
                                                SDL_GAMEPAD_BUTTON_WEST = 2,
                                                SDL_GAMEPAD_BUTTON_NORTH = 3,
                                                SDL_GAMEPAD_BUTTON_BACK = 4,
                                                SDL_GAMEPAD_BUTTON_GUIDE = 5,
                                                SDL_GAMEPAD_BUTTON_START = 6,
                                                SDL_GAMEPAD_BUTTON_LEFT_STICK = 7,
                                                SDL_GAMEPAD_BUTTON_RIGHT_STICK = 8,
                                                SDL_GAMEPAD_BUTTON_LEFT_SHOULDER = 9,
                                                SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER = 10,
                                                SDL_GAMEPAD_BUTTON_DPAD_UP = 11,
                                                SDL_GAMEPAD_BUTTON_DPAD_DOWN = 12,
                                                SDL_GAMEPAD_BUTTON_DPAD_LEFT = 13,
                                                SDL_GAMEPAD_BUTTON_DPAD_RIGHT = 14,
                                                SDL_GAMEPAD_BUTTON_COUNT = 22,
                                                SDL_GAMEPAD_BUTTON_LABEL_UNKNOWN = 0,
                                                SDL_GAMEPAD_BUTTON_LABEL_A = 1,
                                                SDL_GAMEPAD_BUTTON_LABEL_B = 2,
                                                SDL_GAMEPAD_BUTTON_LABEL_X = 3,
                                                SDL_GAMEPAD_BUTTON_LABEL_Y = 4,
                                                SDL_GAMEPAD_BUTTON_LABEL_CROSS = 5,
                                                SDL_GAMEPAD_BUTTON_LABEL_CIRCLE = 6,
                                                SDL_GAMEPAD_BUTTON_LABEL_SQUARE = 7,
                                                SDL_GAMEPAD_BUTTON_LABEL_TRIANGLE = 8,
                                                SDL_EVENT_JOYSTICK_ADDED = 1541,
                                                SDL_EVENT_JOYSTICK_AXIS_MOTION = 0x600,
                                                SDL_EVENT_JOYSTICK_BUTTON_DOWN = 0x603,
                                                SDL_EVENT_JOYSTICK_BUTTON_UP = 0x604,
                                                SDL_EVENT_JOYSTICK_REMOVED = 1542,
                                                SDL_EVENT_KEY_DOWN = 768,
                                                SDL_EVENT_KEY_UP = 769,
                                                SDL_EVENT_MOUSE_BUTTON_DOWN = 1025,
                                                SDL_EVENT_MOUSE_BUTTON_UP = 1026,
                                                SDL_EVENT_MOUSE_MOTION = 1024,
                                                SDL_EVENT_MOUSE_WHEEL = 1027,
                                                SDL_EVENT_QUIT = 256,
                                                SDL_EVENT_TEXT_INPUT = 771,
                                                SDL_EVENT_WINDOW_CLOSE_REQUESTED = 528,
                                                SDL_EVENT_WINDOW_DESTROYED = 537,
                                                SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED = 532,
                                                SDL_EVENT_WINDOW_FIRST = 514,
                                                SDL_EVENT_WINDOW_FOCUS_GAINED = 526,
                                                SDL_EVENT_WINDOW_FOCUS_LOST = 527,
                                                SDL_EVENT_WINDOW_LAST = 538,
                                                SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED = 519,
                                                SDL_EVENT_WINDOW_RESIZED = 518,
                                                SDL_GL_ALPHA_SIZE = 3,
                                                SDL_GL_BLUE_SIZE = 2,
                                                SDL_GL_CONTEXT_DEBUG_FLAG = 1,
                                                SDL_GL_CONTEXT_FLAGS = 19,
                                                SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG = 2,
                                                SDL_GL_CONTEXT_MAJOR_VERSION = 17,
                                                SDL_GL_CONTEXT_MINOR_VERSION = 18,
                                                SDL_GL_CONTEXT_PROFILE_CORE = 1,
                                                SDL_GL_CONTEXT_PROFILE_ES = 4,
                                                SDL_GL_CONTEXT_PROFILE_MASK = 20,
                                                SDL_GL_DEPTH_SIZE = 6,
                                                SDL_GL_DOUBLEBUFFER = 5,
                                                SDL_GL_FRAMEBUFFER_SRGB_CAPABLE = 22,
                                                SDL_GL_GREEN_SIZE = 1,
                                                SDL_GL_MULTISAMPLEBUFFERS = 13,
                                                SDL_GL_MULTISAMPLESAMPLES = 14,
                                                SDL_GL_RED_SIZE = 0,
                                                SDL_GL_STENCIL_SIZE = 7,
                                                SDL_INIT_AUDIO = 0x00000010,
                                                SDL_INIT_EVENTS = 16384,
                                                SDL_INIT_GAMEPAD = 0x00002000,
                                                SDL_INIT_JOYSTICK = 0x00000200,
                                                SDL_INIT_VIDEO = 32,
                                                SDL_PIXELFORMAT_RGBA32 = 376840196,
                                                SDL_SCANCODE_0 = 39,
                                                SDL_SCANCODE_1 = 30,
                                                SDL_SCANCODE_2 = 31,
                                                SDL_SCANCODE_3 = 32,
                                                SDL_SCANCODE_4 = 33,
                                                SDL_SCANCODE_5 = 34,
                                                SDL_SCANCODE_6 = 35,
                                                SDL_SCANCODE_7 = 36,
                                                SDL_SCANCODE_8 = 37,
                                                SDL_SCANCODE_9 = 38,
                                                SDL_SCANCODE_A = 4,
                                                SDL_SCANCODE_APOSTROPHE = 52,
                                                SDL_SCANCODE_B = 5,
                                                SDL_SCANCODE_BACKSLASH = 49,
                                                SDL_SCANCODE_BACKSPACE = 42,
                                                SDL_SCANCODE_C = 6,
                                                SDL_SCANCODE_CAPSLOCK = 57,
                                                SDL_SCANCODE_COMMA = 54,
                                                SDL_SCANCODE_COUNT = 512,
                                                SDL_SCANCODE_D = 7,
                                                SDL_SCANCODE_DELETE = 76,
                                                SDL_SCANCODE_DOWN = 81,
                                                SDL_SCANCODE_E = 8,
                                                SDL_SCANCODE_END = 77,
                                                SDL_SCANCODE_EQUALS = 46,
                                                SDL_SCANCODE_ESCAPE = 41,
                                                SDL_SCANCODE_F = 9,
                                                SDL_SCANCODE_F1 = 58,
                                                SDL_SCANCODE_F10 = 67,
                                                SDL_SCANCODE_F11 = 68,
                                                SDL_SCANCODE_F12 = 69,
                                                SDL_SCANCODE_F13 = 104,
                                                SDL_SCANCODE_F14 = 105,
                                                SDL_SCANCODE_F15 = 106,
                                                SDL_SCANCODE_F2 = 59,
                                                SDL_SCANCODE_F3 = 60,
                                                SDL_SCANCODE_F4 = 61,
                                                SDL_SCANCODE_F5 = 62,
                                                SDL_SCANCODE_F6 = 63,
                                                SDL_SCANCODE_F7 = 64,
                                                SDL_SCANCODE_F8 = 65,
                                                SDL_SCANCODE_F9 = 66,
                                                SDL_SCANCODE_G = 10,
                                                SDL_SCANCODE_GRAVE = 53,
                                                SDL_SCANCODE_H = 11,
                                                SDL_SCANCODE_HOME = 74,
                                                SDL_SCANCODE_I = 12,
                                                SDL_SCANCODE_INSERT = 73,
                                                SDL_SCANCODE_J = 13,
                                                SDL_SCANCODE_K = 14,
                                                SDL_SCANCODE_KP_0 = 98,
                                                SDL_SCANCODE_KP_1 = 89,
                                                SDL_SCANCODE_KP_2 = 90,
                                                SDL_SCANCODE_KP_3 = 91,
                                                SDL_SCANCODE_KP_4 = 92,
                                                SDL_SCANCODE_KP_5 = 93,
                                                SDL_SCANCODE_KP_6 = 94,
                                                SDL_SCANCODE_KP_7 = 95,
                                                SDL_SCANCODE_KP_8 = 96,
                                                SDL_SCANCODE_KP_9 = 97,
                                                SDL_SCANCODE_KP_DIVIDE = 84,
                                                SDL_SCANCODE_KP_ENTER = 88,
                                                SDL_SCANCODE_KP_MINUS = 86,
                                                SDL_SCANCODE_KP_MULTIPLY = 85,
                                                SDL_SCANCODE_KP_PERIOD = 99,
                                                SDL_SCANCODE_KP_PLUS = 87,
                                                SDL_SCANCODE_L = 15,
                                                SDL_SCANCODE_LALT = 226,
                                                SDL_SCANCODE_LCTRL = 224,
                                                SDL_SCANCODE_LEFT = 80,
                                                SDL_SCANCODE_LEFTBRACKET = 47,
                                                SDL_SCANCODE_LGUI = 227,
                                                SDL_SCANCODE_LSHIFT = 225,
                                                SDL_SCANCODE_M = 16,
                                                SDL_SCANCODE_MINUS = 45,
                                                SDL_SCANCODE_N = 17,
                                                SDL_SCANCODE_NUMLOCKCLEAR = 83,
                                                SDL_SCANCODE_O = 18,
                                                SDL_SCANCODE_P = 19,
                                                SDL_SCANCODE_PAGEDOWN = 78,
                                                SDL_SCANCODE_PAGEUP = 75,
                                                SDL_SCANCODE_PAUSE = 72,
                                                SDL_SCANCODE_PERIOD = 55,
                                                SDL_SCANCODE_PRINTSCREEN = 70,
                                                SDL_SCANCODE_Q = 20,
                                                SDL_SCANCODE_R = 21,
                                                SDL_SCANCODE_RALT = 230,
                                                SDL_SCANCODE_RCTRL = 228,
                                                SDL_SCANCODE_RETURN = 40,
                                                SDL_SCANCODE_RGUI = 231,
                                                SDL_SCANCODE_RIGHT = 79,
                                                SDL_SCANCODE_RIGHTBRACKET = 48,
                                                SDL_SCANCODE_RSHIFT = 229,
                                                SDL_SCANCODE_S = 22,
                                                SDL_SCANCODE_SCROLLLOCK = 71,
                                                SDL_SCANCODE_SEMICOLON = 51,
                                                SDL_SCANCODE_SLASH = 56,
                                                SDL_SCANCODE_SPACE = 44,
                                                SDL_SCANCODE_T = 23,
                                                SDL_SCANCODE_TAB = 43,
                                                SDL_SCANCODE_U = 24,
                                                SDL_SCANCODE_UNKNOWN = 0,
                                                SDL_SCANCODE_UP = 82,
                                                SDL_SCANCODE_V = 25,
                                                SDL_SCANCODE_W = 26,
                                                SDL_SCANCODE_X = 27,
                                                SDL_SCANCODE_Y = 28,
                                                SDL_SCANCODE_Z = 29;
                                        
                                            public static final long
                                                SDL_WINDOW_FULLSCREEN = 1L,
                                                SDL_WINDOW_HIDDEN = 8L,
                                                SDL_WINDOW_HIGH_PIXEL_DENSITY = 8192L,
                                                SDL_WINDOW_METAL = 0x0000000020000000L,
                                                SDL_WINDOW_OPENGL = 2L,
                                                SDL_WINDOW_RESIZABLE = 32L;
                                        
                                            public static final String
                                                SDL_HINT_EGL_LIBRARY = "SDL_EGL_LIBRARY",
                                                SDL_HINT_MOUSE_RELATIVE_CURSOR_VISIBLE = "SDL_MOUSE_RELATIVE_CURSOR_VISIBLE",
                                                SDL_HINT_MOUSE_RELATIVE_MODE_CENTER = "SDL_MOUSE_RELATIVE_MODE_CENTER",
                                                SDL_HINT_MOUSE_RELATIVE_WARP_MOTION = "SDL_MOUSE_RELATIVE_WARP_MOTION",
                                                SDL_HINT_OPENGL_ES_DRIVER = "SDL_OPENGL_ES_DRIVER",
                                                SDL_HINT_OPENGL_LIBRARY = "SDL_OPENGL_LIBRARY",
                                                SDL_HINT_QUIT_ON_LAST_WINDOW_CLOSE = "SDL_QUIT_ON_LAST_WINDOW_CLOSE",
                                                SDL_HINT_VIDEO_DRIVER = "SDL_VIDEO_DRIVER",
                                                SDL_HINT_VIDEO_FORCE_EGL = "SDL_VIDEO_FORCE_EGL",
                                                SDL_HINT_VIDEO_WAYLAND_ALLOW_LIBDECOR = "SDL_VIDEO_WAYLAND_ALLOW_LIBDECOR",
                                                SDL_HINT_VIDEO_WAYLAND_PREFER_LIBDECOR = "SDL_VIDEO_WAYLAND_PREFER_LIBDECOR";
                                        
                                            public static final int SDL_WINDOWPOS_UNDEFINED_MASK = 0x1FFF0000;
                                            public static final int SDL_WINDOWPOS_CENTERED_MASK = 0x2FFF0000;
                                        
                                            public static int SDL_WINDOWPOS_UNDEFINED_DISPLAY(int displayIndex) {
                                                return SDL_WINDOWPOS_UNDEFINED_MASK | displayIndex;
                                            }
                                        
                                            public static int SDL_WINDOWPOS_CENTERED_DISPLAY(int displayIndex) {
                                                return SDL_WINDOWPOS_CENTERED_MASK | displayIndex;
                                            }

    public static native boolean SDL_CaptureMouse(boolean enabled);
    public static native void SDL_CloseGamepad(long gamepad);
    public static native void SDL_CloseJoystick(long joystick);
    public static native long SDL_CreateColorCursor(long surface, int hot_x, int hot_y);
    public static native long SDL_CreateSurfaceFrom(int width, int height, int format, long pixels, int pitch);
    public static native long SDL_CreateWindow(String title, int w, int h, long flags);
    public static native void SDL_Delay(int ms);
    public static native void SDL_DestroyAudioStream(long stream);
    public static native void SDL_DestroyCursor(long cursor);
    public static native void SDL_DestroySurface(long surface);
    public static native void SDL_DestroyWindow(long window);
    public static native long SDL_GL_CreateContext(long window);
    public static native boolean SDL_GL_DestroyContext(long context);
    public static native boolean SDL_GL_MakeCurrent(long window, long context);
    public static native void SDL_GL_ResetAttributes();
    public static native boolean SDL_GL_SetAttribute(int attr, int value);
    public static native boolean SDL_GL_SetSwapInterval(int interval);
    public static native boolean SDL_GL_SwapWindow(long window);
    public static native int SDL_GetAudioStreamData(long stream, long buf, int len);
    public static native String SDL_GetBasePath();
    public static native long SDL_GetCurrentDisplayMode(int displayID);
    public static native String SDL_GetCurrentVideoDriver();
    public static native String SDL_GetDisplayName(int displayID);
    public static native long SDL_GetDisplays(int[] count);
    public static native String SDL_GetError();
    public static native int SDL_GetGamepadButtonLabel(long gamepad, int button);
    public static native String SDL_GetGamepadName(long gamepad);
    public static native int[] SDL_GetGamepads();
    public static native int SDL_GetGlobalProperties();
    public static native String SDL_GetHint(String name);
    public static native String SDL_GetKeyName(int key);
    public static native int SDL_GetMouseState(float[] x, float[] y);
    public static native String SDL_GetJoystickName(long joystick);
    public static native int[] SDL_GetJoysticks();
    public static native int SDL_GetNumJoystickAxes(long joystick);
    public static native int SDL_GetNumJoystickButtons(long joystick);
    public static native int SDL_GetPrimaryDisplay();
    public static native String SDL_GetScancodeName(int scancode);
    public static native long SDL_GetTicks();
    public static native long SDL_GetTicksNS();
    public static native int SDL_GetWindowID(long window);
    public static native boolean SDL_GetWindowPosition(long window, int[] x, int[] y);
    public static native boolean SDL_GetWindowRelativeMouseMode(long window);
    public static native boolean SDL_GetWindowSize(long window, int[] w, int[] h);
    public static native boolean SDL_GetWindowSizeInPixels(long window, int[] w, int[] h);
    public static native boolean SDL_HideCursor();
    public static native boolean SDL_Init(int flags);
    public static native boolean SDL_InitSubSystem(int flags);
    public static native boolean SDL_IsGamepad(int instance_id);
    public static native long SDL_Metal_CreateView(long window);
    public static native void SDL_Metal_DestroyView(long view);
    public static native long SDL_Metal_GetLayer(long view);
    public static native long SDL_OpenAudioDeviceStream(int devid, long spec, long callback, long userdata);
    public static native long SDL_OpenGamepad(int instance_id);
    public static native long SDL_OpenJoystick(int instance_id);
    public static native int SDL_PauseAudioStreamDevice(long stream);
    public static native int SDL_PollEvent(long event);
    public static native void SDL_PumpEvents();
    public static native int SDL_PutAudioStreamData(long stream, long buf, int len);
    public static native void SDL_Quit();
    public static native void SDL_QuitSubSystem(int flags);
    public static native int SDL_ResumeAudioStreamDevice(long stream);
    public static native boolean SDL_RumbleGamepad(long gamepad, int lowFrequency, int highFrequency, int durationMs);
    public static native boolean SDL_RumbleJoystick(long joystick, int lowFrequency, int highFrequency, int durationMs);
    public static native boolean SDL_SetCursor(long cursor);
    public static native void SDL_SetGamepadEventsEnabled(boolean enabled);
    public static native int SDL_SetHint(String name, String value);
    public static native void SDL_SetJoystickEventsEnabled(boolean enabled);
    public static native boolean SDL_SetWindowIcon(long window, long iconSurface);
    public static native boolean SDL_SetWindowMouseGrab(long window, boolean grabbed);
    public static native boolean SDL_SetWindowPosition(long window, int x, int y);
    public static native boolean SDL_SetWindowRelativeMouseMode(long window, boolean enabled);
    public static native boolean SDL_SetWindowTitle(long window, String title);
    public static native boolean SDL_ShowCursor();
    public static native boolean SDL_ShowWindow(long window);
    public static native boolean SDL_StartTextInput(long window);
    public static native boolean SDL_StopTextInput(long window);
    public static native void SDL_WarpMouseInWindow(long window, float x, float y);
    public static native int SDL_WasInit(int flags);
    public static native void SDL_free(long mem);
}
