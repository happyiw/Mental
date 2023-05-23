/// rlerp(val0, val1, val_in_the_middle);
/**
    * The Reverse lerp function.
    * 
    * This function takes a number, and returns that number's position between values ``val0`` and ``val1``, normalized from 0 to 1.
    * This is the reverse of the built-in ``lerp`` function.
    * Keep in mind that the returned value can be less than 0 (if the input value is less than val0), or more than 1 (if the input value is more than val1).
    * 
    * @param {float} val1 - The beginning value of the interval.
    * @param {float} val2 - The end value of the interval.
    * @param {float} val_in_the_middle - The value to calculate the position for.
    * 
    * @returns {float} - The position of the value between ``val0`` and ``val1``, from 0 to 1.
*/
var val1=argument0;
var val2=argument1;
var val3=argument2;

return (val1-val3)/(val1-val2);
