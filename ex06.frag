#version 400 core

//  Input from previous shader
in vec3 FrontColor;
in vec4 Vertex;
in vec3 Color;
in vec3 Normal;
in vec2 TextureCoord;

in mat4 ModelViewMatrix;
in mat4 ProjectionMatrix;
in mat3 NormalMatrix;

//  Fragment color
layout (location=0) out vec4 Fragcolor;
uniform sampler2D texture;

// Light information
uniform vec4 LightPos;
uniform float LightAmbient;
uniform float LightDiffuse;
uniform float LightSpecular;

vec3 phong()
{
   //  P is the vertex coordinate on body
   vec3 P = vec3(ModelViewMatrix * Vertex);
   //  N is the object normal at P
   vec3 N = normalize(NormalMatrix * Normal);
   //  L is the light vector
   vec3 L = normalize(vec3(ModelViewMatrix * LightPos) - P);

   //  Emission and ambient color
   vec3 color = vec3(LightAmbient);


   //  Diffuse light intensity is cosine of light and normal vectors
   float Id = dot(L,N);
   if (Id>0.0)
   {
      //  Add diffuse
      color += Id*LightDiffuse;
      //  R is the reflected light vector R = 2(L.N)N - L
      vec3 R = reflect(-L, N);
      //  V is the view vector (eye at the origin)
      vec3 V = normalize(-P);
      //  Specular is cosine of reflected and view vectors
      float Is = dot(R,V);
      if (Is>0.0) color += pow(Is,32.0)*LightSpecular;
   }

   //  Return sum of color components
   return color;
//   return vec3(Vertex[0],Vertex[1],Vertex[2]);
}

void main()
{
    //Fragcolor = vec4(FrontColor,1.0)*texture2D(texture,TextureCoord);
    Fragcolor = vec4(phong(),1.0)*texture2D(texture,TextureCoord);
}
