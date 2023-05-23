///shaper_shape(theta,n)

///Shaper scripts return a pair of values corresponding to the X and Y position of a point on a parametric curve
///theta goes from 0 to 1
var theta = argument0;
var n0 = argument1;
var X=0,Y=0;

var n=2*n0;
for(var i=0;i<n;i++){
    if(theta>=i/n && theta<=(i+1)/n){
        var X1 = dcos(360*i/n);
        var Y1 = -dsin(360*i/n);
        
        var X2 = dcos(360*(i+1)/n);
        var Y2 = -dsin(360*(i+1)/n);
        if(i%2){
            X2*=0.5;
            Y2*=0.5;
        }else{
            X1*=0.5;
            Y1*=0.5;
        }
        X = lerp(X1,X2,n*(theta-i/n));
        Y = lerp(Y1,Y2,n*(theta-i/n));
        break;
    }
}

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


