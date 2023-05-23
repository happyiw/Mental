///shaper_heart(theta,n)

///Shaper scripts return a pair of values corresponding to the X and Y position of a point on a parametric curve
///theta goes from 0 to 1
var theta = argument0;
var n = argument1;
var X,Y;
var tt = theta*360;


X = power(dsin(tt),3);
Y = (13*dcos(tt)-5*dcos(2*tt)-2*dcos(3*tt)-dcos(4*tt))/16;


///Convert to polar

var R = point_distance(0,0,X,Y);
var THETA = point_direction(0,0,X,Y);


///Pack the values into an array and return them
var a;
a[0]=0;
a[1]=0;

a[@0]=R;
a[@1]=THETA;
return a;


