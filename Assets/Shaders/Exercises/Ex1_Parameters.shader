Shader "Exercises/Ex1_Parameters"{	
    Properties{
        _Color("Color", Color) = (1, 1, 1, 1)
        _MainTex("Texture", 2D) = "white" {}
        _Value1("Value 1", Float) = 3.0
        _Value2("Value 2", Float) = 5.0
        _Value3("Value 3", Float) = 0.1
    }
    SubShader{ 
        Pass{
            CGPROGRAM

            #pragma vertex MyVertexProgram
            #pragma fragment MyFragmentProgram

            #include "UnityCG.cginc"

            float4 _Color;
            sampler2D _MainTex;
            float4 _MainTex_ST;

            float _Value1;
            float _Value2;
            float _Value3;

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
                vert.position.x += sin((_Time.y*_Value1)+(vert.position.y*_Value2))*_Value3;
                v2f.position = UnityObjectToClipPos(vert.position);
                v2f.uv = vert.uv * _MainTex_ST.xy + _MainTex_ST.zw;
                return v2f; 
            }

            float4 MyFragmentProgram(VertexToFragment v2f) : SV_TARGET{
                return tex2D(_MainTex, v2f.uv) * _Color;
            }

            ENDCG
        }	
    }
}