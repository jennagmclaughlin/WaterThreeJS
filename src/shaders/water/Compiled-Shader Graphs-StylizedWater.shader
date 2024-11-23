// Compiled shader for custom platforms

//////////////////////////////////////////////////////////////////////////
// 
// NOTE: This is *not* a valid shader file, the contents are provided just
// for information and for debugging purposes only.
// 
//////////////////////////////////////////////////////////////////////////
// Skipping shader variants that would not be included into build of current scene.

Shader "Shader Graphs/StylizedWater" {
Properties {
[NoScaleOffset]  _FlowTexture ("Flow Map", 2D) = "white" { }
 _Size ("Size", Float) = 2.000000
 _FlowStrength ("Flow Strength", Float) = 0.007500
 _FlowSpeed ("Flow Speed", Float) = 0.010000
[NoScaleOffset]  _FoamTexture ("Foam Texture", 2D) = "white" { }
 _WaterColor ("Water Color", Color) = (0.000000,0.507114,1.000000,0.000000)
 _LightFoamColor ("Light Foam Color", Color) = (0.922926,0.931590,0.962264,0.000000)
 _DarkFoamColor ("Dark Foam Color", Color) = (0.000000,0.505882,1.000000,1.000000)
 _FoamDistance ("Foam Distance", Float) = 1.500000
 _Choppiness ("Choppiness", Float) = 0.100000
[HideInInspector]  _QueueOffset ("_QueueOffset", Float) = 0.000000
[HideInInspector]  _QueueControl ("_QueueControl", Float) = -1.000000
[HideInInspector] [NoScaleOffset]  unity_Lightmaps ("unity_Lightmaps", 2DArray) = "" { }
[HideInInspector] [NoScaleOffset]  unity_LightmapsInd ("unity_LightmapsInd", 2DArray) = "" { }
[HideInInspector] [NoScaleOffset]  unity_ShadowMasks ("unity_ShadowMasks", 2DArray) = "" { }
}
SubShader { 
 Tags { "QUEUE"="Transparent" "RenderType"="Transparent" "DisableBatching"="False" "RenderPipeline"="UniversalPipeline" "ShaderGraphShader"="true" "ShaderGraphTargetId"="UniversalUnlitSubTarget" "UniversalMaterialType"="Unlit" }
 Pass {
  Name "Universal Forward"
  Tags { "QUEUE"="Transparent" "RenderType"="Transparent" "DisableBatching"="False" "RenderPipeline"="UniversalPipeline" "ShaderGraphShader"="true" "ShaderGraphTargetId"="UniversalUnlitSubTarget" "UniversalMaterialType"="Unlit" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_CameraDepthTexture" to slot 0
Set 2D Texture "_FlowTexture" to slot 1
Set 2D Texture "_FoamTexture" to slot 2

Constant Buffer "$Globals" (320 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 112
  Matrix4x4 unity_MatrixVP at 176
  Matrix4x4 unity_MatrixInvVP at 240
  Vector4 _ScaledScreenParams at 0
  Vector2 _GlobalMipBias at 16
  Vector4 _TimeParameters at 32
  Vector4 _ProjectionParams at 48
  Vector4 _ZBufferParams at 64
  Vector4 unity_OrthoParams at 80
  Vector4 _RTHandleScale at 96
  Vector4 _CameraDepthTexture_TexelSize at 304
}
Constant Buffer "UnityPerMaterial" (176 bytes) on slot 0 {
  Float _Size at 16
  Float _FlowStrength at 20
  Float _FlowSpeed at 24
  Vector4 _WaterColor at 48
  Vector4 _LightFoamColor at 64
  Vector4 _DarkFoamColor at 80
  Float _FoamDistance at 96
  Float _Choppiness at 100
}
Constant Buffer "UnityPerDraw" (720 bytes) on slot 1 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
UNITY_BINDING(1) uniform UnityPerDraw {
	vec4                hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4                hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 Xhlslcc_UnusedXunity_LODFade;
	vec4 Xhlslcc_UnusedXunity_WorldTransformParams;
	vec4 Xhlslcc_UnusedXunity_RenderingLayer;
	vec4 Xhlslcc_UnusedXunity_LightData;
	vec4 Xhlslcc_UnusedXunity_LightIndices[2];
	vec4 Xhlslcc_UnusedXunity_ProbesOcclusion;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_HDR;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_HDR;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_BoxMax;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_BoxMin;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_ProbePosition;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_BoxMax;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_BoxMin;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_ProbePosition;
	vec4 Xhlslcc_UnusedXunity_LightmapST;
	vec4 Xhlslcc_UnusedXunity_DynamicLightmapST;
	vec4 Xhlslcc_UnusedXunity_SHAr;
	vec4 Xhlslcc_UnusedXunity_SHAg;
	vec4 Xhlslcc_UnusedXunity_SHAb;
	vec4 Xhlslcc_UnusedXunity_SHBr;
	vec4 Xhlslcc_UnusedXunity_SHBg;
	vec4 Xhlslcc_UnusedXunity_SHBb;
	vec4 Xhlslcc_UnusedXunity_SHC;
	vec4 Xhlslcc_UnusedXunity_RendererBounds_Min;
	vec4 Xhlslcc_UnusedXunity_RendererBounds_Max;
	vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_MatrixPreviousM[4];
	vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_MatrixPreviousMI[4];
	vec4 Xhlslcc_UnusedXunity_MotionVectorsParams;
	vec4 Xhlslcc_UnusedXunity_SpriteColor;
	vec4 Xhlslcc_UnusedXunity_SpriteProps;
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	vec4 Xhlslcc_UnusedX_FlowTexture_TexelSize;
	float                _Size;
	float                _FlowStrength;
	float                _FlowSpeed;
	vec4 Xhlslcc_UnusedX_FoamTexture_TexelSize;
	vec4                _WaterColor;
	vec4                _LightFoamColor;
	vec4                _DarkFoamColor;
	float                _FoamDistance;
	float                _Choppiness;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_ST;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_TexelSize;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_MipInfo;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_StreamInfo;
};
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec4 vs_INTERP0;
out vec3 vs_INTERP1;
out vec3 vs_INTERP2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xy = in_POSITION0.yy * hlslcc_mtx4x4unity_ObjectToWorld[1].xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_ObjectToWorld[3].xz;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _TimeParameters.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.y = u_xlat0.x * _Choppiness;
    u_xlat0.x = float(0.0);
    u_xlat0.z = float(0.0);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_INTERP1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_INTERP0 = in_TEXCOORD0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_INTERP2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScaledScreenParams;
uniform 	vec2 _GlobalMipBias;
uniform 	vec4 _TimeParameters;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _RTHandleScale;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvVP[4];
uniform 	vec4 _CameraDepthTexture_TexelSize;
UNITY_BINDING(0) uniform UnityPerMaterial {
	vec4 Xhlslcc_UnusedX_FlowTexture_TexelSize;
	float                _Size;
	float                _FlowStrength;
	float                _FlowSpeed;
	vec4 Xhlslcc_UnusedX_FoamTexture_TexelSize;
	vec4                _WaterColor;
	vec4                _LightFoamColor;
	vec4                _DarkFoamColor;
	float                _FoamDistance;
	float                _Choppiness;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_ST;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_TexelSize;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_MipInfo;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_StreamInfo;
};
UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform  sampler2D _FlowTexture;
UNITY_LOCATION(2) uniform  sampler2D _FoamTexture;
in  vec4 vs_INTERP0;
in  vec3 vs_INTERP1;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
bool u_xlatb5;
vec2 u_xlat6;
float u_xlat10;
vec2 u_xlat12;
float u_xlat15;
bool u_xlatb15;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = vs_INTERP1.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0].w * vs_INTERP1.x + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2].w * vs_INTERP1.z + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3].w;
    u_xlatb5 = 0.0<_ProjectionParams.x;
    u_xlat10 = (-hlslcc_FragCoord.y) + _ScaledScreenParams.y;
    u_xlat1.y = (u_xlatb5) ? u_xlat10 : hlslcc_FragCoord.y;
    u_xlat1.x = hlslcc_FragCoord.x;
    u_xlat1.xy = u_xlat1.xy / _ScaledScreenParams.xy;
    u_xlat5.x = _FlowSpeed / _Size;
    u_xlat2.xy = _TimeParameters.xx * u_xlat5.xx + vs_INTERP0.xy;
    u_xlat3 = texture(_FlowTexture, u_xlat2.xy, _GlobalMipBias.x);
    u_xlat2.zw = u_xlat2.xy + vec2(0.0125000002, 0.0125000002);
    u_xlat4 = texture(_FlowTexture, u_xlat2.zy, _GlobalMipBias.x);
    u_xlat2 = texture(_FlowTexture, u_xlat2.xw, _GlobalMipBias.x);
    u_xlat4.x = (-u_xlat3.x) + u_xlat4.x;
    u_xlat4.y = (-u_xlat3.x) + u_xlat2.x;
    u_xlat2.xy = u_xlat4.xy * vec2(8.0, 8.0);
    u_xlat2.z = 0.0;
    u_xlat5.xyz = (-u_xlat2.xyz) + vec3(0.0, 0.0, 1.0);
    u_xlat15 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat5.xy = vec2(u_xlat15) * u_xlat5.xy;
    u_xlat2.xy = u_xlat5.xy * vec2(vec2(_FlowStrength, _FlowStrength)) + vs_INTERP0.xy;
    u_xlat12.xy = u_xlat2.xy * vec2(_Size);
    u_xlat2.xy = u_xlat2.xy * vec2(_Size) + vec2(0.100000001, 0.100000001);
    u_xlat3 = texture(_FoamTexture, u_xlat2.xy, _GlobalMipBias.x);
    u_xlat4.xyz = (-_WaterColor.xyz) + _DarkFoamColor.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz + _WaterColor.xyz;
    u_xlat2 = texture(_FoamTexture, u_xlat12.xy, _GlobalMipBias.x);
    u_xlat4.xyz = (-u_xlat3.xyz) + _LightFoamColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat1.z = (-u_xlat1.y) + 1.0;
    u_xlat5.xy = u_xlat5.xy * vec2(vec2(_FlowStrength, _FlowStrength)) + u_xlat1.xz;
    u_xlatb15 = unity_OrthoParams.w==1.0;
    if(u_xlatb15){
        u_xlat1.xy = (-_CameraDepthTexture_TexelSize.xy) * vec2(0.5, 0.5) + vec2(1.0, 1.0);
        u_xlat1.xy = min(u_xlat5.xy, u_xlat1.xy);
        u_xlat1.xy = u_xlat1.xy * _RTHandleScale.xy;
        u_xlat1 = texture(_CameraDepthTexture, u_xlat1.xy, _GlobalMipBias.x);
        u_xlat6.xy = u_xlat5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat3 = u_xlat6.yyyy * hlslcc_mtx4x4unity_MatrixInvVP[1];
        u_xlat3 = hlslcc_mtx4x4unity_MatrixInvVP[0] * u_xlat6.xxxx + u_xlat3;
        u_xlat1 = hlslcc_mtx4x4unity_MatrixInvVP[2] * u_xlat1.xxxx + u_xlat3;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixInvVP[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat15 = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
        u_xlat15 = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat15;
        u_xlat15 = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat15;
        u_xlat15 = u_xlat15 + hlslcc_mtx4x4unity_MatrixV[3].z;
        u_xlat15 = abs(u_xlat15);
    } else {
        u_xlat1.xy = (-_CameraDepthTexture_TexelSize.xy) * vec2(0.5, 0.5) + vec2(1.0, 1.0);
        u_xlat5.xy = min(u_xlat5.xy, u_xlat1.xy);
        u_xlat5.xy = u_xlat5.xy * _RTHandleScale.xy;
        u_xlat1 = texture(_CameraDepthTexture, u_xlat5.xy, _GlobalMipBias.x);
        u_xlat5.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
        u_xlat15 = float(1.0) / u_xlat5.x;
    }
    u_xlat0 = (-u_xlat0) + u_xlat15;
    u_xlat0 = u_xlat0 / _FoamDistance;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlatb0 = u_xlat0>=0.5;
    u_xlat0 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat2.xyz + (-_LightFoamColor.xyz);
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat5.xyz + _LightFoamColor.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


//////////////////////////////////////////////////////
Keywords: _SCREEN_SPACE_OCCLUSION
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_CameraDepthTexture" to slot 0
Set 2D Texture "_FlowTexture" to slot 1
Set 2D Texture "_FoamTexture" to slot 2

Constant Buffer "$Globals" (320 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 112
  Matrix4x4 unity_MatrixVP at 176
  Matrix4x4 unity_MatrixInvVP at 240
  Vector4 _ScaledScreenParams at 0
  Vector2 _GlobalMipBias at 16
  Vector4 _TimeParameters at 32
  Vector4 _ProjectionParams at 48
  Vector4 _ZBufferParams at 64
  Vector4 unity_OrthoParams at 80
  Vector4 _RTHandleScale at 96
  Vector4 _CameraDepthTexture_TexelSize at 304
}
Constant Buffer "UnityPerMaterial" (176 bytes) on slot 0 {
  Float _Size at 16
  Float _FlowStrength at 20
  Float _FlowSpeed at 24
  Vector4 _WaterColor at 48
  Vector4 _LightFoamColor at 64
  Vector4 _DarkFoamColor at 80
  Float _FoamDistance at 96
  Float _Choppiness at 100
}
Constant Buffer "UnityPerDraw" (720 bytes) on slot 1 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
UNITY_BINDING(1) uniform UnityPerDraw {
	vec4                hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4                hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 Xhlslcc_UnusedXunity_LODFade;
	vec4 Xhlslcc_UnusedXunity_WorldTransformParams;
	vec4 Xhlslcc_UnusedXunity_RenderingLayer;
	vec4 Xhlslcc_UnusedXunity_LightData;
	vec4 Xhlslcc_UnusedXunity_LightIndices[2];
	vec4 Xhlslcc_UnusedXunity_ProbesOcclusion;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_HDR;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_HDR;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_BoxMax;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_BoxMin;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_ProbePosition;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_BoxMax;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_BoxMin;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_ProbePosition;
	vec4 Xhlslcc_UnusedXunity_LightmapST;
	vec4 Xhlslcc_UnusedXunity_DynamicLightmapST;
	vec4 Xhlslcc_UnusedXunity_SHAr;
	vec4 Xhlslcc_UnusedXunity_SHAg;
	vec4 Xhlslcc_UnusedXunity_SHAb;
	vec4 Xhlslcc_UnusedXunity_SHBr;
	vec4 Xhlslcc_UnusedXunity_SHBg;
	vec4 Xhlslcc_UnusedXunity_SHBb;
	vec4 Xhlslcc_UnusedXunity_SHC;
	vec4 Xhlslcc_UnusedXunity_RendererBounds_Min;
	vec4 Xhlslcc_UnusedXunity_RendererBounds_Max;
	vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_MatrixPreviousM[4];
	vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_MatrixPreviousMI[4];
	vec4 Xhlslcc_UnusedXunity_MotionVectorsParams;
	vec4 Xhlslcc_UnusedXunity_SpriteColor;
	vec4 Xhlslcc_UnusedXunity_SpriteProps;
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	vec4 Xhlslcc_UnusedX_FlowTexture_TexelSize;
	float                _Size;
	float                _FlowStrength;
	float                _FlowSpeed;
	vec4 Xhlslcc_UnusedX_FoamTexture_TexelSize;
	vec4                _WaterColor;
	vec4                _LightFoamColor;
	vec4                _DarkFoamColor;
	float                _FoamDistance;
	float                _Choppiness;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_ST;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_TexelSize;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_MipInfo;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_StreamInfo;
};
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec4 vs_INTERP0;
out vec3 vs_INTERP1;
out vec3 vs_INTERP2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xy = in_POSITION0.yy * hlslcc_mtx4x4unity_ObjectToWorld[1].xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_ObjectToWorld[3].xz;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _TimeParameters.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.y = u_xlat0.x * _Choppiness;
    u_xlat0.x = float(0.0);
    u_xlat0.z = float(0.0);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_INTERP1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_INTERP0 = in_TEXCOORD0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_INTERP2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScaledScreenParams;
uniform 	vec2 _GlobalMipBias;
uniform 	vec4 _TimeParameters;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _RTHandleScale;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvVP[4];
uniform 	vec4 _CameraDepthTexture_TexelSize;
UNITY_BINDING(0) uniform UnityPerMaterial {
	vec4 Xhlslcc_UnusedX_FlowTexture_TexelSize;
	float                _Size;
	float                _FlowStrength;
	float                _FlowSpeed;
	vec4 Xhlslcc_UnusedX_FoamTexture_TexelSize;
	vec4                _WaterColor;
	vec4                _LightFoamColor;
	vec4                _DarkFoamColor;
	float                _FoamDistance;
	float                _Choppiness;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_ST;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_TexelSize;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_MipInfo;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_StreamInfo;
};
UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform  sampler2D _FlowTexture;
UNITY_LOCATION(2) uniform  sampler2D _FoamTexture;
in  vec4 vs_INTERP0;
in  vec3 vs_INTERP1;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
bool u_xlatb5;
vec2 u_xlat6;
float u_xlat10;
vec2 u_xlat12;
float u_xlat15;
bool u_xlatb15;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0 = vs_INTERP1.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0].w * vs_INTERP1.x + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2].w * vs_INTERP1.z + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3].w;
    u_xlatb5 = 0.0<_ProjectionParams.x;
    u_xlat10 = (-hlslcc_FragCoord.y) + _ScaledScreenParams.y;
    u_xlat1.y = (u_xlatb5) ? u_xlat10 : hlslcc_FragCoord.y;
    u_xlat1.x = hlslcc_FragCoord.x;
    u_xlat1.xy = u_xlat1.xy / _ScaledScreenParams.xy;
    u_xlat5.x = _FlowSpeed / _Size;
    u_xlat2.xy = _TimeParameters.xx * u_xlat5.xx + vs_INTERP0.xy;
    u_xlat3 = texture(_FlowTexture, u_xlat2.xy, _GlobalMipBias.x);
    u_xlat2.zw = u_xlat2.xy + vec2(0.0125000002, 0.0125000002);
    u_xlat4 = texture(_FlowTexture, u_xlat2.zy, _GlobalMipBias.x);
    u_xlat2 = texture(_FlowTexture, u_xlat2.xw, _GlobalMipBias.x);
    u_xlat4.x = (-u_xlat3.x) + u_xlat4.x;
    u_xlat4.y = (-u_xlat3.x) + u_xlat2.x;
    u_xlat2.xy = u_xlat4.xy * vec2(8.0, 8.0);
    u_xlat2.z = 0.0;
    u_xlat5.xyz = (-u_xlat2.xyz) + vec3(0.0, 0.0, 1.0);
    u_xlat15 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat5.xy = vec2(u_xlat15) * u_xlat5.xy;
    u_xlat2.xy = u_xlat5.xy * vec2(vec2(_FlowStrength, _FlowStrength)) + vs_INTERP0.xy;
    u_xlat12.xy = u_xlat2.xy * vec2(_Size);
    u_xlat2.xy = u_xlat2.xy * vec2(_Size) + vec2(0.100000001, 0.100000001);
    u_xlat3 = texture(_FoamTexture, u_xlat2.xy, _GlobalMipBias.x);
    u_xlat4.xyz = (-_WaterColor.xyz) + _DarkFoamColor.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz + _WaterColor.xyz;
    u_xlat2 = texture(_FoamTexture, u_xlat12.xy, _GlobalMipBias.x);
    u_xlat4.xyz = (-u_xlat3.xyz) + _LightFoamColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat1.z = (-u_xlat1.y) + 1.0;
    u_xlat5.xy = u_xlat5.xy * vec2(vec2(_FlowStrength, _FlowStrength)) + u_xlat1.xz;
    u_xlatb15 = unity_OrthoParams.w==1.0;
    if(u_xlatb15){
        u_xlat1.xy = (-_CameraDepthTexture_TexelSize.xy) * vec2(0.5, 0.5) + vec2(1.0, 1.0);
        u_xlat1.xy = min(u_xlat5.xy, u_xlat1.xy);
        u_xlat1.xy = u_xlat1.xy * _RTHandleScale.xy;
        u_xlat1 = texture(_CameraDepthTexture, u_xlat1.xy, _GlobalMipBias.x);
        u_xlat6.xy = u_xlat5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat3 = u_xlat6.yyyy * hlslcc_mtx4x4unity_MatrixInvVP[1];
        u_xlat3 = hlslcc_mtx4x4unity_MatrixInvVP[0] * u_xlat6.xxxx + u_xlat3;
        u_xlat1 = hlslcc_mtx4x4unity_MatrixInvVP[2] * u_xlat1.xxxx + u_xlat3;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixInvVP[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat15 = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
        u_xlat15 = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat15;
        u_xlat15 = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat15;
        u_xlat15 = u_xlat15 + hlslcc_mtx4x4unity_MatrixV[3].z;
        u_xlat15 = abs(u_xlat15);
    } else {
        u_xlat1.xy = (-_CameraDepthTexture_TexelSize.xy) * vec2(0.5, 0.5) + vec2(1.0, 1.0);
        u_xlat5.xy = min(u_xlat5.xy, u_xlat1.xy);
        u_xlat5.xy = u_xlat5.xy * _RTHandleScale.xy;
        u_xlat1 = texture(_CameraDepthTexture, u_xlat5.xy, _GlobalMipBias.x);
        u_xlat5.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
        u_xlat15 = float(1.0) / u_xlat5.x;
    }
    u_xlat0 = (-u_xlat0) + u_xlat15;
    u_xlat0 = u_xlat0 / _FoamDistance;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlatb0 = u_xlat0>=0.5;
    u_xlat0 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat2.xyz + (-_LightFoamColor.xyz);
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat5.xyz + _LightFoamColor.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


 }
 Pass {
  Name "MotionVectors"
  Tags { "LIGHTMODE"="MOTIONVECTORS" "QUEUE"="Transparent" "RenderType"="Transparent" "DisableBatching"="False" "RenderPipeline"="UniversalPipeline" "ShaderGraphShader"="true" "ShaderGraphTargetId"="UniversalUnlitSubTarget" "UniversalMaterialType"="Unlit" }
  ColorMask RG
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Constant Buffer "$Globals" (208 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 16
  Matrix4x4 _PrevViewProjMatrix at 80
  Matrix4x4 _NonJitteredViewProjMatrix at 144
  Vector4 _TimeParameters at 0
}
Constant Buffer "UnityPerMaterial" (176 bytes) on slot 1 {
  Float _Choppiness at 100
}
Constant Buffer "UnityPerDraw" (720 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_MatrixPreviousM at 544
  Vector4 unity_MotionVectorsParams at 672
}

Shader Disassembly:
#ifdef VERTEX
#version 330
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4_PrevViewProjMatrix[4];
uniform 	vec4 hlslcc_mtx4x4_NonJitteredViewProjMatrix[4];
UNITY_BINDING(0) uniform UnityPerDraw {
	vec4                hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_WorldToObject[4];
	vec4 Xhlslcc_UnusedXunity_LODFade;
	vec4 Xhlslcc_UnusedXunity_WorldTransformParams;
	vec4 Xhlslcc_UnusedXunity_RenderingLayer;
	vec4 Xhlslcc_UnusedXunity_LightData;
	vec4 Xhlslcc_UnusedXunity_LightIndices[2];
	vec4 Xhlslcc_UnusedXunity_ProbesOcclusion;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_HDR;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_HDR;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_BoxMax;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_BoxMin;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_ProbePosition;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_BoxMax;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_BoxMin;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_ProbePosition;
	vec4 Xhlslcc_UnusedXunity_LightmapST;
	vec4 Xhlslcc_UnusedXunity_DynamicLightmapST;
	vec4 Xhlslcc_UnusedXunity_SHAr;
	vec4 Xhlslcc_UnusedXunity_SHAg;
	vec4 Xhlslcc_UnusedXunity_SHAb;
	vec4 Xhlslcc_UnusedXunity_SHBr;
	vec4 Xhlslcc_UnusedXunity_SHBg;
	vec4 Xhlslcc_UnusedXunity_SHBb;
	vec4 Xhlslcc_UnusedXunity_SHC;
	vec4 Xhlslcc_UnusedXunity_RendererBounds_Min;
	vec4 Xhlslcc_UnusedXunity_RendererBounds_Max;
	vec4                hlslcc_mtx4x4unity_MatrixPreviousM[4];
	vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_MatrixPreviousMI[4];
	vec4                unity_MotionVectorsParams;
	vec4 Xhlslcc_UnusedXunity_SpriteColor;
	vec4 Xhlslcc_UnusedXunity_SpriteProps;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	vec4 Xhlslcc_UnusedX_FlowTexture_TexelSize;
	float Xhlslcc_UnusedX_Size;
	float Xhlslcc_UnusedX_FlowStrength;
	float Xhlslcc_UnusedX_FlowSpeed;
	vec4 Xhlslcc_UnusedX_FoamTexture_TexelSize;
	vec4 Xhlslcc_UnusedX_WaterColor;
	vec4 Xhlslcc_UnusedX_LightFoamColor;
	vec4 Xhlslcc_UnusedX_DarkFoamColor;
	float Xhlslcc_UnusedX_FoamDistance;
	float                _Choppiness;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_ST;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_TexelSize;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_MipInfo;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_StreamInfo;
};
in  vec3 in_POSITION0;
in  vec3 in_TEXCOORD4;
out vec3 vs_CLIP_POSITION_NO_JITTER0;
out vec3 vs_PREVIOUS_CLIP_POSITION_NO_JITTER0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = in_POSITION0.yy * hlslcc_mtx4x4unity_ObjectToWorld[1].xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_ObjectToWorld[3].xz;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _TimeParameters.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.y = u_xlat0.x * _Choppiness;
    u_xlat0.x = float(0.0);
    u_xlat0.z = float(0.0);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = u_xlat2 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlatb9 = unity_MotionVectorsParams.y!=0.0;
    if(u_xlatb9){
        u_xlatb9 = unity_MotionVectorsParams.x==1.0;
        if(u_xlatb9){
            u_xlat2.xy = in_TEXCOORD4.yy * hlslcc_mtx4x4unity_ObjectToWorld[1].xz;
            u_xlat2.xy = hlslcc_mtx4x4unity_ObjectToWorld[0].xz * in_TEXCOORD4.xx + u_xlat2.xy;
            u_xlat2.xy = hlslcc_mtx4x4unity_ObjectToWorld[2].xz * in_TEXCOORD4.zz + u_xlat2.xy;
            u_xlat2.xy = u_xlat2.xy + hlslcc_mtx4x4unity_ObjectToWorld[3].xz;
            u_xlat9 = u_xlat2.y + u_xlat2.x;
            u_xlat9 = u_xlat9 + _TimeParameters.x;
            u_xlat9 = sin(u_xlat9);
            u_xlat2.y = u_xlat9 * _Choppiness;
            u_xlat2.x = float(0.0);
            u_xlat2.z = float(0.0);
            u_xlat0.xyz = u_xlat2.xyz + in_TEXCOORD4.xyz;
        }
        u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4_NonJitteredViewProjMatrix[1].xyw;
        u_xlat1.xyw = hlslcc_mtx4x4_NonJitteredViewProjMatrix[0].xyw * u_xlat1.xxx + u_xlat2.xyz;
        u_xlat1.xyz = hlslcc_mtx4x4_NonJitteredViewProjMatrix[2].xyw * u_xlat1.zzz + u_xlat1.xyw;
        vs_CLIP_POSITION_NO_JITTER0.xyz = u_xlat1.xyz + hlslcc_mtx4x4_NonJitteredViewProjMatrix[3].xyw;
        u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixPreviousM[1];
        u_xlat1 = hlslcc_mtx4x4unity_MatrixPreviousM[0] * u_xlat0.xxxx + u_xlat1;
        u_xlat0 = hlslcc_mtx4x4unity_MatrixPreviousM[2] * u_xlat0.zzzz + u_xlat1;
        u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixPreviousM[3];
        u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_PrevViewProjMatrix[1].xyw;
        u_xlat1.xyz = hlslcc_mtx4x4_PrevViewProjMatrix[0].xyw * u_xlat0.xxx + u_xlat1.xyz;
        u_xlat0.xyz = hlslcc_mtx4x4_PrevViewProjMatrix[2].xyw * u_xlat0.zzz + u_xlat1.xyz;
        vs_PREVIOUS_CLIP_POSITION_NO_JITTER0.xyz = hlslcc_mtx4x4_PrevViewProjMatrix[3].xyw * u_xlat0.www + u_xlat0.xyz;
    } else {
        vs_CLIP_POSITION_NO_JITTER0.xyz = vec3(0.0, 0.0, 0.0);
        vs_PREVIOUS_CLIP_POSITION_NO_JITTER0.xyz = vec3(0.0, 0.0, 0.0);
    }
    return;
}

