///player_BLC_kill()
//"Bullet limit controller" main script
//The script count if player touches the bullets
//Under normal conditions, it just pushes timer until its limit
//If player reaches collectable's limit, it dies

if (instance_exists(objPlayer) && (!global.noDeath && !global.debugNoDeath))
{
    audio_stop_sound(sndBossHit2)
    global.deathSound = audio_play_sound(sndBossHit2, 0, false);
    
    if (global.gameStarted)
    {
        with(objBLCSystemController) {
            if (comboTimer<1) comboTimer += argument0;
        }
    }
    
}
