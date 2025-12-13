if !o_game.pausa
{
    altura -= m_gravedad * dlt;
    if altura <= 0
    {
        instance_create(x, y, o_regalo);
        audio_play_sound(a_proy_suelo, 40, false);
        instance_destroy();
    }
}

