///random_range_controlled(x1,x2,rngController);
/**
    * Randomly generates a value between x1 and x2, using an rngController object (see {@link rng_controller_create}).
    * The RNG controller object separates the interval into a number of "bins". On the first call, the value is guaranteed to generate in the first bin, then on the second call in the second bin, so on and so forth.
    * This way, random clusters and variations of RNG density can be mitigated, however, care should be taken as using an RNG controller with an amount of bins that is too large will cause the function to lose its randomness.
    * 
    * @param {float} x1 - The lower boundary of the interval.
    * @param {float} x2 - The upper boundary of the interval.
    * @param {instanceID} rngController - The index of an RNG controller object previously created using {@link rng_controller_create}.
    * 
    * @returns {float} The randomly generated value.
    * 
    * @example
    * // The following code creates an RNG controller with 4 bins on the first frame of the attack,
    * // and then generates instances with random direction based on the RNG controller.
    * if(ct==1){
    *     rngController = rng_controller_create(4); //Create the RNG controller
    * }else if(ct>1){
    *    var bullet = instance_create(400,304,objAvoidanceBullet);
    *    bullet.speed = 1;
    *    bullet.direction = random_range_controlled(0,360,rngController);
    * }
    * 
*/

var x1 = argument[0];
var x2 = argument[1];

var rngController = argument[2];


var bin = rngController.bin;


var xBin1=lerp(x1,x2,bin/rngController.numBins);
var xBin2=lerp(x1,x2,(bin+1)/rngController.numBins);
with(rngController) event_user(0);

return random_range(xBin1,xBin2);

