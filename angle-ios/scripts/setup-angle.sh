#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
deployment="${1:-12.0}"
profile="${2:-gles30}"
builder="${3:?Pass the pinned ANGLE Builder checkout}"
builder_revision="${4:?Pass the pinned ANGLE Builder commit}"
revision="${5:?Pass the pinned upstream ANGLE commit}"
configuration="${6:-All}"
[[ "$configuration" == All || "$configuration" == Debug || "$configuration" == Release ]] || { echo "Invalid configuration: $configuration" >&2; exit 1; }
[[ "$deployment" =~ ^[0-9]+(\.[0-9]+){1,2}$ ]] || { echo "Invalid iOS deployment target: $deployment" >&2; exit 1; }
[[ "$profile" == gles30 || "$profile" == gles31 ]] || { echo "Invalid Metal profile: $profile" >&2; exit 1; }
if [[ "$profile" == gles31 && "${deployment%%.*}" -lt 18 ]]; then
  echo "The GLES 3.1 profile requires an iOS 18 minimum deployment target" >&2
  exit 1
fi
metal_dir="$(dirname "$(xcrun --find metal)")"
[[ -x "$metal_dir/metallib" ]] || { echo "Missing metallib in $metal_dir" >&2; exit 1; }
export PATH="$(pwd)/depot_tools:$PATH"
if [[ "${ANGLE_SKIP_SYNC:-0}" != 1 ]]; then
  (cd angle && python3 scripts/bootstrap.py && gclient sync)
fi
python3 prepare-angle-patches.py --angle angle --builder "$builder" \
  --builder-revision "$builder_revision" --revision "$revision"
cd angle
configurations=(Debug Release)
[[ "$configuration" == All ]] || configurations=("$configuration")
for configuration in "${configurations[@]}"; do
  debug=false
  [[ "$configuration" != Debug ]] || debug=true
  for target in iphoneos iphonesimulator_arm64 iphonesimulator_x86_64; do
    environment=simulator
    cpu=arm64
    [[ "$target" != iphoneos ]] || environment=device
    [[ "$target" != iphonesimulator_x86_64 ]] || cpu=x64
    extra=""
    [[ "$profile" != gles31 ]] || extra="angle_metal_enable_gles31=true"
    gn gen "out/$configuration-$target-$profile" --args="is_debug=$debug enable_dsyms=true is_component_build=false clang_use_chrome_plugins=false target_os=\"ios\" target_cpu=\"$cpu\" ios_enable_code_signing=false use_system_xcode=true angle_enable_metal=true angle_enable_gl=false angle_enable_null=false angle_enable_vulkan=false angle_enable_wgpu=false ios_deployment_target=\"$deployment\" angle_metal_toolchain_dir=\"$metal_dir\" angle_build_all=false target_environment=\"$environment\" $extra"
  done
done
