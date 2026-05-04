package org.ngengine.libjglios.sample;

import java.nio.charset.StandardCharsets;
import org.ngengine.libjglios.gles.GLESCompat;

import static org.ngengine.libjglios.gles.GLES.*;

public final class IOSGlesGearsRenderer {
    private static final String VERTEX_SHADER = """
        #version 300 es
        layout(location = 0) in vec3 aPosition;
        layout(location = 1) in vec3 aNormal;

        uniform mat4 uMvp;
        uniform mat4 uModel;

        out vec3 vNormal;

        void main() {
            vNormal = mat3(uModel) * aNormal;
            gl_Position = uMvp * vec4(aPosition, 1.0);
        }
        """;

    private static final String FRAGMENT_SHADER = """
        #version 300 es
        precision mediump float;

        in vec3 vNormal;

        uniform vec3 uLightDir;
        uniform vec3 uBaseColor;

        out vec4 fragColor;

        void main() {
            vec3 normal = normalize(vNormal);
            float diffuse = max(dot(normal, normalize(-uLightDir)), 0.0);
            vec3 lit = uBaseColor * (0.22 + 0.78 * diffuse);
            fragColor = vec4(lit, 1.0);
        }
        """;

    private static final float[] LIGHT_DIR = {0.35f, 0.45f, 1.0f};

    private static final float[] RED_GEAR = {0.82f, 0.18f, 0.12f};
    private static final float[] GREEN_GEAR = {0.22f, 0.72f, 0.28f};
    private static final float[] BLUE_GEAR = {0.25f, 0.40f, 0.86f};

    private final float[] projection = new float[16];
    private final float[] view = new float[16];
    private final float[] model = new float[16];
    private final float[] mvp = new float[16];
    private final float[] vp = new float[16];

    private GearMesh gearMesh;
    private int program;
    private int mvpLocation;
    private int modelLocation;
    private int lightDirectionLocation;
    private int baseColorLocation;
    private int frameCounter;
    private float angleDegrees;
    private int lastFramebufferWidth;
    private int lastFramebufferHeight;

    public void initialize() {
        if (program != 0) {
            return;
        }

        program = createProgram(VERTEX_SHADER, FRAGMENT_SHADER);
        mvpLocation = uniformLocation(program, "uMvp");
        modelLocation = uniformLocation(program, "uModel");
        lightDirectionLocation = uniformLocation(program, "uLightDir");
        baseColorLocation = uniformLocation(program, "uBaseColor");

        gearMesh = GearMesh.create(0.35f, 1.05f, 0.36f, 24, 0.22f);

        Mat4.lookAt(view, 0.0f, 0.0f, 7.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f);

        glEnable(GL_DEPTH_TEST);
        glDepthFunc(GL_LEQUAL);
        glEnable(GL_CULL_FACE);
        glCullFace(GL_BACK);

        System.out.println("libJGLIOS_GRAAL_RENDERER_INIT program=" + program + " indices=" + gearMesh.indexCount);
    }

