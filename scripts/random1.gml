///random1(x,rngObj);

var valX,valY,rngObj;
valX=argument[0];
rngObj=argument[1];
with(rngObj){
    valY=seq[n];
    n++;
    if(n==size) n=0;
}
return valY*valX;
