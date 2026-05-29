# libJGLIOS

libJGLIOS is a full suite to build graphical Java apps with GraalVM Native Image for iOS.

It includes bindings for SDL3, OpenAL, Clipboard and OpenGL ES via ANGLE on Metal.


## What It Provides

- `:sdl3-ios`: bindings for the SDL3
- `:gles-ios`: bindings for OpenGL ES
- `:openal-ios`: bindings for OpenAL
- `:core-ios`: bridge for lifecycle, runble and setup
- `:libjglios-gradle-plugin`: `org.ngengine.libjglios`, a Gradle plugin to build iOS apps

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

iOS {
    mainClass = 'com.example.Main'
    bundleId = 'com.example.game'
    appName = 'ExampleGame'
    // appIcon = file('src/ios/app-icon.png')
    // appIcon = file('src/ios/Assets.xcassets')
    // assets.from('src/assets', 'src/ios/assets')
    // includeResourceExtensions 'foo', '.bar'
    // minIosVersion = '15.0'
    // simulatorDevice = 'iPhone 16'
    // buildType = 'release'
    // orientation = 'landscape'
}
```

`mainClass`, `bundleId`, and `appName` are required.
`appIcon` is optional. It accepts either a single PNG file, which the plugin
converts into an iOS `AppIcon.appiconset`, or an existing `Assets.xcassets`
directory containing an `AppIcon` asset catalog.
`assets` is optional. Paths added with `assets.from(...)` are copied into the
iOS `.app` bundle as files and are not added to GraalVM native-image resources
by the plugin.
`includeResourceExtensions` is optional. Values added there are appended to the
default native-image resource extension list. Use `-Pios.includeResourceExtensions=foo,bar`
for the same additive behavior from the command line. Use
`-PiosGraalIncludeResources=<regex>` only when you want to replace the whole
native-image include regex.

Useful app tasks:

- `runIosDebugApp` - builds and runs the debug app on a connected iOS device, or on the simulator when no device is selected.
- `buildIosSimulatorApp` - builds a runnable simulator app.
- `buildIosDebugApp` - builds a development-signed `.app` for a real iOS device.
- `buildIosApp` - builds a release-signed `.ipa` for App Store upload.

Device signing uses Xcode automatic signing by default. Before running on a
real device, make sure your Apple ID is added in Xcode Settings > Accounts.
For release IPAs, make sure that account has the Apple signing assets needed
for distribution.

```bash
./gradlew runIosDebugApp
```

If iOS refuses to launch a newly-installed debug app, trust the developer
profile on the device in Settings > General > VPN & Device Management.

Signing and device overrides:

| CLI property | Environment variable | Use |
| --- | --- | --- |
| `-PiosTeamId=ABCDE12345` | `IOS_TEAM_ID` | Select the Apple Developer team when Xcode cannot choose one automatically. |
| `-PiosXcodeTeamId=ABCDE12345` | `IOS_XCODE_TEAM_ID` | Same as `iosTeamId`; kept for explicit Xcode naming. |
| `-PiosXcodeProvisioningAutoCreate=false` | `IOS_XCODE_PROVISIONING_AUTO_CREATE` | Disable Xcode automatic signing/provisioning. |
| `-PiosBundleIdAutoCreate=false` | `IOS_BUNDLE_ID_AUTO_CREATE` | Do not let Xcode create the configured bundle ID. |
| `-PiosDebugSigningIdentity=<identity-or-sha1>` | `IOS_DEBUG_SIGNING_IDENTITY` | Force the debug signing certificate. |
| `-PiosDebugProvisioningProfile=/path/profile.mobileprovision` | `IOS_DEBUG_PROVISIONING_PROFILE` | Force the debug provisioning profile. |
| `-PiosDebugCodesignEntitlements=/path/Entitlements.plist` | `IOS_DEBUG_CODESIGN_ENTITLEMENTS` | Force debug entitlements. |
| `-PiosReleaseSigningIdentity=<identity-or-sha1>` | `IOS_RELEASE_SIGNING_IDENTITY` | Force the release signing certificate. |
| `-PiosReleaseProvisioningProfile=/path/profile.mobileprovision` | `IOS_RELEASE_PROVISIONING_PROFILE` | Force the release provisioning profile. |
| `-PiosReleaseCodesignEntitlements=/path/Entitlements.plist` | `IOS_RELEASE_CODESIGN_ENTITLEMENTS` | Force release entitlements. |
| `-PiosAppTarget=device` | `IOS_APP_TARGET` | Choose `device` or `simulator`. |
| `-PiosDevice=<udid-or-name>` | `IOS_DEVICE` | Select a specific connected device. |

If the project has a `generateNativeImageMetadata` task, libJGLIOS runs it
before the iOS native-image build. This lets apps or engine plugins generate
their own `META-INF/native-image` reachability metadata without libJGLIOS
owning that discovery logic.


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
./gradlew runIosDebugApp -PiosAppTarget=simulator
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
