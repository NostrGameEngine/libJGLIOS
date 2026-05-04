package org.ngengine.libjglios.gradle

import org.gradle.api.Plugin
import org.gradle.api.Project

class LibJGLIOSGradlePlugin implements Plugin<Project> {
    void apply(Project project) {
        project.pluginManager.apply('java-library')

        def extension = project.extensions.create('libJGLIOS', LibJGLIOSExtension)
        extension.mainClass = project.objects.property(String)
        extension.bundleId = project.objects.property(String)
        extension.appName = project.objects.property(String)
        extension.minIosVersion = project.objects.property(String)
        extension.simulatorDevice = project.objects.property(String)
        extension.buildType = project.objects.property(String)

        extension.bundleId.convention('org.ngengine.libjglios.app')
        extension.appName.convention(project.name)
        extension.minIosVersion.convention('15.0')
        extension.simulatorDevice.convention('iPhone 16')
        extension.buildType.convention('release')

        registerGeneratedEntrypointsTask(project, extension)
        registerMaterializeNativeSourcesTask(project)

        [
            'graal-host-provider.gradle',
            'graal-ios-provider.gradle',
            'ios-tasks.gradle'
        ].each { resourceName ->
            def resource = LibJGLIOSGradlePlugin.classLoader.getResource("org/ngengine/libjglios/gradle/${resourceName}")
            if (resource == null) {
                throw new org.gradle.api.GradleException("Could not find bundled libJGLIOS ${resourceName} resource.")
            }
            project.apply(from: resource)
        }
    }

    private static void registerGeneratedEntrypointsTask(Project project, LibJGLIOSExtension extension) {
        def generatedSourceDir = project.layout.buildDirectory.dir('generated/sources/libjglios/main/java')
        def generatedFile = generatedSourceDir.map {
            it.file('org/ngengine/libjglios/generated/LibJGLIOSGeneratedEntrypoints.java')
        }

        project.ext.libJGLIOSGeneratedEntrypointClass = 'org.ngengine.libjglios.generated.LibJGLIOSGeneratedEntrypoints'

        def generateTask = project.tasks.register('generateLibJGLIOSEntrypoints') {
            group = 'libJGLIOS'
            description = 'Generates Graal CEntryPoint glue for a libJGLIOS application main class.'
            outputs.file(generatedFile)
            inputs.property('mainClass', extension.mainClass)
            doLast {
                def mainClass = extension.mainClass.orNull
                if (!mainClass) {
                    throw new org.gradle.api.GradleException(
                        'libJGLIOS.mainClass must name the application class to launch.'
                    )
                }

                def outFile = generatedFile.get().asFile
                project.delete(generatedSourceDir.get().asFile)
                outFile.parentFile.mkdirs()
                outFile.text = generatedEntrypointsSource(escapeJava(mainClass))
            }
        }

        project.extensions.configure(org.gradle.api.tasks.SourceSetContainer) { sourceSets ->
            sourceSets.named('main') {
                java.srcDir(generatedSourceDir)
            }
        }

        project.tasks.named('compileJava') {
            dependsOn(generateTask)
        }
    }

    private static String escapeJava(String value) {
        value
            .replace('\\', '\\\\')
            .replace('"', '\\"')
            .replace('\n', '\\n')
            .replace('\r', '\\r')
    }

