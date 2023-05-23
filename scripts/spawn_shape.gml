///spawn_shape(x, y, angle, edges, numprojectiles, speed, obj, opt_tag, opt_shaper)
/**
    * Spawns a custom shape.
    *
    * You can pass a Shaper script as the last argument to define which shape to spawn.
    *
    * @param {float} x - The X position to spawn the shape at.
    * @param {float} y - The Y position to spawn the shape at.
    * @param {float} angle - The angle at which to spawn the shape.
    * @param {int} edges - The amount of edges the shape should have.
    * @param {int} numprojectiles - The total amount of projectiles spawned.
    * @param {float} speed - The speed at which the shape expands.
    * @param {objectID} obj - The index of the object type to spawn as the projectile.
    * @param {string} opt_tag - The tag to assign the projectile. The default is "" (an empty string)
    * @param {shaper} opt_shaper - The shaper function to use. The default is ``shaper_shape``.
    * 
    * @returns {array} An array containing all of the created bullets.
    * 
*/



var spawnX = argument[0];
var spawnY = argument[1];
var spawnAngle = argument[2];
var spawnEdges = argument[3]; //3 = triangle, 4 = square, etc.
var spawnNum = argument[4]; //Projectiles per edge
var spawnSpeed = argument[5];
var spawnObj = argument[6];

var opt_tag=0;
if(argument_count>7) opt_tag=argument[7];
var opt_shaper=shaper_shape;
if(argument_count>8) opt_shaper=argument[8]; //shaper script


var th, xx, yy, ddx, ddy, dx, dy, a, aaa;

th = degtorad(spawnAngle);

aaa[0]=0;
aaa[spawnNum-1]=0;
for(var i=0;i<spawnNum;i++){
    a = instance_create(spawnX, spawnY, spawnObj);
    var aa = script_execute(opt_shaper,i/spawnNum,spawnEdges);
    a.speed=spawnSpeed*aa[0];
    a.direction=aa[1]+spawnAngle;
    a.tag = opt_tag;
    aaa[@i]=a;
}

return aaa;

