﻿Shader "Custom/GroundShader" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0
		_NoiseTex ("Albedo (RGB)", 2D) = "white" {}
		_Amount ("Extrusion Amount", Range(0,10)) = 0.5
    }
    SubShader {
      Tags { "RenderType" = "Opaque" }

      CGPROGRAM
      #pragma surface surf Standard vertex:vert addshadow
      #pragma target 3.0

      sampler2D _MainTex;

      struct Input {
          float2 uv_MainTex;
      };

		half _Glossiness;
		half _Metallic;
		fixed4 _Color;

		sampler2D _NoiseTex;
		float _Amount;

      void vert (inout appdata_full v) {
          v.vertex.y += tex2Dlod(_NoiseTex, float4(v.texcoord1.x, v.texcoord1.y, 0, 0)).r * _Amount ;
      }

      void surf (Input IN, inout SurfaceOutputStandard o) {
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
			o.Albedo = c.rgb;
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			o.Alpha = c.a;
      }
      ENDCG
    } 
    Fallback "Diffuse"
}
