///tracer_attach(obj,spawnObj,steps,dist,tag)
/**
    * Attaches a tracer to an object which spawns an instance of an object ``obj`` every ``dist`` pixels the instance moves, for a specified amount of frames.
    * 
    * This is useful for things like bullet trails, as well as gradually drawing shapes with objects.
    * @param {instanceID} obj - The ID of the object to attach the tracer to.
    * @param {objectID} spawnObj - The kind of object to spawn.
    * @param {int} steps - The amount of frames to attach the tracer for, in frames.
    * @param {float} dist - The distance between spawned objects, in pixels.
    * @param {string} tag - The tag to assign to the instance.
*/
var obj = argument[0];
var spawnObj = argument[1];
var steps = argument[2];
var dist = argument[3];
var tag = argument[4];


with(instance_create(0,0,oTraceCommand)){
    self.obj = obj;
    self.spawnObj = spawnObj;
    self.steps = steps;
    self.dist = dist;
    self.tag = tag;
    cx=obj.x;
    cy=obj.y;
}