    public int renderFrame() {
        if (program == 0 || gearMesh == null) {
            return -1;
        }

        frameCounter++;
        angleDegrees += 1.2f;

        int framebufferWidth = Math.max(1, IosSdlRuntime.framebufferWidth());
        int framebufferHeight = Math.max(1, IosSdlRuntime.framebufferHeight());

        if (framebufferWidth != lastFramebufferWidth || framebufferHeight != lastFramebufferHeight) {
            float aspect = framebufferWidth / (float) framebufferHeight;
            Mat4.perspective(projection, 52.0f, aspect, 0.1f, 32.0f);
            lastFramebufferWidth = framebufferWidth;
            lastFramebufferHeight = framebufferHeight;
            System.out.println("libJGLIOS_GRAAL_VIEWPORT width=" + framebufferWidth + " height=" + framebufferHeight);
        }

        glViewport(0, 0, framebufferWidth, framebufferHeight);
        glClearColor(0.03f, 0.03f, 0.06f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        glUseProgram(program);
        glUniform3f(lightDirectionLocation, LIGHT_DIR[0], LIGHT_DIR[1], LIGHT_DIR[2]);

        Mat4.multiply(vp, projection, view);

        drawGear(-2.1f, -0.3f, -0.2f, angleDegrees, RED_GEAR);
        drawGear(2.0f, 0.8f, 0.1f, -1.7f * angleDegrees + 42.0f, GREEN_GEAR);
        drawGear(0.35f, -1.95f, 0.0f, 2.4f * angleDegrees - 17.0f, BLUE_GEAR);

        glBindVertexArray(0);

        IosSdlRuntime.swapBuffers();

        if (frameCounter == 1 || frameCounter % 120 == 0) {
            System.out.println("libJGLIOS_GRAAL_RENDER_FRAME frame=" + frameCounter + " angle=" + angleDegrees);
        }
        return frameCounter;
    }

    public void shutdown() {
        if (gearMesh != null) {
            gearMesh.delete();
            gearMesh = null;
        }
        if (program != 0) {
            glDeleteProgram(program);
            program = 0;
        }
        if (frameCounter > 0) {
            System.out.println("libJGLIOS_GRAAL_RENDERER_STOP frames=" + frameCounter);
        }
    }

    private void drawGear(float tx, float ty, float tz, float rotationDegrees, float[] color) {
        Mat4.identity(model);
        Mat4.translate(model, tx, ty, tz);
        Mat4.rotateX(model, 65.0f);
        Mat4.rotateZ(model, rotationDegrees);

        Mat4.multiply(mvp, vp, model);

        glUniformMatrix4fv(mvpLocation, 1, (byte) 0, mvp);
        glUniformMatrix4fv(modelLocation, 1, (byte) 0, model);
        glUniform3f(baseColorLocation, color[0], color[1], color[2]);

        glBindVertexArray(gearMesh.vao);
        glDrawElements(GL_TRIANGLES, gearMesh.indexCount, GL_UNSIGNED_SHORT, 0L);
    }

    private static int createProgram(String vertexShaderSource, String fragmentShaderSource) {
        int vertexShader = compileShader(GL_VERTEX_SHADER, vertexShaderSource);
        int fragmentShader = compileShader(GL_FRAGMENT_SHADER, fragmentShaderSource);
        int createdProgram = glCreateProgram();
        glAttachShader(createdProgram, vertexShader);
        glAttachShader(createdProgram, fragmentShader);
        glLinkProgram(createdProgram);

        int[] status = new int[1];
        glGetProgramiv(createdProgram, GL_LINK_STATUS, status);
        if (status[0] == 0) {
            throw new IllegalStateException("Program link failed: " + getProgramLog(createdProgram));
        }

        glDeleteShader(vertexShader);
        glDeleteShader(fragmentShader);
        return createdProgram;
    }

    private static int uniformLocation(int program, String name) {
        int location = glGetUniformLocation(program, cString(name));
        if (location < 0) {
            throw new IllegalStateException("Uniform not found: " + name);
        }
        return location;
    }

    private static int compileShader(int type, String source) {
        int shader = glCreateShader(type);
        GLESCompat.glShaderSourceString(shader, source);
        glCompileShader(shader);

        int[] status = new int[1];
        glGetShaderiv(shader, GL_COMPILE_STATUS, status);
        if (status[0] == 0) {
            throw new IllegalStateException("Shader compile failed: " + getShaderLog(shader));
        }
        return shader;
    }

    private static String getShaderLog(int shader) {
        byte[] log = new byte[4096];
        int[] length = new int[1];
        glGetShaderInfoLog(shader, log.length, length, log);
        int used = Math.max(0, Math.min(log.length, length[0]));
        return new String(log, 0, used, StandardCharsets.UTF_8);
    }

    private static String getProgramLog(int program) {
        byte[] log = new byte[4096];
        int[] length = new int[1];
        glGetProgramInfoLog(program, log.length, length, log);
        int used = Math.max(0, Math.min(log.length, length[0]));
        return new String(log, 0, used, StandardCharsets.UTF_8);
    }

    private static byte[] cString(String text) {
        byte[] raw = text.getBytes(StandardCharsets.UTF_8);
        byte[] terminated = new byte[raw.length + 1];
        System.arraycopy(raw, 0, terminated, 0, raw.length);
        return terminated;
    }

    private static final class GearMesh {
        final int vao;
        final int vbo;
        final int ebo;
        final int indexCount;

        private GearMesh(int vao, int vbo, int ebo, int indexCount) {
            this.vao = vao;
            this.vbo = vbo;
            this.ebo = ebo;
            this.indexCount = indexCount;
        }

        static GearMesh create(float innerRadius, float outerRadius, float width, int teeth, float toothDepth) {
            float halfWidth = width * 0.5f;
            int pointsPerTooth = 4;
            int points = teeth * pointsPerTooth;

            FloatArrayBuilder vertices = new FloatArrayBuilder(points * 48);
            ShortArrayBuilder indices = new ShortArrayBuilder(points * 24);

            float[] outerX = new float[points];
            float[] outerY = new float[points];
            float[] innerX = new float[points];
            float[] innerY = new float[points];

            float baseRadius = outerRadius - toothDepth * 0.5f;
            float tipRadius = outerRadius + toothDepth * 0.5f;

            int pointIndex = 0;
            for (int tooth = 0; tooth < teeth; tooth++) {
                float startAngle = (float) ((Math.PI * 2.0) * tooth / teeth);
                float step = (float) ((Math.PI * 2.0) / (teeth * pointsPerTooth));
                for (int part = 0; part < pointsPerTooth; part++) {
                    float angle = startAngle + part * step;
                    float radius = (part == 1 || part == 2) ? tipRadius : baseRadius;
                    outerX[pointIndex] = (float) Math.cos(angle) * radius;
                    outerY[pointIndex] = (float) Math.sin(angle) * radius;
                    innerX[pointIndex] = (float) Math.cos(angle) * innerRadius;
                    innerY[pointIndex] = (float) Math.sin(angle) * innerRadius;
                    pointIndex++;
                }
            }

            short[] frontOuter = new short[points];
            short[] frontInner = new short[points];
            short[] backOuter = new short[points];
            short[] backInner = new short[points];

            for (int i = 0; i < points; i++) {
                frontOuter[i] = addVertex(vertices, outerX[i], outerY[i], halfWidth, 0.0f, 0.0f, 1.0f);
                frontInner[i] = addVertex(vertices, innerX[i], innerY[i], halfWidth, 0.0f, 0.0f, 1.0f);
                backOuter[i] = addVertex(vertices, outerX[i], outerY[i], -halfWidth, 0.0f, 0.0f, -1.0f);
                backInner[i] = addVertex(vertices, innerX[i], innerY[i], -halfWidth, 0.0f, 0.0f, -1.0f);
            }

            for (int i = 0; i < points; i++) {
                int next = (i + 1) % points;
                addQuad(indices, frontInner[i], frontInner[next], frontOuter[next], frontOuter[i], true);
                addQuad(indices, backInner[i], backOuter[i], backOuter[next], backInner[next], true);
            }

            for (int i = 0; i < points; i++) {
                int next = (i + 1) % points;
                float midX = (outerX[i] + outerX[next]) * 0.5f;
                float midY = (outerY[i] + outerY[next]) * 0.5f;
                float invOuterLen = invLength(midX, midY, 0.0f);
                short v0 = addVertex(vertices, outerX[i], outerY[i], halfWidth, midX * invOuterLen, midY * invOuterLen, 0.0f);
                short v1 = addVertex(vertices, outerX[i], outerY[i], -halfWidth, midX * invOuterLen, midY * invOuterLen, 0.0f);
                short v2 = addVertex(vertices, outerX[next], outerY[next], -halfWidth, midX * invOuterLen, midY * invOuterLen, 0.0f);
                short v3 = addVertex(vertices, outerX[next], outerY[next], halfWidth, midX * invOuterLen, midY * invOuterLen, 0.0f);
                addQuad(indices, v0, v1, v2, v3, true);

                float innerMidX = (innerX[i] + innerX[next]) * 0.5f;
                float innerMidY = (innerY[i] + innerY[next]) * 0.5f;
                float invInnerLen = invLength(innerMidX, innerMidY, 0.0f);
                short i0 = addVertex(vertices, innerX[i], innerY[i], halfWidth, -innerMidX * invInnerLen, -innerMidY * invInnerLen, 0.0f);
                short i1 = addVertex(vertices, innerX[next], innerY[next], halfWidth, -innerMidX * invInnerLen, -innerMidY * invInnerLen, 0.0f);
                short i2 = addVertex(vertices, innerX[next], innerY[next], -halfWidth, -innerMidX * invInnerLen, -innerMidY * invInnerLen, 0.0f);
                short i3 = addVertex(vertices, innerX[i], innerY[i], -halfWidth, -innerMidX * invInnerLen, -innerMidY * invInnerLen, 0.0f);
                addQuad(indices, i0, i1, i2, i3, true);
            }

            int[] vaoIds = new int[1];
            int[] bufferIds = new int[2];
            glGenVertexArrays(1, vaoIds);
            glGenBuffers(2, bufferIds);

            int vao = vaoIds[0];
            int vbo = bufferIds[0];
            int ebo = bufferIds[1];

            glBindVertexArray(vao);
            glBindBuffer(GL_ARRAY_BUFFER, vbo);
            GLESCompat.glBufferDataFloats(GL_ARRAY_BUFFER, vertices.toArray(), GL_STATIC_DRAW);

            glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ebo);
            GLESCompat.glBufferDataShorts(GL_ELEMENT_ARRAY_BUFFER, indices.toArray(), GL_STATIC_DRAW);

            int stride = 6 * Float.BYTES;
            glEnableVertexAttribArray(0);
            glVertexAttribPointer(0, 3, GL_FLOAT, (byte) 0, stride, 0L);
            glEnableVertexAttribArray(1);
            glVertexAttribPointer(1, 3, GL_FLOAT, (byte) 0, stride, 3L * Float.BYTES);
            glBindVertexArray(0);

            return new GearMesh(vao, vbo, ebo, indices.size());
        }

        void delete() {
            glDeleteVertexArrays(1, new int[]{vao});
            glDeleteBuffers(1, new int[]{vbo});
            glDeleteBuffers(1, new int[]{ebo});
        }

        private static short addVertex(FloatArrayBuilder vertices, float x, float y, float z, float nx, float ny, float nz) {
            int current = vertices.size() / 6;
            if (current > 65535) {
                throw new IllegalStateException("Gear mesh has too many vertices for GL_UNSIGNED_SHORT indices.");
            }
            vertices.add(x);
            vertices.add(y);
            vertices.add(z);
            vertices.add(nx);
            vertices.add(ny);
            vertices.add(nz);
            return (short) current;
        }

        private static void addQuad(ShortArrayBuilder indices, short a, short b, short c, short d, boolean ccw) {
            if (ccw) {
                indices.add(a);
                indices.add(b);
                indices.add(c);
                indices.add(a);
                indices.add(c);
                indices.add(d);
            } else {
                indices.add(a);
                indices.add(c);
                indices.add(b);
                indices.add(a);
                indices.add(d);
                indices.add(c);
            }
        }

        private static float invLength(float x, float y, float z) {
            float length = (float) Math.sqrt(x * x + y * y + z * z);
            return length == 0.0f ? 0.0f : (1.0f / length);
        }
    }

