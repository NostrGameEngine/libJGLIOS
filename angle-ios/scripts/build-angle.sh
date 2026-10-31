#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
configuration="${1:?Pass Debug or Release}"
profile="${2:?Pass gles30 or gles31}"
jobs="${3:-2}"
simulator_architectures="${4:-arm64,x86_64}"
[[ "$configuration" == Debug || "$configuration" == Release ]] || { echo "Invalid build type" >&2; exit 1; }
[[ "$profile" == gles30 || "$profile" == gles31 ]] || { echo "Invalid profile" >&2; exit 1; }
[[ "$jobs" =~ ^[1-9][0-9]*$ ]] || { echo "Build jobs must be positive" >&2; exit 1; }
[[ "$simulator_architectures" == arm64 || "$simulator_architectures" == arm64,x86_64 ]] || { echo "Simulator architectures must be arm64 or arm64,x86_64" >&2; exit 1; }
export PATH="$(pwd)/depot_tools:$PATH"
frameworks=(libEGL libGLESv2 libfeature_support)
targets=(iphoneos iphonesimulator_arm64)
[[ "$simulator_architectures" != arm64,x86_64 ]] || targets+=(iphonesimulator_x86_64)
for target in "${targets[@]}"; do
  autoninja -C "angle/out/$configuration-$target-$profile" -j "$jobs" "${frameworks[@]}"
done
work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT
mkdir -p "$work/device" "$work/simulator" Frameworks
for framework in "${frameworks[@]}"; do
  for environment in device simulator; do
    target=iphoneos
    [[ "$environment" == device ]] || target=iphonesimulator_arm64
    out="angle/out/$configuration-$target-$profile"
    cp -R "$out/$framework.framework" "$work/$environment/"
    cp -R "$out/$framework.dSYM" "$work/$environment/"
    headers="$work/$environment/$framework.framework/Headers"
    mkdir -p "$headers"
    if [[ "$framework" == libEGL ]]; then
      cp -R angle/include/EGL angle/include/KHR "$headers/"
    elif [[ "$framework" == libGLESv2 ]]; then
      cp -R angle/include/GLES angle/include/GLES2 angle/include/GLES3 angle/include/KHR "$headers/"
    else
      cp angle/src/feature_support_util/feature_support_util.h angle/include/export.h "$headers/"
    fi
    /usr/libexec/PlistBuddy -c 'Set :CFBundleShortVersionString 1.0' "$work/$environment/$framework.framework/Info.plist" 2>/dev/null || \
      /usr/libexec/PlistBuddy -c 'Add :CFBundleShortVersionString string 1.0' "$work/$environment/$framework.framework/Info.plist"
  done
  if [[ "$simulator_architectures" == arm64,x86_64 ]]; then
    intel="angle/out/$configuration-iphonesimulator_x86_64-$profile"
    lipo -create "$work/simulator/$framework.framework/$framework" "$intel/$framework.framework/$framework" \
      -output "$work/simulator/$framework.framework/$framework"
    lipo -create "$work/simulator/$framework.dSYM/Contents/Resources/DWARF/$framework" \
      "$intel/$framework.dSYM/Contents/Resources/DWARF/$framework" \
      -output "$work/simulator/$framework.dSYM/Contents/Resources/DWARF/$framework"
  fi
  rm -rf "Frameworks/$framework.xcframework"
  xcodebuild -create-xcframework -framework "$work/device/$framework.framework" \
    -debug-symbols "$work/device/$framework.dSYM" -framework "$work/simulator/$framework.framework" \
    -debug-symbols "$work/simulator/$framework.dSYM" -output "Frameworks/$framework.xcframework"
done
python3 write-ios-build-manifest.py "$profile" "$configuration" "$simulator_architectures"
