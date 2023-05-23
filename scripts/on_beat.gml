/// on_beat(ct,period,opt_offset);
/**
    * Returns ``true`` every **period** frames, using the timer variable **ct**. Otherwise returns ``false``. An offset **opt_offset** can be set.
    * This is useful if you, for example, want to spawn a bullet every **period** frames.
    * @param {int} ct - The timer variable, in frames.
    * @param {float} period - The period of the check, in frames. A float value can be given.
    * @param {float} opt_offset - The offset to use, in frames. A float value can be given. The default value is 1.
*/
var ct = argument[0];
var period = argument[1];
var opt_offset=1;
if(argument_count>2) opt_offset = argument[2];

var wrappedValue = modwrap(ct,0,period);
return (floor(wrappedValue)==opt_offset);
//return (floor(ct % floor(period))==opt_offset);
