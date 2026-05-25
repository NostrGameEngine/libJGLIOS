package org.ngengine.libjglios.gradle

import groovy.lang.Closure
import org.gradle.api.file.ConfigurableFileCollection
import org.gradle.api.provider.Property

class LibJGLIOSExtension {
    Property<String> mainClass
    Property<String> bundleId
    Property<String> appName
    Property<String> minIosVersion
    Property<String> simulatorDevice
    Property<String> buildType
    Property<String> orientation
    Property<Object> appIcon
    ConfigurableFileCollection assets

    void assets(Object... paths) {
        assets.from(paths)
    }

    void assets(Closure<?> configureClosure) {
        configureClosure.delegate = assets
        configureClosure.resolveStrategy = Closure.DELEGATE_FIRST
        configureClosure.call()
    }
}
