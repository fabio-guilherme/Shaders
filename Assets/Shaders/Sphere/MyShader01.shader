Shader "Custom/MyShader01"{	
  Properties{			
  }
  SubShader{ 
    Pass{
      HLSLPROGRAM
      #pragma vertex MyVertexProgram
      #pragma fragment MyFragmentProgram

      #include "UnityCG.cginc"

      void MyVertexProgram(){
      }

      void MyFragmentProgram(){
      }
      ENDHLSL
    }	
  }
}