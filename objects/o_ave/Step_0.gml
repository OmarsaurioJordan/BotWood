if !o_game.pausa
{
    s_anima(id, 0, m_anima, 4);
    s_oscila(id, 1, m_anima * 3, 7);
    s_errar(id, m_errar, m_errar, 30, 0.333, 0.666);
    
    //aumentar altura del ave
    if altu < 80
    {
        altu += 1 + random(1);
    }
    
    //moverse y detectar colision
    var otro = s_colision(x, y, m_rad_u * o_game.eschum, o_edificio,
        m_rad_m, 1, -1);
    if otro == noone
    {
        otro = s_colision(x, y, m_rad_u * o_game.eschum, o_globo,
            m_rad_m, 1, -1);
        if otro == noone
        {
            otro = s_colision(x, y, m_rad_u * o_game.eschum, o_ave,
                m_rad_m, 1, id);
        }
    }
    if otro != noone
    {
        var ddd = point_direction(otro.x, otro.y, x, y);
        x += lengthdir_x(m_velave * dlt, ddd);
        y += lengthdir_y(m_velave * dlt, ddd);
        dir_ia = irandom(359);
    }
    else if mov_ia
    {
        x += lengthdir_x(m_velave * dlt, dir_ia);
        y += lengthdir_y(m_velave * dlt, dir_ia);
    }
    
    //limitar a dentro del circulo
    if point_distance(x, y, o_suelo.x, o_suelo.y) > m_radext * o_suelo.resise
    {
        instance_destroy();
    }
    
    depth = -y;
}

