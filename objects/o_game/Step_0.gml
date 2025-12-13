/// @description commands
if keyboard_check_pressed(vk_anykey)
{
    switch keyboard_key
    {
        case vk_tab:
            if room == w_juego or room == w_lobby or room == w_demo
            {
                pausa = !pausa;
            }
            else if room == w_howto
            {
                room_goto(w_menu);
            }
            break;
        
        case vk_escape:
            if alarm[3] == -1
            {
                alarm[3] = room_speed;
            }
            else if room == w_menu
            {
                game_end();
            }
            else
            {
                room_goto(w_menu);
            }
            break;
        
        case vk_backspace:
            if room == w_configuracion {
                break;
            }
            switch sonido
            {
                case 0:
                    sonido = 1;
                    audio_master_gain(1);
                    break;
                
                case 1:
                    sonido = 2;
                    audio_master_gain(1);
                    break;
                
                case 2:
                    sonido = 0;
                    audio_master_gain(0);
                    break;
            }
            s_ponemusica();
            break;
        
        case vk_f4:
            window_set_fullscreen(!window_get_fullscreen());
            break;
        
        case vk_f10:
            s_foto();
            break;
        
        case vk_f1:
            if window_get_fullscreen()
            {
                window_set_fullscreen(false);
            }
            else
            {
                var fff = get_save_filename("APP|*.apk", "BotWoodGp");
                if fff != ""
                {
                    file_copy("BotWoodGp.apk", fff);
                }
            }
            break;
        
        case vk_f8:
            if window_get_fullscreen()
            {
                window_set_fullscreen(false);
            }
            else
            {
                var fff = get_save_filename("INI|*.ini", "");
                if fff != "" and file_exists("bwmap_user.ini")
                {
                    file_copy("bwmap_user.ini", fff);
                }
            }
            break;
        
        case vk_f7:
            if window_get_fullscreen()
            {
                window_set_fullscreen(false);
            }
            else
            {
                var fff = get_open_filename("INI|*.ini", "");
                if fff != ""
                {
                    file_copy(fff, "bwmap_user.ini");
                }
            }
            break;
        
        case vk_f2:
            if room == w_menu and !window_get_fullscreen()
            {
				url_open("https://omwekiatl.itch.io/botwood");
            }
            break;
    }
}

if !pausa and (room == w_juego or room == w_demo)
{
    reloj += dlt;
    if reloj >= 1000000
    {
        reloj -= 1000000;
        segundos++;
        if segundos >= 60
        {
            segundos = 0;
            minutos++;
        }
    }
}

