/// view_scale( targetScale, duration, easingFunc = tween_sine_inout)
/**
    * Sets the scale of the default view to the specified amount, over time. This is useful for "zoom in/out"-style effects.
    * 
    * @param {float} targetScale - the value to set the scale of the view to, where 1 corresponds to the default size of the view.
    * @param {integer} duration - The duration of the change, in frames.
    * @param {easingFuncID} easingFunc - The easing function to use. The default is tween_sine_inout.
    *
*/
var targetScale = argument[0]*800;
var duration = argument[1];
var smoother; 
if( argument_count > 2 ) {
    smoother = argument[2];
} else {
    smoother = tween_sine_inout
}
var command = instance_create( 0, 0, oViewScaleCommand );

command.StartX = view_xview[0];
command.StartY = view_yview[0];
command.StartScale = view_wview[0];
command.MaxScale = targetScale - command.StartScale;
command.Step = 0;
command.Duration = duration;
command.Smoother = smoother;
