# libJGLIOS

libJGLIOS is an iOS-only support library for running Java applications through
SDL3, OpenAL, ANGLE/Metal, OpenGL ES, and GraalVM Native Image.


## What It Provides

- `:sdl3-ios`: Java/JNI bindings for the SDL3 APIs used on iOS.
- `:gles-ios`: Java/JNI bindings for OpenGL ES calls used by the renderer.
- `:openal-ios`: Java/JNI OpenAL bindings backed by iOS OpenAL.
- `:core-ios`: ObjC++/JNI bridge for SDL lifecycle, ANGLE/EGL setup, framebuffer queries, and input events.
- `:libjglios-gradle-plugin`: `org.ngengine.libjglios`, a Gradle plugin for consumer iOS app builds.
- `:sample-ios`: the single iOS sample project, rendering the gears scene through GLES over ANGLE/Metal.


## Usage

Consumer projects apply:

```groovy
plugins {
    id 'org.ngengine.libjglios' version '<version>'
}

dependencies {
    implementation 'org.ngengine:libjglios-core-ios:<version>'
    implementation 'org.ngengine:libjglios-angle-ios:<version>'
    implementation 'org.ngengine:libjglios-sdl3-ios:<version>'
    implementation 'org.ngengine:libjglios-gles-ios:<version>'
    implementation 'org.ngengine:libjglios-openal-ios:<version>'
}

libJGLIOS {
    mainClass = 'com.example.Main'
    bundleId = 'com.example.game'
    appName = 'ExampleGame'
    minIosVersion = '15.0'
    simulatorDevice = 'iPhone 16'
    buildType = 'release'
}
```
 
Useful app tasks:

- `runIosApp` - builds and runs the app on a connected iOS device, or on the simulator when no device is selected.
- `buildIosSimulatorApp` - builds a runnable simulator app.
- `buildIosApp` - builds and signs the app for a real iOS device.
- `packageApp` - packages the device app as a zip.


## Build

### Requirements

- macOS with Xcode command line tools.
- JDK 21 or newer

```bash
./gradlew clean build
./gradlew publishToMavenLocal
```
 

## Custom Native Frameworks

Custom JNI or native code for the iOS backend should be built as an Apple
`xcframework` and carried on the app runtime classpath. libJGLIOS links those
frameworks while building the iOS app; the app should not rely on loading
native libraries at runtime.

Build the framework with Xcode, Apple command line tools, or a Gradle task. It
should include:

- `ios-arm64` for devices.
- `ios-arm64-simulator` or `ios-arm64_x86_64-simulator` for simulators.

Put the framework under `lib/ios` in a dependency jar or in the app's own
resources:

```text
lib/ios/MyGameNative.xcframework
lib/ios/MyGameNative.xcframework.json
```

The metadata file is optional. For a static JNI framework, this is the usual
shape:

```json
{
  "name": "MyGameNative",
  "embed": false,
  "forceLoad": true
}
```

Add `systemFrameworks` to that file when the native code needs extra Apple
frameworks.

For a local app project:

```groovy
tasks.named('processResources') {
    from('native/MyGameNative.xcframework') {
        into 'lib/ios/MyGameNative.xcframework'
    }
    from('native/MyGameNative.xcframework.json') {
        into 'lib/ios'
    }
}
```

Then build or run the app normally:

```bash
./gradlew runIosApp -PiosAppTarget=simulator
./gradlew buildIosSimulatorApp
./gradlew buildIosApp
```

During the app build, libJGLIOS scans the runtime classpath for
`lib/ios/**/*.xcframework`, selects the right device or simulator slice, links
the frameworks, adds configured Apple system frameworks, and embeds frameworks
whose metadata has `embed: true`. Dynamic frameworks usually need
`embed: true`; static frameworks usually use `embed: false` and
`forceLoad: true`.


## License

libJGLIOS itself is licensed under the [BSD-3 Clause License](./LICENSE), however it includes the following third-party components, binaries and code with their own licenses:

- SDL3, [zlib license](https://github.com/libsdl-org/SDL/blob/main/LICENSE.txt)
- ANGLE, [BSD-style license](https://github.com/google/angle/blob/main/LICENSE)
- libGDX MetalANGLEKit build scripts and patches, [BSD-style license](https://github.com/libgdx/MetalANGLEKit)
- Godot-kotlin-jvm by utopia-rise, graalvm linking and build scripts, [MIT license](https://github.com/utopia-rise/godot-kotlin-jvm/blob/master/LICENSE)
