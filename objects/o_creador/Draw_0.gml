draw_set_alpha(0.75);
switch seleccion
{
    case 0:
        draw_sprite(d_ext_bloque, 14, x, y);
        break;
    case 1:
        draw_sprite(d_ext_bloque, 23, x, y);
        break;
    case 2:
        draw_sprite(d_ext_bloque, 1, x, y);
        break;
    case 3:
        draw_sprite(d_ext_bloque, 0, x, y);
        break;
    case 4:
        draw_sprite(d_ext_bloque, 6, x, y);
        break;
    case 5:
        draw_sprite(d_ext_bloque, 27, x, y);
        break;
    case 6:
        draw_sprite(d_ext_bloque, 11, x, y);
        break;
    case 7:
        draw_sprite(d_ext_bloque, 33, x, y);
        break;
    case 8:
        draw_sprite(d_ext_bloque, 35, x, y);
        break;
    case 9:
        draw_sprite(d_ext_robot, 0, x, y);
        draw_sprite(d_ext_robot, 19, x, y);
        break;
    case 10:
        draw_sprite(d_ext_proy, 1, x, y - 4);
        break;
    case 11:
        draw_sprite(d_ext_bloque, 7, x, y);
        draw_sprite(d_ext_robot, 70, x, y);
        break;
    case 12:
        draw_sprite(d_ext_robot, 0, x, y);
        draw_sprite(d_ext_robot, 78, x, y);
        draw_sprite(d_ext_robot, 54, x, y);
        break;
    case 13:
        draw_sprite(d_int_objeto, 12, x, y);
        break;
    case 14:
        draw_sprite(d_int_objeto, 14, x, y);
        break;
    case 15:
        break;
    case 16:
        draw_sprite(d_ext_bloque, 37, x, y);
        break;
    case 17:
        draw_sprite(d_int_objeto, 15, x, y);
        break;
}
draw_set_alpha(1);

