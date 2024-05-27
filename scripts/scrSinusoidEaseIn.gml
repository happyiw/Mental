///scrSinusoidEaseIn(time,step,mode);
//eases in from 0 to 1 (or backwards)
//mode 0 = normal
//mode 1 = backwards
//defaults to 0 if mode isn't 0 or 1

var _time = argument0;
var _step = argument1;
var _mode = argument2;

if(_mode = 1) return 1 - sin(((_time * _mode) - _step)*(pi/(_time * 2)));
else return sin(_step*(pi/(_time * 2)));


