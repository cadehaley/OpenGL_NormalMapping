#version 400 core

//  Input from previous shader
in vec3 FrontColor;
in vec2 TextureCoord;

//  Fragment color
layout (location=0) out vec4 Fragcolor;
uniform sampler2D texture;

void main()
{
    Fragcolor = vec4(FrontColor,1.0)*texture2D(texture,TextureCoord);
}
