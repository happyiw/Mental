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
    float activeTime = time * 1.5;//speed_modifier;
    vec3 col;
    float timeMorph = 0.;
    
    float halfTime = 3.5;
    
    vec2 p1 = -1. + 2. * vec2(v_vTexcoord.x,1.0-v_vTexcoord.y);
    
    p1.y -= 1.5;
    
    p1 *= 10.;
    
    float A = atan(p1.x,p1.y);
    float r1 = sqrt(dot(p1,p1));

    if(mod(activeTime, 2.0 * halfTime) < halfTime)
        timeMorph = mod(activeTime, halfTime);
    else
        timeMorph = (halfTime - mod(activeTime, halfTime));
        
    timeMorph = 2.0*timeMorph + 1.0;
    float ww = .75 + .5*(sin(activeTime - 1.0*r1)+ 2.0*cos(activeTime - 8.0*A)/timeMorph);

    col = vec3(.2,.2,.2)*5.5;
    vec3 red = vec3(0.6,.0,.0);
    gl_FragColor = vec4(col*ww*red,.2);
}
