///instance_create_ext(x,y,obj,speed,direction,scale,tag);
/**
    * Creates an instance of an object initialized with speed, direction, scale and tag.
    * @param {float} x - The X position to spawn the object at.
    * @param {float} y - The Y position to spawn the object at.
    * @param {objectID} obj - The obejct to spawn.
    * @param {float} speed - The initial speed to spawn the object with.
    * @param {float} direction - The initial direction the instance will be moving in.
    * @param {float} scale - The initial scale of the object. This affects both the X and the Y scale.
    * @param {string} tag - The tag to intialize the instance with. 
*/
var X=argument0;
var Y=argument1;
var obj=argument2;
var spd=argument3;
var dir=argument4;
var scale=argument5;
var tag=argument6;

inst=instance_create(X,Y,obj);
inst.speed=spd;
inst.direction=dir;
inst.tag=tag;
inst.image_xscale=argument5;
inst.image_yscale=argument5;
return inst;
