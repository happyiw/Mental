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

//taken from https://www.shadertoy.com/view/4tlBWX

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform float intensity;

mat2 r2d(float a) {
    float c = cos(a);
    float s = sin(a);
    return mat2(c, s, -s, c);
}

float de(vec3 p) {
    p.y += cos(time*2.) * .05;
    p.xy *= r2d(time*.5 + p.z);
    vec3 r;
    float d = 0., s = 1.;
    for (int i = 0; i < 3; i++)
    r = max(r = abs(mod(p*s + 1., 2.) - 1.), r.yzx),
    d = max(d, (.9 - min(r.x, min(r.y, r.z))) / s),
    s *= 3.;
    return d;
}



void main()
{
    vec2 uv = v_vTexcoord;
    
    uv.x-=.51;
    uv.y-=.25;
    
    vec3 ro = vec3(/*.2*sin(time*.5)*/0, 0, -time*2.5), p;
    vec3 rd = normalize(vec3(uv,-1));
    p = ro;
    
    float it = 0.;
    for (float i=0.; i < 1.; i += .03) {
            it = i;
        float d = de(p);
        if (d < .0001) break;
        p += rd * d*.8;
    }
    it /= .5 * sqrt(abs(tan(180.) + p.x*p.x + p.y*p.y));
    
    vec3 c = mix(
        vec3(.175, .175, .175)*sin((p.z+10.)*1.5)*.5, 
        vec3(.35, .35, .35)*sin((p.z+20.)*1.)*.5, 
        .5*it*sin(p.z*.5)*.5);
    
    gl_FragColor = vec4(c,intensity);
}

