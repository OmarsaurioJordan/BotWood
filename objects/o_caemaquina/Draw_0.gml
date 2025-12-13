switch tipo
{
    case 0: //golpe
        draw_sprite(d_ext_robot, 41 + direction, x, y + altura);
    break;
    
    case 1: //disparo
        draw_sprite(d_ext_robot, 57 + direction, x, y + altura);
    break;
    
    case 2: //grua
        draw_sprite(d_ext_robot, 22, x, y + altura);
    break;
}

