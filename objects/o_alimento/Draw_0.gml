switch estado
{
    case m_rojo:
        draw_sprite_ext(d_int_rojo, 16 + anima[0], x, y,
            o_game.escint, o_game.escint, 0, c_white, 1);
    break;
    
    case m_azul:
        draw_sprite_ext(d_int_azul, 16 + anima[0], x, y,
            o_game.escint, o_game.escint, 0, c_white, 1);
    break;
    
    case m_verde:
        draw_sprite_ext(d_int_verde, 16 + anima[0], x, y,
            o_game.escint, o_game.escint, 0, c_white, 1);
    break;
    
    case m_amarillo:
        draw_sprite_ext(d_int_amarillo, 16 + anima[0], x, y,
            o_game.escint, o_game.escint, 0, c_white, 1);
    break;
    
    case m_morado:
        draw_sprite_ext(d_int_morado, 16 + anima[0], x, y,
            o_game.escint, o_game.escint, 0, c_white, 1);
    break;
    
    case m_blanco:
        draw_sprite_ext(d_int_blanco, 16 + anima[0], x, y,
            o_game.escint, o_game.escint, 0, c_white, 1);
    break;
    
    case m_negro:
        draw_sprite_ext(d_int_negro, 16 + anima[0], x, y,
            o_game.escint, o_game.escint, 0, c_white, 1);
    break;
    
    case m_aqua:
        draw_sprite_ext(d_int_aqua, 16 + anima[0], x, y,
            o_game.escint, o_game.escint, 0, c_white, 1);
    break;
    
    case m_lima:
        draw_sprite_ext(d_int_lima, 16 + anima[0], x, y,
            o_game.escint, o_game.escint, 0, c_white, 1);
    break;
    
    case m_violeta:
        draw_sprite_ext(d_int_violeta, 16 + anima[0], x, y,
            o_game.escint, o_game.escint, 0, c_white, 1);
    break;
    
    case m_naranja:
        draw_sprite_ext(d_int_naranja, 16 + anima[0], x, y,
            o_game.escint, o_game.escint, 0, c_white, 1);
    break;
    
    case m_gris:
        draw_sprite_ext(d_int_gris, 16 + anima[0], x, y,
            o_game.escint, o_game.escint, 0, c_white, 1);
    break;
    
    case m_roto:
        draw_sprite_ext(d_int_objeto, 10, x, y,
            o_game.escint, o_game.escint, 0, c_white, 1);
    break;
    
    case m_nadie:
    case m_cerrado:
        draw_sprite_ext(d_int_objeto, 4, x, y,
            o_game.escint, o_game.escint, 0, c_white, 1);
    break;
    
    default:
        draw_sprite_ext(d_int_rosado, 16 + anima[0], x, y,
            o_game.escint, o_game.escint, 0, c_white, 1);
    break;
}

