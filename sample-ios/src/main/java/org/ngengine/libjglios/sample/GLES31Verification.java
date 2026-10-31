package org.ngengine.libjglios.sample;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.IntBuffer;
import java.nio.charset.StandardCharsets;

import static org.ngengine.libjglios.gles.GLES.*;

/**
 * Opt-in GPU verification through the public Java/JNI bindings in the sample app.
 */
final class GLES31Verification {
    private GLES31Verification() {
    }

    static boolean enabled() {
        return "1".equals(System.getenv("LIBJGLIOS_SAMPLE_GLES31"));
    }

    static native int verifyBackend();

    static void verifyInvalidContextRequest() {
        try {
            org.ngengine.libjglios.core.LibJGLIOSEglBridge.configureGlesVersion(3, 2);
        } catch (IllegalStateException expected) {
            System.out.println("LIBJGLIOS_CONTEXT_REJECTION_PASS requested=3.2");
            return;
        }
        throw new IllegalStateException("Unsupported context request was accepted");
    }

    static void run() {
        int[] value = new int[1];
        glGetIntegerv(GL_MAJOR_VERSION, value);
        require(value[0] == 3, "GLES major version");
        glGetIntegerv(GL_MINOR_VERSION, value);
        require(value[0] == 1, "GLES minor version");
        boolean mdi = false;
        glGetIntegerv(GL_NUM_EXTENSIONS, value);
        for (int i = 0; i < value[0]; i++) {
            if (new String(glGetStringi(GL_EXTENSIONS, i), StandardCharsets.UTF_8)
                    .trim().equals("GL_EXT_multi_draw_indirect")) {
                mdi = true;
            }
        }
        require(mdi, "MDI extension");
        int graphics = program(
                shader(GL_VERTEX_SHADER, "#version 310 es\n"
                        + "const vec2 p[3]=vec2[3](vec2(-.25,-.7),vec2(.25,-.7),vec2(0,.7));"
                        + "void main(){int group=gl_VertexID/3;"
                        + "gl_Position=vec4(p[gl_VertexID%3]+vec2(-.65+.65*float(group),0),0,1);}"),
                shader(GL_FRAGMENT_SHADER, "#version 310 es\nprecision highp float;"
                        + "layout(location=0) out vec4 color;void main(){color=vec4(1,0,0,1);}"));
        int[] texture = new int[1], framebuffer = new int[1], vao = new int[1];
        glGenTextures(1, texture);
        glBindTexture(GL_TEXTURE_2D, texture[0]);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8, 96, 32, 0, GL_RGBA, GL_UNSIGNED_BYTE, 0L);
        glGenFramebuffers(1, framebuffer);
        glBindFramebuffer(GL_FRAMEBUFFER, framebuffer[0]);
        glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, texture[0], 0);
        require(glCheckFramebufferStatus(GL_FRAMEBUFFER) == GL_FRAMEBUFFER_COMPLETE, "test framebuffer");
        glGenVertexArrays(1, vao);
        glBindVertexArray(vao[0]);
        glViewport(0, 0, 96, 32);
        glDisable(GL_DEPTH_TEST);
        glDisable(GL_CULL_FACE);
        glDisable(GL_SCISSOR_TEST);
        verifyDraw(false, graphics);
        verifyDraw(true, graphics);
        glUseProgram(0);
        glBindVertexArray(0);
        glBindFramebuffer(GL_FRAMEBUFFER, 0);
        glDeleteVertexArrays(1, vao);
        glDeleteFramebuffers(1, framebuffer);
        glDeleteTextures(1, texture);
        glDeleteProgram(graphics);
        require(glGetError() == GL_NO_ERROR, "GLES verification error");
        System.out.println("LIBJGLIOS_GLES31_PASS java_jni=1 compute=1 shared=1 array_mdi=1 indexed_mdi=1 byte_indices=1 negative_base_vertex=1 pixels=1 guards=1 host_command_reads_before_draw=0");
    }

    private static void verifyDraw(boolean indexed, int graphics) {
        int stride = indexed ? 5 : 4;
        int words = 4 + 3 * stride + 4;
        IntBuffer commands = ByteBuffer.allocateDirect(words * 4)
                .order(ByteOrder.nativeOrder()).asIntBuffer();
        for (int i = 0; i < words; i++) {
            commands.put(i, i < 4 ? 0x12345678 : i >= words - 4 ? 0x76543210 : 0);
        }
        IntBuffer indices = ByteBuffer.allocateDirect(44).order(ByteOrder.nativeOrder()).asIntBuffer();
        for (int i = 0; i < 11; i++) {
            indices.put(i, i < 4 ? 0x0badcafe : i >= 7 ? 0x1234abcd : 0);
        }
        int compute = program(shader(GL_COMPUTE_SHADER, "#version 310 es\n"
                + "layout(local_size_x=4) in;\n"
                + "layout(std430,binding=0) buffer Commands { uint words[]; };\n"
                + (indexed ? "layout(std430,binding=1) buffer Indices {uint indices[];};\n" : "")
                + "shared uint drawCounts[4];\n"
                + "void main(){uint id=gl_LocalInvocationID.x;drawCounts[id]=(id==1u?0u:1u);barrier();"
                + "if(id<3u){uint p=4u+id*" + stride + "u;words[p]=3u;words[p+1u]=drawCounts[id];"
                + "words[p+2u]=id*3u+" + (indexed ? "16u" : "0u") + ";"
                + (indexed ? "words[p+3u]=0xffffffffu;words[p+4u]=0u;" : "words[p+3u]=0u;")
                + "}"
                + (indexed ? "if(id==0u){indices[4]=0x04030201u;indices[5]=0x08070605u;indices[6]=0xaabbcc09u;}" : "")
                + "}"));
        int[] buffers = new int[2];
        glGenBuffers(2, buffers);
        glBindBuffer(GL_SHADER_STORAGE_BUFFER, buffers[0]);
        glBufferData(GL_SHADER_STORAGE_BUFFER, words * 4, commands, 0, GL_DYNAMIC_DRAW);
        glBindBufferBase(GL_SHADER_STORAGE_BUFFER, 0, buffers[0]);
        if (indexed) {
            glBindBuffer(GL_SHADER_STORAGE_BUFFER, buffers[1]);
            glBufferData(GL_SHADER_STORAGE_BUFFER, 44, indices, 0, GL_DYNAMIC_DRAW);
            glBindBufferBase(GL_SHADER_STORAGE_BUFFER, 1, buffers[1]);
        }
        glUseProgram(compute);
        glDispatchCompute(1, 1, 1);
        glMemoryBarrier(GL_COMMAND_BARRIER_BIT | GL_ELEMENT_ARRAY_BARRIER_BIT | GL_BUFFER_UPDATE_BARRIER_BIT);
        glClearColor(0, 0, 0, 1);
        glClear(GL_COLOR_BUFFER_BIT);
        glUseProgram(graphics);
        glBindBuffer(GL_DRAW_INDIRECT_BUFFER, buffers[0]);
        if (indexed) {
            glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, buffers[1]);
            glMultiDrawElementsIndirectEXT(GL_TRIANGLES, GL_UNSIGNED_BYTE, 16L, 3, stride * 4);
        } else {
            glMultiDrawArraysIndirectEXT(GL_TRIANGLES, 16L, 3, stride * 4);
        }
        // The first host read happens after MDI consumes the GPU-owned arguments.
        ByteBuffer pixels = ByteBuffer.allocateDirect(96 * 32 * 4);
        glReadPixels(0, 0, 96, 32, GL_RGBA, GL_UNSIGNED_BYTE, pixels, 0);
        for (int x : new int[]{16, 48, 80}) {
            int offset = (16 * 96 + x) * 4;
            require((pixels.get(offset) & 255) == (x == 48 ? 0 : 255)
                    && pixels.get(offset + 1) == 0 && pixels.get(offset + 2) == 0
                    && (pixels.get(offset + 3) & 255) == 255, "MDI pixels indexed=" + indexed);
        }
        glBindBuffer(GL_SHADER_STORAGE_BUFFER, buffers[0]);
        glGetBufferSubData(GL_SHADER_STORAGE_BUFFER, 0, words * 4, commands, 0);
        for (int i = 0; i < words; i++) {
            int expected;
            if (i < 4) {
                expected = 0x12345678;
            } else if (i >= words - 4) {
                expected = 0x76543210;
            } else {
                int draw = (i - 4) / stride;
                int field = (i - 4) % stride;
                expected = field == 0 ? 3 : field == 1 ? (draw == 1 ? 0 : 1)
                        : field == 2 ? draw * 3 + (indexed ? 16 : 0)
                        : field == 3 && indexed ? -1 : 0;
            }
            require(commands.get(i) == expected, "command word " + i + " indexed=" + indexed);
        }
        if (indexed) {
            glBindBuffer(GL_SHADER_STORAGE_BUFFER, buffers[1]);
            glGetBufferSubData(GL_SHADER_STORAGE_BUFFER, 0, 44, indices, 0);
            for (int i = 0; i < 11; i++) {
                int expected = i < 4 ? 0x0badcafe : i >= 7 ? 0x1234abcd
                        : i == 4 ? 0x04030201 : i == 5 ? 0x08070605 : 0xaabbcc09;
                require(indices.get(i) == expected, "index word " + i);
            }
        }
        glBindBufferBase(GL_SHADER_STORAGE_BUFFER, 0, 0);
        glBindBufferBase(GL_SHADER_STORAGE_BUFFER, 1, 0);
        glBindBuffer(GL_DRAW_INDIRECT_BUFFER, 0);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
        glDeleteBuffers(2, buffers);
        glDeleteProgram(compute);
        require(glGetError() == GL_NO_ERROR, "MDI GL error indexed=" + indexed);
        System.out.println("LIBJGLIOS_GLES31_MDI_PASS indexed=" + indexed + " pixels=1 guards=1");
    }

    private static int shader(int type, String source) {
        int shader = glCreateShader(type);
        byte[] text = source.getBytes(StandardCharsets.UTF_8);
        glShaderSource(shader, 1, text, new int[]{text.length});
        glCompileShader(shader);
        int[] status = new int[1], length = new int[1];
        glGetShaderiv(shader, GL_COMPILE_STATUS, status);
        byte[] log = new byte[4096];
        glGetShaderInfoLog(shader, log.length, length, log);
        require(status[0] != 0, "shader: " + new String(log, StandardCharsets.UTF_8));
        return shader;
    }

    private static int program(int... shaders) {
        int program = glCreateProgram();
        for (int shader : shaders) {
            glAttachShader(program, shader);
        }
        glLinkProgram(program);
        int[] status = new int[1], length = new int[1];
        glGetProgramiv(program, GL_LINK_STATUS, status);
        byte[] log = new byte[4096];
        glGetProgramInfoLog(program, log.length, length, log);
        require(status[0] != 0, "program: " + new String(log, StandardCharsets.UTF_8));
        for (int shader : shaders) {
            glDeleteShader(shader);
        }
        return program;
    }

    private static void require(boolean condition, String message) {
        if (!condition) {
            throw new IllegalStateException(message);
        }
    }
}
