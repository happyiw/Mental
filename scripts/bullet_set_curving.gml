///bullet_set_curving(bulletID, curveSpeed);

/*
    * Sets the speed at which a bullet given by bulletID changes its direction.
    * 
    * @param {objectID} bulletID - The ID of the bullet to apply the curving to.
    * @param {float} curveSpeed - The speed at which the bullet will curve.
    * 
*/

var bulletID = argument[0];
var curveSpeed = argument[1];

with(bulletID) self.curveSpeed=curveSpeed;
