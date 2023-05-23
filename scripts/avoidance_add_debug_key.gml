/// avoidance_add_debug_key(key,timing,opt_startX,opt_startY)
/**
    * Create a debug timing for the avoidance that makes it so that when a key is pressed, the player is automatically brought to a certain position in the avoidance.
    * 
    * @param {keyIndex} key - The key to use.
    * @param {int} timing - The timing to warp the player to.
    * @param {float} opt_startX - The X position to teleport the player to. Default is -1 (don't move the player)
    * @param {float} opt_startY - The Y position to teleport the player to. Default is -1 (don't move the player)
*/


var key=argument[0];
var timing=argument[1];
var opt_startX=-1;
var opt_startY=-1;

if(argument_count>2) opt_startX=argument[2];
if(argument_count>3) opt_startY=argument[3];


ds_list_add(debugKeys,key);
ds_list_add(debugKeyTimings,timing);
ds_list_add(debugKeyStartX,opt_startX);
ds_list_add(debugKeyStartY,opt_startY);

numDebugKeys++;