    private static final class FloatArrayBuilder {
        private float[] values;
        private int size;

        FloatArrayBuilder(int initialCapacity) {
            values = new float[Math.max(16, initialCapacity)];
        }

        int size() {
            return size;
        }

        void add(float value) {
            if (size == values.length) {
                float[] expanded = new float[values.length * 2];
                System.arraycopy(values, 0, expanded, 0, values.length);
                values = expanded;
            }
            values[size++] = value;
        }

        float[] toArray() {
            float[] out = new float[size];
            System.arraycopy(values, 0, out, 0, size);
            return out;
        }
    }

    private static final class ShortArrayBuilder {
        private short[] values;
        private int size;

        ShortArrayBuilder(int initialCapacity) {
            values = new short[Math.max(16, initialCapacity)];
        }

        int size() {
            return size;
        }

        void add(short value) {
            if (size == values.length) {
                short[] expanded = new short[values.length * 2];
                System.arraycopy(values, 0, expanded, 0, values.length);
                values = expanded;
            }
            values[size++] = value;
        }

        short[] toArray() {
            short[] out = new short[size];
            System.arraycopy(values, 0, out, 0, size);
            return out;
        }
    }

    private static final class Mat4 {
        private Mat4() {
        }

        static void identity(float[] matrix) {
            for (int i = 0; i < 16; i++) {
                matrix[i] = 0.0f;
            }
            matrix[0] = 1.0f;
            matrix[5] = 1.0f;
            matrix[10] = 1.0f;
            matrix[15] = 1.0f;
        }

