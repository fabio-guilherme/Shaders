Shader "Custom/MyShader09"{	
    Properties{
        _Color("Color", Color) = (1, 1, 1, 1)
        _MainTex("Texture", 2D) = "white" {}
        _DetailTex("Detail Texture", 2D) = "gray" {}
    }
    SubShader{ 
        Pass{
            CGPROGRAM

            #pragma vertex MyVertexProgram
            #pragma fragment MyFragmentProgram

            #include "UnityCG.cginc"

            float4 _Color;
            sampler2D _MainTex, _DetailTex;
            float4 _MainTex_ST, _DetailTex_ST;

            struct VertexData {
                float4 position : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct VertexToFragment {
                float4 position : SV_POSITION;
                float2 uv : TEXCOORD0;
                float2 uvDetail : TEXCOORD1;
            };

            VertexToFragment MyVertexProgram(VertexData vert){
                VertexToFragment v2f;
                v2f.position = UnityObjectToClipPos(vert.position);
                v2f.uv = vert.uv * _MainTex_ST.xy + _MainTex_ST.zw;
                v2f.uvDetail = vert.uv * _DetailTex_ST.xy + _DetailTex_ST.zw;
                return v2f; 
            }
			 
            float4 MyFragmentProgram(VertexToFragment v2f):SV_TARGET{
                float4 color = tex2D(_MainTex, v2f.uv) * _Color;
                color *= tex2D(_DetailTex, v2f.uvDetail * 10) * 2;
                return color;
            }

            ENDCG
        }	
    }
}