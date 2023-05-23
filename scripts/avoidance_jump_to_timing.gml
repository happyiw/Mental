/// avoidance_jump_to_timing(timing,opt_cleanup);
/*
    * Sets the avoidance timer to a value specified by **timing**.
    * If **opt_cleanup** is set to true, also cleans up all of the avoidance entities such as bullets.
    * 
    * @param {int} timing - The timing to jump to.
    * @param {boolean} opt_cleanup - Whether to clean up the avoidance entities.
    * 
*/

var timing = argument[0];
var opt_cleanup = true;
if(argument_count>1) opt_cleanup = argument[1];

audio_sound_set_track_position(global.currentMusic,timing/50);
t=floor(timing);
for(var i=0;i<ds_list_size(attackTimings)-1;i++){
    if(timing*50>attackTimings[|i]){
        attack=i;
        break;       
    }
}
if(opt_cleanup){
    with(objAvoidanceEntity) {
        if(!child)
        instance_destroy();
    }
}
