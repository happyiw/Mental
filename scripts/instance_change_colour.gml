/// instance_change_colour targetId, targetColour, duration, easingFunc = tween_linear )
/** 
    * Change the colour of an instance over time.
    * New instance commands override existing ones.
    * @param {instanceID} targetId - The instance to change the alpha of.
    * @param {colour} targetColour - The final value to change the colour to.
    * @param {integer} duration - The duration of the change, in frames.
    * @param {easingFuncID} [easingFunc] - The easing function to use. The default is tween_linear.
    * 
*/
var targetId = argument[0];
var targetColor = argument[1];
var duration = argument[2];

var easingFunc = tween_linear;
if( argument_count > 3 ) {
    easingFunc = argument[3];
}

with( targetId ) {
    var command = instance_create( x, y, oRdrChangeColorCommand );
    command.TargetId = id;
    command.StartColor = image_blend;
    command.EndColor = targetColor;
    command.Step = 0;
    command.Duration = max( duration, 1 );
    command.Smoother = easingFunc;
    self.Internal_ColorChangeCommand = command;
}
