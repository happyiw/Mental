/// rng_controller_create([opt_numBins]);
/**
    * Creates an RNG controller object with the specified number of bins.
    * RNG controller objects are required for further {@link random_range_controlled} calls.
    * 
    * The number of bins dictates how even you want your RNG to be - the more bins, the more even the RNG will be. 
    * However, an amount that is too large will eventually cause the randomness to be lost. 2-4 bins are usually recommended.
    * 
    * @param {integer} [opt_numBins] - The number of bins to be created.
    * The default is 4.
    * 
    * @returns {instanceID} The index of the created RNG controller instance.
*/

var opt_numBins = 4;
if(argument_count>0){
    opt_numBins=argument[0];
}
var a=instance_create(0,0,objRNGController);

a.numBins=opt_numBins;

return a;
