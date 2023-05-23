#define EaseLinear
/// EaseLinear(time,start,end,duration)
return (argument2-argument1) * argument0 / argument3 + argument1;




#define EaseInQuad
/// EaseInQuad(time,start,end,duration)
argument0 /= argument3;
return (argument2-argument1) * argument0 * argument0 + argument1;




#define EaseOutQuad
/// EaseOutQuad(time,start,end,duration)
argument0 /= argument3;
return -(argument2-argument1) * argument0 * (argument0 - 2) + argument1;




#define EaseInOutQuad
/// EaseInOutQuad(time,start,end,duration)
argument0 /= argument3 * 0.5;

if (argument0 < 1)
{
    return (argument2-argument1) * 0.5 * argument0 * argument0 + argument1;
}

return (argument2-argument1) * -0.5 * (--argument0 * (argument0 - 2) - 1) + argument1;




#define EaseInCubic
/// EaseInCubic(time,start,end,duration)
return (argument2-argument1) * power(argument0/argument3, 3) + argument1;




#define EaseOutCubic
/// EaseOutCubic(time,start,end,duration)
return (argument2-argument1) * (power(argument0/argument3 - 1, 3) + 1) + argument1;




#define EaseInOutCubic
/// EaseInOutCubic(time,start,end,duration)
argument0 /= argument3 * 0.5;

if (argument0 < 1)
{
   return (argument2-argument1) * 0.5 * power(argument0, 3) + argument1;
}

return (argument2-argument1) * 0.5 * (power(argument0 - 2, 3) + 2) + argument1;




#define EaseInQuart
/// EaseInQuart(time,start,end,duration)
return (argument2-argument1) * power(argument0 / argument3, 4) + argument1;




#define EaseOutQuart
/// EaseOutQuart(time,start,end,duration)
return -(argument2-argument1) * (power(argument0 / argument3 - 1, 4) - 1) + argument1;




#define EaseInOutQuart
/// EaseInOutQuart(time,start,end,duration)
argument0 /= argument3 * 0.5;

if (argument0 < 1) 
{
    return argument2 * 0.5 * power(argument0, 4) + argument1;
}

return (argument2-argument1) * -0.5 * (power(argument0 - 2, 4) - 2) + argument1;




#define EaseInQuint
/// EaseInQuint(time,start,end,duration)
return (argument2-argument1) * power(argument0 / argument3, 5) + argument1;




#define EaseOutQuint
/// EaseOutQuint(time,start,end,duration)
return (argument2-argument1) * (power(argument0 / argument3 - 1, 5) + 1) + argument1;




#define EaseInOutQuint
/// EaseInOutQuint(time,start,end,duration)
argument0 /= argument3 * 0.5;

if (argument0 < 1)
{
    return (argument2-argument1) * 0.5 * power(argument0, 5) + argument1;
}

return (argument2-argument1) * 0.5 * (power(argument0 - 2, 5) + 2) + argument1;




#define EaseInSine
/// EaseInSine(time,start,end,duration)
return (argument2-argument1) * (1 - cos(argument0 / argument3 * (pi / 2))) + argument1;




#define EaseOutSine
/// EaseOutSine(time,start,end,duration)
return (argument2-argument1) * sin(argument0 / argument3 * (pi / 2)) + argument1;




#define EaseInOutSine
/// EaseInOutSine(time,start,end,duration)
return (argument2-argument1) * 0.5 * (1 - cos(pi * argument0 / argument3)) + argument1;




#define EaseInCirc
/// EaseInCirc(time,start,end,duration)
// This is a really radical curve... haha hidden programmer joke.
argument0 /= argument3;
return (argument2-argument1) * (1 - sqrt(1 - argument0 * argument0)) + argument1;




#define EaseOutCirc
/// EaseOutCirc(time,start,end,duration)
argument0 = argument0 / argument3 - 1;
return (argument2-argument1) * sqrt(1 - argument0 * argument0) + argument1;




#define EaseInOutCirc
/// EaseInOutCirc(time,start,end,duration)
argument0 /= argument3 * 0.5;

if (argument0 < 1)
{
    return (argument2-argument1) * 0.5 * (1 - sqrt(1 - argument0 * argument0)) + argument1;
}

argument0 -= 2;
return (argument2-argument1) * 0.5 * (sqrt(1 - argument0 * argument0) + 1) + argument1;




#define EaseInExpo
/// EaseInExpo(time,start,end,duration)
return (argument2-argument1) * power(2, 10 * (argument0 / argument3 - 1)) + argument1;




#define EaseOutExpo
/// EaseOutExpo(time,start,end,duration)
return (argument2-argument1) * (-power(2, -10 * argument0 / argument3) + 1) + argument1;




#define EaseInOutExpo
/// EaseInOutExpo(time,start,end,duration)
argument0 /= argument3 * 0.5;

if (argument0 < 1) 
{
    return (argument2-argument1) * 0.5 * power(2, 10 * --argument0) + argument1;
}

return (argument2-argument1) * 0.5 * (-power(2, -10 * --argument0) + 2) + argument1;




