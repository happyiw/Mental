/// instance_change_alpha( targetId, targetAlpha, duration, easingFunc = tween_linear )
/** 
    * Change the alpha of an instance over time.
    * 
    * New instance commands override existing ones.
    * @param {instanceID} targetId - The instance to change the alpha of.
    * @param {float} targetAlpha - The final value to change the alpha to.
    * @param {integer} duration - The duration of the change, in frames.
    * @param {easingFuncID} [easingFunc] - The easing function to use. The default is tween_linear.
    * 
*/
var targetId = argument[0];
var targetAlpha = argument[1];
var duration = argument[2];

var easingFunc = tween_linear;
if( argument_count > 3 ) {
    easingFunc = argument[3];
}

with( targetId ) {
    var command = instance_create( x, y, oRdrChangeAlphaCommand );
    command.TargetId = id;
    command.StartAlpha = image_alpha;
    command.DeltaAlpha = targetAlpha - image_alpha;
    command.Step = 0;
    command.Duration = max( duration, 1 );
    command.Smoother = easingFunc;
    self.Internal_AlphaChangeCommand = command;
}