        static void multiply(float[] out, float[] left, float[] right) {
            float[] result = new float[16];
            for (int column = 0; column < 4; column++) {
                for (int row = 0; row < 4; row++) {
                    float sum = 0.0f;
                    for (int k = 0; k < 4; k++) {
                        sum += left[row + k * 4] * right[k + column * 4];
                    }
                    result[row + column * 4] = sum;
                }
            }
            System.arraycopy(result, 0, out, 0, 16);
        }

        static void perspective(float[] out, float fovYDegrees, float aspect, float near, float far) {
            float fovRadians = (float) Math.toRadians(fovYDegrees);
            float f = (float) (1.0 / Math.tan(fovRadians * 0.5));
            identity(out);
            out[0] = f / aspect;
            out[5] = f;
            out[10] = (far + near) / (near - far);
            out[11] = -1.0f;
            out[14] = (2.0f * far * near) / (near - far);
            out[15] = 0.0f;
        }

        static void lookAt(float[] out,
                           float eyeX, float eyeY, float eyeZ,
                           float centerX, float centerY, float centerZ,
                           float upX, float upY, float upZ) {
            float fx = centerX - eyeX;
            float fy = centerY - eyeY;
            float fz = centerZ - eyeZ;
            float invF = invLength(fx, fy, fz);
            fx *= invF;
            fy *= invF;
            fz *= invF;

            float sx = fy * upZ - fz * upY;
            float sy = fz * upX - fx * upZ;
            float sz = fx * upY - fy * upX;
            float invS = invLength(sx, sy, sz);
            sx *= invS;
            sy *= invS;
            sz *= invS;

            float ux = sy * fz - sz * fy;
            float uy = sz * fx - sx * fz;
            float uz = sx * fy - sy * fx;

            identity(out);
            out[0] = sx;
            out[1] = ux;
            out[2] = -fx;
            out[4] = sy;
            out[5] = uy;
            out[6] = -fy;
            out[8] = sz;
            out[9] = uz;
            out[10] = -fz;
            out[12] = -(sx * eyeX + sy * eyeY + sz * eyeZ);
            out[13] = -(ux * eyeX + uy * eyeY + uz * eyeZ);
            out[14] = fx * eyeX + fy * eyeY + fz * eyeZ;
        }

