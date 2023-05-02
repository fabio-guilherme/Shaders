Shader "Custom/MyShader02"{	
    Properties{			
    }
    SubShader{ 
        Pass{
            HLSLPROGRAM
            #pragma vertex MyVertexProgram
            #pragma fragment MyFragmentProgram

            #include "UnityCG.cginc"

            float4 MyVertexProgram(float4 position : POSITION) : SV_POSITION 
            {
                return UnityObjectToClipPos(position);
            }

            float4 MyFragmentProgram(float4 position:SV_POSITION):SV_TARGET
            {
                return float4(0, 0, 0, 1);
            }
            ENDHLSL
        }	
    }
}