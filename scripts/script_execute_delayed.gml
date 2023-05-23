///script_execute_delayed(scr,delay,param1,param2...)
/** 
    * Executes a script after a certain number a frames has passed.
    * 
    * Supports up to 5 arguments: param1, param2 etc.
    * @param {scriptID} scr - A script to execute.
    * @param {integer} delay - The time delay before the script is executed, in frames.
    * @param param1 - The first parameter of the script.
    * @param param2 - The second parameter of the script.

*/

var scr=argument[0];
var delay=argument[1];
var numargs=argument_count-2;

var obj=instance_create(0,0,oDelayedExecutionCommand);
obj.scr=scr;
obj.delay=delay;
obj.numargs=numargs;
for(var i=0;i<argument_count;i++){
    obj.args[i]=argument[i];
}
