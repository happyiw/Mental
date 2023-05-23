///avoidance_add_attack(name,time);
/**
    * Adds a timing for an avoidance attack named ``name`` that starts at time ``time``.
    * @param {string} name - The name of the attack.
    * @param {integer} time - The time at which the attack starts, in frames.
*/

var aName=argument[0];
var aTime=argument[1];
ds_list_add(attackNames,aName);
ds_list_add(attackTimings,aTime);
numTimings++;
