#version 400 core

//  Transformation matrices
uniform mat4 ModelViewMatrix;
uniform mat4 ProjectionMatrix;
uniform mat3 NormalMatrix;

//  Vertex attributes (input)
layout(location = 0) in vec4 Vertex;
layout(location = 1) in vec3 Color;
layout(location = 2) in vec3 Normal;
layout(location = 3) in vec2 inTextureCoord;

// Light information
uniform vec4 LightPos;
uniform float LightAmbient;
uniform float LightDiffuse;
uniform float LightSpecular;

//  Output to next shader
out vec3 FrontColor;
out vec2 TextureCoord;


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
   //  Pass colors to fragment shader (will be interpolated)
//   FrontColor = Color;
   FrontColor = phong();
   //  Set transformed vertex location
   gl_Position =  ProjectionMatrix * ModelViewMatrix * Vertex;

   TextureCoord = inTextureCoord;
}
