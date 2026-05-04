package org.ngengine.libjglios.gles;

public final class GLES {
    private GLES() {
    }

    public static final int __gles2_gl2_h_ = 1;
    
    // #ifdef __cplusplus
    // #endif
    
    /*
    ** Copyright 2013-2020 The Khronos Group Inc.
    ** SPDX-License-Identifier: MIT
    **
    ** This header is generated from the Khronos OpenGL / OpenGL ES XML
    ** API Registry. The current version of the Registry, generator scripts
    ** used to make the header, and the header can be found at
    **   https://github.com/KhronosGroup/OpenGL-Registry
    */
    
    // #include <GLES2/gl2platform.h>
    
    // #ifndef GL_APIENTRYP
    // #define GL_APIENTRYP GL_APIENTRY*
    // #endif
    
    // #ifndef GL_GLES_PROTOTYPES
    public static final int GL_GLES_PROTOTYPES = 1;
    // #endif
    
    /* Generated on date 20210107 */
    
    /* Generated C header for:
        * API: gles2
        * Profile: common
        * Versions considered: 2\.[0-9]
        * Versions emitted: .*
        * Default extensions included: None
        * Additional extensions included: _nomatch_^
        * Extensions removed: _nomatch_^
        */
    
    // #ifndef GL_ES_VERSION_2_0
    public static final int GL_ES_VERSION_2_0 = 1;
    // #include <KHR/khrplatform.h>
    // Targeting ../GLvoid.java
    
    
    // Targeting ../__GLsync.java
    
    
    public static final int GL_DEPTH_BUFFER_BIT =               0x00000100;
    public static final int GL_STENCIL_BUFFER_BIT =             0x00000400;
    public static final int GL_COLOR_BUFFER_BIT =               0x00004000;
    public static final int GL_FALSE =                          0;
    public static final int GL_TRUE =                           1;
    public static final int GL_POINTS =                         0x0000;
    public static final int GL_LINES =                          0x0001;
    public static final int GL_LINE_LOOP =                      0x0002;
    public static final int GL_LINE_STRIP =                     0x0003;
    public static final int GL_TRIANGLES =                      0x0004;
    public static final int GL_TRIANGLE_STRIP =                 0x0005;
    public static final int GL_TRIANGLE_FAN =                   0x0006;
    public static final int GL_ZERO =                           0;
    public static final int GL_ONE =                            1;
    public static final int GL_SRC_COLOR =                      0x0300;
    public static final int GL_ONE_MINUS_SRC_COLOR =            0x0301;
    public static final int GL_SRC_ALPHA =                      0x0302;
    public static final int GL_ONE_MINUS_SRC_ALPHA =            0x0303;
    public static final int GL_DST_ALPHA =                      0x0304;
    public static final int GL_ONE_MINUS_DST_ALPHA =            0x0305;
    public static final int GL_DST_COLOR =                      0x0306;
    public static final int GL_ONE_MINUS_DST_COLOR =            0x0307;
    public static final int GL_SRC_ALPHA_SATURATE =             0x0308;
    public static final int GL_FUNC_ADD =                       0x8006;
    public static final int GL_BLEND_EQUATION =                 0x8009;
    public static final int GL_BLEND_EQUATION_RGB =             0x8009;
    public static final int GL_BLEND_EQUATION_ALPHA =           0x883D;
    public static final int GL_FUNC_SUBTRACT =                  0x800A;
    public static final int GL_FUNC_REVERSE_SUBTRACT =          0x800B;
    public static final int GL_BLEND_DST_RGB =                  0x80C8;
    public static final int GL_BLEND_SRC_RGB =                  0x80C9;
    public static final int GL_BLEND_DST_ALPHA =                0x80CA;
    public static final int GL_BLEND_SRC_ALPHA =                0x80CB;
    public static final int GL_CONSTANT_COLOR =                 0x8001;
    public static final int GL_ONE_MINUS_CONSTANT_COLOR =       0x8002;
    public static final int GL_CONSTANT_ALPHA =                 0x8003;
    public static final int GL_ONE_MINUS_CONSTANT_ALPHA =       0x8004;
    public static final int GL_BLEND_COLOR =                    0x8005;
    public static final int GL_ARRAY_BUFFER =                   0x8892;
    public static final int GL_ELEMENT_ARRAY_BUFFER =           0x8893;
    public static final int GL_ARRAY_BUFFER_BINDING =           0x8894;
    public static final int GL_ELEMENT_ARRAY_BUFFER_BINDING =   0x8895;
    public static final int GL_STREAM_DRAW =                    0x88E0;
    public static final int GL_STATIC_DRAW =                    0x88E4;
    public static final int GL_DYNAMIC_DRAW =                   0x88E8;
    public static final int GL_BUFFER_SIZE =                    0x8764;
    public static final int GL_BUFFER_USAGE =                   0x8765;
    public static final int GL_CURRENT_VERTEX_ATTRIB =          0x8626;
    public static final int GL_FRONT =                          0x0404;
    public static final int GL_BACK =                           0x0405;
    public static final int GL_FRONT_AND_BACK =                 0x0408;
    public static final int GL_TEXTURE_2D =                     0x0DE1;
    public static final int GL_CULL_FACE =                      0x0B44;
    public static final int GL_BLEND =                          0x0BE2;
    public static final int GL_DITHER =                         0x0BD0;
    public static final int GL_STENCIL_TEST =                   0x0B90;
    public static final int GL_DEPTH_TEST =                     0x0B71;
    public static final int GL_SCISSOR_TEST =                   0x0C11;
    public static final int GL_POLYGON_OFFSET_FILL =            0x8037;
    public static final int GL_SAMPLE_ALPHA_TO_COVERAGE =       0x809E;
    public static final int GL_SAMPLE_COVERAGE =                0x80A0;
    public static final int GL_NO_ERROR =                       0;
    public static final int GL_INVALID_ENUM =                   0x0500;
    public static final int GL_INVALID_VALUE =                  0x0501;
    public static final int GL_INVALID_OPERATION =              0x0502;
    public static final int GL_OUT_OF_MEMORY =                  0x0505;
    public static final int GL_CW =                             0x0900;
    public static final int GL_CCW =                            0x0901;
    public static final int GL_LINE_WIDTH =                     0x0B21;
    public static final int GL_ALIASED_POINT_SIZE_RANGE =       0x846D;
    public static final int GL_ALIASED_LINE_WIDTH_RANGE =       0x846E;
    public static final int GL_CULL_FACE_MODE =                 0x0B45;
    public static final int GL_FRONT_FACE =                     0x0B46;
    public static final int GL_DEPTH_RANGE =                    0x0B70;
    public static final int GL_DEPTH_WRITEMASK =                0x0B72;
    public static final int GL_DEPTH_CLEAR_VALUE =              0x0B73;
    public static final int GL_DEPTH_FUNC =                     0x0B74;
    public static final int GL_STENCIL_CLEAR_VALUE =            0x0B91;
    public static final int GL_STENCIL_FUNC =                   0x0B92;
    public static final int GL_STENCIL_FAIL =                   0x0B94;
    public static final int GL_STENCIL_PASS_DEPTH_FAIL =        0x0B95;
    public static final int GL_STENCIL_PASS_DEPTH_PASS =        0x0B96;
    public static final int GL_STENCIL_REF =                    0x0B97;
    public static final int GL_STENCIL_VALUE_MASK =             0x0B93;
    public static final int GL_STENCIL_WRITEMASK =              0x0B98;
    public static final int GL_STENCIL_BACK_FUNC =              0x8800;
    public static final int GL_STENCIL_BACK_FAIL =              0x8801;
    public static final int GL_STENCIL_BACK_PASS_DEPTH_FAIL =   0x8802;
    public static final int GL_STENCIL_BACK_PASS_DEPTH_PASS =   0x8803;
    public static final int GL_STENCIL_BACK_REF =               0x8CA3;
    public static final int GL_STENCIL_BACK_VALUE_MASK =        0x8CA4;
    public static final int GL_STENCIL_BACK_WRITEMASK =         0x8CA5;
    public static final int GL_VIEWPORT =                       0x0BA2;
    public static final int GL_SCISSOR_BOX =                    0x0C10;
    public static final int GL_COLOR_CLEAR_VALUE =              0x0C22;
    public static final int GL_COLOR_WRITEMASK =                0x0C23;
    public static final int GL_UNPACK_ALIGNMENT =               0x0CF5;
    public static final int GL_PACK_ALIGNMENT =                 0x0D05;
    public static final int GL_MAX_TEXTURE_SIZE =               0x0D33;
    public static final int GL_MAX_VIEWPORT_DIMS =              0x0D3A;
    public static final int GL_SUBPIXEL_BITS =                  0x0D50;
    public static final int GL_RED_BITS =                       0x0D52;
    public static final int GL_GREEN_BITS =                     0x0D53;
    public static final int GL_BLUE_BITS =                      0x0D54;
    public static final int GL_ALPHA_BITS =                     0x0D55;
    public static final int GL_DEPTH_BITS =                     0x0D56;
    public static final int GL_STENCIL_BITS =                   0x0D57;
    public static final int GL_POLYGON_OFFSET_UNITS =           0x2A00;
    public static final int GL_POLYGON_OFFSET_FACTOR =          0x8038;
    public static final int GL_TEXTURE_BINDING_2D =             0x8069;
    public static final int GL_SAMPLE_BUFFERS =                 0x80A8;
    public static final int GL_SAMPLES =                        0x80A9;
    public static final int GL_SAMPLE_COVERAGE_VALUE =          0x80AA;
    public static final int GL_SAMPLE_COVERAGE_INVERT =         0x80AB;
    public static final int GL_NUM_COMPRESSED_TEXTURE_FORMATS = 0x86A2;
    public static final int GL_COMPRESSED_TEXTURE_FORMATS =     0x86A3;
    public static final int GL_DONT_CARE =                      0x1100;
    public static final int GL_FASTEST =                        0x1101;
    public static final int GL_NICEST =                         0x1102;
    public static final int GL_GENERATE_MIPMAP_HINT =           0x8192;
    public static final int GL_BYTE =                           0x1400;
    public static final int GL_UNSIGNED_BYTE =                  0x1401;
    public static final int GL_SHORT =                          0x1402;
    public static final int GL_UNSIGNED_SHORT =                 0x1403;
    public static final int GL_INT =                            0x1404;
    public static final int GL_UNSIGNED_INT =                   0x1405;
    public static final int GL_FLOAT =                          0x1406;
    public static final int GL_FIXED =                          0x140C;
    public static final int GL_DEPTH_COMPONENT =                0x1902;
    public static final int GL_ALPHA =                          0x1906;
    public static final int GL_RGB =                            0x1907;
    public static final int GL_RGBA =                           0x1908;
    public static final int GL_LUMINANCE =                      0x1909;
    public static final int GL_LUMINANCE_ALPHA =                0x190A;
    public static final int GL_UNSIGNED_SHORT_4_4_4_4 =         0x8033;
    public static final int GL_UNSIGNED_SHORT_5_5_5_1 =         0x8034;
    public static final int GL_UNSIGNED_SHORT_5_6_5 =           0x8363;
    public static final int GL_FRAGMENT_SHADER =                0x8B30;
    public static final int GL_VERTEX_SHADER =                  0x8B31;
    public static final int GL_MAX_VERTEX_ATTRIBS =             0x8869;
    public static final int GL_MAX_VERTEX_UNIFORM_VECTORS =     0x8DFB;
    public static final int GL_MAX_VARYING_VECTORS =            0x8DFC;
    public static final int GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS = 0x8B4D;
    public static final int GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS = 0x8B4C;
    public static final int GL_MAX_TEXTURE_IMAGE_UNITS =        0x8872;
    public static final int GL_MAX_FRAGMENT_UNIFORM_VECTORS =   0x8DFD;
    public static final int GL_SHADER_TYPE =                    0x8B4F;
    public static final int GL_DELETE_STATUS =                  0x8B80;
    public static final int GL_LINK_STATUS =                    0x8B82;
    public static final int GL_VALIDATE_STATUS =                0x8B83;
    public static final int GL_ATTACHED_SHADERS =               0x8B85;
    public static final int GL_ACTIVE_UNIFORMS =                0x8B86;
    public static final int GL_ACTIVE_UNIFORM_MAX_LENGTH =      0x8B87;
    public static final int GL_ACTIVE_ATTRIBUTES =              0x8B89;
    public static final int GL_ACTIVE_ATTRIBUTE_MAX_LENGTH =    0x8B8A;
    public static final int GL_SHADING_LANGUAGE_VERSION =       0x8B8C;
    public static final int GL_CURRENT_PROGRAM =                0x8B8D;
    public static final int GL_NEVER =                          0x0200;
    public static final int GL_LESS =                           0x0201;
    public static final int GL_EQUAL =                          0x0202;
    public static final int GL_LEQUAL =                         0x0203;
    public static final int GL_GREATER =                        0x0204;
    public static final int GL_NOTEQUAL =                       0x0205;
    public static final int GL_GEQUAL =                         0x0206;
    public static final int GL_ALWAYS =                         0x0207;
    public static final int GL_KEEP =                           0x1E00;
    public static final int GL_REPLACE =                        0x1E01;
    public static final int GL_INCR =                           0x1E02;
    public static final int GL_DECR =                           0x1E03;
    public static final int GL_INVERT =                         0x150A;
    public static final int GL_INCR_WRAP =                      0x8507;
    public static final int GL_DECR_WRAP =                      0x8508;
    public static final int GL_VENDOR =                         0x1F00;
    public static final int GL_RENDERER =                       0x1F01;
    public static final int GL_VERSION =                        0x1F02;
    public static final int GL_EXTENSIONS =                     0x1F03;
    public static final int GL_NEAREST =                        0x2600;
    public static final int GL_LINEAR =                         0x2601;
    public static final int GL_NEAREST_MIPMAP_NEAREST =         0x2700;
    public static final int GL_LINEAR_MIPMAP_NEAREST =          0x2701;
    public static final int GL_NEAREST_MIPMAP_LINEAR =          0x2702;
    public static final int GL_LINEAR_MIPMAP_LINEAR =           0x2703;
    public static final int GL_TEXTURE_MAG_FILTER =             0x2800;
    public static final int GL_TEXTURE_MIN_FILTER =             0x2801;
    public static final int GL_TEXTURE_WRAP_S =                 0x2802;
    public static final int GL_TEXTURE_WRAP_T =                 0x2803;
    public static final int GL_TEXTURE =                        0x1702;
    public static final int GL_TEXTURE_CUBE_MAP =               0x8513;
    public static final int GL_TEXTURE_BINDING_CUBE_MAP =       0x8514;
    public static final int GL_TEXTURE_CUBE_MAP_POSITIVE_X =    0x8515;
    public static final int GL_TEXTURE_CUBE_MAP_NEGATIVE_X =    0x8516;
    public static final int GL_TEXTURE_CUBE_MAP_POSITIVE_Y =    0x8517;
    public static final int GL_TEXTURE_CUBE_MAP_NEGATIVE_Y =    0x8518;
    public static final int GL_TEXTURE_CUBE_MAP_POSITIVE_Z =    0x8519;
    public static final int GL_TEXTURE_CUBE_MAP_NEGATIVE_Z =    0x851A;
    public static final int GL_MAX_CUBE_MAP_TEXTURE_SIZE =      0x851C;
    public static final int GL_TEXTURE0 =                       0x84C0;
    public static final int GL_TEXTURE1 =                       0x84C1;
    public static final int GL_TEXTURE2 =                       0x84C2;
    public static final int GL_TEXTURE3 =                       0x84C3;
    public static final int GL_TEXTURE4 =                       0x84C4;
    public static final int GL_TEXTURE5 =                       0x84C5;
    public static final int GL_TEXTURE6 =                       0x84C6;
    public static final int GL_TEXTURE7 =                       0x84C7;
    public static final int GL_TEXTURE8 =                       0x84C8;
    public static final int GL_TEXTURE9 =                       0x84C9;
    public static final int GL_TEXTURE10 =                      0x84CA;
    public static final int GL_TEXTURE11 =                      0x84CB;
    public static final int GL_TEXTURE12 =                      0x84CC;
    public static final int GL_TEXTURE13 =                      0x84CD;
    public static final int GL_TEXTURE14 =                      0x84CE;
    public static final int GL_TEXTURE15 =                      0x84CF;
    public static final int GL_TEXTURE16 =                      0x84D0;
    public static final int GL_TEXTURE17 =                      0x84D1;
    public static final int GL_TEXTURE18 =                      0x84D2;
    public static final int GL_TEXTURE19 =                      0x84D3;
    public static final int GL_TEXTURE20 =                      0x84D4;
    public static final int GL_TEXTURE21 =                      0x84D5;
    public static final int GL_TEXTURE22 =                      0x84D6;
    public static final int GL_TEXTURE23 =                      0x84D7;
    public static final int GL_TEXTURE24 =                      0x84D8;
    public static final int GL_TEXTURE25 =                      0x84D9;
    public static final int GL_TEXTURE26 =                      0x84DA;
    public static final int GL_TEXTURE27 =                      0x84DB;
    public static final int GL_TEXTURE28 =                      0x84DC;
    public static final int GL_TEXTURE29 =                      0x84DD;
    public static final int GL_TEXTURE30 =                      0x84DE;
    public static final int GL_TEXTURE31 =                      0x84DF;
    public static final int GL_ACTIVE_TEXTURE =                 0x84E0;
    public static final int GL_REPEAT =                         0x2901;
    public static final int GL_CLAMP_TO_EDGE =                  0x812F;
    public static final int GL_MIRRORED_REPEAT =                0x8370;
    public static final int GL_FLOAT_VEC2 =                     0x8B50;
    public static final int GL_FLOAT_VEC3 =                     0x8B51;
    public static final int GL_FLOAT_VEC4 =                     0x8B52;
    public static final int GL_INT_VEC2 =                       0x8B53;
    public static final int GL_INT_VEC3 =                       0x8B54;
    public static final int GL_INT_VEC4 =                       0x8B55;
    public static final int GL_BOOL =                           0x8B56;
    public static final int GL_BOOL_VEC2 =                      0x8B57;
    public static final int GL_BOOL_VEC3 =                      0x8B58;
    public static final int GL_BOOL_VEC4 =                      0x8B59;
    public static final int GL_FLOAT_MAT2 =                     0x8B5A;
    public static final int GL_FLOAT_MAT3 =                     0x8B5B;
    public static final int GL_FLOAT_MAT4 =                     0x8B5C;
    public static final int GL_SAMPLER_2D =                     0x8B5E;
    public static final int GL_SAMPLER_CUBE =                   0x8B60;
    public static final int GL_VERTEX_ATTRIB_ARRAY_ENABLED =    0x8622;
    public static final int GL_VERTEX_ATTRIB_ARRAY_SIZE =       0x8623;
    public static final int GL_VERTEX_ATTRIB_ARRAY_STRIDE =     0x8624;
    public static final int GL_VERTEX_ATTRIB_ARRAY_TYPE =       0x8625;
    public static final int GL_VERTEX_ATTRIB_ARRAY_NORMALIZED = 0x886A;
    public static final int GL_VERTEX_ATTRIB_ARRAY_POINTER =    0x8645;
    public static final int GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 0x889F;
    public static final int GL_IMPLEMENTATION_COLOR_READ_TYPE = 0x8B9A;
    public static final int GL_IMPLEMENTATION_COLOR_READ_FORMAT = 0x8B9B;
    public static final int GL_COMPILE_STATUS =                 0x8B81;
    public static final int GL_INFO_LOG_LENGTH =                0x8B84;
    public static final int GL_SHADER_SOURCE_LENGTH =           0x8B88;
    public static final int GL_SHADER_COMPILER =                0x8DFA;
    public static final int GL_SHADER_BINARY_FORMATS =          0x8DF8;
    public static final int GL_NUM_SHADER_BINARY_FORMATS =      0x8DF9;
    public static final int GL_LOW_FLOAT =                      0x8DF0;
    public static final int GL_MEDIUM_FLOAT =                   0x8DF1;
    public static final int GL_HIGH_FLOAT =                     0x8DF2;
    public static final int GL_LOW_INT =                        0x8DF3;
    public static final int GL_MEDIUM_INT =                     0x8DF4;
    public static final int GL_HIGH_INT =                       0x8DF5;
    public static final int GL_FRAMEBUFFER =                    0x8D40;
    public static final int GL_RENDERBUFFER =                   0x8D41;
    public static final int GL_RGBA4 =                          0x8056;
    public static final int GL_RGB5_A1 =                        0x8057;
    public static final int GL_RGB565 =                         0x8D62;
    public static final int GL_DEPTH_COMPONENT16 =              0x81A5;
    public static final int GL_STENCIL_INDEX8 =                 0x8D48;
    public static final int GL_RENDERBUFFER_WIDTH =             0x8D42;
    public static final int GL_RENDERBUFFER_HEIGHT =            0x8D43;
    public static final int GL_RENDERBUFFER_INTERNAL_FORMAT =   0x8D44;
    public static final int GL_RENDERBUFFER_RED_SIZE =          0x8D50;
    public static final int GL_RENDERBUFFER_GREEN_SIZE =        0x8D51;
    public static final int GL_RENDERBUFFER_BLUE_SIZE =         0x8D52;
    public static final int GL_RENDERBUFFER_ALPHA_SIZE =        0x8D53;
    public static final int GL_RENDERBUFFER_DEPTH_SIZE =        0x8D54;
    public static final int GL_RENDERBUFFER_STENCIL_SIZE =      0x8D55;
    public static final int GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = 0x8CD0;
    public static final int GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = 0x8CD1;
    public static final int GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = 0x8CD2;
    public static final int GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 0x8CD3;
    public static final int GL_COLOR_ATTACHMENT0 =              0x8CE0;
    public static final int GL_DEPTH_ATTACHMENT =               0x8D00;
    public static final int GL_STENCIL_ATTACHMENT =             0x8D20;
    public static final int GL_NONE =                           0;
    public static final int GL_FRAMEBUFFER_COMPLETE =           0x8CD5;
    public static final int GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT = 0x8CD6;
    public static final int GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 0x8CD7;
    public static final int GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS = 0x8CD9;
    public static final int GL_FRAMEBUFFER_UNSUPPORTED =        0x8CDD;
    public static final int GL_FRAMEBUFFER_BINDING =            0x8CA6;
    public static final int GL_RENDERBUFFER_BINDING =           0x8CA7;
    public static final int GL_MAX_RENDERBUFFER_SIZE =          0x84E8;
    public static final int GL_INVALID_FRAMEBUFFER_OPERATION =  0x0506;
    // Targeting ../PFNGLACTIVETEXTUREPROC.java
    
    
    // Targeting ../PFNGLATTACHSHADERPROC.java
    
    
    // Targeting ../PFNGLBINDATTRIBLOCATIONPROC.java
    
    
    // Targeting ../PFNGLBINDBUFFERPROC.java
    
    
    // Targeting ../PFNGLBINDFRAMEBUFFERPROC.java
    
    
    // Targeting ../PFNGLBINDRENDERBUFFERPROC.java
    
    
    // Targeting ../PFNGLBINDTEXTUREPROC.java
    
    
    // Targeting ../PFNGLBLENDCOLORPROC.java
    
    
    // Targeting ../PFNGLBLENDEQUATIONPROC.java
    
    
    // Targeting ../PFNGLBLENDEQUATIONSEPARATEPROC.java
    
    
    // Targeting ../PFNGLBLENDFUNCPROC.java
    
    
    // Targeting ../PFNGLBLENDFUNCSEPARATEPROC.java
    
    
    // Targeting ../PFNGLBUFFERDATAPROC.java
    
    
    // Targeting ../PFNGLBUFFERSUBDATAPROC.java
    
    
    // Targeting ../PFNGLCHECKFRAMEBUFFERSTATUSPROC.java
    
    
    // Targeting ../PFNGLCLEARPROC.java
    
    
    // Targeting ../PFNGLCLEARCOLORPROC.java
    
    
    // Targeting ../PFNGLCLEARDEPTHFPROC.java
    
    
    // Targeting ../PFNGLCLEARSTENCILPROC.java
    
    
    // Targeting ../PFNGLCOLORMASKPROC.java
    
    
    // Targeting ../PFNGLCOMPILESHADERPROC.java
    
    
    // Targeting ../PFNGLCOMPRESSEDTEXIMAGE2DPROC.java
    
    
    // Targeting ../PFNGLCOMPRESSEDTEXSUBIMAGE2DPROC.java
    
    
    // Targeting ../PFNGLCOPYTEXIMAGE2DPROC.java
    
    
    // Targeting ../PFNGLCOPYTEXSUBIMAGE2DPROC.java
    
    
    // Targeting ../PFNGLCREATEPROGRAMPROC.java
    
    
    // Targeting ../PFNGLCREATESHADERPROC.java
    
    
    // Targeting ../PFNGLCULLFACEPROC.java
    
    
    // Targeting ../PFNGLDELETEBUFFERSPROC.java
    
    
    // Targeting ../PFNGLDELETEFRAMEBUFFERSPROC.java
    
    
    // Targeting ../PFNGLDELETEPROGRAMPROC.java
    
    
    // Targeting ../PFNGLDELETERENDERBUFFERSPROC.java
    
    
    // Targeting ../PFNGLDELETESHADERPROC.java
    
    
    // Targeting ../PFNGLDELETETEXTURESPROC.java
    
    
    // Targeting ../PFNGLDEPTHFUNCPROC.java
    
    
    // Targeting ../PFNGLDEPTHMASKPROC.java
    
    
    // Targeting ../PFNGLDEPTHRANGEFPROC.java
    
    
    // Targeting ../PFNGLDETACHSHADERPROC.java
    
    
    // Targeting ../PFNGLDISABLEPROC.java
    
    
    // Targeting ../PFNGLDISABLEVERTEXATTRIBARRAYPROC.java
    
    
    // Targeting ../PFNGLDRAWARRAYSPROC.java
    
    
    // Targeting ../PFNGLDRAWELEMENTSPROC.java
    
    
    // Targeting ../PFNGLENABLEPROC.java
    
    
    // Targeting ../PFNGLENABLEVERTEXATTRIBARRAYPROC.java
    
    
    // Targeting ../PFNGLFINISHPROC.java
    
    
    // Targeting ../PFNGLFLUSHPROC.java
    
    
    // Targeting ../PFNGLFRAMEBUFFERRENDERBUFFERPROC.java
    
    
    // Targeting ../PFNGLFRAMEBUFFERTEXTURE2DPROC.java
    
    
    // Targeting ../PFNGLFRONTFACEPROC.java
    
    
    // Targeting ../PFNGLGENBUFFERSPROC.java
    
    
    // Targeting ../PFNGLGENERATEMIPMAPPROC.java
    
    
    // Targeting ../PFNGLGENFRAMEBUFFERSPROC.java
    
    
    // Targeting ../PFNGLGENRENDERBUFFERSPROC.java
    
    
    // Targeting ../PFNGLGENTEXTURESPROC.java
    
    
    // Targeting ../PFNGLGETACTIVEATTRIBPROC.java
    
    
    // Targeting ../PFNGLGETACTIVEUNIFORMPROC.java
    
    
    // Targeting ../PFNGLGETATTACHEDSHADERSPROC.java
    
    
    // Targeting ../PFNGLGETATTRIBLOCATIONPROC.java
    
    
    // Targeting ../PFNGLGETBOOLEANVPROC.java
    
    
    // Targeting ../PFNGLGETBUFFERPARAMETERIVPROC.java
    
    
    // Targeting ../PFNGLGETERRORPROC.java
    
    
    // Targeting ../PFNGLGETFLOATVPROC.java
    
    
    // Targeting ../PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVPROC.java
    
    
    // Targeting ../PFNGLGETINTEGERVPROC.java
    
    
    // Targeting ../PFNGLGETPROGRAMIVPROC.java
    
    
    // Targeting ../PFNGLGETPROGRAMINFOLOGPROC.java
    
    
    // Targeting ../PFNGLGETRENDERBUFFERPARAMETERIVPROC.java
    
    
    // Targeting ../PFNGLGETSHADERIVPROC.java
    
    
    // Targeting ../PFNGLGETSHADERINFOLOGPROC.java
    
    
    // Targeting ../PFNGLGETSHADERPRECISIONFORMATPROC.java
    
    
    // Targeting ../PFNGLGETSHADERSOURCEPROC.java
    
    
    // Targeting ../PFNGLGETSTRINGPROC.java
    
    
    // Targeting ../PFNGLGETTEXPARAMETERFVPROC.java
    
    
    // Targeting ../PFNGLGETTEXPARAMETERIVPROC.java
    
    
    // Targeting ../PFNGLGETUNIFORMFVPROC.java
    
    
    // Targeting ../PFNGLGETUNIFORMIVPROC.java
    
    
    // Targeting ../PFNGLGETUNIFORMLOCATIONPROC.java
    
    
    // Targeting ../PFNGLGETVERTEXATTRIBFVPROC.java
    
    
    // Targeting ../PFNGLGETVERTEXATTRIBIVPROC.java
    
    
    // Targeting ../PFNGLGETVERTEXATTRIBPOINTERVPROC.java
    
    
    // Targeting ../PFNGLHINTPROC.java
    
    
    // Targeting ../PFNGLISBUFFERPROC.java
    
    
    // Targeting ../PFNGLISENABLEDPROC.java
    
    
    // Targeting ../PFNGLISFRAMEBUFFERPROC.java
    
    
    // Targeting ../PFNGLISPROGRAMPROC.java
    
    
    // Targeting ../PFNGLISRENDERBUFFERPROC.java
    
    
    // Targeting ../PFNGLISSHADERPROC.java
    
    
    // Targeting ../PFNGLISTEXTUREPROC.java
    
    
    // Targeting ../PFNGLLINEWIDTHPROC.java
    
    
    // Targeting ../PFNGLLINKPROGRAMPROC.java
    
    
    // Targeting ../PFNGLPIXELSTOREIPROC.java
    
    
    // Targeting ../PFNGLPOLYGONOFFSETPROC.java
    
    
    // Targeting ../PFNGLREADPIXELSPROC.java
    
    
    // Targeting ../PFNGLRELEASESHADERCOMPILERPROC.java
    
    
    // Targeting ../PFNGLRENDERBUFFERSTORAGEPROC.java
    
    
    // Targeting ../PFNGLSAMPLECOVERAGEPROC.java
    
    
    // Targeting ../PFNGLSCISSORPROC.java
    
    
    // Targeting ../PFNGLSHADERBINARYPROC.java
    
    
    // Targeting ../PFNGLSHADERSOURCEPROC.java
    
    
    // Targeting ../PFNGLSTENCILFUNCPROC.java
    
    
    // Targeting ../PFNGLSTENCILFUNCSEPARATEPROC.java
    
    
    // Targeting ../PFNGLSTENCILMASKPROC.java
    
    
    // Targeting ../PFNGLSTENCILMASKSEPARATEPROC.java
    
    
    // Targeting ../PFNGLSTENCILOPPROC.java
    
    
    // Targeting ../PFNGLSTENCILOPSEPARATEPROC.java
    
    
    // Targeting ../PFNGLTEXIMAGE2DPROC.java
    
    
    // Targeting ../PFNGLTEXPARAMETERFPROC.java
    
    
    // Targeting ../PFNGLTEXPARAMETERFVPROC.java
    
    
    // Targeting ../PFNGLTEXPARAMETERIPROC.java
    
    
    // Targeting ../PFNGLTEXPARAMETERIVPROC.java
    
    
    // Targeting ../PFNGLTEXSUBIMAGE2DPROC.java
    
    
    // Targeting ../PFNGLUNIFORM1FPROC.java
    
    
    // Targeting ../PFNGLUNIFORM1FVPROC.java
    
    
    // Targeting ../PFNGLUNIFORM1IPROC.java
    
    
    // Targeting ../PFNGLUNIFORM1IVPROC.java
    
    
    // Targeting ../PFNGLUNIFORM2FPROC.java
    
    
    // Targeting ../PFNGLUNIFORM2FVPROC.java
    
    
    // Targeting ../PFNGLUNIFORM2IPROC.java
    
    
    // Targeting ../PFNGLUNIFORM2IVPROC.java
    
    
    // Targeting ../PFNGLUNIFORM3FPROC.java
    
    
    // Targeting ../PFNGLUNIFORM3FVPROC.java
    
    
    // Targeting ../PFNGLUNIFORM3IPROC.java
    
    
    // Targeting ../PFNGLUNIFORM3IVPROC.java
    
    
    // Targeting ../PFNGLUNIFORM4FPROC.java
    
    
    // Targeting ../PFNGLUNIFORM4FVPROC.java
    
    
    // Targeting ../PFNGLUNIFORM4IPROC.java
    
    
    // Targeting ../PFNGLUNIFORM4IVPROC.java
    
    
    // Targeting ../PFNGLUNIFORMMATRIX2FVPROC.java
    
    
    // Targeting ../PFNGLUNIFORMMATRIX3FVPROC.java
    
    
    // Targeting ../PFNGLUNIFORMMATRIX4FVPROC.java
    
    
    // Targeting ../PFNGLUSEPROGRAMPROC.java
    
    
    // Targeting ../PFNGLVALIDATEPROGRAMPROC.java
    
    
    // Targeting ../PFNGLVERTEXATTRIB1FPROC.java
    
    
    // Targeting ../PFNGLVERTEXATTRIB1FVPROC.java
    
    
    // Targeting ../PFNGLVERTEXATTRIB2FPROC.java
    
    
    // Targeting ../PFNGLVERTEXATTRIB2FVPROC.java
    
    
    // Targeting ../PFNGLVERTEXATTRIB3FPROC.java
    
    
    // Targeting ../PFNGLVERTEXATTRIB3FVPROC.java
    
    
    // Targeting ../PFNGLVERTEXATTRIB4FPROC.java
    
    
    // Targeting ../PFNGLVERTEXATTRIB4FVPROC.java
    
    
    // Targeting ../PFNGLVERTEXATTRIBPOINTERPROC.java
    
    
    // Targeting ../PFNGLVIEWPORTPROC.java
    
    
    // #if GL_GLES_PROTOTYPES

