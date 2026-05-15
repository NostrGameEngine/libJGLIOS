package org.ngengine.libjglios.sdl3;

import org.junit.jupiter.api.Test;
import org.ngengine.libjglios.sdl3.SDL3;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

class SDL3BindingShapeTest {
    @Test
    void exposesMetalWindowAndEventApis() throws Exception {
        assertEquals(0x0000000020000000L, SDL3.SDL_WINDOW_METAL);
        assertEquals(0x700, SDL3.SDL_EVENT_FINGER_DOWN);
        assertEquals(0x650, SDL3.SDL_EVENT_GAMEPAD_AXIS_MOTION);
        assertEquals(0, SDL3.SDL_GAMEPAD_AXIS_LEFTX);
        assertEquals(6, SDL3.SDL_GAMEPAD_AXIS_COUNT);
        assertEquals(0, SDL3.SDL_GAMEPAD_BUTTON_SOUTH);
        assertEquals(22, SDL3.SDL_GAMEPAD_BUTTON_COUNT);
        assertEquals(1, SDL3.SDL_GAMEPAD_BUTTON_LABEL_A);
        assertEquals(8, SDL3.SDL_GAMEPAD_BUTTON_LABEL_TRIANGLE);

        assertNative("SDL_CreateWindow", String.class, int.class, int.class, long.class);
        assertNative("SDL_Metal_CreateView", long.class);
        assertNative("SDL_Metal_GetLayer", long.class);
        assertNative("SDL_PollEvent", long.class);
        assertNative("SDL_OpenGamepad", int.class);
        assertNative("SDL_GetGamepads");
        assertNative("SDL_GetJoysticks");
        assertNative("SDL_IsGamepad", int.class);
        assertNative("SDL_GetGamepadButtonLabel", long.class, int.class);
        assertNative("SDL_RumbleGamepad", long.class, int.class, int.class, int.class);
        assertNative("SDL_RumbleJoystick", long.class, int.class, int.class, int.class);
    }

    private static void assertNative(String name, Class<?>... parameterTypes) throws Exception {
        Method method = SDL3.class.getDeclaredMethod(name, parameterTypes);
        int modifiers = method.getModifiers();
        assertTrue(Modifier.isStatic(modifiers), name + " must be static");
        assertTrue(Modifier.isNative(modifiers), name + " must be native");
    }
}
