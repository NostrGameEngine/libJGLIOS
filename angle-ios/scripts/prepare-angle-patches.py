#!/usr/bin/env python3
"""Apply a pinned ANGLE Builder series followed by libJGLIOS iOS overlays."""
import argparse
import importlib.util
import json
from pathlib import Path
import shutil
import subprocess
import tempfile

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--angle', required=True, type=Path)
parser.add_argument('--builder', required=True, type=Path)
parser.add_argument('--builder-revision', required=True)
parser.add_argument('--revision', required=True)
parser.add_argument('--verify', action='store_true')
args = parser.parse_args()
angle, builder = args.angle.resolve(), args.builder.resolve()
local = Path(__file__).resolve().parent.parent
if not (local / 'patch-series.json').is_file():
    local = Path(__file__).resolve().parent


def git(*command):
    return subprocess.check_output(['git', *command], cwd=angle, text=True).strip()


builder_head = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=builder, text=True).strip()
if builder_head != args.builder_revision:
    raise SystemExit('ANGLE Builder checkout differs from the pinned revision')
if subprocess.check_output(['git', 'status', '--porcelain', '--untracked-files=all'], cwd=builder):
    raise SystemExit('ANGLE Builder checkout contains unrecorded changes')
if (builder / 'ANGLE_COMMIT').read_text().strip() != args.revision:
    raise SystemExit('ANGLE and ANGLE Builder must pin the same upstream revision')
spec = importlib.util.spec_from_file_location('angle_manifest', builder / 'scripts/write-build-manifest.py')
manifest = importlib.util.module_from_spec(spec)
spec.loader.exec_module(manifest)
shared = sorted((builder / 'patches').glob('*.patch'))
patch_dir = local / 'patches' if (local / 'patches').is_dir() else local
overlays = [patch_dir / name for name in json.loads((local / 'patch-series.json').read_text())]
if not shared or any(not p.is_file() for p in overlays):
    raise SystemExit('The shared or iOS patch series is incomplete')
with tempfile.TemporaryDirectory(prefix='libjglios-angle-series-') as temporary:
    combined = Path(temporary)
    (combined / 'ANGLE_COMMIT').write_text(args.revision + '\n')
    (combined / 'patches').mkdir()
    for index, patch in enumerate(shared + overlays):
        shutil.copyfile(patch, combined / 'patches' / f'{index:04d}-{patch.name}')
    # Check the complete series in a temporary Git index before changing sources.
    identity = manifest.source_identity(combined, angle, allow_unrelated=True, verify_sources=False)
    if args.verify:
        identity = manifest.source_identity(combined, angle)
    elif not git('diff', '--name-only', 'HEAD', '--ignore-submodules=all') and not git(
            'ls-files', '--others', '--exclude-standard'):
        for patch in sorted((combined / 'patches').glob('*.patch')):
            subprocess.run(['git', 'apply', str(patch)], cwd=angle, check=True)
        identity = manifest.source_identity(combined, angle)
    else:
        # The shared engine recognizes canonical prefixes and preserves unrelated edits.
        manifest.apply_patch_series(combined, angle)
        identity = manifest.source_identity(combined, angle)
record = {
    'angle_builder_checkout': str(builder),
    'angle_builder_revision': builder_head,
    'upstream_commit': args.revision,
    'patched_tree': identity['patched_tree'],
    'shared_patches': [{'name': p.name, 'sha256': manifest.sha256(p)} for p in shared],
    'ios_patches': [{'name': p.name, 'sha256': manifest.sha256(p)} for p in overlays],
}
(angle.parent / 'ANGLE_PATCH_MANIFEST.json').write_text(json.dumps(record, indent=2) + '\n')
print('ANGLE_IOS_PATCHES_VERIFIED shared=' + str(len(shared)) + ' ios=' + str(len(overlays)))