#define EaseInElastic
/// EaseInElastic(time,start,end,duration)
var _s = 1.70158;
var _p = 0;
var _a = (argument2-argument1);

if (argument0 == 0 || _a == 0) 
{
    return argument1; 
}

argument0 /= argument3;

if (argument0 == 1) 
{
    return argument1+(argument2-argument1); 
}

if (_p == 0) 
{
    _p = argument3*0.3;
}

if (_a < abs((argument2-argument1))) 
{ 
    _a = (argument2-argument1); 
    _s = _p*0.25; 
}
else
{
    _s = _p / (2 * pi) * arcsin ((argument2-argument1) / _a);
}

return -(_a * power(2,10 * (--argument0)) * sin((argument0 * argument3 - _s) * (2 * pi) / _p)) + argument1;




#define EaseOutElastic
/// EaseOutElastic(time,start,end,duration)
var _s = 1.70158;
var _p = 0;
var _a = (argument2-argument1);

if (argument0 == 0 || _a == 0)
{
    return argument1;
}

argument0 /= argument3;

if (argument0 == 1)
{
    return argument1 + (argument2-argument1);
}

if (_p == 0)
{
    _p = argument3 * 0.3;
}

if (_a < abs((argument2-argument1))) 
{ 
    _a = (argument2-argument1);
    _s = _p * 0.25; 
}
else 
{
    _s = _p / (2 * pi) * arcsin ((argument2-argument1) / _a);
}

return _a * power(2, -10 * argument0) * sin((argument0 * argument3 - _s) * (2 * pi) / _p ) + (argument2-argument1) + argument1;




#define EaseInOutElastic
/// EaseInOutElastic(time,start,end,duration)
var _s = 1.70158;
var _p = 0;
var _a = (argument2-argument1);

if (argument0 == 0 || _a == 0)
{
    return argument1;
}

argument0 /= argument3*0.5;

if (argument0 == 2)
{
    return argument1+(argument2-argument1); 
}

if (_p == 0)
{
    _p = argument3 * (0.3 * 1.5);
}

if (_a < abs((argument2-argument1))) 
{ 
    _a = (argument2-argument1); 
    _s = _p * 0.25; 
}
else
{
    _s = _p / (2 * pi) * arcsin ((argument2-argument1) / _a);
}

if (argument0 < 1)
{
    return -0.5 * (_a * power(2, 10 * (--argument0)) * sin((argument0 * argument3 - _s) * (2 * pi) / _p)) + argument1;
}

return _a * power(2, -10 * (--argument0)) * sin((argument0 * argument3 - _s) * (2 * pi) / _p) * 0.5 + (argument2-argument1) + argument1;




#define EaseInBack
/// EaseInBack(time,start,end,duration)
var _s = 1.70158;

argument0 /= argument3;
return (argument2-argument1) * argument0 * argument0 * ((_s + 1) * argument0 - _s) + argument1;




#define EaseOutBack
/// EaseOutBack(time,start,end,duration)
var _s = 1.70158;

argument0 = argument0/argument3 - 1;
return (argument2-argument1) * (argument0 * argument0 * ((_s + 1) * argument0 + _s) + 1) + argument1;




#define EaseInOutBack
/// EaseInOutBack(time,start,end,duration)
var _s = 1.70158;

argument0 = argument0/argument3*2

if (argument0 < 1)
{
    _s *= 1.525;
    return (argument2-argument1) * 0.5 * (argument0 * argument0 * ((_s + 1) * argument0 - _s)) + argument1;
}

argument0 -= 2;
_s *= 1.525

return (argument2-argument1) * 0.5 * (argument0 * argument0 * ((_s + 1) * argument0 + _s) + 2) + argument1;




#define EaseInBounce
/// EaseInBounce(time,start,end,duration)
return (argument2-argument1) - EaseOutBounce(argument3 - argument0, 0, (argument2-argument1), argument3) + argument1




#define EaseOutBounce
/// EaseOutBounce(time,start,end,duration)
argument0 /= argument3;

if (argument0 < 1/2.75)
{
    return (argument2-argument1) * 7.5625 * argument0 * argument0 + argument1;
}
else
if (argument0 < 2/2.75)
{
    argument0 -= 1.5/2.75;
    return (argument2-argument1) * (7.5625 * argument0 * argument0 + 0.75) + argument1;
}
else
if (argument0 < 2.5/2.75)
{
    argument0 -= 2.25/2.75;
    return (argument2-argument1) * (7.5625 * argument0 * argument0 + 0.9375) + argument1;
}
else
{
    argument0 -= 2.625/2.75;
    return (argument2-argument1) * (7.5625 * argument0 * argument0 + 0.984375) + argument1;
}





#define EaseInOutBounce
/// EaseInOutBounce(time,start,end,duration)
if (argument0 < argument3*0.5) 
{
    return (EaseInBounce(argument0*2, 0, (argument2-argument1), argument3)*0.5 + argument1);
}

return (EaseOutBounce(argument0*2 - argument3, 0, (argument2-argument1), argument3)*0.5 + (argument2-argument1)*0.5 + argument1);