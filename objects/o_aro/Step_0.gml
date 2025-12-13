if !o_game.pausa
{
    s_oscila(id, 0, m_anima * 3, 7);
    
    //alumbrar segun robot que lo toca
    if direction == 35
    {
        var otro = s_colision(x, y, 0, o_robot, m_rad_m, 1, -1);
        if otro != noone
        {
            direction = otro.origen.ident;
            audio_play_sound(a_map_meta, 99, false);
        }
    }
    
    //sacar chispas
    if gol
    {
        if random(1) <= 0.1
        {
            if direction == 35
            {
                s_particulas(x + 16 - irandom(32),
                    y + 16 - irandom(32), true, 6);
            }
            else
            {
                s_particulas(x + 16 - irandom(32),
                    y + 16 - irandom(32), true, 2 + direction);
            }
        }
    }
    else if instance_exists(o_globo)
    {
        var otro = s_colision(x, y, m_rad_m, o_globo, m_rad_m, 1, -1);
        if otro != noone
        {
            gol = true;
            audio_play_sound(a_map_gol, 99, false);
        }
    }
}

