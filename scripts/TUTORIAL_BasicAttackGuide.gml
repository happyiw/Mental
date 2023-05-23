/**
    * **THIS TUTORIAL IS WORK IN PROGRESS! More chapters will be added as the engine updates.**
    * 
    * In this guide, we will be covering some examples of how to use this engine's features to create some basic types of avoidance attacks.
    * We will be going through basic RNG attacks with RNG control, as well as some prettier-looking patterns that you could implement in your games.
    * 
    * All of the following code is placed in the Step event of your avoidance object, inside the ``case`` statement for your attack. This assumes you have read {@link TUTORIAL_YourFirstAvoidance|the avoidance setup guide}, so if you haven't, make sure to read it as well.
    * 
    * **Chapter 1 - Basic RNG Attacks and RNG control**
    * 
    * One of the most basic attacks you can implement is spawning a bullet every set amount of frames. You can use the (@link on_beat) function, as follows:
    * 
    * ```
    * //This example spawns a bullet from the center of the screen every 10 frames.
    * var spawnInterval = 10;
    * if(on_beat(ct, 10)){
    *   var spawnX=400;
    *   var spawnY=304;
    *   var bullet = instance_create(spawnX,spawnY,objBullet);
    *   bullet.speed=random_range(4,6);
    *   bullet.direction=random(360);
    *   bullet.tag="random_spawn";
    * }
    * ```
    * 
    * Sometimes, you may want to control the RNG your attacks have, to guarantee no random walls or large, impassable clusters of bullets may occur.
    * 
    * For this, you will need to first create an RNG controller object using {@link rng_controller_create}, as follows:
    * 
    * ```
    * //This example creates an RNG controller on the first frame of the attack.
    * if(ct==1) RNGController = rng_controller_create();
    * ```
    * 
    * Then, you can use this newly-created object for the {@link random_range_controlled} function, as follows:
    * 
    * ```
    * //This example spawns a bullet from the center of the screen every 10 frames, with the RNG handled by the RNG controller object.
    * var spawnInterval = 10;
    * if(ct>=1&&on_beat(ct, 10)){
    *   var spawnX=400;
    *   var spawnY=304;
    *   var bullet = instance_create(spawnX,spawnY,objBullet);
    *   bullet.speed=random_range(4,6);
    *   bullet.direction=random_range_controlled(0,360,RNGController); //Use the RNG controller instead of just calling random(360);
    *   bullet.tag="random_spawn";
    * }
    * ```
    * 
    *  **Chapter 2 - The Tag System**   
    * 
    * The tag system can be used to separate behaviours of different objects. For example, if you want to have a "spawner" bullet that creates other bullets as it moves, you will want only the kinds of bullets tagged as such to execute the spawn code.
    * 
    * To use it, just set the bullet's built-in tag variable after creating it, as follows:
    * 
    * ```
    * //This example creates a bullet on the first frame of the attack, and tags it as "spawner"
    * if(ct==1){
    *   var spawner = instance_create(400,304,objAvoidanceBullet);
    *   spawner.tag = "spawner";
    * }
    * ```
    * 
    * Then, when using the ``with`` statement, you can check for the tag of the bullet, as follows:
    * 
    * ```
    * //This example makes every bullet tagged as "spawner" spawn another, non-spawner bullet every frame.
    * with(objAvoidanceBullet){
    *   if(tag=="spawner"){
    *       var bullet = instance_create(x,y,objAvoidanceBullet);
    *       bullet.speed=random_range(4,6);
    *       bullet.direction=random(360);
    *   }
    * }
    * ```
*/
