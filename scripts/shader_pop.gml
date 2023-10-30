/// shader_pop();
/**
    * This script removes the most recent shader effect that has been applied.
    * If there is only one shader in the chain, deletes the shader chain object.
*/

with(objPShaderChain){
    if(numShaders==1){
        instance_destroy();
    }else{
        numShaders--;
    }
}

