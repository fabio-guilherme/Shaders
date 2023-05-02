Shader "Custom/MyShader04"{	
    Properties{
        _Color("Color", Color) = (1, 1, 1, 1)
    }
    SubShader{ 
        Pass{
            HLSLPROGRAM

            #pragma vertex MyVertexProgram
            #pragma fragment MyFragmentProgram

            #include "UnityCG.cginc"

            float4 _Color;

            struct VertexToFragment {
                float4 position : SV_POSITION;
                float3 localPosition : TEXCOORD0;
            };

            VertexToFragment MyVertexProgram(float4 position : POSITION){
                VertexToFragment v2f;
                v2f.localPosition = position.xyz;
                v2f.position = UnityObjectToClipPos(position); 
                return v2f;
            }

            float4 MyFragmentProgram(VertexToFragment v2f) : SV_TARGET{
                return float4(v2f.localPosition + 0.5, 1) * _Color;
            }

            ENDHLSL
        }	
    }
}