#endif
#ifdef FRAGMENT
#version 330
#extension GL_ARB_explicit_attrib_location : require

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_BINDING(0) uniform UnityPerDraw {
	vec4                hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_WorldToObject[4];
	vec4 Xhlslcc_UnusedXunity_LODFade;
	vec4 Xhlslcc_UnusedXunity_WorldTransformParams;
	vec4 Xhlslcc_UnusedXunity_RenderingLayer;
	vec4 Xhlslcc_UnusedXunity_LightData;
	vec4 Xhlslcc_UnusedXunity_LightIndices[2];
	vec4 Xhlslcc_UnusedXunity_ProbesOcclusion;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_HDR;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_HDR;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_BoxMax;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_BoxMin;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_ProbePosition;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_BoxMax;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_BoxMin;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_ProbePosition;
	vec4 Xhlslcc_UnusedXunity_LightmapST;
	vec4 Xhlslcc_UnusedXunity_DynamicLightmapST;
	vec4 Xhlslcc_UnusedXunity_SHAr;
	vec4 Xhlslcc_UnusedXunity_SHAg;
	vec4 Xhlslcc_UnusedXunity_SHAb;
	vec4 Xhlslcc_UnusedXunity_SHBr;
	vec4 Xhlslcc_UnusedXunity_SHBg;
	vec4 Xhlslcc_UnusedXunity_SHBb;
	vec4 Xhlslcc_UnusedXunity_SHC;
	vec4 Xhlslcc_UnusedXunity_RendererBounds_Min;
	vec4 Xhlslcc_UnusedXunity_RendererBounds_Max;
	vec4                hlslcc_mtx4x4unity_MatrixPreviousM[4];
	vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_MatrixPreviousMI[4];
	vec4                unity_MotionVectorsParams;
	vec4 Xhlslcc_UnusedXunity_SpriteColor;
	vec4 Xhlslcc_UnusedXunity_SpriteProps;
};
in  vec3 vs_CLIP_POSITION_NO_JITTER0;
in  vec3 vs_PREVIOUS_CLIP_POSITION_NO_JITTER0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
float u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.x = float(1.0) / vs_PREVIOUS_CLIP_POSITION_NO_JITTER0.z;
    u_xlat0.xy = u_xlat0.xx * vs_PREVIOUS_CLIP_POSITION_NO_JITTER0.xy;
    u_xlat2 = float(1.0) / vs_CLIP_POSITION_NO_JITTER0.z;
    u_xlat0.xy = vs_CLIP_POSITION_NO_JITTER0.xy * vec2(u_xlat2) + (-u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlatb2 = unity_MotionVectorsParams.y!=0.0;
    SV_Target0.xy = bool(u_xlatb2) ? u_xlat0.xy : vec2(0.0, 0.0);
    SV_Target0.zw = vec2(0.0, 0.0);
    return;
}

