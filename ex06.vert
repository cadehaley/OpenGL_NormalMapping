#version 400 core

//  Transformation matrices
uniform mat4 inModelViewMatrix;
uniform mat4 ProjectionMatrix;
uniform mat3 NormalMatrix;

//  Vertex attributes (input)
layout(location = 0) in vec4 inVertex;
layout(location = 1) in vec3 inColor;
layout(location = 2) in vec3 inNormal;
layout(location = 3) in vec2 inTextureCoord;



//  Output to next shader
out vec3 FrontColor;
out vec3 Color;
out vec3 Normal;
out vec2 TextureCoord;

out mat4 ModelViewMatrix;
out vec3 P;
out vec3 N;


void main()
{
  Color = inColor;
  Normal = inNormal;
  TextureCoord = inTextureCoord;
  ModelViewMatrix = inModelViewMatrix;

  //  P is the vertex coordinate on body
  P = vec3(inModelViewMatrix * inVertex);
  //  N is the object normal at P
  N = normalize(NormalMatrix * Normal);

   //  Pass colors to fragment shader (will be interpolated)
   FrontColor = Color;

   //  Set transformed vertex location
   gl_Position =  ProjectionMatrix * inModelViewMatrix * inVertex;
}
