/// scrApplyShaderEffect(shader,intensity);
/**
    * Applies a screen-wide shader effect specified by shader. The shader is required to have two uniform values: "time" and "intensity".
    * @param {shaderID} shader - The shader to apply
    * @param {float} intensity - The intensity parameter to initialize the shader handler object instance with, from 0 to 1. Default: 1
    * @returns {instanceID} The index of the created shader handler object instance. It can then be further manipulated using instance manipulation functions.(see: {@link instance_change_variable} )
    *
    * @example
    * //The following code applies an effect given by the shader shGodRays, and then changes its intensity from 0 to 1.
    * shaderHandler = scrApplyShaderEffect(shGodRays,0);
    * instance_change_variable(shaderHandler,"intensity",1,50);

*/
