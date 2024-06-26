/// view_offset( targetX, targetY, duration, easingFunc = tween_sine_inout)
/**
    * Moves the default view by a specified amount over time. The movement is relative to the initial position of the view when the script is called.
    * 
    * @param {float} targetX - the X value to move to the view by.
    * @param {float} targetY - the Y value to move to the view by.
    * @param {integer} duration - The duration of the change, in frames.
    * @param {easingFuncID} easingFunc - The easing function to use. The default is tween_sine_inout.
    * 
*/
var targetX = argument[0];
var targetY = argument[1];
var duration = argument[2];
var smoother; 
if( argument_count > 3 ) {
    smoother = argument[3];
} else {
    smoother = tween_sine_inout
}
var command = instance_create( 0, 0, oViewOffsetCommand );
command.StartX = view_xview[0];
command.StartY = view_yview[0];
command.MaxX = targetX - command.StartX;
command.MaxY = targetY - command.StartY;
command.Step = 0;
command.Duration = duration;
command.Smoother = smoother;
