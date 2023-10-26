///scrSeededSeqInit(size,seed);


var size;size = argument[0];
var seed;seed = argument[1];


var obj = instance_create(1,1,objSeededRNGSeq);
random_set_seed(seed);
with(obj){
    for(var i=0;i<size;i++){
        seq[i]=random(1);
    }
    self.size=size;
}
return obj;
