if !o_game.pausa
{
    reloj += dlt;
    if reloj >= 1000000
    {
        instance_destroy();
    }
    
    direction += dlt * 0.0002;
}

