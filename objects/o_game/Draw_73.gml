/// @description mouse

if room == w_menu {
    draw_sprite_ext(d_qr, 0, room_width / 2, room_height / 2,
        0.666, 0.666, 0, c_white, 1);
}
var e = 0.75;
var c = c_white;
switch room {
	case w_menu:
		if point_distance(mouse_x, mouse_y,
                room_width / 2, room_height / 2) < 64 {
            e = 1;
            c = c_orange;
        }
    case w_lobby:
    case w_howto:
    case w_configuracion:
        with o_reloj {
            if point_in_rectangle(mouse_x, mouse_y,
                    x - 36, y - 36, x + 36, y + 36) {
                e = 1;
                c = c_orange;
            }
        }
        with o_selectia {
            if point_in_rectangle(mouse_x, mouse_y,
                    x - 14, y - 64, x + 14, y) {
                e = 1;
                c = c_orange;
            }
        }/*
        if instance_exists(o_titulos) {
            var otr = instance_nearest(mouse_x, mouse_y + 44, o_titulos);
            if point_distance(mouse_x, mouse_y + 44, otr.x, otr.y) < 32 {
                e = 1;
                c = c_orange;
            }
        }*/
        if instance_exists(o_puerta) {
            var otr = instance_nearest(mouse_x, mouse_y + 44, o_puerta);
            if point_distance(mouse_x, mouse_y + 44, otr.x, otr.y) < 32 {
                e = 1;
                c = c_orange;
            }
        }
        if instance_exists(o_opciones) {
            var otr = instance_nearest(mouse_x, mouse_y + 56, o_opciones);
            if point_distance(mouse_x, mouse_y + 56, otr.x, otr.y) < 32 {
                e = 1;
                c = c_orange;
            }
        }
        if room == w_configuracion {
            var xx = room_width * o_gamepad.ip_x;
            var yy = room_height * o_gamepad.ip_y;
            if point_in_rectangle(mouse_x, mouse_y,
                    xx - 100, yy - 20, xx + 100, yy + 20) {
                e = 1;
                c = c_orange;
            }
        }
        draw_sprite_ext(d_mouse, 0, mouse_x, mouse_y,
            e, e, 0, c, 1);
        break;
}


/* */
/*  */
