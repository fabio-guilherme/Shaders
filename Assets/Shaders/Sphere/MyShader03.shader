Shader "Custom/MyShader03"{	
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

            float4 MyVertexProgram(float4 position:POSITION):SV_POSITION{
                return UnityObjectToClipPos(position);
            }

            float4 MyFragmentProgram(float4 position:SV_POSITION):SV_TARGET{
                return _Color;
            }

            ENDHLSL
        }	
    }
}