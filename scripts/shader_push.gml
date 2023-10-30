/// shader_push(shader,intensity);
/**
    * Applies a screen-wide shader effect specified by shader. The shader is required to have two uniform values: "time" and "intensity".
    * @param {shaderID} shader - The shader to apply
    * @param {float} intensity - The intensity parameter to initialize the shader handler object instance with, from 0 to 1. Default: 1
*/
var Shader;Shader=argument[0];
var Intensity;Intensity=argument[1];

if(!instance_exists(objPShaderChain)){
    var shaderChain = instance_create(0,0,objPShaderChain);
    shaderChain.numShaders = 1;
    shader_insert(0,Shader,Intensity);
    return shaderChain.chain[0];
}else{
    with(objPShaderChain){
        numShaders++;
        shader_insert(numShaders-1,Shader,Intensity);
        return chain[numShaders-1];
    }
}

