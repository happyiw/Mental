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
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform float intensity;


void main()
{
    float margin=0.01;
    vec2 c = v_vTexcoord - vec2(0.5,0.5);
    float shift = intensity*(c.x*c.x+c.y*c.y);
    vec2 shiftedCoord = c*(1.0+shift);
    gl_FragColor = step(shiftedCoord.x,0.5-margin)*step(-shiftedCoord.x,0.5-margin)*step(shiftedCoord.y,0.5-margin)*step(-shiftedCoord.y,0.5-margin)*v_vColour * texture2D( gm_BaseTexture, shiftedCoord+vec2(0.5,0.5) );
}

