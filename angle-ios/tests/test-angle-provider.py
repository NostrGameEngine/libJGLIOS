#!/usr/bin/env python3
"""Exercise revision selection and Gradle invalidation with local Git fixtures.

Native setup/build commands are replaced with argument-recording scripts.
"""
import os
from pathlib import Path
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]
PROVIDER = ROOT / 'angle-ios/angle-provider.gradle'


def git(directory, *args):
    return subprocess.check_output(['git', '-C', str(directory), *args],
                                   text=True, stderr=subprocess.DEVNULL).strip()


def repository(directory):
    directory.mkdir()
    git(directory, 'init', '-b', 'main')
    git(directory, 'config', 'user.name', 'ANGLE provider test')
    git(directory, 'config', 'user.email', 'angle-test@example.invalid')


def commit(directory, name, content):
    (directory / name).write_text(content)
    git(directory, 'add', name)
    git(directory, 'commit', '-m', 'Update fixture')
    return git(directory, 'rev-parse', 'HEAD')


class ProviderTest(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory(prefix='angle-provider-test-')
        self.addCleanup(temporary.cleanup)
        self.work = Path(temporary.name)
        self.upstream = self.work / 'upstream'
        repository(self.upstream)
        self.first = commit(self.upstream, 'README', 'first revision\n')
        self.second = commit(self.upstream, 'README', 'second revision\n')
        self.builder = self.work / 'builder'
        repository(self.builder)
        self.first_builder = commit(self.builder, 'ANGLE_COMMIT', self.first + '\n')
        self.second_builder = commit(self.builder, 'ANGLE_COMMIT', self.second + '\n')
        self.patch_builder = commit(self.builder, 'patch-note', 'updated patches\n')
        self.bad_builder = commit(self.builder, 'ANGLE_COMMIT', 'main\n')
        depot = self.work / 'depot'
        repository(depot)
        commit(depot, 'README', 'local depot_tools fixture\n')

        self.project = self.work / 'project'
        module = self.project / 'angle-ios'
        scripts = module / 'scripts'
        scripts.mkdir(parents=True)
        (self.project / 'settings.gradle').write_text("include ':angle-ios'\n")
        (self.project / 'gradle.properties').write_text(
            'org.gradle.jvmargs=-Xmx512m -XX:ActiveProcessorCount=2\n')
        (module / 'build.gradle').write_text('apply from: ' + repr(str(PROVIDER)) + '\n')
        (module / 'patch-series.json').write_text('[]\n')
        (module / 'patches').mkdir()
        (module / 'patches/fixture.patch').write_text('fixture\n')
        (scripts / 'setup-angle.sh').write_text(
            '#!/bin/sh\nset -eu\nprintf "%s\\n" "$@" > setup-arguments.txt\n')
        (scripts / 'build-angle.sh').write_text(
            '#!/bin/sh\nset -eu\nmkdir -p Frameworks\n'
            'cp setup-arguments.txt Frameworks/selection.txt\n')
        self.source = module / 'build/angle/source-gles30'
        self.source.mkdir(parents=True)
        git(self.source, 'clone', str(depot), 'depot_tools')

    def gradle(self, builder, *extra):
        return subprocess.run([
            str(ROOT / 'gradlew'), '--offline', '--no-daemon', '--max-workers=2',
            '-p', str(self.project), ':angle-ios:buildANGLE',
            '-PangleBuilderUrl=' + str(self.builder), '-PangleBuilderRevision=' + builder,
            '-PangleIosUrl=' + str(self.upstream), *extra],
            env=dict(os.environ), text=True, stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT, timeout=180)

    def test_selected_builder_controls_checkout_build_and_invalidation(self):
        for builder, upstream in [(self.first_builder, self.first),
                                  (self.second_builder, self.second),
                                  (self.patch_builder, self.second)]:
            with self.subTest(builder=builder):
                result = self.gradle(builder)
                self.assertEqual(result.returncode, 0, result.stdout)
                self.assertEqual(git(self.source / 'angle', 'rev-parse', 'HEAD'), upstream)
                arguments = (self.source / 'Frameworks/selection.txt').read_text().splitlines()
                self.assertEqual(arguments[3:5], [builder, upstream])
        result = self.gradle(self.patch_builder)
        self.assertEqual(result.returncode, 0, result.stdout)
        self.assertIn(':angle-ios:buildANGLE UP-TO-DATE', result.stdout)

    def test_malformed_builder_upstream_pin_stops_before_source_checkout(self):
        result = self.gradle(self.bad_builder)
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('ANGLE_COMMIT must contain a full commit SHA', result.stdout)
        self.assertFalse((self.source / 'angle').exists())

    def test_independent_upstream_override_is_rejected(self):
        result = self.gradle(self.first_builder, '-PangleIosRevision=' + self.second)
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('angleIosRevision is derived from ANGLE Builder', result.stdout)
        self.assertFalse((self.source / 'angle').exists())


if __name__ == '__main__':
    unittest.main()
