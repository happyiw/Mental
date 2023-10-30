///shader_insert(ind,shader,intensity);
var Ind = argument[0];

var Shader = argument[1];
var Intensity = argument[2];

with(objPShaderChain){
    chain[Ind] = instance_create(0,0,objPShaderChainElement);
    chain[Ind].shader = Shader;
    chain[Ind].intensity = Intensity;
}

