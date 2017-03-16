#version 400 core

//  Transformation matrices
uniform mat4 inModelViewMatrix;
uniform mat4 inProjectionMatrix;
uniform mat3 inNormalMatrix;

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
out mat4 ProjectionMatrix;
out mat3 NormalMatrix;


void main()
{
  Color = inColor;
  Normal = inNormal;
  TextureCoord = inTextureCoord;
  ModelViewMatrix = inModelViewMatrix;
  ProjectionMatrix = inProjectionMatrix;
  NormalMatrix = inNormalMatrix;

   //  Pass colors to fragment shader (will be interpolated)
   FrontColor = Color;
   //  Set transformed vertex location
   gl_Position =  inProjectionMatrix * inModelViewMatrix * inVertex;
}
