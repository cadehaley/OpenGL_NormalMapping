#version 400 core

//  Transformation matrices
uniform mat4 ModelViewMatrix;
uniform mat4 ProjectionMatrix;
uniform mat3 NormalMatrix;

//  Vertex attributes (input)
layout(location = 0) in vec4 Vertex;
layout(location = 1) in vec3 Color;
layout(location = 2) in vec3 Normal;

//  Output to next shader
out vec3 FrontColor;


vec3 phong()
{
   //  P is the vertex coordinate on body
   vec3 P = vec3(ModelViewMatrix * Vertex);
   //  N is the object normal at P
   vec3 N = normalize(NormalMatrix * Normal);
   //  Light Position for light 0
//   vec3 LightPos = vec3(gl_LightSource[0].position);
   //  L is the light vector
//   vec3 L = normalize(LightPos - P);

   //  Emission and ambient color
//   vec4 color = gl_FrontMaterial.emission + gl_FrontLightProduct[0].ambient + gl_LightModel.ambient*gl_FrontMaterial.ambient;
//////DEBUG//////
  vec3 color = N;

   //  Diffuse light intensity is cosine of light and normal vectors
//   float Id = dot(L,N);
//   if (Id>0.0)
//   {
      //  Add diffuse
//      color += Id*gl_FrontLightProduct[0].diffuse;
      //  R is the reflected light vector R = 2(L.N)N - L
//      vec3 R = reflect(-L, N);
      //  V is the view vector (eye at the origin)
//      vec3 V = normalize(-P);
      //  Specular is cosine of reflected and view vectors
//      float Is = dot(R,V);
//      if (Is>0.0) color += pow(Is,gl_FrontMaterial.shininess)*gl_FrontLightProduct[0].specular;
//   }

   //  Return sum of color components
   return color;
}


void main()
{
   //  Pass colors to fragment shader (will be interpolated)
//   FrontColor = Color;
   FrontColor = phong();
   //  Set transformed vertex location
   gl_Position =  ProjectionMatrix * ModelViewMatrix * Vertex;
}
