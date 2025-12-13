if !o_game.pausa
{
    reloj_regreso -= dlt;
    if reloj_regreso <= 0
    {
        var bb = instance_create(x, y, o_bolareg);
        bb.origen = origen;
        instance_destroy();
    }
    else
    {
        //mover y detectar colision
        var otro = s_colision(x, y, m_rad_m * 0.75, o_altobloq, m_rad_m, 1, origen);
        if otro != noone
        {
            switch otro.object_index
            {
                case o_edificio:
                    s_demoledificio(otro, true);
                    audio_play_sound(a_bot_golpe, 30, false);
                    break;
                
                case o_robot:
                    if o_game.inmune
                    {
                        otro.origen.calor = m_calor;
                    }
                    else if o_game.onepunch
                    {
                        s_destruido(otro);
                    }
                    else
                    {
                        s_calculadamage(otro, angle_difference(otro.direction,
                            point_direction(otro.x, otro.y, x, y)), false);
                    }
                    otro.impulso = m_velroca;
                    otro.dir_imp = point_direction(x, y, otro.x, otro.y);
                    audio_play_sound(a_map_rocacorre, 60, false);
                    audio_play_sound(a_bot_golpe, 30, false);
                    break;
                
                case o_pavo:
                    otro.impulso = m_velroca;
                    otro.direction = point_direction(x, y, otro.x, otro.y);
                    audio_play_sound(a_map_rocacorre, 60, false);
                    audio_play_sound(a_bot_golpe, 30, false);
                    break;
                
                case o_globo:
                    otro.impulso = m_velglobo;
                    otro.direction = point_direction(x, y, otro.x, otro.y);
                    audio_play_sound(a_bot_golpe, 30, false);
                    audio_play_sound(a_map_aire, 5, false);
                    break;
                
                case o_cortina:
                    s_demolecorti(otro);
                    audio_play_sound(a_bot_golpe, 30, false);
                    break;
                
                case o_arbol:
                    s_arbolcosas(otro, true);
                    break;
                
                case o_roca:
                    origen.impulso = m_velroca;
                    origen.dir_imp = point_direction(otro.x, otro.y, origen.x, origen.y);
                    audio_play_sound(a_map_rocacorre, 60, false);
                    audio_play_sound(a_bot_golpe, 30, false);
                    break;
                
                case o_torre:
                    with otro
                    {
                        instance_create(x, y, o_explobot);
                        var h = instance_create(x, y, o_decorado);
                        h.direction = 9;
                        instance_destroy();
                    }
                    audio_play_sound(a_bot_golpe, 30, false);
                    break;
                
                case o_asediador:
                    with otro
                    {
                        instance_create(x, y, o_explobot);
                        var h = instance_create(x, y, o_decorado);
                        if retirada
                        {
                            h.direction = 36;
                        }
                        else
                        {
                            h.direction = 10;
                        }
                        instance_destroy();
                    }
                    audio_play_sound(a_bot_golpe, 30, false);
                    break;
            }
            
            var bb = instance_create(x, y, o_bolareg);
            bb.origen = origen;
            instance_create(x, y, o_exploproy);
            instance_destroy();
        }
        else
        {
            x += lengthdir_x(m_velgolp * dlt, direction);
            y += lengthdir_y(m_velgolp * dlt, direction);
        }
        
        depth = -y;
    }
}

