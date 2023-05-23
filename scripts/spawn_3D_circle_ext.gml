///spawn_3D_circle_ext(x,y,sprite,index,radius,angle,dAngle,theta,dTheta,phi,dPhi,numBullets,tag);
//TODO: add a demonstration of how the Euler angles (angle, theta, phi) work, 
//either through a room or through an external image

var spawnX = argument[0];
var spawnY = argument[1];
var spawnSprite = argument[2];
var spawnIndex = argument[3];
var spawnRadius = argument[4];
var spawnAngle = argument[5];
var spawnDAngle = argument[6];
var spawnTheta = argument[7];
var spawnDTheta = argument[8];
var spawnPhi = argument[9];
var spawnDPhi = argument[10];
var spawnNum = argument[11];
var spawnTag = argument[12];



var obj=instance_create(spawnX,spawnY,objAvoidance3DCircle);

obj.numBullets = spawnNum;
obj.image_xscale = spawnRadius;
obj.angle = spawnAngle;
obj.dAngle = spawnDAngle;
obj.tag = spawnTag;
obj.theta=spawnTheta;
obj.dTheta=spawnDTheta;
obj.phi=spawnPhi;
obj.dPhi=spawnDPhi;


with(obj){
    event_perform(ev_step,ev_step_normal);
    for(var i=0;i<numBullets;i++){
        bullets[i].sprite_index = spawnSprite;
        bullets[i].image_index = spawnIndex;
    }
}
return obj;

