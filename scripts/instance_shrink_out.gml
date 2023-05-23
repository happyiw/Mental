/// instance_shrink_out( targetId, shrinkDuration )
/**
    * Gradually lower the scale value of all instances with the given targetId.
    * When the scale reaches zero, destroy them.
    * Fade duration represents the maximum possible duration for fully opaque instances.
    * If an instance is already partially transparent, it will disappear quicker.
    * @param {instanceID} targetId - the index of the object to shrink out.
    * @param {int} shrinkDuration - The duration of the shrinkout for an object with full scale, in frames.
*/
var targetId = argument0;
var fadeDuration = max( argument1, 1 );

var newCommand = instance_create( 0, 0, oRdrShrinkCommand );
newCommand.AlphaDelta = 1 / fadeDuration;

var fadeCount = 0;
with( targetId ) {
    newCommand.FadeList[fadeCount] = id;
    newCommand.StartXScale=image_xscale;
    newCommand.StartYScale=image_yscale;
    
    fadeCount++;
}
newCommand.FadeCount = fadeCount;
newCommand.alarm[0] = fadeDuration;
newCommand.fadeDuration=fadeDuration;
