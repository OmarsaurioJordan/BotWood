if !o_game.pausa
{
    s_anima(id, 0, m_anima * (1 / 1.25), 4);
    
    //cuenta regresiva para tomarlo como No jugador
    if antisemovio > 0
    {
        antisemovio = max(0, antisemovio - dlt);
        if antisemovio == 0
        {
            if point_distance(room_width * 0.25 + 150,
                room_height * 0.25 + 40, x, y) <= m_radint * 0.6 or
                point_distance(room_width * 0.75 + 150,
                room_height * 0.25 + 40, x, y) <= m_radint * 0.6 or
                point_distance(room_width * 0.25 + 150,
                room_height * 0.75 + 40, x, y) <= m_radint * 0.6 or
                point_distance(room_width * 0.75 + 150,
                room_height * 0.75 + 40, x, y) <= m_radint * 0.6
            {
                antisemovio = 2000000;
            }
            else
            {
                semovio = false;
            }
        }
    }
    /*
    //ver si regresa a menu o a juego sin jugadores
    var otro = s_colision(x, y, m_rad_m * 0.5, o_puerta, m_rad_m, 1, -1);
    if otro != noone
    {
        switch otro.seleccion
        {
            case 27:
                audio_play_sound(a_men_puerta, 99, false);
                room_goto(w_menu);
                break;
            
            case 28:
                audio_play_sound(a_men_puerta, 99, false);
                o_game.bots = "0000";
                o_game.ayudantes = "0000";
                o_game.players = "xxxxxxxxxxxx";
                room_goto(w_juego);
                break;
        }
    }*/
    
    var otro = s_colision(x, y, m_rad_m, o_semibot, m_rad_m * 8, 1, -1);
    if otro == noone
    {
        otro = s_colision(x, y, m_rad_m, o_puerta, m_rad_m * 1.5, 1, -1);
        if otro == noone
        {
            otro = s_colision(x, y, m_rad_m, o_pichirilo, m_rad_m * 0.5, 1, -1);
            if otro == noone
            {
                otro = s_colision(x, y, m_rad_m, o_pacificante, m_rad_m * 0.5, 1, -1);
                if otro == noone
                {
                    otro = s_colision(x, y, m_rad_m, o_selectia, m_rad_m * 0.5, 1, -1);
                    if otro == noone
                    {
                        otro = s_colision(x, y, m_rad_m, o_elmen, m_rad_m, 1, id);
                    }
                }
                else
                {
                    otro.alarm[0] = room_speed * 10;
                }
            }
        }
        else if otro.x < room_width * 0.5
        {
            otro = noone;
        }
    }
    if otro != noone
    {
        var vvv = m_velint * 1.25 * dlt;
        var ddd = point_direction(otro.x, otro.y, x, y);
        x += lengthdir_x(vvv, ddd);
        y += lengthdir_y(vvv, ddd);
        
        x = clamp(x, 32, room_width - 32);
        y = clamp(y, 82, room_height - 32);
    }
    else
    {
        //comandos del jugador
        var dirrr;
        if keyboard_check(s_tecla(m_up, quien))
        {
            if keyboard_check(s_tecla(m_left, quien))
            {
                dirrr = 135;
            }
            else if keyboard_check(s_tecla(m_right, quien))
            {
                dirrr = 45;
            }
            else
            {
                dirrr = 90;
            }
        }
        else if keyboard_check(s_tecla(m_down, quien))
        {
            if keyboard_check(s_tecla(m_left, quien))
            {
                dirrr = 225;
            }
            else if keyboard_check(s_tecla(m_right, quien))
            {
                dirrr = 315;
            }
            else
            {
                dirrr = 270;
            }
        }
        else
        {
            if keyboard_check(s_tecla(m_left, quien))
            {
                dirrr = 180;
            }
            else if keyboard_check(s_tecla(m_right, quien))
            {
                dirrr = 0;
            }
            else
            {
                dirrr = -1;
            }
        }
        if dirrr != -1 {
            s_set_salgase(quien, 0);
            semovio = true;
            antisemovio = 6000000;
        }
        // en caso de manejo por App automaticamente localizada
        if relojsalgase != 0
        {
            // libre
            var ori = instance_nearest(o_suelo.x + 150, o_suelo.y + 40, o_pichirilo);
            s_puntoamover(ori, id, m_rad_m / 2, m_radint * (0.1 + 0.3));
            dirrr = o_gamepad.user_direction[quien - 1];
        }
        else if o_gamepad.user_ip[quien - 1] != ""
        {
            dirrr = o_gamepad.user_direction[quien - 1];
            if dirrr != -1 {
                semovio = true;
                antisemovio = 6000000;
            }
        }
        if dirrr != -1
        {
            var vvv = m_velint * 1.25 * dlt;
            x += lengthdir_x(vvv, dirrr);
            y += lengthdir_y(vvv, dirrr);
            
            x = clamp(x, 32, room_width - 32);
            y = clamp(y, 82, room_height - 32);
        }
    }
    
    xxp = xprevious;
    yyp = yprevious;
    xx = x;
    yy = y;
    
    depth = -y;
}

/* */
/*  */
