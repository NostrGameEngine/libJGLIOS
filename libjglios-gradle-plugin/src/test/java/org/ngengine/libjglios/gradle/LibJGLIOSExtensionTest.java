package org.ngengine.libjglios.gradle;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;
import org.gradle.testfixtures.ProjectBuilder;
import org.junit.jupiter.api.Test;

class LibJGLIOSExtensionTest {

    @Test
    void runtimeInitializationIsConfiguredThroughTheDsl() {
        var objects = ProjectBuilder.builder().build().getObjects();
        LibJGLIOSExtension extension = new LibJGLIOSExtension();
        extension.setRuntimeInitializedTypes(objects.listProperty(String.class));

        extension.runtimeInitialize("com.example.IosRuntimeState");

        assertEquals(
            List.of("com.example.IosRuntimeState"),
            extension.getRuntimeInitializedTypes().get()
        );
    }
}