        static void translate(float[] matrix, float x, float y, float z) {
            identity(TRANSLATION);
            TRANSLATION[12] = x;
            TRANSLATION[13] = y;
            TRANSLATION[14] = z;
            multiply(TEMP, matrix, TRANSLATION);
            System.arraycopy(TEMP, 0, matrix, 0, 16);
        }

        static void rotateX(float[] matrix, float degrees) {
            float radians = (float) Math.toRadians(degrees);
            float c = (float) Math.cos(radians);
            float s = (float) Math.sin(radians);
            identity(ROTATION);
            ROTATION[5] = c;
            ROTATION[6] = s;
            ROTATION[9] = -s;
            ROTATION[10] = c;
            multiply(TEMP, matrix, ROTATION);
            System.arraycopy(TEMP, 0, matrix, 0, 16);
        }

        static void rotateZ(float[] matrix, float degrees) {
            float radians = (float) Math.toRadians(degrees);
            float c = (float) Math.cos(radians);
            float s = (float) Math.sin(radians);
            identity(ROTATION);
            ROTATION[0] = c;
            ROTATION[1] = s;
            ROTATION[4] = -s;
            ROTATION[5] = c;
            multiply(TEMP, matrix, ROTATION);
            System.arraycopy(TEMP, 0, matrix, 0, 16);
        }

        private static final float[] TEMP = new float[16];
        private static final float[] TRANSLATION = new float[16];
        private static final float[] ROTATION = new float[16];

        private static float invLength(float x, float y, float z) {
            float length = (float) Math.sqrt(x * x + y * y + z * z);
            return length == 0.0f ? 0.0f : (1.0f / length);
        }
    }
}
