///scrMakeStar(x,y,object,speed,angle,numprojectiles,tag)
///spawns a star
///argument0 - spawn X
///argument1 - spawn Y
///argument2 - projectile to spawn
///argument3 - speed
///argument4 - starting angle
///argument5 - number of projectiles to spawn
///argument6 - tag

var a,i,j,dir,n,v,vv,ddd,k;
xxx = argument0
yyy = argument1

n = argument5-1

//if(argument4==-2){
//    dir=point_direction(xxx,yyy,objPlayer.x,objPlayer.y)
//}
//else if(argument4==-1){
//    dir=random(360)
//}
//else{
    dir=argument4
//}

for(j=1;j<=5;j+=1;){
    a=instance_create(xxx,yyy,argument2)
    v=argument3
    ddd = degtorad((36-(360/5))/2)
    k=2*v*cos(ddd)
    a.speed=argument3
    a.direction=dir;
    a.tag=argument6
    for(i=1;i<n;i+=1;){
        a=instance_create(xxx,yyy,argument2)
        a.speed=abs(sqrt(sqr(v)+sqr(k*i/n)-2*v*(k*i/n)*cos(ddd)))
        vv=a.speed
        a.direction=dir+radtodeg(arccos((sqr(v)+sqr(vv)-sqr(k*i/n))/(2*v*(vv))))
        a.tag=argument6
        if(i==n-1){
            dir += 360/5
        }
    }
}
