///spawn_circle(x,y,angle,numprojectiles,speed,obj,opt_tag)
/**
    * Spawns a ring of projectiles.
    * 
    * @param {float} x - The X position to spawn the circle at.
    * @param {float} y - The Y position to spawn the circle at.
    * @param {float} angle - The angle at which to spawn the circle.
    * @param {int} numprojectiles - The total amount of projectiles spawned.
    * @param {float} speed - The speed at which the circle expands.
    * @param {objectID} obj - The index of the object type to spawn as the projectile.
    * @param {string} opt_tag - The tag to assign the projectile. The default is "" (an empty string)
    * 
    * @returns {array} An array containing all of the created bullets.
    * 
*/

var spawnX = argument[0];
var spawnY = argument[1];
var spawnAngle = argument[2];
var spawnNum = argument[3];
var spawnSpeed = argument[4];
var spawnObj = argument[5];
var opt_tag = 0;
if(argument_count>6) opt_tag=argument[6];
var a;

aaa[0]=0;
aaa[spawnNum-1]=0;
for (var i = 0; i < spawnNum; i += 1)
{
    a = instance_create(spawnX, spawnY, spawnObj);
    a.speed = spawnSpeed;
    a.direction = spawnAngle + i * (360 / spawnNum);
    a.tag=opt_tag;
    aaa[@i]=a;
}
return aaa;
