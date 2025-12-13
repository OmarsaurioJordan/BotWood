if !o_game.pausa
{
    reloj += dlt;
    if reloj >= 1500000
    {
        instance_destroy();
    }
}

