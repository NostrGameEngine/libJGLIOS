#!/usr/bin/env python3
"""Apply the pinned compatibility patches and inspect setup's GN invocations.

ANGLE_DIR selects an upstream source checkout containing angleIosRevision.
GN and gclient are mocked; this does not constitute an iOS native build.
"""

import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
import unittest

MODULE = Path(__file__).resolve().parents[1]
ROOT = MODULE.parent
ANGLE = Path(os.environ.get("ANGLE_DIR", str(ROOT.parent / "angle")))
REVISION = re.search(r"^angleIosRevision=([0-9a-f]{40})$",
                     (ROOT / "gradle.properties").read_text(), re.MULTILINE).group(1)


class SetupTest(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory(prefix="ios-angle-setup-test-")
        self.addCleanup(temporary.cleanup)
        self.work = Path(temporary.name)
        self.source = self.work / "angle"
        self.source.mkdir()
        shutil.copyfile(MODULE / "scripts/setup-angle.sh", self.work / "setup-angle.sh")
        for patch in (MODULE / "patches").glob("*.patch"):
            shutil.copyfile(patch, self.work / patch.name)
            for line in patch.read_text().splitlines():
                if line.startswith("--- a/"):
                    name = line[6:].split("\t", 1)[0]
                    target = self.source / name
                    if not target.exists():
                        target.parent.mkdir(parents=True, exist_ok=True)
                        target.write_bytes(subprocess.check_output(
                            ["git", "show", REVISION + ":" + name], cwd=ANGLE))
        bootstrap = self.source / "scripts/bootstrap.py"
        bootstrap.parent.mkdir(parents=True, exist_ok=True)
        bootstrap.write_text("# Dependency bootstrap is mocked in this logic test.\n")

        tools = self.work / "depot_tools"
        tools.mkdir()
        self.log = self.work / "gn.jsonl"
        self.metal_dir = self.work / "Metal Toolchain/bin"
        self.metal_dir.mkdir(parents=True)
        self.executable(self.metal_dir / "metallib", "#!/bin/sh\nexit 0\n")
        self.executable(tools / "xcrun", f"#!{sys.executable}\n"
                        "import os\nprint(os.environ['SETUP_METAL_EXECUTABLE'])\n")
        self.executable(tools / "gclient", "#!/bin/sh\nexit 0\n")
        self.executable(tools / "gn", f"#!{sys.executable}\n"
                        "import json, os, sys\n"
                        "with open(os.environ['SETUP_GN_LOG'], 'a') as log:\n"
                        "    log.write(json.dumps(sys.argv[1:]) + '\\n')\n")
        self.env = dict(os.environ, PATH=str(tools) + os.pathsep + os.environ["PATH"],
                        SETUP_GN_LOG=str(self.log),
                        SETUP_METAL_EXECUTABLE=str(self.metal_dir / "metal"))

    @staticmethod
    def executable(path, content):
        path.write_text(content)
        path.chmod(0o755)

    def run_setup(self, *args):
        return subprocess.run(["bash", str(self.work / "setup-angle.sh"), *args],
                              cwd=self.work, env=self.env, text=True, capture_output=True)

    def check_invocations(self, expected_target):
        commands = [json.loads(line) for line in self.log.read_text().splitlines()]
        self.assertEqual(len(commands), 6)
        for command in commands:
            self.assertEqual(command[0], "gen")
            self.assertEqual(len(command), 3, "GN args must remain one argument even with spaces")
            self.assertIn(f'ios_deployment_target="{expected_target}"', command[2])
            self.assertIn(f'angle_metal_toolchain_dir="{self.metal_dir}"', command[2])
            expected_environment = "device" if command[1].endswith("iphoneos") else "simulator"
            self.assertIn(f'target_environment="{expected_environment}"', command[2])

    def test_default_target_and_idempotent_patch_application(self):
        for attempt in range(2):
            result = self.run_setup()
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            self.check_invocations("12.0")
            self.log.unlink()

    def test_configured_deployment_target(self):
        result = self.run_setup("14.2")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.check_invocations("14.2")

    def test_invalid_deployment_target_fails_before_generation(self):
        result = self.run_setup("invalid")
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("Invalid iOS deployment target", result.stderr)
        self.assertFalse(self.log.exists())


if __name__ == "__main__":
    unittest.main()
