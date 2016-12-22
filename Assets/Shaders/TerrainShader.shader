Shader "Custom/TerrainShader" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Main Texture", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0
		_BumpMap ("Normal Map", 2D) = "bump" {}
		_HeightMap ("Height Map", 2D) = "white" {}
		_OcclusionMap ("Occlusion", 2D) = "white" {}
		_Amount ("Extrusion Amount", Range(1,100)) = 1.0
    }
    SubShader {
      Tags { "RenderType" = "Opaque" }

      CGPROGRAM
      #pragma surface surf Standard vertex:vert addshadow
      #pragma target 3.0

      struct Input {
          float2 uv_MainTex;
          float2 uv_BumpMap;
          float2 uv_OcclusionMap;
          float3 worldRefl;
          INTERNAL_DATA
      };

      sampler2D _MainTex;
      sampler2D _BumpMap;
      sampler2D _OcclusionMap;

		half _Glossiness;
		half _Metallic;
		fixed4 _Color;

		sampler2D _HeightMap;
		float _Amount;

      void vert (inout appdata_full v) {
          v.vertex.y = tex2Dlod(_HeightMap, float4(v.texcoord1.x, v.texcoord1.y, 0, 0)).r * _Amount - (_Amount / 2);
      }

      void surf (Input IN, inout SurfaceOutputStandard o) {
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
			o.Albedo = c.rgb;
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			o.Normal = UnpackNormal (tex2D (_BumpMap, IN.uv_BumpMap));
			o.Occlusion = tex2D (_OcclusionMap, IN.uv_OcclusionMap);
			o.Alpha = c.a;
      }
      ENDCG
    } 
    Fallback "Diffuse"
}
