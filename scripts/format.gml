///number_format(argument0,argument1)

var s;
s = string(argument0);
return string_repeat("0", argument1 - string_length(s)) + s;
