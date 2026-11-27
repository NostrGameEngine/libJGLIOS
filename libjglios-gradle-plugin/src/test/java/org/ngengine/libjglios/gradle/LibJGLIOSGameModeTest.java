package org.ngengine.libjglios.gradle;

import static org.gradle.testkit.runner.TaskOutcome.SUCCESS;
import static org.gradle.testkit.runner.TaskOutcome.UP_TO_DATE;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPathFactory;
import org.gradle.testkit.runner.GradleRunner;
import org.gradle.testkit.runner.TaskOutcome;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;

class LibJGLIOSGameModeTest {
    private static final List<String> PLIST_TASKS = List.of(
        "generateLibJGLIOSInfoPlist", "generateLibJGLIOSSimulatorInfoPlist"
    );

    @TempDir
    Path projectDir;

    @Test
    void generatesGameModeMetadataForDeviceAndSimulatorWithoutRaisingMinimumIos() throws Exception {
        Files.writeString(projectDir.resolve("settings.gradle"), "rootProject.name = 'game-mode-test'\n");
        Files.writeString(projectDir.resolve("build.gradle"), """
            plugins {
                id 'org.ngengine.libjglios'
            }

            iOS {
                mainClass = 'com.example.Main'
                bundleId = 'com.example.game'
                appName = 'ExampleGame'
                minIosVersion = '15.0'
                if (providers.gradleProperty('testGameMode').isPresent()) {
                    supportsGameMode = providers.gradleProperty('testGameMode').get().toBoolean()
                }
            }
            """);

        generatePlists(SUCCESS);
        assertPlists("true");
        generatePlists(UP_TO_DATE, "-PtestGameMode=true");
        generatePlists(SUCCESS, "-PtestGameMode=false");
        assertPlists("false");
        generatePlists(UP_TO_DATE, "-Pios.supportsGameMode=false");
        generatePlists(SUCCESS);
        assertPlists("true");
    }

    private void generatePlists(TaskOutcome outcome, String... extraArguments) {
        var arguments = new ArrayList<>(PLIST_TASKS);
        arguments.addAll(List.of("--offline", "--max-workers=2"));
        arguments.addAll(List.of(extraArguments));
        var result = GradleRunner.create()
            .withProjectDir(projectDir.toFile())
            .withPluginClasspath()
            .withArguments(arguments)
            .build();
        for (var taskName : PLIST_TASKS) {
            assertEquals(outcome, result.task(":" + taskName).getOutcome(), result.getOutput());
        }
    }

    private void assertPlists(String gameModeElementName) throws Exception {
        var factory = DocumentBuilderFactory.newInstance();
        factory.setAttribute(XMLConstants.ACCESS_EXTERNAL_DTD, "");
        factory.setFeature("http://apache.org/xml/features/nonvalidating/load-external-dtd", false);
        var builder = factory.newDocumentBuilder();
        var xpath = XPathFactory.newInstance().newXPath();
        for (var target : List.of("ios-device", "ios-simulator")) {
            var plist = builder.parse(projectDir.resolve("build/libjglios/" + target + "/Info.plist").toFile());
            assertEquals("15.0", xpath.evaluate("/plist/dict/key[.='MinimumOSVersion']/following-sibling::*[1]", plist));
            for (var key : List.of("LSSupportsGameMode", "GCSupportsGameMode")) {
                assertEquals(gameModeElementName,
                    xpath.evaluate("name(/plist/dict/key[.='" + key + "']/following-sibling::*[1])", plist), key);
            }
        }
    }
}
