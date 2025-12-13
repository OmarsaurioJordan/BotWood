switch estado
{
    case m_rojo:
        if baja
        {
            draw_sprite_ext(d_int_rojo, 8 + anima[0], x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(d_int_rojo, 8 + (3 - anima[0]), x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
    break;
    
    case m_azul:
        if baja
        {
            draw_sprite_ext(d_int_azul, 8 + anima[0], x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(d_int_azul, 8 + (3 - anima[0]), x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
    break;
    
    case m_verde:
        if baja
        {
            draw_sprite_ext(d_int_verde, 8 + anima[0], x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(d_int_verde, 8 + (3 - anima[0]), x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
    break;
    
    case m_amarillo:
        if baja
        {
            draw_sprite_ext(d_int_amarillo, 8 + anima[0], x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(d_int_amarillo, 8 + (3 - anima[0]), x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
    break;
    
    case m_morado:
        if baja
        {
            draw_sprite_ext(d_int_morado, 8 + anima[0], x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(d_int_morado, 8 + (3 - anima[0]), x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
    break;
    
    case m_blanco:
        if baja
        {
            draw_sprite_ext(d_int_blanco, 8 + anima[0], x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(d_int_blanco, 8 + (3 - anima[0]), x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
    break;
    
    case m_negro:
        if baja
        {
            draw_sprite_ext(d_int_negro, 8 + anima[0], x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(d_int_negro, 8 + (3 - anima[0]), x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
    break;
    
    case m_aqua:
        if baja
        {
            draw_sprite_ext(d_int_aqua, 8 + anima[0], x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(d_int_aqua, 8 + (3 - anima[0]), x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
    break;
    
    case m_lima:
        if baja
        {
            draw_sprite_ext(d_int_lima, 8 + anima[0], x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(d_int_lima, 8 + (3 - anima[0]), x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
    break;
    
    case m_naranja:
        if baja
        {
            draw_sprite_ext(d_int_naranja, 8 + anima[0], x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(d_int_naranja, 8 + (3 - anima[0]), x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
    break;
    
    case m_violeta:
        if baja
        {
            draw_sprite_ext(d_int_violeta, 8 + anima[0], x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(d_int_violeta, 8 + (3 - anima[0]), x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
    break;
    
    case m_gris:
        if baja
        {
            draw_sprite_ext(d_int_gris, 8 + anima[0], x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(d_int_gris, 8 + (3 - anima[0]), x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
    break;
    
    case m_roto:
        draw_sprite_ext(d_int_objeto, 10, x, y,
            o_game.escint, o_game.escint, 0, c_white, 1);
    break;
    
    case m_nadie:
    case m_cerrado:
        draw_sprite_ext(d_int_objeto, 2, x, y,
            o_game.escint, o_game.escint, 0, c_white, 1);
    break;
    
    default:
        if baja
        {
            draw_sprite_ext(d_int_rosado, 8 + anima[0], x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(d_int_rosado, 8 + (3 - anima[0]), x, y,
                o_game.escint, o_game.escint, 0, c_white, 1);
        }
    break;
}

var desf;
if estado == m_roto
{
    desf = -16;
}
else
{
    desf = 0;
}
for (var i = 0; i < municion; i++)
{
    draw_sprite_ext(d_int_objeto, 1, x, y - (desf + i * 8) * o_game.escint,
        o_game.escint, o_game.escint, 0, c_white, 1);
}

