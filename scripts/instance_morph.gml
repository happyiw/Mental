/// instance_morph( targetId, targetShape, targetN, duration, [easingFunc] = tween_sine_inout);
/**
    * Change the shape of a 3D shape object.
    *
    * New instance commands override existing ones.
    *
    * @param {instanceID} targetId - The 3D shape instance to morph(returned by {@link spawn_3D_shape})
    * @param {shaper} targetShape - The shape function to morph into.
    * @param {int} targetN - The amount of edges of the target shape.
    * @param {integer} duration - The duration of the change, in frames.
    * @param {easingFuncID} [easingFunc] - The easing function to use. The default is tween_sine_inout.
    * 
*/

var targetId = argument[0];
var targetShape = argument[1];
var targetN = argument[2]
var duration = argument[3];

var easingFunc = tween_linear;
if( argument_count > 4 ) {
    easingFunc = argument[4];
}

with( targetId ) {
    var command = instance_create( x, y, oMorphCommand );
    command.TargetId = id;
    command.Step = 0;
    command.Duration = max( duration, 1 );
    command.Smoother = easingFunc;
    self.Internal_MorphCommand = command;
    morphT=0;
    morph=true;
    newShaper = targetShape;
    newN = targetN;
}
