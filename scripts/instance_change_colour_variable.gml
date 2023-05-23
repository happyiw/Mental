/// instance_change_colour_variable( targetId, varName, targetX, duration, [easingFunc] = tween_sine_inout )

/** 
    * Change the colour variable given by the string varName to targetX over time. 
    * 
    * A separate script from {@link instance_change_variable} is used for colour variables specifically as they are handled differently internally.
    * 
    * New instance commands override existing ones.
    * @param {instanceID} targetId - The instance to change a variable of.
    * @param {string} varName - A string containing the name of the variable to change.
    * @param {colour} targetX - The final value of the manipulated variable.
    * @param {integer} duration - The duration of the change, in frames.
    * @param {easingFuncID} [easingFunc] - The easing function to use. The default is tween_sine_inout.
    * 
*/
var targetId = argument[0];
var varName = argument[1];
var targetX = argument[2];
var duration = argument[3];

var easingFunc = tween_sine_inout;
if( argument_count > 4 ) {
    easingFunc = argument[4];
}

with( targetId ) {
    var command = instance_create( x, y, oRdrChangeColourVariableCommand );
    command.TargetId = id;
    command.varName=varName;
    command.StartVar=variable_instance_get(id,varName);
    command.targetX = targetX;
    command.Step = 0;
    command.Duration = max( duration, 1 );
    command.Smoother = easingFunc;
    self.Internal_ChangeVariableCommand = command;
}
