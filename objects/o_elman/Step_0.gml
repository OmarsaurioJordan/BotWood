s_anima(id, 0, m_anima * (1 / 1.5), 4);

// verificar colision
var dirrr;
var otro = s_colision(x, y, m_rad_m * 0.5, o_opciones, m_rad_m, 1, -1);
if otro != noone
{
    dirrr = point_direction(otro.x, otro.y, x, y);
}
else
{
    //comandos del jugador
    if keyboard_check(s_tecla(m_up, m_rojo))
    {
        if keyboard_check(s_tecla(m_left, m_rojo))
        {
            dirrr = 135;
        }
        else if keyboard_check(s_tecla(m_right, m_rojo))
        {
            dirrr = 45;
        }
        else
        {
            dirrr = 90;
        }
    }
    else if keyboard_check(s_tecla(m_down, m_rojo))
    {
        if keyboard_check(s_tecla(m_left, m_rojo))
        {
            dirrr = 225;
        }
        else if keyboard_check(s_tecla(m_right, m_rojo))
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
        if keyboard_check(s_tecla(m_left, m_rojo))
        {
            dirrr = 180;
        }
        else if keyboard_check(s_tecla(m_right, m_rojo))
        {
            dirrr = 0;
        }
        else
        {
            dirrr = -1;
        }
    }
}
if dirrr != -1
{
    var vvv = m_velint * 1.5 * dlt;
    x += lengthdir_x(vvv, dirrr);
    y += lengthdir_y(vvv, dirrr);
    
    x = clamp(x, 32, room_width - 32);
    y = clamp(y, 82, room_height - 32);
}

//verificar si entro por puerta
otro = s_colision(x, y, m_rad_m * 0.5, o_puerta, m_rad_m, 1, -1);
if otro != noone
{
    switch otro.seleccion
    {
        case 1: o_game.mundo = "bwmap_torres_c.ini"; break;
        case 2: o_game.mundo = "bwmap_torres_b.ini"; break;
        case 3: o_game.mundo = "bwmap_torres_a.ini"; break;
        case 4: o_game.mundo = "bwmap_fuego_d.ini"; break;
        case 5: o_game.mundo = "bwmap_fuego_c.ini"; break;
        case 6: o_game.mundo = "bwmap_fuego_b.ini"; break;
        case 7: o_game.mundo = "bwmap_fuego_a.ini"; break;
        case 8: o_game.mundo = "bwmap_mele_b.ini"; break;
        case 9: o_game.mundo = "bwmap_mele_a.ini"; break;
        case 10: o_game.mundo = "bwmap_globo_b.ini"; break;
        case 11: o_game.mundo = "bwmap_globo_a.ini"; break;
        case 13: o_game.mundo = "bwmap_asediadores_a.ini"; break;
        case 14: o_game.mundo = "bwmap_asediadores_b.ini"; break;
        case 15: o_game.mundo = "bwmap_asediadores_c.ini"; break;
        case 16: o_game.mundo = "bwmap_distancia_a.ini"; break;
        case 17: o_game.mundo = "bwmap_distancia_b.ini"; break;
        case 18: o_game.mundo = "bwmap_distancia_c.ini"; break;
        case 19: o_game.mundo = "bwmap_distancia_d.ini"; break;
        case 20: o_game.mundo = "bwmap_aro_a.ini"; break;
        case 21: o_game.mundo = "bwmap_aro_b.ini"; break;
        case 22: o_game.mundo = "bwmap_aro_c.ini"; break;
        case 23: o_game.mundo = "bwmap_user.ini"; break;
    }
    
    switch otro.seleccion
    {
        case 24:
            audio_play_sound(a_men_puerta, 99, false);
            room_goto(w_demo);
        break;
        
        case 25:
            audio_play_sound(a_men_puerta, 99, false);
            o_game.cargamapaedit = false;
            room_goto(w_editor);
        break;
        
        case 26:
            audio_play_sound(a_men_puerta, 99, false);
            o_game.cargamapaedit = true;
            room_goto(w_editor);
        break;
        
        case 27:
            audio_play_sound(a_men_puerta, 99, false);
            ini_open("configuracion.ini");
            if o_game.onepunch {
                ini_write_string("config", "onepunch", "1"); }
            else { ini_write_string("config", "onepunch", "0"); }
            if o_game.fatal {
                ini_write_string("config", "fatal", "1"); }
            else { ini_write_string("config", "fatal", "0"); }
            if o_game.compartepad {
                ini_write_string("config", "compartepad", "1"); }
            else { ini_write_string("config", "compartepad", "0"); }
            ini_write_string("config", "maxvidas", string(o_game.maxvidas));
            ini_close();
            room_goto(w_menu);
        break;
        
        case 29:
            audio_play_sound(a_men_puerta, 99, false);
            room_goto(w_configuracion);
        break;
        
        case 30:
            audio_play_sound(a_men_puerta, 99, false);
            room_goto(w_howto);
        break;
        
        case 0:
        case 12:
        break;
        
        default:
            audio_play_sound(a_men_puerta, 99, false);
            room_goto(w_lobby);
        break;
    }
}

//verificar cambio de opciones
if room == w_configuracion
{
    var el = instance_nearest(x, y, o_opciones);
    if point_distance(x, y, el.x, el.y) < 32
    {
        switch el.opccc
        {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
                with o_opciones {
                    if opccc < 8 { activa = false; } }
                el.activa = true;
                o_game.onepunch = true;
                o_game.maxvidas = el.opccc + 1;
            break;
                
            case 6:
            case 7:
                with o_opciones {
                    if opccc < 8 { activa = false; } }
                el.activa = true;
                o_game.onepunch = false;
                if el.opccc == 7 {
                    o_game.fatal = true; }
                else { o_game.fatal = false; }
            break;
            
            case 8:
                with o_opciones {
                    if opccc == 9 { activa = false; } }
                el.activa = true;
                o_game.compartepad = true;
            break;
            
            case 9:
                with o_opciones {
                    if opccc == 8 { activa = false; } }
                el.activa = true;
                o_game.compartepad = false;
            break;
        }
    }
}

depth = -y;

