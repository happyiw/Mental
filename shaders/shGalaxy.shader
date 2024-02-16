attribute vec3 in_Position; 
varying vec2 fragCoord; 
 void main() 
 {
    vec4 Position = vec4( in_Position, 1); 
   gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * Position; 
   fragCoord = in_Position.xy; 
 }
//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform float iGlobalTime; 
uniform float iResolution; 
varying vec2 fragCoord; 
//---  Galaxy --- Fabrice NEYRET  august 2013

const float RETICULATION = 3.;  // strenght of dust texture2D
const float NB_ARMS = 5.;       // number of arms
//const float ARM = 3.;         // contrast in/out arms
const float COMPR = .1;         // compression in arms
const float SPEED = .1;
const float GALAXY_R = 1./2.;
const float BULB_R = 1./4.;
const vec3 GALAXY_COL = vec3(.9,.9,1.); //(1.,.8,.5);
const vec3 BULB_COL   = vec3(1.,.8,.8);
const vec3 SKY_COL    = .5*vec3(.1,.3,.5);
		
#define t iGlobalTime

// --- base noise
float tex(vec2 uv) 
{
	float n = texture2D(gm_BaseTexture,uv, 0.).r;
	
#define MODE 3  // kind of noise texture2D
#if MODE==0         // unsigned
	#define A 2.
	return n;
#elif MODE==1       // signed
	#define A 3.
	return 2.*n-1.;
#elif MODE==2       // bulbs
	#define A 3.
	return abs(2.*n-1.);
#elif MODE==3       // wires
	#define A 1.5
	return 1.-abs(2.*n-1.);
#endif
}


// --- perlin turbulent noise + rotation
float noise(vec2 uv)
{
	float v=0.;
	float a=-SPEED*t,	co=cos(a),si=sin(a); 
	mat2 M = mat2(co,-si,si,co);
	const int L = 7;
	float s=1.;
	for (int i=0; i<L; i++)
	{
		uv = M*uv;
		float b = tex(uv*s);
		v += 1./s* pow(abs(b),RETICULATION); 
		s *= 2.;
	}
	
    return v/2.;
}

bool keyToggle(int ascii) 
{
	return (texture2D(iChannel2,vec2((.5+float(ascii))/256.,0.75)).x > 0.);
}

void main( void )
{
	vec2 uv = fragCoord.xy/iResolution.y-vec2(.8,.5);
	vec3 col;
	
	// spiral stretching with distance
	float rho = length(uv); // polar coords
	float ang = atan(uv.y,uv.x);
	float shear = 2.*log(rho); // logarythmic spiral
	float c = cos(shear), s=sin(shear);
	mat2 R = mat2(c,-s,s,c);

	// galaxy profile
	float r; // disk
	r = rho/GALAXY_R; float dens = exp(-r*r);
	r = rho/BULB_R;	  float bulb = exp(-r*r);
	float phase = NB_ARMS*(ang-shear);
	// arms = spirals compression
	ang = ang-COMPR*cos(phase)+SPEED*t;
	uv = rho*vec2(cos(ang),sin(ang));
	// stretched texture2D must be darken by d(new_ang)/d(ang)
	float spires = 1.+NB_ARMS*COMPR*sin(phase);
	// pires = mix(1.,sin(phase),ARM);
	dens *= .7*spires;	
	
	// gaz texture2D
	float gaz = noise(.09*1.2*R*uv);
	float gaz_trsp = pow(abs((1.-gaz*dens)),2.);

	// stars
	//float a=SPEED*t, co=cos(a),si=sin(a); 
	//mat2 M = mat2(co,-si,si,co);
	// adapt stars size to display resolution
	float ratio = .8*iResolution.y/iChannelResolution[0].y;
	float stars1 = texture2D(iChannel1,ratio*uv+.5, 0.).r, // M*uv
	      stars2 = texture2D(gm_BaseTexture,ratio*uv+.5, 0.).r,
		  stars = pow(abs(1.-(1.-stars1)*(1.-stars2)),5.);
	
	//stars = pow(abs(stars),5.);
	
	// keybord controls (numbers)
	if (keyToggle(49)) gaz_trsp = 1./1.7;
	if (keyToggle(50)) stars = 0.;
	if (keyToggle(51)) bulb = 0.;
	if (keyToggle(52)) dens = .3*spires;
	
	// mix all	
	col = mix(SKY_COL,
			  gaz_trsp*(1.7*GALAXY_COL) + 1.2*stars, 
			  dens);
	col = mix(col, 1.2*BULB_COL, bulb);
		
	gl_FragColor = vec4(col,1.);
}
