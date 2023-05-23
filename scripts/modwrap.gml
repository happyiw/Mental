///modwrap(val, min, max)
/**
    * Keeps a value withing the provided edge by wrapping around the edges.
    * Inclusive at the lower bound, exclusive at the upper.
    * e.g. 8 in range 0-8 would wrap to 0.
    * Code taken from renex's gm82core.
    * 
    * @param {float} val - The value to wrap.
    * @param {float} min - The lower bound of the wrap interval.
    * @param {float} max - The upper bound of the wrap interval.
    * 
    * @returns {float} - The wrapped value.
*/
var val = argument0;
var minv = argument1;
var maxv = argument2;

var f = val - minv;
var w = maxv-minv;
return f - floor(f/w) * w + minv;
