Shader "Custom/MyShader11"{	
    Properties{
        _Color("Color", Color) = (1, 1, 1, 1)
        _MainTex("Texture", 2D) = "white" {}
        _DissolveTexture ("Dissolve Texture", 2D) = "white" {}
        _DissolveCutoff ("Dissolve Cutoff", Range(0, 1)) = 1
    }
    SubShader{ 
        Pass{
            CGPROGRAM

            #pragma vertex MyVertexProgram
            #pragma fragment MyFragmentProgram

            #include "UnityCG.cginc"

            float4 _Color;
            sampler2D _MainTex, _DissolveTexture;
            float4 _MainTex_ST;
            float _DissolveCutoff;

            struct VertexData {
                float4 position : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct VertexToFragment {
                float4 position : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            VertexToFragment MyVertexProgram(VertexData vert) {
                VertexToFragment v2f;
                v2f.position = UnityObjectToClipPos(vert.position);
                v2f.uv = vert.uv * _MainTex_ST.xy + _MainTex_ST.zw;
                return v2f;
            }

            float4 MyFragmentProgram(VertexToFragment v2f) : SV_TARGET{
                float4 textureColor = tex2D(_MainTex, v2f.uv) * _Color;
                float4 dissolveColour = tex2D(_DissolveTexture, v2f.uv);
                clip(dissolveColour.rgb - _DissolveCutoff);
                return textureColor;
            }

            ENDCG
        }	
    }
}