/// instance_scale( targetId, targetScale, duration, easingFunc = tween_sine_inout )
/** 
    * Change the scale of an instance over time.
    * New instance commands override existing ones.
    * @param {instanceID} targetId - The instance to change the scale of.
    * @param {float} targetScale - The final value to change the scale to.
    * @param {integer} duration - The duration of the change, in frames.
    * @param {easingFuncID} [easingFunc] - The easing function to use. The default is tween_sine_inout.
    * 
*/
var targetId = argument[0];
var targetScale = argument[1];
var duration = argument[2];

var easingFunc = tween_sine_inout;
if( argument_count > 3 ) {
    easingFunc = argument[3];
}

with( targetId ) {
    var command = instance_create( x, y, oRdrScaleCommand );
    command.TargetId = id;
    command.StartScale = image_xscale;
    command.ScaleDelta = targetScale - image_xscale;
    command.Step = 0;
    command.Duration = max( duration, 1 );
    command.Smoother = easingFunc;
    self.Internal_ScaleChangeCommand = command;
}
