///bullet_set_follow_direction(bulletID, followDirection);

/*
    * Sets whether or not the bullet given by ID will change its sprite orientation as it moves.
    *
    * If **followDirection** is set to ``true``, then the bullet will automatically set its image_angle equal to the direction of its movement.
    * 
    * @param {objectID} bulletID - The ID of the bullet to apply the curving to.
    * @param {boolean} followDirection - Whether or not the bullet will change its image_angle according to its direction.
    * 
*/

var bulletID = argument[0];
var followDirection = argument[1];

with(bulletID) self.followDirection=followDirection;