if room == w_menu or room == w_lobby or room == w_configuracion {
    if mouse_check_button_pressed(mb_left) {
        var otr = instance_nearest(mouse_x, mouse_y + 44, o_puerta);
        if point_distance(mouse_x, mouse_y + 44, otr.x, otr.y) < 32 {
            switch otr.seleccion
            {
                case 1: mundo = "bwmap_torres_c.ini"; break;
                case 2: mundo = "bwmap_torres_b.ini"; break;
                case 3: mundo = "bwmap_torres_a.ini"; break;
                case 4: mundo = "bwmap_fuego_d.ini"; break;
                case 5: mundo = "bwmap_fuego_c.ini"; break;
                case 6: mundo = "bwmap_fuego_b.ini"; break;
                case 7: mundo = "bwmap_fuego_a.ini"; break;
                case 8: mundo = "bwmap_mele_b.ini"; break;
                case 9: mundo = "bwmap_mele_a.ini"; break;
                case 10: mundo = "bwmap_globo_b.ini"; break;
                case 11: mundo = "bwmap_globo_a.ini"; break;
                case 13: mundo = "bwmap_asediadores_a.ini"; break;
                case 14: mundo = "bwmap_asediadores_b.ini"; break;
                case 15: mundo = "bwmap_asediadores_c.ini"; break;
                case 16: mundo = "bwmap_distancia_a.ini"; break;
                case 17: mundo = "bwmap_distancia_b.ini"; break;
                case 18: mundo = "bwmap_distancia_c.ini"; break;
                case 19: mundo = "bwmap_distancia_d.ini"; break;
                case 20: mundo = "bwmap_aro_a.ini"; break;
                case 21: mundo = "bwmap_aro_b.ini"; break;
                case 22: mundo = "bwmap_aro_c.ini"; break;
                case 23: mundo = "bwmap_user.ini"; break;
            }
            switch otr.seleccion
            {
                case 24:
                    audio_play_sound(a_men_puerta, 99, false);
                    room_goto(w_demo);
                break;
                
                case 25:
                    audio_play_sound(a_men_puerta, 99, false);
                    cargamapaedit = false;
                    room_goto(w_editor);
                break;
                
                case 26:
                    audio_play_sound(a_men_puerta, 99, false);
                    cargamapaedit = true;
                    room_goto(w_editor);
                break;
                
                case 27:
                    audio_play_sound(a_men_puerta, 99, false);
                    if room == w_configuracion {
                        ini_open("configuracion.ini");
                        if onepunch {
                            ini_write_string("config", "onepunch", "1"); }
                        else {
                            ini_write_string("config", "onepunch", "0"); }
                        if fatal {
                            ini_write_string("config", "fatal", "1"); }
                        else {
                            ini_write_string("config", "fatal", "0"); }
                        if compartepad {
                            ini_write_string("config", "compartepad", "1"); }
                        else {
                            ini_write_string("config", "compartepad", "0"); }
                        ini_write_string("config", "maxvidas", string(maxvidas));
                        // IP
                        with o_gamepad {
							var res = edita_ip;
							if string_count("-", res) == 1 {
	                            var pedazos = s_split(res, "-", true);
	                            if is_array(pedazos) {
	                                if array_length(pedazos) == 2 {
	                                    if s_str_es_ip(pedazos[0]) and s_str_es_ip(pedazos[1]) {
											dir_lan = pedazos[0];
											msk_lan = pedazos[1];
											ini_write_string("config", "dir_lan", dir_lan);
											ini_write_string("config", "msk_lan", msk_lan);
											for (var i = 0; i < 12; i++) {
			                                    user_ip[i] = "";
			                                    user_final[i] = 0;
			                                    user_direction[i] = -1;
			                                }
											res = "";
	                                    }
	                                }
	                            }
	                        }
							if res != "" {
								edita_ip = dir_lan + "-" + msk_lan;
							}
                        }
                        ini_close();
                    }
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
        // opciones
        else if instance_exists(o_opciones) {
            otr = instance_nearest(mouse_x, mouse_y + 56, o_opciones);
            if point_distance(mouse_x, mouse_y + 56, otr.x, otr.y) < 32 {
            switch otr.opccc
            {
                case 0:
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                    with o_opciones {
                        if opccc < 8 { activa = false; } }
                    otr.activa = true;
                    onepunch = true;
                    maxvidas = otr.opccc + 1;
                break;
                    
                case 6:
                case 7:
                    with o_opciones {
                        if opccc < 8 { activa = false; } }
                    otr.activa = true;
                    onepunch = false;
                    if otr.opccc == 7 {
                        fatal = true; }
                    else { fatal = false; }
                break;
                
                case 8:
                    with o_opciones {
                        if opccc == 9 { activa = false; } }
                    otr.activa = true;
                    compartepad = true;
                break;
                
                case 9:
                    with o_opciones {
                        if opccc == 8 { activa = false; } }
                    otr.activa = true;
                    compartepad = false;
                break;
            } }
        }
		// Qr
		else if room == w_menu {
			if point_distance(mouse_x, mouse_y, room_width / 2, room_height / 2) < 64 {
				mundo = "bwmap_fuego_d.ini";
				audio_play_sound(a_men_puerta, 99, false);
				room_goto(w_lobby);
			}
		}
    }
}


