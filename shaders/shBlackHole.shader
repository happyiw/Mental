//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//

//taken from https://www.shadertoy.com/view/Xt3fWB

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform float intensity;

float M=0.1;

vec3 rotate(vec3 a)
{
    vec3 b = a;
    float sinT = sin(time);
    float cosT = cos(time);
    b.x = (cosT*a.x)-(sinT*a.z);
    b.z = (sinT*a.x)+(cosT*a.z);
    return b;
}

void main()
{
    vec2 uv = v_vTexcoord;
    uv.x-=0.5;
    uv.y-=0.5;
    
    float theta = atan(length(uv));
    
    float alpha = (4.0*M)/length(uv);
    float beta = theta-alpha;
    float into = length(uv)/tan(beta);//tan(beta) == length(uv)/into
    vec3 uvCube = vec3(uv,abs(into));
    
    float rS = step(1.0*M,length(uv));
    
    gl_FragColor = 1. -vec4(vec3(rS * uvCube),intensity);
}

