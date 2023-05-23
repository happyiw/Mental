///view_screen_shake(amplitude,duration);
/**
    * Creates a screen shake effect with the specified amplitude for the specified amount of frames.
    * @param {float} amplitude - The amplitude of the screen shake.
    * @param {int} duration - The duration of the effect in frames.
*/


var amplitude=argument0;
var duration=argument1;
with(oViewScreenShakeCommand) {
    view_xview[0]=viewXStart;
    view_yview[0]=viewYStart;
    instance_destroy();

}
var obj=instance_create(0,0,oViewScreenShakeCommand);
obj.amplitude=amplitude;
obj.t=duration;
obj.viewXStart=view_xview[0];
obj.viewYStart=view_yview[0];


