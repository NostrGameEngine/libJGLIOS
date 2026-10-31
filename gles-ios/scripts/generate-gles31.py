#!/usr/bin/env python3
"""Add the GLES 3.1 core declarations from the pinned Khronos header to the JNI API."""
import argparse
from pathlib import Path
import re

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--header', required=True, type=Path)
args = parser.parse_args()
root = Path(__file__).resolve().parents[1]
java_path = root / 'src/main/java/org/ngengine/libjglios/gles/GLES.java'
native_path = root / 'src/main/native/jni_gles.mm'
begin, end = '// BEGIN GLES 3.1 CORE', '// END GLES 3.1 CORE'


def remove_block(text):
    return re.sub(re.escape(begin) + r'.*?' + re.escape(end) + r'\n?', '', text, flags=re.S)


java, native = remove_block(java_path.read_text()), remove_block(native_path.read_text())
full_header = args.header.read_text()
header = full_header.split('#ifndef GL_ES_VERSION_3_1', 1)[1]
types = {'void': ('void', 'void'), 'GLuint': ('int', 'jint'), 'GLint': ('int', 'jint'),
         'GLenum': ('int', 'jint'), 'GLsizei': ('int', 'jint'), 'GLbitfield': ('int', 'jint'),
         'GLintptr': ('long', 'jlong'), 'GLfloat': ('float', 'jfloat'),
         'GLboolean': ('byte', 'jbyte')}
java_lines, native_lines = [begin], [begin]
for name, value in re.findall(r'^#define (GL_\w+)\s+(0x[0-9A-Fa-f]+|\d+)\s*$', full_header, re.M):
    if not re.search(r'\b' + name + r'\s*=', java):
        java_lines.append('    public static final int ' + name + ' = ' + value + ';')
count = 0
for result, name, arguments in re.findall(r'GL_APICALL (.*?) GL_APIENTRY (\w+)\s*\((.*?)\);', header):
    if re.search(r'\b' + name + r'\(', java):
        continue
    count += 1
    java_args, jni_args, native_types, call_args, setup, cleanup = [], [], [], [], [], []
    java_return, jni_return = types[result]
    default_return = 'return;' if result == 'void' else 'return 0;'
    for argument in arguments.split(','):
        match = re.search(r'(\w+)$', argument)
        variable = match[1]
        ctype = argument[:match.start()].strip()
        native_types.append(ctype)
        if variable == 'strings':
            java_args.append('String[] strings')
            jni_args.append('jobjectArray strings')
            setup += [
                'if (!strings || count < 0 || count > env->GetArrayLength(strings)) {',
                '    throwJavaException(env, "java/lang/IllegalArgumentException", "Invalid shader strings/count");',
                '    return 0;', '}',
                'std::vector<jstring> stringRefs;', 'std::vector<const GLchar*> stringValues;',
                'for (jint i = 0; i < count; ++i) {',
                '    jstring string = static_cast<jstring>(env->GetObjectArrayElement(strings, i));',
                '    const char* value = string ? env->GetStringUTFChars(string, nullptr) : nullptr;',
                '    if (!value) {',
                '        for (size_t j = 0; j < stringRefs.size(); ++j) {',
                '            env->ReleaseStringUTFChars(stringRefs[j], stringValues[j]);',
                '            env->DeleteLocalRef(stringRefs[j]);', '        }',
                '        if (string) env->DeleteLocalRef(string);',
                '        if (!env->ExceptionCheck()) throwJavaException(env, "java/lang/IllegalArgumentException", "Null shader string");',
                '        return 0;', '    }', '    stringRefs.push_back(string);',
                '    stringValues.push_back(value);', '}',
            ]
            cleanup += ['for (size_t i = 0; i < stringRefs.size(); ++i) {',
                        '    env->ReleaseStringUTFChars(stringRefs[i], stringValues[i]);',
                        '    env->DeleteLocalRef(stringRefs[i]);', '}']
            call_args.append('stringValues.data()')
        elif ctype == 'const GLchar *':
            java_args.append('String ' + variable)
            jni_args.append('jstring ' + variable)
            setup += [f'const char* {variable}Value = {variable} ? env->GetStringUTFChars({variable}, nullptr) : nullptr;',
                      f'if (!{variable}Value) {{',
                      '    if (!env->ExceptionCheck()) throwJavaException(env, "java/lang/IllegalArgumentException", "Null resource name");',
                      '    ' + default_return, '}']
            cleanup.append(f'env->ReleaseStringUTFChars({variable}, {variable}Value);')
            call_args.append(variable + 'Value')
        elif ctype == 'const void *':
            java_args.append('long ' + variable)
            jni_args.append('jlong ' + variable)
            call_args.append(f'reinterpret_cast<const void*>(static_cast<intptr_t>({variable}))')
        elif '*' in ctype:
            buffer = 'FloatBuffer' if 'GLfloat' in ctype else 'ByteBuffer' if ('GLchar' in ctype or 'GLboolean' in ctype) else 'IntBuffer'
            java_args += [f'java.nio.{buffer} {variable}', f'long {variable}ByteOffset']
            jni_args += [f'jobject {variable}', f'jlong {variable}ByteOffset']
            setup.append(f'auto {variable}Value = reinterpret_cast<{ctype}>(directBufferAddress(env, {variable}, {variable}ByteOffset));')
            setup.append('if (env->ExceptionCheck()) { ' + default_return + ' }')
            call_args.append(variable + 'Value')
        else:
            java_type, jni_type = types[ctype]
            java_args.append(java_type + ' ' + variable)
            jni_args.append(jni_type + ' ' + variable)
            call_args.append(f'static_cast<{ctype}>({variable})')
    java_lines.append('    public static native ' + java_return + ' ' + name + '(' + ', '.join(java_args) + ');')
    native_lines += [f'JNIEXPORT {jni_return} JNICALL Java_org_ngengine_libjglios_gles_GLES_{name.replace("_", "_1")}(JNIEnv* env, jclass, ' + ', '.join(jni_args) + ') {',
                     f'    using Fn = {result} (*)(' + ', '.join(native_types) + ');',
                     f'    static Fn fn = reinterpret_cast<Fn>(libjglios_gl_get_proc_address("{name}"));',
                     '    if (!fn) {',
                     f'        throwJavaException(env, "java/lang/UnsupportedOperationException", "{name} is unavailable");',
                     '        ' + default_return, '    }']
    native_lines += ['    ' + line for line in setup]
    native_lines.append('    ' + ('auto result = ' if result != 'void' else '') + 'fn(' + ', '.join(call_args) + ');')
    native_lines += ['    ' + line for line in cleanup]
    if result != 'void':
        native_lines.append(f'    return static_cast<{jni_return}>(result);')
    native_lines.append('}\n')
java_lines.append(end)
native_lines.append(end)
index = java.rfind('}')
java_path.write_text(java[:index] + '\n'.join(java_lines) + '\n' + java[index:])
if '#include <vector>' not in native:
    native = native.replace('#include <cstring>', '#include <cstring>\n#include <vector>')
index = native.rfind('}')
native_path.write_text(native[:index] + '\n'.join(native_lines) + '\n' + native[index:])
print('Added GLES 3.1 core entry points:', count)
