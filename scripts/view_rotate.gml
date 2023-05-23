/// view_rotate(targetAngle, duration, easingFunc = tween_sine_inout);
/**
    * Rotates the default view by a specified amount over time. The movement is relative to thie initial rotation of the view.
    * 
    * @param {float} targetAngle - The angle to rotate the view by.
    * @param {integer} duration - The duration of the change, in frames.
    * @param {easingFuncID} easingFunc - The easing function to use. The default is tween_sine_inout.
    * 
*/


var targetAngle = argument[0];
var duration = argument[1];
var smoother; 
if( argument_count > 2 ) {
    smoother = argument[2];
} else {
    smoother = tween_sine_inout;
}

var command = instance_create(0,0,oViewRotateCommand);

command.StartAngle = view_angle[0];
command.DeltaAngle = targetAngle-view_angle[0];
command.Step = 0;
command.Duration = duration;
command.Smoother = smoother;
