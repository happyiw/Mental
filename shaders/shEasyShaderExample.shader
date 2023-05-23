// A sample PShader for use with objPShaderEffect, objPShaderChain and objPShaderRectangle.
// The Vertex Shader is left as default
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

//######################_==_YOYO_SHADER_MARKER_==_######################@~// A sample PShader for use with objPShaderEffect, objPShaderChain and objPShaderRectangle.
// The Fragment Shader has two uniforms: time and intensity

// time: time in seconds (increments by 1/50 every frame)
// intensity: a variable between 0 and 1 determining the intensity (or some other arbitrary parameter) of a shader effect
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float time;
uniform float intensity;

float rand(vec2 co){
    return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
}

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord + intensity*vec2(rand(vec2(v_vTexcoord.y,time))-0.5,0.0));
}

