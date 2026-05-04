package org.ngengine.libjglios.sample;

import org.graalvm.nativeimage.IsolateThread;
import org.graalvm.nativeimage.c.function.CEntryPoint;

public final class IosGraalEntrypoints {
    private static volatile boolean started;
    private static volatile int frameCount;
    private static IOSGlesGearsRenderer renderer;

    private IosGraalEntrypoints() {
    }

    // Keep a conventional Java entrypoint so native-image can build with this class as the image class.
    public static void main(String[] args) {
        // Intentionally empty; runtime entry is via @CEntryPoint exports.
    }

    @CEntryPoint(name = "libjglios_app_start")
    public static int start(IsolateThread thread) {
        if (started) {
            System.out.println("libJGLIOS_GRAAL_START_ALREADY_RUNNING");
            return 0;
        }

        started = true;
        frameCount = 0;

        int initResult = IosSdlRuntime.init(640, 480);
        if (initResult != 0) {
            started = false;
            System.out.println("libJGLIOS_GRAAL_START_FAILED SDL init=" + initResult + " error=" + IosSdlRuntime.lastError());
            return -1;
        }

        renderer = new IOSGlesGearsRenderer();
        try {
            renderer.initialize();
        } catch (RuntimeException ex) {
            IosSdlRuntime.shutdown();
            started = false;
            renderer = null;
            System.out.println("libJGLIOS_GRAAL_START_FAILED " + ex.getMessage());
            ex.printStackTrace(System.out);
            return -1;
        }
        System.out.println("libJGLIOS_GRAAL_START");
        return 0;
    }

    @CEntryPoint(name = "libjglios_app_frame")
    public static int frame(IsolateThread thread) {
        if (!started || renderer == null) {
            return -1;
        }

        IosSdlRuntime.pollEvents();

        int renderedFrame;
        try {
            renderedFrame = renderer.renderFrame();
        } catch (RuntimeException ex) {
            System.out.println("libJGLIOS_GRAAL_FRAME_EXCEPTION " + ex.getMessage());
            ex.printStackTrace(System.out);
            return -2;
        }

        if (renderedFrame < 0) {
            return renderedFrame;
        }

        frameCount = renderedFrame;
        if (frameCount == 1 || frameCount % 120 == 0) {
            System.out.println("libJGLIOS_GRAAL_FRAME frame=" + frameCount);
        }
        return frameCount;
    }

    @CEntryPoint(name = "libjglios_app_resize")
    public static int resize(IsolateThread thread, int width, int height) {
        IosSdlRuntime.pollEvents();
        return 0;
    }

    @CEntryPoint(name = "libjglios_app_stop")
    public static int stop(IsolateThread thread) {
        if (renderer != null) {
            try {
                renderer.shutdown();
            } finally {
                renderer = null;
            }
        }
        IosSdlRuntime.shutdown();
        System.out.println("libJGLIOS_GRAAL_STOP frames=" + frameCount);
        started = false;
        return frameCount;
    }
}
