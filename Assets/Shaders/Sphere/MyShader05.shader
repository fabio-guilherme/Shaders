Shader "Custom/MyShader05"{	
    Properties{
        _Color("Color", Color) = (1, 1, 1, 1)
        _MainTex("Texture", 2D) = "white" {}
    }
    SubShader{ 
        Pass{
            CGPROGRAM

            #pragma vertex MyVertexProgram
            #pragma fragment MyFragmentProgram

            #include "UnityCG.cginc"

            float4 _Color;
            sampler2D _MainTex;

            struct VertexData {
                float4 position : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct VertexToFragment {
                float4 position : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            VertexToFragment MyVertexProgram(VertexData vert){
                VertexToFragment v2f;
                v2f.position = UnityObjectToClipPos(vert.position);
                v2f.uv = vert.uv;
                return v2f; 
            }

            float4 MyFragmentProgram(VertexToFragment v2f) : SV_TARGET{
                return tex2D(_MainTex, v2f.uv) * _Color;
            }

            ENDCG
        }	
    }
}