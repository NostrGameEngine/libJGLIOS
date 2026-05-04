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

        assertNative("SDL_CreateWindow", String.class, int.class, int.class, long.class);
        assertNative("SDL_Metal_CreateView", long.class);
        assertNative("SDL_Metal_GetLayer", long.class);
        assertNative("SDL_PollEvent", long.class);
        assertNative("SDL_OpenGamepad", int.class);
    }

    private static void assertNative(String name, Class<?>... parameterTypes) throws Exception {
        Method method = SDL3.class.getDeclaredMethod(name, parameterTypes);
        int modifiers = method.getModifiers();
        assertTrue(Modifier.isStatic(modifiers), name + " must be static");
        assertTrue(Modifier.isNative(modifiers), name + " must be native");
    }
}
