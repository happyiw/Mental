/// block_break(x,y, layer);
/**
    * Removes a tile in the layer and breaks a block at that space.
    *
    * @param {float} x - The X position to remove a block at.
    * @param {float} y - The Y position to remove a block at.
    * @param {integer} layer - The layer to remove the tile from.
    *
    * @example
    * //The following code breaks a block at position (0,0) (top left corner of the room)
    * //and removes a tile at layer 10000000 at that position.
    * block_break(0,0,10000000);
    * 
    
*/
var X = argument[0];
var Y = argument[1];
var Layer = argument[2];

var block=instance_position(X,Y,objBlock);
with(block){
    tile_layer_delete_at(Layer,x,y);
    for(var i=0;i<2;i++) 
        for(var j=0;j<2;j++)
            with(instance_create(x+8+16*i,y+8+16*j,objBrokenTile)) self.Layer=Layer;
    instance_destroy();
}

