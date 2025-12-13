if !o_game.pausa
{
    s_anima(id, 0, m_anima, 4);
    s_errar(id, m_errar, m_errar, 30, 0.333, 0.666);
    
    //moverse y detectar colision
    var otro = s_colision(x, y, m_rad_u * o_game.eschum, o_bloque,
        m_rad_m, 1, -1);
    if otro != noone
    {
        if otro.object_index == o_globo
        {
            otro = noone;
        }
    }
    if otro != noone
    {
        var ddd = point_direction(otro.x, otro.y, x, y);
        x += lengthdir_x(m_velint * dlt * o_game.eschum, ddd);
        y += lengthdir_y(m_velint * dlt * o_game.eschum, ddd);
        dir_ia = irandom(359);
    }
    else if quien == m_nadie
    {
        if mov_ia
        {
            x += lengthdir_x(m_velint * dlt * o_game.eschum * 0.5, dir_ia);
            y += lengthdir_y(m_velint * dlt * o_game.eschum * 0.5, dir_ia);
        }
    }
    else
    {
        //ver si automatico
        if automatico != 0
        {
            automatico = max(0, automatico - dlt);
        }
        
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
        // en caso de manejo por App automaticamente localizada
        if relojsalgase != 0
        {
            // libre
        }
        else if o_gamepad.user_ip[quien - 1] != ""
        {
            dirrr = o_gamepad.user_direction[quien - 1];
        }
        
        //ver si se mueve o no
        if dirrr != -1
        {
            automatico = m_relojlobby;
            x += lengthdir_x(m_velint * dlt * o_game.eschum * 0.5, dirrr);
            y += lengthdir_y(m_velint * dlt * o_game.eschum * 0.5, dirrr);
            dir_ia = dirrr;
        }
        else if mov_ia and automatico == 0
        {
            x += lengthdir_x(m_velint * dlt * o_game.eschum * 0.5, dir_ia);
            y += lengthdir_y(m_velint * dlt * o_game.eschum * 0.5, dir_ia);
        }
    }
    
    //limitar a dentro del circulo
    if point_distance(x, y, o_suelo.x, o_suelo.y) > m_radext * o_suelo.resise
    {
        if quien == m_nadie
        {
            instance_destroy();
        }
        else
        {
            var dddd = point_direction(o_suelo.x, o_suelo.y, x, y);
            x = o_suelo.x + lengthdir_x(m_radext * o_suelo.resise, dddd);
            y = o_suelo.y + lengthdir_y(m_radext * o_suelo.resise, dddd);
            dir_ia = point_direction(x, y, o_suelo.x, o_suelo.y);
        }
    }
    
    //ver si entra al robot
    if quien != m_nadie
    {
        var bot = instance_nearest(x, y, o_robot);
        if point_distance(x, y, bot.x, bot.y) <= m_rad_m * 4 and
            !s_chequeorobot(bot.origen, m_todomalo)
        {
            if bot.origen.mach[m_bodega].estado != m_roto and
                bot.origen.mach[m_bodega].accion >= m_grua * 0.8
            {
                var rr = s_invers16(s_angulo16(bot.direction)) * 22.5;
                if s_colision(bot.x + lengthdir_x(18, rr),
                    bot.y + lengthdir_y(18, rr), m_rad_m, id, 0, 1, -1) != noone
                {
                    var u = instance_create(bot.origen.mach[m_bodega].x,
                        bot.origen.mach[m_bodega].y, o_jugador);
                    u.quien = quien;
                    audio_play_sound(a_int_bien, 50, false);
                    instance_destroy();
                }
            }
        }
    }
    
    depth = -y;
}

