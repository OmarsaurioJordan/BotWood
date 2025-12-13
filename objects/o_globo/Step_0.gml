if !o_game.pausa
{
    s_oscila(id, 0, m_anima * 3, 7);
    if impulso != 0
    {
        impulso = clamp(impulso * (m_fricmove + (1 - m_fricmove) * 0.8), 0, m_velglobo);
        
        if point_distance(x, y, o_suelo.x, o_suelo.y) > m_radext * o_suelo.resise * 0.95
        {
            direction = point_direction(x, y, o_suelo.x, o_suelo.y);
            impulso = m_velglobo;
        }
        else
        {
            var otro = s_colision(x, y, m_rad_m, o_altobloq, m_rad_m, 1, id);
            if otro != noone
            {
                direction = point_direction(otro.x, otro.y, x, y);
                if otro.object_index == o_globo
                {
                    otro.direction = direction + 180;
                    var imp = (impulso + otro.impulso) * 0.5;
                    imp = max(imp, m_velglobo * 0.1);
                    impulso = imp;
                    otro.impulso = imp;
                }
            }
        }
        x += lengthdir_x(impulso * dlt, direction);
        y += lengthdir_y(impulso * dlt, direction);
        
        depth = -y;
    }
}

