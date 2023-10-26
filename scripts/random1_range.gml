///random1_range(x1,x2,rngObj);

var valX1,valX2,valY,rngObj;
valX1=argument[0];
valX2=argument[1];
rngObj=argument[2];
with(rngObj){
    valY=seq[n];
    n++;
    if(n==size) n=0;
}
return lerp(valX1,valX2,valY);
