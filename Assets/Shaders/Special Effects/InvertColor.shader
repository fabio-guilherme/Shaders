Shader "Image Effect/InvertColor"{	

  Properties{
    _MainTex ("Source", 2D) = "white" {}	
  }	

  SubShader{
    Cull Off 	
    ZWrite Off 		
    ZTest Always		
  
    Pass{
      HLSLPROGRAM
      #pragma vertex MyVertexProgram	
      #pragma fragment MyFragmentProgram
      #include "UnityCG.cginc"			

      sampler2D _MainTex;			
      float4 _MainTex_ST;			
    
      struct VertexData{
        float4 position : POSITION;			
        float2 uv : TEXCOORD0;			
      };
      struct VertexToFragment{
        float4 position : POSITION;			    
        float2 uv : TEXCOORD0;			
      };
    
      VertexToFragment MyVertexProgram(VertexData vert){
        VertexToFragment v2f;	
        v2f.position = UnityObjectToClipPos(vert.position);
        v2f.uv = vert.uv;			
        return v2f;	
      }	

      float4 MyFragmentProgram(VertexToFragment v2f) : SV_TARGET{
        float4 color = tex2D(_MainTex, v2f.uv);
        return 1 - color;	
      }

      ENDHLSL	
    }  	
  }
}