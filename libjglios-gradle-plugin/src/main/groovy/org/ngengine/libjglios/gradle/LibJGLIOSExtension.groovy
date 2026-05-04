package org.ngengine.libjglios.gradle

import org.gradle.api.provider.Property

class LibJGLIOSExtension {
    Property<String> mainClass
    Property<String> bundleId
    Property<String> appName
    Property<String> minIosVersion
    Property<String> simulatorDevice
    Property<String> buildType
}

