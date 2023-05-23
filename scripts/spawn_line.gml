///spawn_line(x1,y1,x2,y2,angle,numprojectiles,speed,obj,opt_tag)
/**
    * Spawns a line of projectiles.
    * 
    * @param {float} x1 - The X position of the start of the line.
    * @param {float} y1 - The Y position of the start of the line.
    * @param {float} x2 - The X position of the end of the line.
    * @param {float} y2 - The Y position of the end of the line.
    * @param {float} angle - The angle at which to spawn the line.
    * @param {int} numprojectiles - The total amount of projectiles spawned.
    * @param {float} speed - The speed at which the line expands.
    * @param {objectID} obj - The index of the object type to spawn as the projectile.
    * @param {string} opt_tag - The tag to assign the projectile. The default is "" (an empty string)
    * 
    * @returns {array} An array containing all of the created bullets.
    * 
*/

var spawnX1 = argument[0];
var spawnY1 = argument[1];
var spawnX2 = argument[2];
var spawnY2 = argument[3];
var spawnAngle = argument[4];
var spawnNum = argument[5];
var spawnSpeed = argument[6];
var spawnObj = argument[7];
var opt_tag = 0;
if(argument_count>6) opt_tag=argument[8];

var a;

aaa[0]=0;
aaa[spawnNum-1]=0;
for (var i = 0; i < spawnNum; i += 1)
{
    var spawnX=lerp(spawnX1,spawnX2,i/(spawnNum-1));
    var spawnY=lerp(spawnY1,spawnY2,i/(spawnNum-1));
    a = instance_create(spawnX, spawnY, spawnObj);
    a.speed = spawnSpeed;
    a.direction = spawnAngle;
    a.image_angle = a.direction;
    a.tag=opt_tag;
    aaa[@i]=a;
}
return aaa;