#endif


 }
 Pass {
  Name "DepthNormalsOnly"
  Tags { "LIGHTMODE"="DepthNormalsOnly" "QUEUE"="Transparent" "RenderType"="Transparent" "DisableBatching"="False" "RenderPipeline"="UniversalPipeline" "ShaderGraphShader"="true" "ShaderGraphTargetId"="UniversalUnlitSubTarget" "UniversalMaterialType"="Unlit" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Constant Buffer "$Globals" (80 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 16
  Vector4 _TimeParameters at 0
}
Constant Buffer "UnityPerMaterial" (176 bytes) on slot 1 {
  Float _Choppiness at 100
}
Constant Buffer "UnityPerDraw" (720 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
UNITY_BINDING(0) uniform UnityPerDraw {
	vec4                hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4                hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 Xhlslcc_UnusedXunity_LODFade;
	vec4 Xhlslcc_UnusedXunity_WorldTransformParams;
	vec4 Xhlslcc_UnusedXunity_RenderingLayer;
	vec4 Xhlslcc_UnusedXunity_LightData;
	vec4 Xhlslcc_UnusedXunity_LightIndices[2];
	vec4 Xhlslcc_UnusedXunity_ProbesOcclusion;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_HDR;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_HDR;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_BoxMax;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_BoxMin;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_ProbePosition;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_BoxMax;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_BoxMin;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_ProbePosition;
	vec4 Xhlslcc_UnusedXunity_LightmapST;
	vec4 Xhlslcc_UnusedXunity_DynamicLightmapST;
	vec4 Xhlslcc_UnusedXunity_SHAr;
	vec4 Xhlslcc_UnusedXunity_SHAg;
	vec4 Xhlslcc_UnusedXunity_SHAb;
	vec4 Xhlslcc_UnusedXunity_SHBr;
	vec4 Xhlslcc_UnusedXunity_SHBg;
	vec4 Xhlslcc_UnusedXunity_SHBb;
	vec4 Xhlslcc_UnusedXunity_SHC;
	vec4 Xhlslcc_UnusedXunity_RendererBounds_Min;
	vec4 Xhlslcc_UnusedXunity_RendererBounds_Max;
	vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_MatrixPreviousM[4];
	vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_MatrixPreviousMI[4];
	vec4 Xhlslcc_UnusedXunity_MotionVectorsParams;
	vec4 Xhlslcc_UnusedXunity_SpriteColor;
	vec4 Xhlslcc_UnusedXunity_SpriteProps;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	vec4 Xhlslcc_UnusedX_FlowTexture_TexelSize;
	float Xhlslcc_UnusedX_Size;
	float Xhlslcc_UnusedX_FlowStrength;
	float Xhlslcc_UnusedX_FlowSpeed;
	vec4 Xhlslcc_UnusedX_FoamTexture_TexelSize;
	vec4 Xhlslcc_UnusedX_WaterColor;
	vec4 Xhlslcc_UnusedX_LightFoamColor;
	vec4 Xhlslcc_UnusedX_DarkFoamColor;
	float Xhlslcc_UnusedX_FoamDistance;
	float                _Choppiness;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_ST;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_TexelSize;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_MipInfo;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_StreamInfo;
};
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
out vec3 vs_INTERP0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xy = in_POSITION0.yy * hlslcc_mtx4x4unity_ObjectToWorld[1].xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_ObjectToWorld[3].xz;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _TimeParameters.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.y = u_xlat0.x * _Choppiness;
    u_xlat0.x = float(0.0);
    u_xlat0.z = float(0.0);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_INTERP0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

in  vec3 vs_INTERP0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
void main()
{
    u_xlat0 = dot(vs_INTERP0.xyz, vs_INTERP0.xyz);
    u_xlat0 = inversesqrt(u_xlat0);
    SV_Target0.xyz = vec3(u_xlat0) * vs_INTERP0.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif


 }
 Pass {
  Name "ShadowCaster"
  Tags { "LIGHTMODE"="SHADOWCASTER" "QUEUE"="Transparent" "RenderType"="Transparent" "DisableBatching"="False" "RenderPipeline"="UniversalPipeline" "ShaderGraphShader"="true" "ShaderGraphTargetId"="UniversalUnlitSubTarget" "UniversalMaterialType"="Unlit" }
  ColorMask 0
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Constant Buffer "$Globals" (108 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 16
  Vector4 _TimeParameters at 0
  Vector4 _ShadowBias at 80
  Vector3 _LightDirection at 96
}
Constant Buffer "UnityPerMaterial" (176 bytes) on slot 1 {
  Float _Choppiness at 100
}
Constant Buffer "UnityPerDraw" (720 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShadowBias;
uniform 	vec3 _LightDirection;
UNITY_BINDING(0) uniform UnityPerDraw {
	vec4                hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4                hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 Xhlslcc_UnusedXunity_LODFade;
	vec4 Xhlslcc_UnusedXunity_WorldTransformParams;
	vec4 Xhlslcc_UnusedXunity_RenderingLayer;
	vec4 Xhlslcc_UnusedXunity_LightData;
	vec4 Xhlslcc_UnusedXunity_LightIndices[2];
	vec4 Xhlslcc_UnusedXunity_ProbesOcclusion;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_HDR;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_HDR;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_BoxMax;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_BoxMin;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_ProbePosition;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_BoxMax;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_BoxMin;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_ProbePosition;
	vec4 Xhlslcc_UnusedXunity_LightmapST;
	vec4 Xhlslcc_UnusedXunity_DynamicLightmapST;
	vec4 Xhlslcc_UnusedXunity_SHAr;
	vec4 Xhlslcc_UnusedXunity_SHAg;
	vec4 Xhlslcc_UnusedXunity_SHAb;
	vec4 Xhlslcc_UnusedXunity_SHBr;
	vec4 Xhlslcc_UnusedXunity_SHBg;
	vec4 Xhlslcc_UnusedXunity_SHBb;
	vec4 Xhlslcc_UnusedXunity_SHC;
	vec4 Xhlslcc_UnusedXunity_RendererBounds_Min;
	vec4 Xhlslcc_UnusedXunity_RendererBounds_Max;
	vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_MatrixPreviousM[4];
	vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_MatrixPreviousMI[4];
	vec4 Xhlslcc_UnusedXunity_MotionVectorsParams;
	vec4 Xhlslcc_UnusedXunity_SpriteColor;
	vec4 Xhlslcc_UnusedXunity_SpriteProps;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	vec4 Xhlslcc_UnusedX_FlowTexture_TexelSize;
	float Xhlslcc_UnusedX_Size;
	float Xhlslcc_UnusedX_FlowStrength;
	float Xhlslcc_UnusedX_FlowSpeed;
	vec4 Xhlslcc_UnusedX_FoamTexture_TexelSize;
	vec4 Xhlslcc_UnusedX_WaterColor;
	vec4 Xhlslcc_UnusedX_LightFoamColor;
	vec4 Xhlslcc_UnusedX_DarkFoamColor;
	float Xhlslcc_UnusedX_FoamDistance;
	float                _Choppiness;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_ST;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_TexelSize;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_MipInfo;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_StreamInfo;
};
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
out vec3 vs_INTERP0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat3;
bool u_xlatb3;
float u_xlat6;
void main()
{
    u_xlat0.xy = in_POSITION0.yy * hlslcc_mtx4x4unity_ObjectToWorld[1].xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_ObjectToWorld[3].xz;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _TimeParameters.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.y = u_xlat0.x * _Choppiness;
    u_xlat0.x = float(0.0);
    u_xlat0.z = float(0.0);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat0.xyz = _LightDirection.xyz * _ShadowBias.xxx + u_xlat0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat6 = dot(_LightDirection.xyz, u_xlat1.xyz);
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat6 = (-u_xlat6) + 1.0;
    u_xlat6 = u_xlat6 * _ShadowBias.y;
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat6) + u_xlat0.xyz;
    vs_INTERP0.xyz = u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat3 = roundEven(_ShadowBias.z);
    u_xlatb3 = u_xlat3==1.0;
    u_xlat3 = u_xlatb3 ? 1.0 : float(0.0);
    gl_Position.z = u_xlat3 * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

layout(location = 0) out vec4 SV_TARGET0;
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif


//////////////////////////////////////////////////////
Keywords: _CASTING_PUNCTUAL_LIGHT_SHADOW
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Constant Buffer "$Globals" (108 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 16
  Vector4 _TimeParameters at 0
  Vector4 _ShadowBias at 80
  Vector3 _LightPosition at 96
}
Constant Buffer "UnityPerMaterial" (176 bytes) on slot 1 {
  Float _Choppiness at 100
}
Constant Buffer "UnityPerDraw" (720 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShadowBias;
uniform 	vec3 _LightPosition;
UNITY_BINDING(0) uniform UnityPerDraw {
	vec4                hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4                hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 Xhlslcc_UnusedXunity_LODFade;
	vec4 Xhlslcc_UnusedXunity_WorldTransformParams;
	vec4 Xhlslcc_UnusedXunity_RenderingLayer;
	vec4 Xhlslcc_UnusedXunity_LightData;
	vec4 Xhlslcc_UnusedXunity_LightIndices[2];
	vec4 Xhlslcc_UnusedXunity_ProbesOcclusion;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_HDR;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_HDR;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_BoxMax;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_BoxMin;
	vec4 Xhlslcc_UnusedXunity_SpecCube0_ProbePosition;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_BoxMax;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_BoxMin;
	vec4 Xhlslcc_UnusedXunity_SpecCube1_ProbePosition;
	vec4 Xhlslcc_UnusedXunity_LightmapST;
	vec4 Xhlslcc_UnusedXunity_DynamicLightmapST;
	vec4 Xhlslcc_UnusedXunity_SHAr;
	vec4 Xhlslcc_UnusedXunity_SHAg;
	vec4 Xhlslcc_UnusedXunity_SHAb;
	vec4 Xhlslcc_UnusedXunity_SHBr;
	vec4 Xhlslcc_UnusedXunity_SHBg;
	vec4 Xhlslcc_UnusedXunity_SHBb;
	vec4 Xhlslcc_UnusedXunity_SHC;
	vec4 Xhlslcc_UnusedXunity_RendererBounds_Min;
	vec4 Xhlslcc_UnusedXunity_RendererBounds_Max;
	vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_MatrixPreviousM[4];
	vec4 Xhlslcc_UnusedXhlslcc_mtx4x4unity_MatrixPreviousMI[4];
	vec4 Xhlslcc_UnusedXunity_MotionVectorsParams;
	vec4 Xhlslcc_UnusedXunity_SpriteColor;
	vec4 Xhlslcc_UnusedXunity_SpriteProps;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	vec4 Xhlslcc_UnusedX_FlowTexture_TexelSize;
	float Xhlslcc_UnusedX_Size;
	float Xhlslcc_UnusedX_FlowStrength;
	float Xhlslcc_UnusedX_FlowSpeed;
	vec4 Xhlslcc_UnusedX_FoamTexture_TexelSize;
	vec4 Xhlslcc_UnusedX_WaterColor;
	vec4 Xhlslcc_UnusedX_LightFoamColor;
	vec4 Xhlslcc_UnusedX_DarkFoamColor;
	float Xhlslcc_UnusedX_FoamDistance;
	float                _Choppiness;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_ST;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_TexelSize;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_MipInfo;
	vec4 Xhlslcc_UnusedXunity_MipmapStreaming_DebugTex_StreamInfo;
};
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
out vec3 vs_INTERP0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat4;
bool u_xlatb4;
float u_xlat9;
void main()
{
    u_xlat0.xy = in_POSITION0.yy * hlslcc_mtx4x4unity_ObjectToWorld[1].xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_ObjectToWorld[3].xz;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _TimeParameters.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.y = u_xlat0.x * _Choppiness;
    u_xlat0.x = float(0.0);
    u_xlat0.z = float(0.0);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _LightPosition.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _ShadowBias.xxx + u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = u_xlat9 * _ShadowBias.y;
    u_xlat0.xyz = u_xlat2.xyz * vec3(u_xlat9) + u_xlat0.xyz;
    vs_INTERP0.xyz = u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    u_xlat4 = roundEven(_ShadowBias.z);
    u_xlatb4 = u_xlat4==1.0;
    u_xlat4 = u_xlatb4 ? 1.0 : float(0.0);
    gl_Position.z = u_xlat4 * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

layout(location = 0) out vec4 SV_TARGET0;
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif


 }
 Pass {
  Name "GBuffer"
  Tags { "LIGHTMODE"="UniversalGBuffer" "QUEUE"="Transparent" "RenderType"="Transparent" "DisableBatching"="False" "RenderPipeline"="UniversalPipeline" "ShaderGraphShader"="true" "ShaderGraphTargetId"="UniversalUnlitSubTarget" "UniversalMaterialType"="Unlit" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
 }
}
CustomEditor "UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI"
Fallback "Hidden/Shader Graph/FallbackError"
}