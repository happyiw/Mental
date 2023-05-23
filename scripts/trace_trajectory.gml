///trace_trajectory(obj,steps,dist,tag)

/**
    * Traces an object's trajectory with other objects for a specified amount of frames.
    * 
    * The spawned objects are placed at an equal distance from each other,specified by ``dist``. They also inherit the object's scale and alpha variables.
    * 
    * This is useful for creating structures like curves and tendrils.
    * 
    * Unlike {@link tracer_attach}, this executes the specified amount of steps immediately rather than over time.
    * @param {objectID} obj - The type of the object to spawn.
    * @param {int} steps - The amount of steps to trace for.
    * @param {float} dist - The distance at which to spawn the objects.
    * @param {string} tag - The tag to give the spawned objects.
    * 
    * @example
    * //The following code creates a bullet with gravity, then traces its trajectory for 80 frames, spawning another bullet every 16 pixels
    * var bullet = instance_create(400,304,objAvoidanceBullet);
    * 
    * bullet.speed = 5;
    * bullet.direction=random(360);
    * bullet.gravity = 0.4;
    * 
    * with(bullet) trace_trajectory(objAvoidanceBullet, 80, 16, "trace");

*/

var spawnObj=argument[0];
var steps=argument[1];
var dist=argument[2];
var spawnTag=argument[3];

var cx=x;
var cy=y;


for(var i=0;i<steps;i++){
    
    event_perform(ev_step,ev_step_normal);    
    hspeed+=gravity*dcos(gravity_direction);
    vspeed-=gravity*dsin(gravity_direction);
    x+=hspeed;
    y+=vspeed;
    
    var cr=point_distance(cx,cy,x,y);
    var ca=point_direction(cx,cy,x,y);
    while(cr>dist){
        cx+=dist*dcos(ca);
        cy-=dist*dsin(ca);
        cr-=dist;
        var obj=instance_create(cx,cy,spawnObj);
        obj.tag=spawnTag;
        obj.image_xscale=image_xscale;
        obj.image_yscale=image_yscale;
        obj.image_alpha=image_alpha;
    }   
}
