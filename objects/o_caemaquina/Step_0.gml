if !o_game.pausa
{
    if altura != 50
    {
        altura += m_gravedad * dlt;
        if altura > 50
        {
            altura = 50;
            audio_play_sound(a_bot_caeparte, 10, false);
        }
    }
    
    //detectar colision
    var otro = s_colision(x, y, m_rad_m * 0.5, o_bloque, m_rad_m, 1, -1);
    if otro != noone
    {
        if otro.object_index != o_globo
        {
            var ddd = point_direction(otro.x, otro.y, x, y);
            x += lengthdir_x(m_velroca * dlt, ddd);
            y += lengthdir_y(m_velroca * dlt, ddd);
        }
    }
    
    //limitar a dentro del circulo
    if point_distance(x, y, o_suelo.x, o_suelo.y) > m_radext * o_suelo.resise
    {
        instance_destroy();
    }
    
    depth = -y;
}

