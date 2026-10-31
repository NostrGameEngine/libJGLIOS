#!/usr/bin/env python3
"""Verify and identify the source-built ANGLE iOS frameworks."""
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import subprocess
import sys

profile, configuration, architectures = sys.argv[1:]
root = Path(__file__).resolve().parent
angle = root / 'angle'
patches = json.loads((root / 'ANGLE_PATCH_MANIFEST.json').read_text())
builder = Path(patches['angle_builder_checkout'])
subprocess.run([sys.executable, str(root / 'prepare-angle-patches.py'),
                '--angle', str(angle), '--builder', str(builder),
                '--builder-revision', patches['angle_builder_revision'],
                '--revision', patches['upstream_commit'], '--verify'], check=True)
spec = importlib.util.spec_from_file_location('manifest', builder / 'scripts/write-build-manifest.py')
manifest = importlib.util.module_from_spec(spec)
spec.loader.exec_module(manifest)
targets = ['iphoneos', 'iphonesimulator_arm64']
if architectures == 'arm64,x86_64':
    targets.append('iphonesimulator_x86_64')
record = {'profile': profile, 'source': patches, 'targets': {}, 'xcframeworks': {},
          'xcode': manifest.capture('xcodebuild', '-version'),
          'iphoneos_sdk': manifest.capture('xcrun', '--sdk', 'iphoneos', '--show-sdk-version'),
          'simulator_sdk': manifest.capture('xcrun', '--sdk', 'iphonesimulator', '--show-sdk-version'),
          'compiler': manifest.capture(str(angle / 'third_party/llvm-build/Release+Asserts/bin/clang'), '--version')}
for target in targets:
    out = angle / 'out' / f'{configuration}-{target}-{profile}'
    manifest.verify_production_profile(angle, out, profile)
    binaries = {}
    for name in ['libEGL', 'libGLESv2', 'libfeature_support']:
        binary = out / (name + '.framework') / name
        platform = manifest.capture('xcrun', 'vtool', '-show-build', str(binary))
        expected = 'IOS' if target == 'iphoneos' else 'IOSSIMULATOR'
        if not re.search(r'platform\s+' + expected + r'\s*$', platform, re.M):
            raise SystemExit('Wrong framework platform: ' + str(binary))
        binaries[name] = {'sha256': manifest.sha256(binary), 'platform': platform}
    air = (out / 'gen/angle/mtl_internal_shaders_autogen.air').read_bytes()
    air_targets = sorted(set(s.decode() for s in re.findall(
        rb'air64(?:_v\d+)?-apple-ios[0-9.]+(?:-simulator)?', air)))
    if not air_targets or any(s.endswith('-simulator') != (target != 'iphoneos') for s in air_targets):
        raise SystemExit('Metal AIR platform differs: ' + str(air_targets))
    record['targets'][target] = {'gn_args': (out / 'args.gn').read_text(),
                                 'binaries': binaries, 'metal_air_targets': air_targets}
for path in sorted((root / 'Frameworks').rglob('*')):
    if path.is_file() and path.name != 'ANGLE_IOS_BUILD_MANIFEST.json':
        record['xcframeworks'][str(path.relative_to(root / 'Frameworks'))] = manifest.sha256(path)
(root / 'Frameworks/ANGLE_IOS_BUILD_MANIFEST.json').write_text(json.dumps(record, indent=2) + '\n')
print('LIBJGLIOS_ANGLE_BUILD_PASS profile=' + profile)
