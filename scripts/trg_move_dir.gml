/// trg_move_dir(dir, speed);
/**
    * Sets an object's movement defined by direction and speed.
    * 
    * @param {float} dir - Direction to set
    * @param {float} speed - Speed to set
    * 
*/


if (!global.makingTrigger)
{
    switch(argument[0])
    {
        case "define":
            dir = undefined;
            break;
            
        case "exclusive":
            return true;
        
        case "isUsed":
            return (!is_undefined(dir));
            
        case "init":
            speed = spd;
            direction = dir;
            break;
    }
}
else
{
    if (argument_count >= 1) { dir = argument[0]; }
    if (argument_count >= 2) { spd = argument[1]; }
}
