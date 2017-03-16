#version 400 core

//  Input from previous shader
in vec3 FrontColor;
in vec4 Vertex;
in vec3 Color;
in vec3 Normal;
in vec2 TextureCoord;

in mat4 ModelViewMatrix;

//  Fragment color
layout (location=0) out vec4 Fragcolor;
uniform sampler2D texture;
uniform sampler2D texture_nrm;
in vec3 P;
in vec3 N;

// Light information
uniform vec4 LightPos;
uniform float LightAmbient;
uniform float LightDiffuse;
uniform float LightSpecular;

vec3 phong()
{

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
      //return L;
   return color;
}

//mat3 cotangent_frame( vec3 N, vec3 p, vec2 uv )
//{
//    // get edge vectors of the pixel triangle
//    vec3 dp1 = dFdx( p );
//    vec3 dp2 = dFdy( p );
//    vec2 duv1 = dFdx( uv );
//    vec2 duv2 = dFdy( uv );
//
//    // solve the linear system
//    vec3 dp2perp = cross( dp2, N );
//    vec3 dp1perp = cross( N, dp1 );
//    vec3 T = dp2perp * duv1.x + dp1perp * duv2.x;
//    vec3 B = dp2perp * duv1.y + dp1perp * duv2.y;
//
//    // construct a scale-invariant frame
//    float invmax = inversesqrt( max( dot(T,T), dot(B,B) ) );
//    return mat3( T * invmax, B * invmax, N );
//}

void main()
{
    vec3 normal = texture2D(texture,TextureCoord).rgb;
    normal = normalize(normal * 2.0 - 1.0);

    //Fragcolor = vec4(phong(),1.0);
    Fragcolor = vec4(phong(),1.0)*texture2D(texture,TextureCoord);
}