    public static native byte glAcquireKeyedMutexWin32EXT(int memory, long key, int timeout);
    public static native void glActiveShaderProgramEXT(int pipeline, int program);
    public static native void glActiveTexture(int texture);
    public static native void glAlphaFuncQCOM(int func, float ref);
    public static native void glApplyFramebufferAttachmentCMAAINTEL();
    public static native void glAttachShader(int program, int shader);
    public static native void glBeginConditionalRenderNV(int id, int mode);
    public static native void glBeginPerfMonitorAMD(int monitor);
    public static native void glBeginPerfQueryINTEL(int queryHandle);
    public static native void glBeginQuery(int target, int id);
    public static native void glBeginQueryEXT(int target, int id);
    public static native void glBeginTransformFeedback(int primitiveMode);
    public static native void glBindAttribLocation(int program, int index, byte[] name);
    public static native void glBindBuffer(int target, int buffer);
    public static native void glBindBufferBase(int target, int index, int buffer);
    public static native void glBindBufferRange(int target, int index, int buffer, long offset, long size);
    public static native void glBindFragDataLocationEXT(int program, int color, byte[] name);
    public static native void glBindFragDataLocationIndexedEXT(int program, int colorNumber, int index, byte[] name);
    public static native void glBindFramebuffer(int target, int framebuffer);
    public static native void glBindProgramPipelineEXT(int pipeline);
    public static native void glBindRenderbuffer(int target, int renderbuffer);
    public static native void glBindSampler(int unit, int sampler);
    public static native void glBindShadingRateImageNV(int texture);
    public static native void glBindTexture(int target, int texture);
    public static native void glBindTransformFeedback(int target, int id);
    public static native void glBindVertexArray(int array);
    public static native void glBindVertexArrayOES(int array);
    public static native void glBlendBarrierKHR();
    public static native void glBlendBarrierNV();
    public static native void glBlendColor(float red, float green, float blue, float alpha);
    public static native void glBlendEquation(int mode);
    public static native void glBlendEquationSeparate(int modeRGB, int modeAlpha);
    public static native void glBlendEquationSeparateiEXT(int buf, int modeRGB, int modeAlpha);
    public static native void glBlendEquationSeparateiOES(int buf, int modeRGB, int modeAlpha);
    public static native void glBlendEquationiEXT(int buf, int mode);
    public static native void glBlendEquationiOES(int buf, int mode);
    public static native void glBlendFunc(int sfactor, int dfactor);
    public static native void glBlendFuncSeparate(int sfactorRGB, int dfactorRGB, int sfactorAlpha, int dfactorAlpha);
    public static native void glBlendFuncSeparateiEXT(int buf, int srcRGB, int dstRGB, int srcAlpha, int dstAlpha);
    public static native void glBlendFuncSeparateiOES(int buf, int srcRGB, int dstRGB, int srcAlpha, int dstAlpha);
    public static native void glBlendFunciEXT(int buf, int src, int dst);
    public static native void glBlendFunciOES(int buf, int src, int dst);
    public static native void glBlendParameteriNV(int pname, int value);
    public static native void glBlitFramebuffer(int srcX0, int srcY0, int srcX1, int srcY1, int dstX0, int dstY0, int dstX1, int dstY1, int mask, int filter);
    public static native void glBlitFramebufferANGLE(int srcX0, int srcY0, int srcX1, int srcY1, int dstX0, int dstY0, int dstX1, int dstY1, int mask, int filter);
    public static native void glBlitFramebufferNV(int srcX0, int srcY0, int srcX1, int srcY1, int dstX0, int dstY0, int dstX1, int dstY1, int mask, int filter);
    public static native void glBufferAttachMemoryNV(int target, int memory, long offset);
    public static native void glBufferData(int target, long size, long data, int usage);
    public static native void glBufferPageCommitmentMemNV(int target, long offset, long size, int memory, long memOffset, byte commit);
    public static native void glBufferStorageEXT(int target, long size, long data, int flags);
    public static native void glBufferStorageExternalEXT(int target, long offset, long size, long clientBuffer, int flags);
    public static native void glBufferStorageMemEXT(int target, long size, int memory, long offset);
    public static native void glBufferSubData(int target, long offset, long size, long data);
    public static native int glCheckFramebufferStatus(int target);
    public static native void glClear(int mask);
    public static native void glClearBufferfi(int buffer, int drawbuffer, float depth, int stencil);
    public static native void glClearBufferfv(int buffer, int drawbuffer, float[] value);
    public static native void glClearBufferiv(int buffer, int drawbuffer, int[] value);
    public static native void glClearBufferuiv(int buffer, int drawbuffer, int[] value);
    public static native void glClearColor(float red, float green, float blue, float alpha);
    public static native void glClearDepthf(float d);
    public static native void glClearPixelLocalStorageuiEXT(int offset, int n, int[] values);
    public static native void glClearStencil(int s);
    public static native void glClearTexImageEXT(int texture, int level, int format, int type, long data);
    public static native void glClearTexSubImageEXT(int texture, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, int format, int type, long data);
    public static native int glClientWaitSync(long sync, int flags, long timeout);
    public static native int glClientWaitSyncAPPLE(long sync, int flags, long timeout);
    public static native void glClipControlEXT(int origin, int depth);
    public static native void glColorMask(byte red, byte green, byte blue, byte alpha);
    public static native void glColorMaskiEXT(int index, byte r, byte g, byte b, byte a);
    public static native void glColorMaskiOES(int index, byte r, byte g, byte b, byte a);
    public static native void glCompileShader(int shader);
    public static native void glCompressedTexImage2D(int target, int level, int internalformat, int width, int height, int border, int imageSize, long data);
    public static native void glCompressedTexImage3D(int target, int level, int internalformat, int width, int height, int depth, int border, int imageSize, long data);
    public static native void glCompressedTexImage3DOES(int target, int level, int internalformat, int width, int height, int depth, int border, int imageSize, long data);
    public static native void glCompressedTexSubImage2D(int target, int level, int xoffset, int yoffset, int width, int height, int format, int imageSize, long data);
    public static native void glCompressedTexSubImage3D(int target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, int format, int imageSize, long data);
    public static native void glCompressedTexSubImage3DOES(int target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, int format, int imageSize, long data);
    public static native void glConservativeRasterParameteriNV(int pname, int param);
    public static native void glCopyBufferSubData(int readTarget, int writeTarget, long readOffset, long writeOffset, long size);
    public static native void glCopyBufferSubDataNV(int readTarget, int writeTarget, long readOffset, long writeOffset, long size);
    public static native void glCopyImageSubDataEXT(int srcName, int srcTarget, int srcLevel, int srcX, int srcY, int srcZ, int dstName, int dstTarget, int dstLevel, int dstX, int dstY, int dstZ, int srcWidth, int srcHeight, int srcDepth);
    public static native void glCopyImageSubDataOES(int srcName, int srcTarget, int srcLevel, int srcX, int srcY, int srcZ, int dstName, int dstTarget, int dstLevel, int dstX, int dstY, int dstZ, int srcWidth, int srcHeight, int srcDepth);
    public static native void glCopyPathNV(int resultPath, int srcPath);
    public static native void glCopyTexImage2D(int target, int level, int internalformat, int x, int y, int width, int height, int border);
    public static native void glCopyTexSubImage2D(int target, int level, int xoffset, int yoffset, int x, int y, int width, int height);
    public static native void glCopyTexSubImage3D(int target, int level, int xoffset, int yoffset, int zoffset, int x, int y, int width, int height);
    public static native void glCopyTexSubImage3DOES(int target, int level, int xoffset, int yoffset, int zoffset, int x, int y, int width, int height);
    public static native void glCopyTextureLevelsAPPLE(int destinationTexture, int sourceTexture, int sourceBaseLevel, int sourceLevelCount);
    public static native void glCoverFillPathInstancedNV(int numPaths, int pathNameType, long paths, int pathBase, int coverMode, int transformType, float[] transformValues);
    public static native void glCoverFillPathNV(int path, int coverMode);
    public static native void glCoverStrokePathInstancedNV(int numPaths, int pathNameType, long paths, int pathBase, int coverMode, int transformType, float[] transformValues);
    public static native void glCoverStrokePathNV(int path, int coverMode);
    public static native void glCoverageMaskNV(byte mask);
    public static native void glCoverageModulationNV(int components);
    public static native void glCoverageModulationTableNV(int n, float[] v);
    public static native void glCoverageOperationNV(int operation);
    public static native void glCreateMemoryObjectsEXT(int n, int[] memoryObjects);
    public static native void glCreatePerfQueryINTEL(int queryId, int[] queryHandle);
    public static native int glCreateProgram();
    public static native void glCreateSemaphoresNV(int n, int[] semaphores);
    public static native int glCreateShader(int type);
    public static native int glCreateShaderProgramvEXT(int type, int count, byte[] strings);
    public static native void glCullFace(int mode);
    public static native void glDebugMessageCallbackKHR(long callback, long userParam);
    public static native void glDebugMessageControlKHR(int source, int type, int severity, int count, int[] ids, byte enabled);
    public static native void glDebugMessageInsertKHR(int source, int type, int id, int severity, int length, byte[] buf);
    public static native void glDeleteBuffers(int n, int[] buffers);
    public static native void glDeleteFencesNV(int n, int[] fences);
    public static native void glDeleteFramebuffers(int n, int[] framebuffers);
    public static native void glDeleteMemoryObjectsEXT(int n, int[] memoryObjects);
    public static native void glDeletePathsNV(int path, int range);
    public static native void glDeletePerfMonitorsAMD(int n, int[] monitors);
    public static native void glDeletePerfQueryINTEL(int queryHandle);
    public static native void glDeleteProgram(int program);
    public static native void glDeleteProgramPipelinesEXT(int n, int[] pipelines);
    public static native void glDeleteQueries(int n, int[] ids);
    public static native void glDeleteQueriesEXT(int n, int[] ids);
    public static native void glDeleteRenderbuffers(int n, int[] renderbuffers);
    public static native void glDeleteSamplers(int count, int[] samplers);
    public static native void glDeleteSemaphoresEXT(int n, int[] semaphores);
    public static native void glDeleteShader(int shader);
    public static native void glDeleteSync(long sync);
    public static native void glDeleteSyncAPPLE(long sync);
    public static native void glDeleteTextures(int n, int[] textures);
    public static native void glDeleteTransformFeedbacks(int n, int[] ids);
    public static native void glDeleteVertexArrays(int n, int[] arrays);
    public static native void glDeleteVertexArraysOES(int n, int[] arrays);
    public static native void glDepthFunc(int func);
    public static native void glDepthMask(byte flag);
    public static native void glDepthRangeArrayfvNV(int first, int count, float[] v);
    public static native void glDepthRangeArrayfvOES(int first, int count, float[] v);
    public static native void glDepthRangeIndexedfNV(int index, float n, float f);
    public static native void glDepthRangeIndexedfOES(int index, float n, float f);
    public static native void glDepthRangef(float n, float f);
    public static native void glDetachShader(int program, int shader);
    public static native void glDisable(int cap);
    public static native void glDisableDriverControlQCOM(int driverControl);
    public static native void glDisableVertexAttribArray(int index);
    public static native void glDisableiEXT(int target, int index);
    public static native void glDisableiNV(int target, int index);
    public static native void glDisableiOES(int target, int index);
    public static native void glDiscardFramebufferEXT(int target, int numAttachments, int[] attachments);
    public static native void glDrawArrays(int mode, int first, int count);
    public static native void glDrawArraysInstanced(int mode, int first, int count, int instancecount);
    public static native void glDrawArraysInstancedANGLE(int mode, int first, int count, int primcount);
    public static native void glDrawArraysInstancedBaseInstanceEXT(int mode, int first, int count, int instancecount, int baseinstance);
    public static native void glDrawArraysInstancedEXT(int mode, int start, int count, int primcount);
    public static native void glDrawArraysInstancedNV(int mode, int first, int count, int primcount);
    public static native void glDrawBuffers(int n, int[] bufs);
    public static native void glDrawBuffersEXT(int n, int[] bufs);
    public static native void glDrawBuffersIndexedEXT(int n, int[] location, int[] indices);
    public static native void glDrawBuffersNV(int n, int[] bufs);
    public static native void glDrawElements(int mode, int count, int type, long indices);
    public static native void glDrawElementsBaseVertexEXT(int mode, int count, int type, long indices, int basevertex);
    public static native void glDrawElementsBaseVertexOES(int mode, int count, int type, long indices, int basevertex);
    public static native void glDrawElementsInstanced(int mode, int count, int type, long indices, int instancecount);
    public static native void glDrawElementsInstancedANGLE(int mode, int count, int type, long indices, int primcount);
    public static native void glDrawElementsInstancedBaseInstanceEXT(int mode, int count, int type, long indices, int instancecount, int baseinstance);
    public static native void glDrawElementsInstancedBaseVertexBaseInstanceEXT(int mode, int count, int type, long indices, int instancecount, int basevertex, int baseinstance);
    public static native void glDrawElementsInstancedBaseVertexEXT(int mode, int count, int type, long indices, int instancecount, int basevertex);
    public static native void glDrawElementsInstancedBaseVertexOES(int mode, int count, int type, long indices, int instancecount, int basevertex);
    public static native void glDrawElementsInstancedEXT(int mode, int count, int type, long indices, int primcount);
    public static native void glDrawElementsInstancedNV(int mode, int count, int type, long indices, int primcount);
    public static native void glDrawMeshTasksIndirectNV(long indirect);
    public static native void glDrawMeshTasksNV(int first, int count);
    public static native void glDrawRangeElements(int mode, int start, int end, int count, int type, long indices);
    public static native void glDrawRangeElementsBaseVertexEXT(int mode, int start, int end, int count, int type, long indices, int basevertex);
    public static native void glDrawRangeElementsBaseVertexOES(int mode, int start, int end, int count, int type, long indices, int basevertex);
    public static native void glDrawTransformFeedbackEXT(int mode, int id);
    public static native void glDrawTransformFeedbackInstancedEXT(int mode, int id, int instancecount);
    public static native void glDrawVkImageNV(long vkImage, int sampler, float x0, float y0, float x1, float y1, float z, float s0, float t0, float s1, float t1);
    public static native void glEGLImageTargetRenderbufferStorageOES(int target, long image);
    public static native void glEGLImageTargetTexStorageEXT(int target, long image, int[] attrib_list);
    public static native void glEGLImageTargetTexture2DOES(int target, long image);
    public static native void glEGLImageTargetTextureStorageEXT(int texture, long image, int[] attrib_list);
    public static native void glEnable(int cap);
    public static native void glEnableDriverControlQCOM(int driverControl);
    public static native void glEnableVertexAttribArray(int index);
    public static native void glEnableiEXT(int target, int index);
    public static native void glEnableiNV(int target, int index);
    public static native void glEnableiOES(int target, int index);
    public static native void glEndConditionalRenderNV();
    public static native void glEndPerfMonitorAMD(int monitor);
    public static native void glEndPerfQueryINTEL(int queryHandle);
    public static native void glEndQuery(int target);
    public static native void glEndQueryEXT(int target);
    public static native void glEndTilingQCOM(int preserveMask);
    public static native void glEndTransformFeedback();
    public static native void glExtGetBufferPointervQCOM(int target, long params);
    public static native void glExtGetBuffersQCOM(int[] buffers, int maxBuffers, int[] numBuffers);
    public static native void glExtGetFramebuffersQCOM(int[] framebuffers, int maxFramebuffers, int[] numFramebuffers);
    public static native void glExtGetProgramBinarySourceQCOM(int program, int shadertype, byte[] source, int[] length);
    public static native void glExtGetProgramsQCOM(int[] programs, int maxPrograms, int[] numPrograms);
    public static native void glExtGetRenderbuffersQCOM(int[] renderbuffers, int maxRenderbuffers, int[] numRenderbuffers);
    public static native void glExtGetShadersQCOM(int[] shaders, int maxShaders, int[] numShaders);
    public static native void glExtGetTexLevelParameterivQCOM(int texture, int face, int level, int pname, int[] params);
    public static native void glExtGetTexSubImageQCOM(int target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, int format, int type, long texels);
    public static native void glExtGetTexturesQCOM(int[] textures, int maxTextures, int[] numTextures);
    public static native byte glExtIsProgramBinaryQCOM(int program);
    public static native void glExtTexObjectStateOverrideiQCOM(int target, int pname, int param);
    public static native void glExtrapolateTex2DQCOM(int src1, int src2, int output, float scaleFactor);
    public static native long glFenceSync(int condition, int flags);
    public static native long glFenceSyncAPPLE(int condition, int flags);
    public static native void glFinish();
    public static native void glFinishFenceNV(int fence);
    public static native void glFlush();
    public static native void glFlushMappedBufferRange(int target, long offset, long length);
    public static native void glFlushMappedBufferRangeEXT(int target, long offset, long length);
    public static native void glFragmentCoverageColorNV(int color);
    public static native void glFramebufferFetchBarrierEXT();
    public static native void glFramebufferFetchBarrierQCOM();
    public static native void glFramebufferFoveationConfigQCOM(int framebuffer, int numLayers, int focalPointsPerLayer, int requestedFeatures, int[] providedFeatures);
    public static native void glFramebufferFoveationParametersQCOM(int framebuffer, int layer, int focalPoint, float focalX, float focalY, float gainX, float gainY, float foveaArea);
    public static native void glFramebufferParameteriMESA(int target, int pname, int param);
    public static native void glFramebufferPixelLocalStorageSizeEXT(int target, int size);
    public static native void glFramebufferRenderbuffer(int target, int attachment, int renderbuffertarget, int renderbuffer);
    public static native void glFramebufferSampleLocationsfvNV(int target, int start, int count, float[] v);
    public static native void glFramebufferTexture2D(int target, int attachment, int textarget, int texture, int level);
    public static native void glFramebufferTexture2DDownsampleIMG(int target, int attachment, int textarget, int texture, int level, int xscale, int yscale);
    public static native void glFramebufferTexture2DMultisampleEXT(int target, int attachment, int textarget, int texture, int level, int samples);
    public static native void glFramebufferTexture2DMultisampleIMG(int target, int attachment, int textarget, int texture, int level, int samples);
    public static native void glFramebufferTexture3DOES(int target, int attachment, int textarget, int texture, int level, int zoffset);
    public static native void glFramebufferTextureEXT(int target, int attachment, int texture, int level);
    public static native void glFramebufferTextureLayer(int target, int attachment, int texture, int level, int layer);
    public static native void glFramebufferTextureLayerDownsampleIMG(int target, int attachment, int texture, int level, int layer, int xscale, int yscale);
    public static native void glFramebufferTextureMultisampleMultiviewOVR(int target, int attachment, int texture, int level, int samples, int baseViewIndex, int numViews);
    public static native void glFramebufferTextureMultiviewOVR(int target, int attachment, int texture, int level, int baseViewIndex, int numViews);
    public static native void glFramebufferTextureOES(int target, int attachment, int texture, int level);
    public static native void glFrontFace(int mode);
    public static native void glGenBuffers(int n, int[] buffers);
    public static native void glGenFencesNV(int n, int[] fences);
    public static native void glGenFramebuffers(int n, int[] framebuffers);
    public static native int glGenPathsNV(int range);
    public static native void glGenPerfMonitorsAMD(int n, int[] monitors);
    public static native void glGenProgramPipelinesEXT(int n, int[] pipelines);
    public static native void glGenQueries(int n, int[] ids);
    public static native void glGenQueriesEXT(int n, int[] ids);
    public static native void glGenRenderbuffers(int n, int[] renderbuffers);
    public static native void glGenSamplers(int count, int[] samplers);
    public static native void glGenSemaphoresEXT(int n, int[] semaphores);
    public static native void glGenTextures(int n, int[] textures);
    public static native void glGenTransformFeedbacks(int n, int[] ids);
    public static native void glGenVertexArrays(int n, int[] arrays);
    public static native void glGenVertexArraysOES(int n, int[] arrays);
    public static native void glGenerateMipmap(int target);
    public static native void glGetActiveAttrib(int program, int index, int bufSize, int[] length, int[] size, int[] type, byte[] name);
    public static native void glGetActiveUniform(int program, int index, int bufSize, int[] length, int[] size, int[] type, byte[] name);
    public static native void glGetActiveUniformBlockName(int program, int uniformBlockIndex, int bufSize, int[] length, byte[] uniformBlockName);
    public static native void glGetActiveUniformBlockiv(int program, int uniformBlockIndex, int pname, int[] params);
    public static native void glGetActiveUniformsiv(int program, int uniformCount, int[] uniformIndices, int pname, int[] params);
    public static native void glGetAttachedShaders(int program, int maxCount, int[] count, int[] shaders);
    public static native int glGetAttribLocation(int program, byte[] name);
    public static native void glGetBooleanv(int pname, byte[] data);
    public static native void glGetBufferParameteri64v(int target, int pname, long[] params);
    public static native void glGetBufferParameteriv(int target, int pname, int[] params);
    public static native void glGetBufferPointerv(int target, int pname, long params);
    public static native void glGetBufferPointervOES(int target, int pname, long params);
    public static native void glGetCoverageModulationTableNV(int bufSize, float[] v);
    public static native int glGetDebugMessageLogKHR(int count, int bufSize, int[] sources, int[] types, int[] ids, int[] severities, int[] lengths, byte[] messageLog);
    public static native void glGetDriverControlStringQCOM(int driverControl, int bufSize, int[] length, byte[] driverControlString);
    public static native void glGetDriverControlsQCOM(int[] num, int size, int[] driverControls);
    public static native int glGetError();
    public static native void glGetFenceivNV(int fence, int pname, int[] params);
    public static native void glGetFirstPerfQueryIdINTEL(int[] queryId);
    public static native void glGetFloati_vNV(int target, int index, float[] data);
    public static native void glGetFloati_vOES(int target, int index, float[] data);
    public static native void glGetFloatv(int pname, float[] data);
    public static native int glGetFragDataIndexEXT(int program, byte[] name);
    public static native int glGetFragDataLocation(int program, byte[] name);
    public static native void glGetFramebufferAttachmentParameteriv(int target, int attachment, int pname, int[] params);
    public static native void glGetFramebufferParameterivMESA(int target, int pname, int[] params);
    public static native int glGetFramebufferPixelLocalStorageSizeEXT(int target);
    public static native int glGetGraphicsResetStatusEXT();
    public static native int glGetGraphicsResetStatusKHR();
    public static native long glGetImageHandleNV(int texture, int level, byte layered, int layer, int format);
    public static native void glGetInteger64i_v(int target, int index, long[] data);
    public static native void glGetInteger64v(int pname, long[] data);
    public static native void glGetInteger64vAPPLE(int pname, long[] params);
    public static native void glGetInteger64vEXT(int pname, long[] data);
    public static native void glGetIntegeri_v(int target, int index, int[] data);
    public static native void glGetIntegeri_vEXT(int target, int index, int[] data);
    public static native void glGetIntegerv(int pname, int[] data);
    public static native void glGetInternalformatSampleivNV(int target, int internalformat, int samples, int pname, int count, int[] params);
    public static native void glGetInternalformativ(int target, int internalformat, int pname, int count, int[] params);
    public static native void glGetMemoryObjectDetachedResourcesuivNV(int memory, int pname, int first, int count, int[] params);
    public static native void glGetMemoryObjectParameterivEXT(int memoryObject, int pname, int[] params);
    public static native void glGetNextPerfQueryIdINTEL(int queryId, int[] nextQueryId);
    public static native void glGetObjectLabelEXT(int type, int object, int bufSize, int[] length, byte[] label);
    public static native void glGetObjectLabelKHR(int identifier, int name, int bufSize, int[] length, byte[] label);
    public static native void glGetObjectPtrLabelKHR(long ptr, int bufSize, int[] length, byte[] label);
    public static native void glGetPathCommandsNV(int path, byte[] commands);
    public static native void glGetPathCoordsNV(int path, float[] coords);
    public static native void glGetPathDashArrayNV(int path, float[] dashArray);
    public static native float glGetPathLengthNV(int path, int startSegment, int numSegments);
    public static native void glGetPathMetricRangeNV(int metricQueryMask, int firstPathName, int numPaths, int stride, float[] metrics);
    public static native void glGetPathMetricsNV(int metricQueryMask, int numPaths, int pathNameType, long paths, int pathBase, int stride, float[] metrics);
    public static native void glGetPathParameterfvNV(int path, int pname, float[] value);
    public static native void glGetPathParameterivNV(int path, int pname, int[] value);
    public static native void glGetPathSpacingNV(int pathListMode, int numPaths, int pathNameType, long paths, int pathBase, float advanceScale, float kerningScale, int transformType, float[] returnedSpacing);
    public static native void glGetPerfCounterInfoINTEL(int queryId, int counterId, int counterNameLength, byte[] counterName, int counterDescLength, byte[] counterDesc, int[] counterOffset, int[] counterDataSize, int[] counterTypeEnum, int[] counterDataTypeEnum, long[] rawCounterMaxValue);
    public static native void glGetPerfMonitorCounterDataAMD(int monitor, int pname, int dataSize, int[] data, int[] bytesWritten);
    public static native void glGetPerfMonitorCounterInfoAMD(int group, int counter, int pname, long data);
    public static native void glGetPerfMonitorCounterStringAMD(int group, int counter, int bufSize, int[] length, byte[] counterString);
    public static native void glGetPerfMonitorCountersAMD(int group, int[] numCounters, int[] maxActiveCounters, int counterSize, int[] counters);
    public static native void glGetPerfMonitorGroupStringAMD(int group, int bufSize, int[] length, byte[] groupString);
    public static native void glGetPerfMonitorGroupsAMD(int[] numGroups, int groupsSize, int[] groups);
    public static native void glGetPerfQueryDataINTEL(int queryHandle, int flags, int dataSize, long data, int[] bytesWritten);
    public static native void glGetPerfQueryIdByNameINTEL(byte[] queryName, int[] queryId);
    public static native void glGetPerfQueryInfoINTEL(int queryId, int queryNameLength, byte[] queryName, int[] dataSize, int[] noCounters, int[] noInstances, int[] capsMask);
    public static native void glGetPointervKHR(int pname, long params);
    public static native void glGetProgramBinary(int program, int bufSize, int[] length, int[] binaryFormat, long binary);
    public static native void glGetProgramBinaryOES(int program, int bufSize, int[] length, int[] binaryFormat, long binary);
    public static native void glGetProgramInfoLog(int program, int bufSize, int[] length, byte[] infoLog);
    public static native void glGetProgramPipelineInfoLogEXT(int pipeline, int bufSize, int[] length, byte[] infoLog);
    public static native void glGetProgramPipelineivEXT(int pipeline, int pname, int[] params);
    public static native int glGetProgramResourceLocationIndexEXT(int program, int programInterface, byte[] name);
    public static native void glGetProgramResourcefvNV(int program, int programInterface, int index, int propCount, int[] props, int count, int[] length, float[] params);
    public static native void glGetProgramiv(int program, int pname, int[] params);
    public static native void glGetQueryObjecti64vEXT(int id, int pname, long[] params);
    public static native void glGetQueryObjectivEXT(int id, int pname, int[] params);
    public static native void glGetQueryObjectui64vEXT(int id, int pname, long[] params);
    public static native void glGetQueryObjectuiv(int id, int pname, int[] params);
    public static native void glGetQueryObjectuivEXT(int id, int pname, int[] params);
    public static native void glGetQueryiv(int target, int pname, int[] params);
    public static native void glGetQueryivEXT(int target, int pname, int[] params);
    public static native void glGetRenderbufferParameteriv(int target, int pname, int[] params);
    public static native void glGetSamplerParameterIivEXT(int sampler, int pname, int[] params);
    public static native void glGetSamplerParameterIivOES(int sampler, int pname, int[] params);
    public static native void glGetSamplerParameterIuivEXT(int sampler, int pname, int[] params);
    public static native void glGetSamplerParameterIuivOES(int sampler, int pname, int[] params);
    public static native void glGetSamplerParameterfv(int sampler, int pname, float[] params);
    public static native void glGetSamplerParameteriv(int sampler, int pname, int[] params);
    public static native void glGetSemaphoreParameterivNV(int semaphore, int pname, int[] params);
    public static native void glGetSemaphoreParameterui64vEXT(int semaphore, int pname, long[] params);
    public static native void glGetShaderInfoLog(int shader, int bufSize, int[] length, byte[] infoLog);
    public static native void glGetShaderPrecisionFormat(int shadertype, int precisiontype, int[] range, int[] precision);
    public static native void glGetShaderSource(int shader, int bufSize, int[] length, byte[] source);
    public static native void glGetShaderiv(int shader, int pname, int[] params);
    public static native void glGetShadingRateImagePaletteNV(int viewport, int entry, int[] rate);
    public static native void glGetShadingRateSampleLocationivNV(int rate, int samples, int index, int[] location);
    public static native byte[] glGetString(int name);
    public static native byte[] glGetStringi(int name, int index);
    public static native void glGetSynciv(long sync, int pname, int count, int[] length, int[] values);
    public static native void glGetSyncivAPPLE(long sync, int pname, int count, int[] length, int[] values);
    public static native void glGetTexParameterIivEXT(int target, int pname, int[] params);
    public static native void glGetTexParameterIivOES(int target, int pname, int[] params);
    public static native void glGetTexParameterIuivEXT(int target, int pname, int[] params);
    public static native void glGetTexParameterIuivOES(int target, int pname, int[] params);
    public static native void glGetTexParameterfv(int target, int pname, float[] params);
    public static native void glGetTexParameteriv(int target, int pname, int[] params);
    public static native long glGetTextureHandleIMG(int texture);
    public static native long glGetTextureHandleNV(int texture);
    public static native long glGetTextureSamplerHandleIMG(int texture, int sampler);
    public static native long glGetTextureSamplerHandleNV(int texture, int sampler);
    public static native void glGetTransformFeedbackVarying(int program, int index, int bufSize, int[] length, int[] size, int[] type, byte[] name);
    public static native void glGetTranslatedShaderSourceANGLE(int shader, int bufSize, int[] length, byte[] source);
    public static native int glGetUniformBlockIndex(int program, byte[] uniformBlockName);
    public static native void glGetUniformIndices(int program, int uniformCount, byte[] uniformNames, int[] uniformIndices);
    public static native int glGetUniformLocation(int program, byte[] name);
    public static native void glGetUniformfv(int program, int location, float[] params);
    public static native void glGetUniformi64vNV(int program, int location, long[] params);
    public static native void glGetUniformiv(int program, int location, int[] params);
    public static native void glGetUniformuiv(int program, int location, int[] params);
    public static native void glGetUnsignedBytei_vEXT(int target, int index, byte[] data);
    public static native void glGetUnsignedBytevEXT(int pname, byte[] data);
    public static native void glGetVertexAttribIiv(int index, int pname, int[] params);
    public static native void glGetVertexAttribIuiv(int index, int pname, int[] params);
    public static native void glGetVertexAttribPointerv(int index, int pname, long pointer);
    public static native void glGetVertexAttribfv(int index, int pname, float[] params);
    public static native void glGetVertexAttribiv(int index, int pname, int[] params);
    public static native long glGetVkProcAddrNV(byte[] name);
    public static native void glGetnUniformfvEXT(int program, int location, int bufSize, float[] params);
    public static native void glGetnUniformfvKHR(int program, int location, int bufSize, float[] params);
    public static native void glGetnUniformivEXT(int program, int location, int bufSize, int[] params);
    public static native void glGetnUniformivKHR(int program, int location, int bufSize, int[] params);
    public static native void glGetnUniformuivKHR(int program, int location, int bufSize, int[] params);
    public static native void glHint(int target, int mode);
    public static native void glImportMemoryFdEXT(int memory, long size, int handleType, int fd);
    public static native void glImportMemoryWin32HandleEXT(int memory, long size, int handleType, long handle);
    public static native void glImportMemoryWin32NameEXT(int memory, long size, int handleType, long name);
    public static native void glImportSemaphoreFdEXT(int semaphore, int handleType, int fd);
    public static native void glImportSemaphoreWin32HandleEXT(int semaphore, int handleType, long handle);
    public static native void glImportSemaphoreWin32NameEXT(int semaphore, int handleType, long name);
    public static native void glInsertEventMarkerEXT(int length, byte[] marker);
    public static native void glInterpolatePathsNV(int resultPath, int pathA, int pathB, float weight);
    public static native void glInvalidateFramebuffer(int target, int numAttachments, int[] attachments);
    public static native void glInvalidateSubFramebuffer(int target, int numAttachments, int[] attachments, int x, int y, int width, int height);
    public static native byte glIsBuffer(int buffer);
    public static native byte glIsEnabled(int cap);
    public static native byte glIsEnablediEXT(int target, int index);
    public static native byte glIsEnablediNV(int target, int index);
    public static native byte glIsEnablediOES(int target, int index);
    public static native byte glIsFenceNV(int fence);
    public static native byte glIsFramebuffer(int framebuffer);
    public static native byte glIsImageHandleResidentNV(long handle);
    public static native byte glIsMemoryObjectEXT(int memoryObject);
    public static native byte glIsPathNV(int path);
    public static native byte glIsPointInFillPathNV(int path, int mask, float x, float y);
    public static native byte glIsPointInStrokePathNV(int path, float x, float y);
    public static native byte glIsProgram(int program);
    public static native byte glIsProgramPipelineEXT(int pipeline);
    public static native byte glIsQuery(int id);
    public static native byte glIsQueryEXT(int id);
    public static native byte glIsRenderbuffer(int renderbuffer);
    public static native byte glIsSampler(int sampler);
    public static native byte glIsSemaphoreEXT(int semaphore);
    public static native byte glIsShader(int shader);
    public static native byte glIsSync(long sync);
    public static native byte glIsSyncAPPLE(long sync);
    public static native byte glIsTexture(int texture);
    public static native byte glIsTextureHandleResidentNV(long handle);
    public static native byte glIsTransformFeedback(int id);
    public static native byte glIsVertexArray(int array);
    public static native byte glIsVertexArrayOES(int array);
    public static native void glLabelObjectEXT(int type, int object, int length, byte[] label);
    public static native void glLineWidth(float width);
    public static native void glLinkProgram(int program);
    public static native void glMakeImageHandleNonResidentNV(long handle);
    public static native void glMakeImageHandleResidentNV(long handle, int access);
    public static native void glMakeTextureHandleNonResidentNV(long handle);
    public static native void glMakeTextureHandleResidentNV(long handle);
    public static native long glMapBufferOES(int target, int access);
    public static native long glMapBufferRange(int target, long offset, long length, int access);
    public static native long glMapBufferRangeEXT(int target, long offset, long length, int access);
    public static native void glMatrixFrustumEXT(int mode, double left, double right, double bottom, double top, double zNear, double zFar);
    public static native void glMatrixLoad3x2fNV(int matrixMode, float[] m);
    public static native void glMatrixLoad3x3fNV(int matrixMode, float[] m);
    public static native void glMatrixLoadIdentityEXT(int mode);
    public static native void glMatrixLoadTranspose3x3fNV(int matrixMode, float[] m);
    public static native void glMatrixLoadTransposedEXT(int mode, double[] m);
    public static native void glMatrixLoadTransposefEXT(int mode, float[] m);
    public static native void glMatrixLoaddEXT(int mode, double[] m);
    public static native void glMatrixLoadfEXT(int mode, float[] m);
    public static native void glMatrixMult3x2fNV(int matrixMode, float[] m);
    public static native void glMatrixMult3x3fNV(int matrixMode, float[] m);
    public static native void glMatrixMultTranspose3x3fNV(int matrixMode, float[] m);
    public static native void glMatrixMultTransposedEXT(int mode, double[] m);
    public static native void glMatrixMultTransposefEXT(int mode, float[] m);
    public static native void glMatrixMultdEXT(int mode, double[] m);
    public static native void glMatrixMultfEXT(int mode, float[] m);
    public static native void glMatrixOrthoEXT(int mode, double left, double right, double bottom, double top, double zNear, double zFar);
    public static native void glMatrixPopEXT(int mode);
    public static native void glMatrixPushEXT(int mode);
    public static native void glMatrixRotatedEXT(int mode, double angle, double x, double y, double z);
    public static native void glMatrixRotatefEXT(int mode, float angle, float x, float y, float z);
    public static native void glMatrixScaledEXT(int mode, double x, double y, double z);
    public static native void glMatrixScalefEXT(int mode, float x, float y, float z);
    public static native void glMatrixTranslatedEXT(int mode, double x, double y, double z);
    public static native void glMatrixTranslatefEXT(int mode, float x, float y, float z);
    public static native void glMaxShaderCompilerThreadsKHR(int count);
    public static native void glMemoryObjectParameterivEXT(int memoryObject, int pname, int[] params);
    public static native void glMinSampleShadingOES(float value);
    public static native void glMultiDrawArraysEXT(int mode, int[] first, int[] count, int primcount);
    public static native void glMultiDrawArraysIndirectEXT(int mode, long indirect, int drawcount, int stride);
    public static native void glMultiDrawElementsBaseVertexEXT(int mode, int[] count, int type, long indices, int drawcount, int[] basevertex);
    public static native void glMultiDrawElementsEXT(int mode, int[] count, int type, long indices, int primcount);
    public static native void glMultiDrawElementsIndirectEXT(int mode, int type, long indirect, int drawcount, int stride);
    public static native void glMultiDrawMeshTasksIndirectCountNV(long indirect, long drawcount, int maxdrawcount, int stride);
    public static native void glMultiDrawMeshTasksIndirectNV(long indirect, int drawcount, int stride);
    public static native void glNamedBufferAttachMemoryNV(int buffer, int memory, long offset);
    public static native void glNamedBufferPageCommitmentMemNV(int buffer, long offset, long size, int memory, long memOffset, byte commit);
    public static native void glNamedBufferStorageExternalEXT(int buffer, long offset, long size, long clientBuffer, int flags);
    public static native void glNamedBufferStorageMemEXT(int buffer, long size, int memory, long offset);
    public static native void glNamedFramebufferSampleLocationsfvNV(int framebuffer, int start, int count, float[] v);
    public static native void glNamedRenderbufferStorageMultisampleAdvancedAMD(int renderbuffer, int samples, int storageSamples, int internalformat, int width, int height);
    public static native void glObjectLabelKHR(int identifier, int name, int length, byte[] label);
    public static native void glObjectPtrLabelKHR(long ptr, int length, byte[] label);
    public static native void glPatchParameteriEXT(int pname, int value);
    public static native void glPatchParameteriOES(int pname, int value);
    public static native void glPathCommandsNV(int path, int numCommands, byte[] commands, int numCoords, int coordType, long coords);
    public static native void glPathCoordsNV(int path, int numCoords, int coordType, long coords);
    public static native void glPathCoverDepthFuncNV(int func);
    public static native void glPathDashArrayNV(int path, int dashCount, float[] dashArray);
    public static native int glPathGlyphIndexArrayNV(int firstPathName, int fontTarget, long fontName, int fontStyle, int firstGlyphIndex, int numGlyphs, int pathParameterTemplate, float emScale);
    public static native int glPathGlyphIndexRangeNV(int fontTarget, long fontName, int fontStyle, int pathParameterTemplate, float emScale, int[] baseAndCount);
    public static native void glPathGlyphRangeNV(int firstPathName, int fontTarget, long fontName, int fontStyle, int firstGlyph, int numGlyphs, int handleMissingGlyphs, int pathParameterTemplate, float emScale);
    public static native void glPathGlyphsNV(int firstPathName, int fontTarget, long fontName, int fontStyle, int numGlyphs, int type, long charcodes, int handleMissingGlyphs, int pathParameterTemplate, float emScale);
    public static native int glPathMemoryGlyphIndexArrayNV(int firstPathName, int fontTarget, long fontSize, long fontData, int faceIndex, int firstGlyphIndex, int numGlyphs, int pathParameterTemplate, float emScale);
    public static native void glPathParameterfNV(int path, int pname, float value);
    public static native void glPathParameterfvNV(int path, int pname, float[] value);
    public static native void glPathParameteriNV(int path, int pname, int value);
    public static native void glPathParameterivNV(int path, int pname, int[] value);
    public static native void glPathStencilDepthOffsetNV(float factor, float units);
    public static native void glPathStencilFuncNV(int func, int ref, int mask);
    public static native void glPathStringNV(int path, int format, int length, long pathString);
    public static native void glPathSubCommandsNV(int path, int commandStart, int commandsToDelete, int numCommands, byte[] commands, int numCoords, int coordType, long coords);
    public static native void glPathSubCoordsNV(int path, int coordStart, int numCoords, int coordType, long coords);
    public static native void glPauseTransformFeedback();
    public static native void glPixelStorei(int pname, int param);
    public static native byte glPointAlongPathNV(int path, int startSegment, int numSegments, float distance, float[] x, float[] y, float[] tangentX, float[] tangentY);
    public static native void glPolygonModeNV(int face, int mode);
    public static native void glPolygonOffset(float factor, float units);
    public static native void glPolygonOffsetClampEXT(float factor, float units, float clamp);
    public static native void glPopDebugGroupKHR();
    public static native void glPopGroupMarkerEXT();
    public static native void glPrimitiveBoundingBoxEXT(float minX, float minY, float minZ, float minW, float maxX, float maxY, float maxZ, float maxW);
    public static native void glPrimitiveBoundingBoxOES(float minX, float minY, float minZ, float minW, float maxX, float maxY, float maxZ, float maxW);
    public static native void glProgramBinary(int program, int binaryFormat, long binary, int length);
    public static native void glProgramBinaryOES(int program, int binaryFormat, long binary, int length);
    public static native void glProgramParameteri(int program, int pname, int value);
    public static native void glProgramParameteriEXT(int program, int pname, int value);
    public static native void glProgramPathFragmentInputGenNV(int program, int location, int genMode, int components, float[] coeffs);
    public static native void glProgramUniform1fEXT(int program, int location, float v0);
    public static native void glProgramUniform1fvEXT(int program, int location, int count, float[] value);
    public static native void glProgramUniform1i64NV(int program, int location, long x);
    public static native void glProgramUniform1i64vNV(int program, int location, int count, long[] value);
    public static native void glProgramUniform1iEXT(int program, int location, int v0);
    public static native void glProgramUniform1ivEXT(int program, int location, int count, int[] value);
    public static native void glProgramUniform1ui64NV(int program, int location, long x);
    public static native void glProgramUniform1ui64vNV(int program, int location, int count, long[] value);
    public static native void glProgramUniform1uiEXT(int program, int location, int v0);
    public static native void glProgramUniform1uivEXT(int program, int location, int count, int[] value);
    public static native void glProgramUniform2fEXT(int program, int location, float v0, float v1);
    public static native void glProgramUniform2fvEXT(int program, int location, int count, float[] value);
    public static native void glProgramUniform2i64NV(int program, int location, long x, long y);
    public static native void glProgramUniform2i64vNV(int program, int location, int count, long[] value);
    public static native void glProgramUniform2iEXT(int program, int location, int v0, int v1);
    public static native void glProgramUniform2ivEXT(int program, int location, int count, int[] value);
    public static native void glProgramUniform2ui64NV(int program, int location, long x, long y);
    public static native void glProgramUniform2ui64vNV(int program, int location, int count, long[] value);
    public static native void glProgramUniform2uiEXT(int program, int location, int v0, int v1);
    public static native void glProgramUniform2uivEXT(int program, int location, int count, int[] value);
    public static native void glProgramUniform3fEXT(int program, int location, float v0, float v1, float v2);
    public static native void glProgramUniform3fvEXT(int program, int location, int count, float[] value);
    public static native void glProgramUniform3i64NV(int program, int location, long x, long y, long z);
    public static native void glProgramUniform3i64vNV(int program, int location, int count, long[] value);
    public static native void glProgramUniform3iEXT(int program, int location, int v0, int v1, int v2);
    public static native void glProgramUniform3ivEXT(int program, int location, int count, int[] value);
    public static native void glProgramUniform3ui64NV(int program, int location, long x, long y, long z);
    public static native void glProgramUniform3ui64vNV(int program, int location, int count, long[] value);
    public static native void glProgramUniform3uiEXT(int program, int location, int v0, int v1, int v2);
    public static native void glProgramUniform3uivEXT(int program, int location, int count, int[] value);
    public static native void glProgramUniform4fEXT(int program, int location, float v0, float v1, float v2, float v3);
    public static native void glProgramUniform4fvEXT(int program, int location, int count, float[] value);
    public static native void glProgramUniform4i64NV(int program, int location, long x, long y, long z, long w);
    public static native void glProgramUniform4i64vNV(int program, int location, int count, long[] value);
    public static native void glProgramUniform4iEXT(int program, int location, int v0, int v1, int v2, int v3);
    public static native void glProgramUniform4ivEXT(int program, int location, int count, int[] value);
    public static native void glProgramUniform4ui64NV(int program, int location, long x, long y, long z, long w);
    public static native void glProgramUniform4ui64vNV(int program, int location, int count, long[] value);
    public static native void glProgramUniform4uiEXT(int program, int location, int v0, int v1, int v2, int v3);
    public static native void glProgramUniform4uivEXT(int program, int location, int count, int[] value);
    public static native void glProgramUniformHandleui64IMG(int program, int location, long value);
    public static native void glProgramUniformHandleui64NV(int program, int location, long value);
    public static native void glProgramUniformHandleui64vIMG(int program, int location, int count, long[] values);
    public static native void glProgramUniformHandleui64vNV(int program, int location, int count, long[] values);
    public static native void glProgramUniformMatrix2fvEXT(int program, int location, int count, byte transpose, float[] value);
    public static native void glProgramUniformMatrix2x3fvEXT(int program, int location, int count, byte transpose, float[] value);
    public static native void glProgramUniformMatrix2x4fvEXT(int program, int location, int count, byte transpose, float[] value);
    public static native void glProgramUniformMatrix3fvEXT(int program, int location, int count, byte transpose, float[] value);
    public static native void glProgramUniformMatrix3x2fvEXT(int program, int location, int count, byte transpose, float[] value);
    public static native void glProgramUniformMatrix3x4fvEXT(int program, int location, int count, byte transpose, float[] value);
    public static native void glProgramUniformMatrix4fvEXT(int program, int location, int count, byte transpose, float[] value);
    public static native void glProgramUniformMatrix4x2fvEXT(int program, int location, int count, byte transpose, float[] value);
    public static native void glProgramUniformMatrix4x3fvEXT(int program, int location, int count, byte transpose, float[] value);
    public static native void glPushDebugGroupKHR(int source, int id, int length, byte[] message);
    public static native void glPushGroupMarkerEXT(int length, byte[] marker);
    public static native void glQueryCounterEXT(int id, int target);
    public static native void glRasterSamplesEXT(int samples, byte fixedsamplelocations);
    public static native void glReadBuffer(int src);
    public static native void glReadBufferIndexedEXT(int src, int index);
    public static native void glReadBufferNV(int mode);
    public static native void glReadPixels(int x, int y, int width, int height, int format, int type, long pixels);
    public static native void glReadnPixelsEXT(int x, int y, int width, int height, int format, int type, int bufSize, long data);
    public static native void glReadnPixelsKHR(int x, int y, int width, int height, int format, int type, int bufSize, long data);
    public static native byte glReleaseKeyedMutexWin32EXT(int memory, long key);
    public static native void glReleaseShaderCompiler();
    public static native void glRenderbufferStorage(int target, int internalformat, int width, int height);
    public static native void glRenderbufferStorageMultisample(int target, int samples, int internalformat, int width, int height);
    public static native void glRenderbufferStorageMultisampleANGLE(int target, int samples, int internalformat, int width, int height);
    public static native void glRenderbufferStorageMultisampleAPPLE(int target, int samples, int internalformat, int width, int height);
    public static native void glRenderbufferStorageMultisampleAdvancedAMD(int target, int samples, int storageSamples, int internalformat, int width, int height);
    public static native void glRenderbufferStorageMultisampleEXT(int target, int samples, int internalformat, int width, int height);
    public static native void glRenderbufferStorageMultisampleIMG(int target, int samples, int internalformat, int width, int height);
    public static native void glRenderbufferStorageMultisampleNV(int target, int samples, int internalformat, int width, int height);
    public static native void glResetMemoryObjectParameterNV(int memory, int pname);
    public static native void glResolveDepthValuesNV();
    public static native void glResolveMultisampleFramebufferAPPLE();
    public static native void glResumeTransformFeedback();
    public static native void glSampleCoverage(float value, byte invert);
    public static native void glSamplerParameterIivEXT(int sampler, int pname, int[] param);
    public static native void glSamplerParameterIivOES(int sampler, int pname, int[] param);
    public static native void glSamplerParameterIuivEXT(int sampler, int pname, int[] param);
    public static native void glSamplerParameterIuivOES(int sampler, int pname, int[] param);
    public static native void glSamplerParameterf(int sampler, int pname, float param);
    public static native void glSamplerParameterfv(int sampler, int pname, float[] param);
    public static native void glSamplerParameteri(int sampler, int pname, int param);
    public static native void glSamplerParameteriv(int sampler, int pname, int[] param);
    public static native void glScissor(int x, int y, int width, int height);
    public static native void glScissorArrayvNV(int first, int count, int[] v);
    public static native void glScissorArrayvOES(int first, int count, int[] v);
    public static native void glScissorExclusiveArrayvNV(int first, int count, int[] v);
    public static native void glScissorExclusiveNV(int x, int y, int width, int height);
    public static native void glScissorIndexedNV(int index, int left, int bottom, int width, int height);
    public static native void glScissorIndexedOES(int index, int left, int bottom, int width, int height);
    public static native void glScissorIndexedvNV(int index, int[] v);
    public static native void glScissorIndexedvOES(int index, int[] v);
    public static native void glSelectPerfMonitorCountersAMD(int monitor, byte enable, int group, int numCounters, int[] counterList);
    public static native void glSemaphoreParameterivNV(int semaphore, int pname, int[] params);
    public static native void glSemaphoreParameterui64vEXT(int semaphore, int pname, long[] params);
    public static native void glSetFenceNV(int fence, int condition);
    public static native void glShaderBinary(int count, int[] shaders, int binaryFormat, long binary, int length);
    public static native void glShaderSource(int shader, int count, byte[] string, int[] length);
    public static native void glShadingRateImageBarrierNV(byte synchronize);
    public static native void glShadingRateImagePaletteNV(int viewport, int first, int count, int[] rates);
    public static native void glShadingRateQCOM(int rate);
    public static native void glShadingRateSampleOrderCustomNV(int rate, int samples, int[] locations);
    public static native void glShadingRateSampleOrderNV(int order);
    public static native void glSignalSemaphoreEXT(int semaphore, int numBufferBarriers, int[] buffers, int numTextureBarriers, int[] textures, int[] dstLayouts);
    public static native void glSignalVkFenceNV(long vkFence);
    public static native void glSignalVkSemaphoreNV(long vkSemaphore);
    public static native void glStartTilingQCOM(int x, int y, int width, int height, int preserveMask);
    public static native void glStencilFillPathInstancedNV(int numPaths, int pathNameType, long paths, int pathBase, int fillMode, int mask, int transformType, float[] transformValues);
    public static native void glStencilFillPathNV(int path, int fillMode, int mask);
    public static native void glStencilFunc(int func, int ref, int mask);
    public static native void glStencilFuncSeparate(int face, int func, int ref, int mask);
    public static native void glStencilMask(int mask);
    public static native void glStencilMaskSeparate(int face, int mask);
    public static native void glStencilOp(int fail, int zfail, int zpass);
    public static native void glStencilOpSeparate(int face, int sfail, int dpfail, int dppass);
    public static native void glStencilStrokePathInstancedNV(int numPaths, int pathNameType, long paths, int pathBase, int reference, int mask, int transformType, float[] transformValues);
    public static native void glStencilStrokePathNV(int path, int reference, int mask);
    public static native void glStencilThenCoverFillPathInstancedNV(int numPaths, int pathNameType, long paths, int pathBase, int fillMode, int mask, int coverMode, int transformType, float[] transformValues);
    public static native void glStencilThenCoverFillPathNV(int path, int fillMode, int mask, int coverMode);
    public static native void glStencilThenCoverStrokePathInstancedNV(int numPaths, int pathNameType, long paths, int pathBase, int reference, int mask, int coverMode, int transformType, float[] transformValues);
    public static native void glStencilThenCoverStrokePathNV(int path, int reference, int mask, int coverMode);
    public static native void glSubpixelPrecisionBiasNV(int xbits, int ybits);
    public static native byte glTestFenceNV(int fence);
    public static native void glTexAttachMemoryNV(int target, int memory, long offset);
    public static native void glTexBufferEXT(int target, int internalformat, int buffer);
    public static native void glTexBufferOES(int target, int internalformat, int buffer);
    public static native void glTexBufferRangeEXT(int target, int internalformat, int buffer, long offset, long size);
    public static native void glTexBufferRangeOES(int target, int internalformat, int buffer, long offset, long size);
    public static native void glTexEstimateMotionQCOM(int ref, int target, int output);
    public static native void glTexEstimateMotionRegionsQCOM(int ref, int target, int output, int mask);
    public static native void glTexImage2D(int target, int level, int internalformat, int width, int height, int border, int format, int type, long pixels);
    public static native void glTexImage3D(int target, int level, int internalformat, int width, int height, int depth, int border, int format, int type, long pixels);
    public static native void glTexImage3DOES(int target, int level, int internalformat, int width, int height, int depth, int border, int format, int type, long pixels);
    public static native void glTexPageCommitmentEXT(int target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, byte commit);
    public static native void glTexPageCommitmentMemNV(int target, int layer, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, int memory, long offset, byte commit);
    public static native void glTexParameterIivEXT(int target, int pname, int[] params);
    public static native void glTexParameterIivOES(int target, int pname, int[] params);
    public static native void glTexParameterIuivEXT(int target, int pname, int[] params);
    public static native void glTexParameterIuivOES(int target, int pname, int[] params);
    public static native void glTexParameterf(int target, int pname, float param);
    public static native void glTexParameterfv(int target, int pname, float[] params);
    public static native void glTexParameteri(int target, int pname, int param);
    public static native void glTexParameteriv(int target, int pname, int[] params);
    public static native void glTexStorage1DEXT(int target, int levels, int internalformat, int width);
    public static native void glTexStorage2D(int target, int levels, int internalformat, int width, int height);
    public static native void glTexStorage2DEXT(int target, int levels, int internalformat, int width, int height);
    public static native void glTexStorage3D(int target, int levels, int internalformat, int width, int height, int depth);
    public static native void glTexStorage3DEXT(int target, int levels, int internalformat, int width, int height, int depth);
    public static native void glTexStorage3DMultisampleOES(int target, int samples, int internalformat, int width, int height, int depth, byte fixedsamplelocations);
    public static native void glTexStorageMem2DEXT(int target, int levels, int internalFormat, int width, int height, int memory, long offset);
    public static native void glTexStorageMem2DMultisampleEXT(int target, int samples, int internalFormat, int width, int height, byte fixedSampleLocations, int memory, long offset);
    public static native void glTexStorageMem3DEXT(int target, int levels, int internalFormat, int width, int height, int depth, int memory, long offset);
    public static native void glTexStorageMem3DMultisampleEXT(int target, int samples, int internalFormat, int width, int height, int depth, byte fixedSampleLocations, int memory, long offset);
    public static native void glTexSubImage2D(int target, int level, int xoffset, int yoffset, int width, int height, int format, int type, long pixels);
    public static native void glTexSubImage3D(int target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, int format, int type, long pixels);
    public static native void glTexSubImage3DOES(int target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, int format, int type, long pixels);
    public static native void glTextureAttachMemoryNV(int texture, int memory, long offset);
    public static native void glTextureFoveationParametersQCOM(int texture, int layer, int focalPoint, float focalX, float focalY, float gainX, float gainY, float foveaArea);
    public static native void glTexturePageCommitmentMemNV(int texture, int layer, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, int memory, long offset, byte commit);
    public static native void glTextureStorage1DEXT(int texture, int target, int levels, int internalformat, int width);
    public static native void glTextureStorage2DEXT(int texture, int target, int levels, int internalformat, int width, int height);
    public static native void glTextureStorage3DEXT(int texture, int target, int levels, int internalformat, int width, int height, int depth);
    public static native void glTextureStorageMem2DEXT(int texture, int levels, int internalFormat, int width, int height, int memory, long offset);
    public static native void glTextureStorageMem2DMultisampleEXT(int texture, int samples, int internalFormat, int width, int height, byte fixedSampleLocations, int memory, long offset);
    public static native void glTextureStorageMem3DEXT(int texture, int levels, int internalFormat, int width, int height, int depth, int memory, long offset);
    public static native void glTextureStorageMem3DMultisampleEXT(int texture, int samples, int internalFormat, int width, int height, int depth, byte fixedSampleLocations, int memory, long offset);
    public static native void glTextureViewEXT(int texture, int target, int origtexture, int internalformat, int minlevel, int numlevels, int minlayer, int numlayers);
    public static native void glTextureViewOES(int texture, int target, int origtexture, int internalformat, int minlevel, int numlevels, int minlayer, int numlayers);
    public static native void glTransformFeedbackVaryings(int program, int count, byte[] varyings, int bufferMode);
    public static native void glTransformPathNV(int resultPath, int srcPath, int transformType, float[] transformValues);
    public static native void glUniform1f(int location, float v0);
    public static native void glUniform1fv(int location, int count, float[] value);
    public static native void glUniform1i(int location, int v0);
    public static native void glUniform1i64NV(int location, long x);
    public static native void glUniform1i64vNV(int location, int count, long[] value);
    public static native void glUniform1iv(int location, int count, int[] value);
    public static native void glUniform1ui(int location, int v0);
    public static native void glUniform1ui64NV(int location, long x);
    public static native void glUniform1ui64vNV(int location, int count, long[] value);
    public static native void glUniform1uiv(int location, int count, int[] value);
    public static native void glUniform2f(int location, float v0, float v1);
    public static native void glUniform2fv(int location, int count, float[] value);
    public static native void glUniform2i(int location, int v0, int v1);
    public static native void glUniform2i64NV(int location, long x, long y);
    public static native void glUniform2i64vNV(int location, int count, long[] value);
    public static native void glUniform2iv(int location, int count, int[] value);
    public static native void glUniform2ui(int location, int v0, int v1);
    public static native void glUniform2ui64NV(int location, long x, long y);
    public static native void glUniform2ui64vNV(int location, int count, long[] value);
    public static native void glUniform2uiv(int location, int count, int[] value);
    public static native void glUniform3f(int location, float v0, float v1, float v2);
    public static native void glUniform3fv(int location, int count, float[] value);
    public static native void glUniform3i(int location, int v0, int v1, int v2);
    public static native void glUniform3i64NV(int location, long x, long y, long z);
    public static native void glUniform3i64vNV(int location, int count, long[] value);
    public static native void glUniform3iv(int location, int count, int[] value);
    public static native void glUniform3ui(int location, int v0, int v1, int v2);
    public static native void glUniform3ui64NV(int location, long x, long y, long z);
    public static native void glUniform3ui64vNV(int location, int count, long[] value);
    public static native void glUniform3uiv(int location, int count, int[] value);
    public static native void glUniform4f(int location, float v0, float v1, float v2, float v3);
    public static native void glUniform4fv(int location, int count, float[] value);
    public static native void glUniform4i(int location, int v0, int v1, int v2, int v3);
    public static native void glUniform4i64NV(int location, long x, long y, long z, long w);
    public static native void glUniform4i64vNV(int location, int count, long[] value);
    public static native void glUniform4iv(int location, int count, int[] value);
    public static native void glUniform4ui(int location, int v0, int v1, int v2, int v3);
    public static native void glUniform4ui64NV(int location, long x, long y, long z, long w);
    public static native void glUniform4ui64vNV(int location, int count, long[] value);
    public static native void glUniform4uiv(int location, int count, int[] value);
    public static native void glUniformBlockBinding(int program, int uniformBlockIndex, int uniformBlockBinding);
    public static native void glUniformHandleui64IMG(int location, long value);
    public static native void glUniformHandleui64NV(int location, long value);
    public static native void glUniformHandleui64vIMG(int location, int count, long[] value);
    public static native void glUniformHandleui64vNV(int location, int count, long[] value);
    public static native void glUniformMatrix2fv(int location, int count, byte transpose, float[] value);
    public static native void glUniformMatrix2x3fv(int location, int count, byte transpose, float[] value);
    public static native void glUniformMatrix2x3fvNV(int location, int count, byte transpose, float[] value);
    public static native void glUniformMatrix2x4fv(int location, int count, byte transpose, float[] value);
    public static native void glUniformMatrix2x4fvNV(int location, int count, byte transpose, float[] value);
    public static native void glUniformMatrix3fv(int location, int count, byte transpose, float[] value);
    public static native void glUniformMatrix3x2fv(int location, int count, byte transpose, float[] value);
    public static native void glUniformMatrix3x2fvNV(int location, int count, byte transpose, float[] value);
    public static native void glUniformMatrix3x4fv(int location, int count, byte transpose, float[] value);
    public static native void glUniformMatrix3x4fvNV(int location, int count, byte transpose, float[] value);
    public static native void glUniformMatrix4fv(int location, int count, byte transpose, float[] value);
    public static native void glUniformMatrix4x2fv(int location, int count, byte transpose, float[] value);
    public static native void glUniformMatrix4x2fvNV(int location, int count, byte transpose, float[] value);
    public static native void glUniformMatrix4x3fv(int location, int count, byte transpose, float[] value);
    public static native void glUniformMatrix4x3fvNV(int location, int count, byte transpose, float[] value);
    public static native byte glUnmapBuffer(int target);
    public static native byte glUnmapBufferOES(int target);
    public static native void glUseProgram(int program);
    public static native void glUseProgramStagesEXT(int pipeline, int stages, int program);
    public static native void glValidateProgram(int program);
    public static native void glValidateProgramPipelineEXT(int pipeline);
    public static native void glVertexAttrib1f(int index, float x);
    public static native void glVertexAttrib1fv(int index, float[] v);
    public static native void glVertexAttrib2f(int index, float x, float y);
    public static native void glVertexAttrib2fv(int index, float[] v);
    public static native void glVertexAttrib3f(int index, float x, float y, float z);
    public static native void glVertexAttrib3fv(int index, float[] v);
    public static native void glVertexAttrib4f(int index, float x, float y, float z, float w);
    public static native void glVertexAttrib4fv(int index, float[] v);
    public static native void glVertexAttribDivisor(int index, int divisor);
    public static native void glVertexAttribDivisorANGLE(int index, int divisor);
    public static native void glVertexAttribDivisorEXT(int index, int divisor);
    public static native void glVertexAttribDivisorNV(int index, int divisor);
    public static native void glVertexAttribI4i(int index, int x, int y, int z, int w);
    public static native void glVertexAttribI4iv(int index, int[] v);
    public static native void glVertexAttribI4ui(int index, int x, int y, int z, int w);
    public static native void glVertexAttribI4uiv(int index, int[] v);
    public static native void glVertexAttribIPointer(int index, int size, int type, int stride, long pointer);
    public static native void glVertexAttribPointer(int index, int size, int type, byte normalized, int stride, long pointer);
    public static native void glViewport(int x, int y, int width, int height);
    public static native void glViewportArrayvNV(int first, int count, float[] v);
    public static native void glViewportArrayvOES(int first, int count, float[] v);
    public static native void glViewportIndexedfNV(int index, float x, float y, float w, float h);
    public static native void glViewportIndexedfOES(int index, float x, float y, float w, float h);
    public static native void glViewportIndexedfvNV(int index, float[] v);
    public static native void glViewportIndexedfvOES(int index, float[] v);
    public static native void glViewportPositionWScaleNV(int index, float xcoeff, float ycoeff);
    public static native void glViewportSwizzleNV(int index, int swizzlex, int swizzley, int swizzlez, int swizzlew);
    public static native void glWaitSemaphoreEXT(int semaphore, int numBufferBarriers, int[] buffers, int numTextureBarriers, int[] textures, int[] srcLayouts);
    public static native void glWaitSync(long sync, int flags, long timeout);
    public static native void glWaitSyncAPPLE(long sync, int flags, long timeout);
    public static native void glWaitVkSemaphoreNV(long vkSemaphore);
    public static native void glWeightPathsNV(int resultPath, int numPaths, int[] paths, float[] weights);
    public static native void glWindowRectanglesEXT(int mode, int count, int[] box);
}
