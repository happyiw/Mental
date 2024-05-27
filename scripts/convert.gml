///convert(int_timer)
//converts time (in integer) into string
timer=argument0
str = "";
str += string(timer div 3000) + ":";
timer = timer mod 3000
str += string(timer div 500);
timer = timer mod 500
str += string(timer div 50) + ".";
timer = timer mod 50
if(((timer * 2) mod 100) < 10) str += "0";
str += string(timer * 2)

return str;
