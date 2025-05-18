//inteligencia artificial de ayudantes NPCs
//arg0: id quien llama
//ret: direccion de movimiento o -1 si no

var res = -1;

with argument0
{
    var ori = instance_nearest(x, y, o_salon);
    // alejarse del jugador
    var otro = s_colision(x, y, m_rad_u, o_jugador, m_rad_u * 1.5, o_game.escint, id);
    if otro != noone
    {
        res = point_direction(otro.x, otro.y, x, y) + random_range(-30, 30);
    }
    else
    {
        // alimentacion baja
        otro = ori.mach[m_comida];
        if (hambre <= m_hambre * 0.05 and (otro.estado == m_nadie or
            otro.estado == quien)) or (hambre <= m_hambre * 0.95 and
            otro.estado == quien)
        {
            res = point_direction(x, y, otro.x, otro.y);
        }
        else
        {
            // temperatura alta
            otro = ori.mach[m_refrigera];
            if ori.calor >= m_calor * 0.5 and (otro.estado == m_nadie or
                otro.estado == quien)
            {
                res = point_direction(x, y, otro.x, otro.y);
            }
            else
            {
                // subir municion
                otro = ori.mach[m_bodega];
                if otro.agarro and otro.municion < m_municion and
                    (otro.estado == m_nadie or otro.estado == quien)
                {
                    res = point_direction(x, y, otro.x, otro.y);
                }
                else
                {
                    // tensar disparo
                    otro = ori.mach[m_tensadisp];
                    if otro.estado == m_nadie or otro.estado == quien
                    {
                        res = point_direction(x, y, otro.x, otro.y);
                    }
                    else
                    {
                        // tensar golpe
                        otro = ori.mach[m_tensagolp];
                        if otro.estado == m_nadie or otro.estado == quien
                        {
                            res = point_direction(x, y, otro.x, otro.y);
                        }
                        else
                        {
                            // temperatura alta
                            otro = ori.mach[m_refrigera];
                            if ori.calor >= m_calor * 0.15 and (otro.estado == m_nadie or
                                otro.estado == quien)
                            {
                                res = point_direction(x, y, otro.x, otro.y);
                            }
                            else
                            {
                                // rellenar alimentacion
                                otro = ori.mach[m_comida];
                                if hambre <= m_hambre * 0.9 and
                                    (otro.estado == m_nadie or otro.estado == quien)
                                {
                                    res = point_direction(x, y, otro.x, otro.y);
                                }
                                else
                                {
                                    // descansar en un lugar
                                    if point_distance(x, y, ori.x,
                                        ori.y + 60 * o_game.escint) > m_rad_u * o_game.escint / 2
                                    {
                                        res = point_direction(x, y,
                                            ori.x, ori.y + 60 * o_game.escint);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

return res;
