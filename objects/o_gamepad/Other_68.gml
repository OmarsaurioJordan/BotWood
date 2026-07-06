if ds_map_find_value(async_load, "type") == network_type_data {
    var paquete = ds_map_find_value(async_load, "buffer");
    buffer_seek(paquete, buffer_seek_start, 0);
    var txt = buffer_read(paquete, buffer_string);
    buffer_delete(paquete);
    var msj = s_split(txt, "|", false);
    if is_array(msj) { if array_length(msj) == 5 { if msj[0] == "botwood" {
        // conexion
        var ipp = ds_map_find_value(async_load, "ip");
        var usr = real(msj[3]); // 0-11
        if usr < 0 or usr >= 12 {
            exit;
        }
        var ok = true;
        if user_ip[usr] != "" and user_ip[usr] != ipp {
            // el lugar esta ocupado, solicitar desconexion
            var buf = buffer_create(1, buffer_grow, 1);
            buffer_seek(buf, buffer_seek_start, 0);
            buffer_write(buf, buffer_string, "botwood|1|x");
            network_send_udp_raw(servidor, ipp, puerto, buf, buffer_tell(buf));
            buffer_delete(buf);
            ok = false;
        }
        // actualizar conexion
        if ok {
            for (var i = 0; i < 12; i++) {
                if user_ip[i] == ipp {
                    user_ip[i] = "";
                    user_final[i] = 0;
                    user_direction[i] = -1;
                    s_set_salgase(1 + i, m_relojlobby);
                }
            }
            user_ip[usr] = ipp;
            user_final[usr] = 10;
            s_set_salgase(1 + usr, 0);
        }
        // lobby
        if ok and msj[1] == "4" and room == w_lobby {
            with o_elmen
            {
                if quien == 1 + usr
                {
                    el = id;
                    break;
                }
            }
            var rrr = 0.3;
            switch real(msj[2])
            {
                case 0:
                    ori = instance_nearest(0, 0, o_pichirilo);
                    s_puntoamover(ori, el, m_rad_m / 2, m_radint * rrr);
                    break;
                
                case 1:
                    ori = instance_nearest(room_width, 0, o_pichirilo);
                    s_puntoamover(ori, el, m_rad_m / 2, m_radint * rrr);
                    break;
                
                case 2:
                    ori = instance_nearest(0, room_height, o_pichirilo);
                    s_puntoamover(ori, el, m_rad_m / 2 , m_radint * rrr);
                    break;
                
                case 3:
                    ori = instance_nearest(room_width, room_height, o_pichirilo);
                    s_puntoamover(ori, el, m_rad_m / 2, m_radint * rrr);
                    break;
                
                default:
                    ori = instance_nearest(o_suelo.x + 150, o_suelo.y + 40, o_pichirilo);
                    s_puntoamover(ori, el, m_rad_m / 2, m_radint * (0.1 + rrr));
                    break;
            }
        }
        // game
        else if ok and msj[1] == "5" and (room == w_juego or room == w_demo) {
            var el = noone;
            var ori = noone;
            with o_jugador
            {
                if quien == 1 + usr
                {
                    el = id;
                    ori = instance_nearest(x, y, o_salon);
                    break;
                }
            }
            if el != noone
            {
                var maq = real(msj[2]);
                if maq < 0 or maq >= 13 {
                    // libre
                    s_puntoamover(ori, el, m_rad_u * o_game.escint / 2, 60 * o_game.escint);
                }
                else {
                    // en maquina
                    var otro = ori.mach[maq];
                    if otro.estado == 1 + usr
                    {
                        user_direction[usr] = -1;
                    }
                    else if otro.estado == m_nadie // 0
                    {
                        user_direction[usr] = point_direction(el.x, el.y, otro.x, otro.y);
                    }
                    else
                    {
                        s_puntoamover(ori, el, m_rad_u * o_game.escint / 2, 60 * o_game.escint);
                    }
                }
            }
            // mover ciudadano por fuera del robot
            else {
                with o_ciudadano {
                    if quien == 1 + usr {
                        el = id;
                        break;
                    }
                }
                if el != noone {
                    var maq = real(msj[2]);
                    switch maq {
                        case 1: user_direction[usr] = 90; break; // arriba
                        case 2: user_direction[usr] = 270; break; // abajo
                        case 3: user_direction[usr] = 180; break; // izquierda
                        case 4: user_direction[usr] = 0; break; // derecha
                        case 5: user_direction[usr] = 60; break; // manecillas
                        case 6: user_direction[usr] = 120; break; // nomanecillas
                        case 7: user_direction[usr] = 150; break; // disparo
                        case 8: user_direction[usr] = 30; break; // golpe
                        case 9: user_direction[usr] = 210; break; // tensadisp
                        case 10: user_direction[usr] = 330; break; // tensagolpe
                        case 11: user_direction[usr] = 240; break; // bodega
                        case 12: user_direction[usr] = 300; break; // comida
                        default: user_direction[usr] = -1; break;
                    }
                }
            }
        }
    } } }
}


