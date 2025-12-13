// escribir la IP
if room == w_configuracion {
	var xx = room_width * ip_x;
    var yy = room_height * ip_y;
	go_keyboard = point_in_rectangle(mouse_x, mouse_y, xx - 100, yy - 20, xx + 100, yy + 20);
    if keyboard_check_pressed(vk_anykey) {
        if go_keyboard {
            switch keyboard_key {
                case vk_backspace:
                    if edita_ip != "" {
                        if string_length(edita_ip) == 1 {
                            edita_ip = "";
                        }
                        else {
                            edita_ip = string_copy(edita_ip, 1, string_length(edita_ip) - 1);
                        }
                    }
                    break;
                default:
                    var c = keyboard_lastchar;
                    keyboard_lastchar = "";
                    if string_length(edita_ip) < 31 and
                            string_count(c, "0123456789.-") == 1 {
                        edita_ip += c;
                    }
                    break;
            }
        }
    }
}

// parpadeo edicion
reloj_blink -= mydelta;
if reloj_blink < 0 {
	reloj_blink += 0.6;
}

// envio mensajes hola UDP
if !ds_stack_empty(broadcast) {
    var _ip = ds_stack_pop(broadcast);
    network_send_udp_raw(servidor, _ip, puerto, saludo_buf, saludo_size);
}
else {
	reloj_red -= mydelta;
	if reloj_red <= 0 {
	    reloj_red += 5;
		var _msk = s_ip_str_int(msk_lan);
	    var _lan = s_ip_str_int(dir_lan);
	    var _rango = min(2047, 4294967295 - _msk);
	    var _ip;
	    for (var i = _rango; i > 0; i--) {
	        _ip = s_ip_str_int((_lan & _msk) + i);
	        ds_stack_push(broadcast, _ip);
	    }
	}
}

// envio modo actual a Apps
reloj_ping -= mydelta;
if reloj_ping <= 0 {
    reloj_ping += 0.1;
    var buf = buffer_create(1, buffer_grow, 1);
    buffer_seek(buf, buffer_seek_start, 0);
    if room == w_lobby {
        buffer_write(buf, buffer_string, "botwood|2|x");
    }
    else if room == w_juego or room == w_demo {
        buffer_write(buf, buffer_string, "botwood|3|x");
    }
    else {
        buffer_write(buf, buffer_string, "botwood|1|x");
    }
    var tll = buffer_tell(buf);
    for (var i = 0; i < 12; i++) {
        if user_ip[i] != "" {
            network_send_udp_raw(servidor, user_ip[i], puerto, buf, tll);
        }
    }
    buffer_delete(buf);
}

// manejo
for (var i = 0; i < 12; i++)
{
    // networking
    if user_ip[i] != "" {
        user_final[i] -= mydelta;
        if user_final[i] <= 0 {
            user_ip[i] = "";
            user_final[i] = 0;
            user_direction[i] = -1;
            s_set_salgase(1 + i, m_relojlobby);
        }
    }
    
    // gamepads
    if elcontrol[i, 0] != -1
    {
        // quitar app
        if user_ip[i] != "" {
            var buf = buffer_create(1, buffer_grow, 1);
            buffer_seek(buf, buffer_seek_start, 0);
            buffer_write(buf, buffer_string, "botwood|1|x");
            network_send_udp_raw(servidor, user_ip[i], puerto, buf, buffer_tell(buf));
            buffer_delete(buf);
            s_set_salgase(1 + i, m_relojlobby);
        }
        // gamepad
        if gamepad_axis_value(i, gp_axislh) >= 0.5 {
            s_set_salgase(1 + i, 0);
            keyboard_key_press(s_tecla(m_right, elcontrol[i, 0])); }
        else {
            keyboard_clear(s_tecla(m_right, elcontrol[i, 0])); }
        
        if gamepad_axis_value(i, gp_axislh) <= -0.5 {
            s_set_salgase(1 + i, 0);
            keyboard_key_press(s_tecla(m_left, elcontrol[i, 0])); }
        else {
            keyboard_clear(s_tecla(m_left, elcontrol[i, 0])); }
        
        if gamepad_axis_value(i, gp_axislv) >= 0.5 {
            s_set_salgase(1 + i, 0);
            keyboard_key_press(s_tecla(m_down, elcontrol[i, 0])); }
        else {
            keyboard_clear(s_tecla(m_down, elcontrol[i, 0])); }
        
        if gamepad_axis_value(i, gp_axislv) <= -0.5 {
            s_set_salgase(1 + i, 0);
            keyboard_key_press(s_tecla(m_up, elcontrol[i, 0])); }
        else {
            keyboard_clear(s_tecla(m_up, elcontrol[i, 0])); }
    }
    if elcontrol[i, 1] != -1
    {
        // quitar app
        if user_ip[i] != "" {
            var buf = buffer_create(1, buffer_grow, 1);
            buffer_seek(buf, buffer_seek_start, 0);
            buffer_write(buf, buffer_string, "botwood|1|x");
            network_send_udp_raw(servidor, user_ip[i], puerto, buf, buffer_tell(buf));
            buffer_delete(buf);
            s_set_salgase(1 + i, m_relojlobby);
        }
        // gamepad
        if gamepad_axis_value(i, gp_axisrh) >= 0.5 {
            s_set_salgase(1 + i, 0);
            keyboard_key_press(s_tecla(m_right, elcontrol[i, 1])); }
        else {
            keyboard_clear(s_tecla(m_right, elcontrol[i, 1])); }
        
        if gamepad_axis_value(i, gp_axisrh) <= -0.5 {
            s_set_salgase(1 + i, 0);
            keyboard_key_press(s_tecla(m_left, elcontrol[i, 1])); }
        else {
            keyboard_clear(s_tecla(m_left, elcontrol[i, 1])); }
        
        if gamepad_axis_value(i, gp_axisrv) >= 0.5 {
            s_set_salgase(1 + i, 0);
            keyboard_key_press(s_tecla(m_down, elcontrol[i, 1])); }
        else {
            keyboard_clear(s_tecla(m_down, elcontrol[i, 1])); }
        
        if gamepad_axis_value(i, gp_axisrv) <= -0.5 {
            s_set_salgase(1 + i, 0);
            keyboard_key_press(s_tecla(m_up, elcontrol[i, 1])); }
        else {
            keyboard_clear(s_tecla(m_up, elcontrol[i, 1])); }
    }
    if elcontrol[i, 0] != -1 or elcontrol[i, 1] != -1
    {
        /* No pausa
        if gamepad_button_check_released(i, gp_start) {
            keyboard_key_release(vk_tab); }
        else if gamepad_button_check(i, gp_start) {
            keyboard_key_press(vk_tab); }
        */
    }
}

/* */
/*  */
