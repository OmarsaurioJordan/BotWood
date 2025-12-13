if !o_game.pausa
{
    s_anima(id, 0, m_anima * (1 / s_cansado(quien)), 4);
    
    hambre = clamp(hambre - dlt * 0.1, 0, m_hambre);
    if agotado
    {
        if hambre >= m_hambre * 0.5
        {
            agotado = false;
        }
    }
    else
    {
        if hambre < m_hambre * 0.05
        {
            agotado = true;
        }
    }
    
    xxp = xx;
    yyp = yy;
    
    //comandos del jugador  movimiento virtual
    var dirrr;
    if quien < m_rosado
    {
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
        }
        // en caso de manejo por App automaticamente localizada
        if relojsalgase != 0
        {
            // libre
            var ori = instance_nearest(x, y, o_salon);
            s_puntoamover(ori, id, m_rad_u * o_game.escint / 2, 60 * o_game.escint);
            dirrr = o_gamepad.user_direction[quien - 1];
        }
        else if o_gamepad.user_ip[quien - 1] != ""
        {
            dirrr = o_gamepad.user_direction[quien - 1];
        }
    }
    else //comandos movimiento IA
    {
        dirrr = s_ia(id);
    }
    
    //procesar movimiento seleccionado
    if dirrr != -1
    {
        var vvv = m_velint * o_game.escint * s_cansado(quien) * dlt;
        x += lengthdir_x(vvv, dirrr);
        y += lengthdir_y(vvv, dirrr);
    }
    else if maquina == -1
    {
        var otro = s_colision(x, y, m_rad_u, o_maquina, m_rad_b, o_game.escint, -1);
        if otro == noone
        {
            otro = s_colision(x, y, m_rad_u, o_jugador, m_rad_u, o_game.escint, id);
        }
        if otro != noone
        {
            var vvv = m_velint * o_game.escint * dlt;
            dirrr = point_direction(otro.x, otro.y, x, y);
            x += lengthdir_x(vvv, dirrr);
            y += lengthdir_y(vvv, dirrr);
        }
    }
    
    //movimiento visual
    if maquina == -1
    {
        var otru = s_colision(xx, yy, m_rad_u, o_maquina, m_rad_b, o_game.escint, -1);
        if otru == noone
        {
            otru = s_colision(xx, yy, m_rad_u, o_jugador, m_rad_u, o_game.escint, id);
        }
        if otru != noone
        {
            var vv = m_velint * o_game.escint * dlt;
            dirrr = point_direction(otru.x, otru.y, x, y);
            xx += lengthdir_x(vv, dirrr);
            yy += lengthdir_y(vv, dirrr);
        }
        else
        {
            dirrr = point_direction(xx, yy, x, y);
            var vv = clamp(point_distance(xx, yy, x, y) * 0.000007,
                0, m_velint * o_game.escint * 2) * dlt;
            xx += lengthdir_x(vv, dirrr);
            yy += lengthdir_y(vv, dirrr);
        }
    }
    else
    {
        xx = maquina.x;
        yy = maquina.y;
    }
    
    //usar maquinaria
    if maquina == -1
    {
        var coso = s_colision(x, y, m_rad_u, o_maquina, m_rad_b, o_game.escint, -1);
        if coso != noone
        {
            if coso.estado == m_nadie and s_maquinasia(id, coso)
            {
                coso.relojanima[0] = 0;
                coso.anima[0] = 0;
                coso.estado = quien;
                maquina = coso;
            }
        }
    }
    else
    {
        var coso = s_colision(x, y, m_rad_u, o_maquina, m_rad_b, o_game.escint, -1);
        if coso == noone
        {
            maquina = -1;
            var mm = quien;
            with o_maquina
            {
                if estado == mm
                {
                    estado = m_nadie;
                    if object_index == o_boton
                    {
                        reloj_anima[0] = 0;
                        anima[0] = 0;
                    }
                    break;
                }
            }
        }
    }
    
    //limitar a dentro del circulo
    var bbb = instance_nearest(x, y, o_salon);
    if point_distance(x, y, bbb.x, bbb.y) > m_radint * o_game.escint * 0.9
    {
        dirrr = point_direction(bbb.x, bbb.y, x, y);
        x = bbb.x + lengthdir_x(m_radint * o_game.escint * 0.9, dirrr);
        y = bbb.y + lengthdir_y(m_radint * o_game.escint * 0.9, dirrr);
    }
    
    depth = -(room_height + yy);
}

