if room == w_configuracion {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    var t = edita_ip;
    var c = c_black;
    if t == "" {
        t = "192.168.1.0-255.255.255.0";
        c = c_gray;
    }
	t = "IP-Mask LAN:#" + t;
	if reloj_blink < 0.3 and go_keyboard {
		t += "|";
	}
	else {
		t += " ";
	}
    draw_text_transformed_colour(room_width * ip_x, room_height * ip_y,
        string_hash_to_newline(t), 1.4, 1.4, 0, c, c, c, c, 1);
}