    private static String generatedEntrypointsSource(String escapedMainClass) {
        """package org.ngengine.libjglios.generated;

import java.lang.reflect.Method;
import com.oracle.svm.core.annotate.Substitute;
import com.oracle.svm.core.annotate.TargetClass;
import org.ngengine.libjglios.core.LibJGLIOSLifecycleBridge;
import org.graalvm.nativeimage.IsolateThread;
import org.graalvm.nativeimage.c.function.CEntryPoint;

public final class LibJGLIOSGeneratedEntrypoints {
    private static final String MAIN_CLASS = "${escapedMainClass}";
    private static Object application;

    private LibJGLIOSGeneratedEntrypoints() {
    }

    public static void main(String[] args) {
    }

    @CEntryPoint(name = "libjglios_app_start")
    public static int start(IsolateThread thread) {
        try {
            Class<?> appClass = Class.forName(MAIN_CLASS);
            try {
                application = appClass.getDeclaredConstructor().newInstance();
            } catch (NoSuchMethodException noDefaultConstructor) {
                invokeStaticMain(appClass);
                return 0;
            }
            invokeIfPresent(application, "start", new Class<?>[0]);
            return 0;
        } catch (Throwable throwable) {
            logThrowable("libJGLIOS_GRAAL_START_EXCEPTION", throwable);
            showThrowable("Application startup failed", throwable);
            throwable.printStackTrace(System.out);
            return -1;
        }
    }

    @CEntryPoint(name = "libjglios_app_frame")
    public static int frame(IsolateThread thread) {
        try {
            if (application != null) {
                if (invokeIfPresent(application, "frame", new Class<?>[0]) == MissingMethod.INSTANCE) {
                    invokeIfPresent(application, "update", new Class<?>[0]);
                }
                return 1;
            }
            return -1;
        } catch (Throwable throwable) {
            logThrowable("libJGLIOS_GRAAL_FRAME_EXCEPTION", throwable);
            showThrowable("Application frame failed", throwable);
            throwable.printStackTrace(System.out);
            return -2;
        }
    }

    @CEntryPoint(name = "libjglios_app_resize")
    public static int resize(IsolateThread thread, int width, int height) {
        try {
            if (application != null) {
                invokeIfPresent(application, "resize", new Class<?>[] { int.class, int.class }, width, height);
            }
            return 0;
        } catch (Throwable throwable) {
            logThrowable("libJGLIOS_GRAAL_RESIZE_EXCEPTION", throwable);
            showThrowable("Application resize failed", throwable);
            throwable.printStackTrace(System.out);
            return -1;
        }
    }

    @CEntryPoint(name = "libjglios_app_stop")
    public static int stop(IsolateThread thread) {
        try {
            if (application != null) {
                invokeIfPresent(application, "stop", new Class<?>[] { boolean.class }, true);
            }
            application = null;
            return 0;
        } catch (Throwable throwable) {
            logThrowable("libJGLIOS_GRAAL_STOP_EXCEPTION", throwable);
            showThrowable("Application stop failed", throwable);
            throwable.printStackTrace(System.out);
            return -1;
        }
    }

    private static Object invokeIfPresent(Object target, String name, Class<?>[] parameterTypes, Object... args)
            throws ReflectiveOperationException {
        if (target == null) {
            return MissingMethod.INSTANCE;
        }
        Method method;
        try {
            method = target.getClass().getMethod(name, parameterTypes);
        } catch (NoSuchMethodException ignored) {
            return MissingMethod.INSTANCE;
        }
        return method.invoke(target, args);
    }

    private static void invokeStaticMain(Class<?> appClass) throws ReflectiveOperationException {
        Method main = appClass.getMethod("main", String[].class);
        main.invoke(null, (Object) new String[0]);
    }

    private static void showThrowable(String phase, Throwable throwable) {
        Throwable current = unwrapInvocationTarget(throwable);
        String message = phase + "\\n" + current.getClass().getName() + ": " + String.valueOf(current.getMessage());
        try {
            LibJGLIOSLifecycleBridge.showError("libJGLIOS Error", message);
        } catch (Throwable dialogFailure) {
            logThrowable("libJGLIOS_GRAAL_ERROR_DIALOG_EXCEPTION", dialogFailure);
        }
    }

    private static void logThrowable(String prefix, Throwable throwable) {
        Throwable current = unwrapInvocationTarget(throwable);
        StringBuilder builder = new StringBuilder(prefix).append(": ").append(current);
        StackTraceElement[] stackTrace = current.getStackTrace();
        int frameCount = Math.min(stackTrace.length, 16);
        for (int i = 0; i < frameCount; i++) {
            builder.append("\\n    at ").append(stackTrace[i]);
        }
        Throwable cause = current.getCause();
        int causeCount = 0;
        while (cause != null && causeCount < 4) {
            builder.append("\\nCaused by: ").append(cause);
            StackTraceElement[] causeStackTrace = cause.getStackTrace();
            int causeFrameCount = Math.min(causeStackTrace.length, 8);
            for (int i = 0; i < causeFrameCount; i++) {
                builder.append("\\n    at ").append(causeStackTrace[i]);
            }
            cause = cause.getCause();
            causeCount++;
        }
        System.err.println(builder);
    }

    private static Throwable unwrapInvocationTarget(Throwable throwable) {
        Throwable current = throwable;
        if (current instanceof java.lang.reflect.InvocationTargetException && current.getCause() != null) {
            current = current.getCause();
        }
        return current;
    }

    private enum MissingMethod {
        INSTANCE
    }
}

@TargetClass(className = "com.sun.management.internal.OperatingSystemImpl")
final class Target_com_sun_management_internal_OperatingSystemImpl {
    @Substitute
    private static void initialize0() {
    }
}
"""
    }

    private static void registerMaterializeNativeSourcesTask(Project project) {
        def nativeFiles = [
            'libjglios_ios_app.mm',
            'libjglios_ios_launcher.mm',
            'libjglios_ios_launcher_jni.mm',
                'libjglios_ios_launcher.h',
                'jni_gles.mm',
                'jni_gles_compat.mm',
                'jni_sdl3.mm',
                'jni_openal_ios.mm'
        ]
        def outputDir = project.layout.buildDirectory.dir('libjglios/native')
        project.tasks.register('materializeLibJGLIOSNativeSources') {
            group = 'libJGLIOS'
            description = 'Extracts bundled libJGLIOS native launcher/JNI sources from the Gradle plugin.'
            outputs.dir(outputDir)
            outputs.upToDateWhen { false }
            onlyIf { project.rootProject.findProject(':core-ios') == null }
            doLast {
                def outDir = outputDir.get().asFile
                project.delete(outDir)
                outDir.mkdirs()
                nativeFiles.each { name ->
                    def resource = LibJGLIOSGradlePlugin.classLoader.getResource("org/ngengine/libjglios/gradle/native/${name}")
                    if (resource == null) {
                        throw new org.gradle.api.GradleException("Missing bundled libJGLIOS native resource: ${name}")
                    }
                    new File(outDir, name).bytes = resource.bytes
                }
            }
        }
    }
}
