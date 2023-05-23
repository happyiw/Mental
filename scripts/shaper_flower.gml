///shaper_flower(theta,n)

///Shaper scripts return a pair of values corresponding to the X and Y position of a point on a parametric curve
///theta goes from 0 to 1
var theta = argument0;
var n = argument1;
var tt=360*theta;

var amplitude=abs(tt%(360/n)-(360/n)/2)/(360/n);

var R = 0.25+0.75*amplitude;
var THETA = 360*theta;



///Pack the values into an array and return them
var a;
a[0]=0;
a[1]=0;

a[@0]=R;
a[@1]=THETA;
return a;


