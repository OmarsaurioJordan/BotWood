var piel;
switch quien
{
    case m_rojo: piel = d_int_rojo; break;
    case m_azul: piel = d_int_azul; break;
    case m_verde: piel = d_int_verde; break;
    case m_amarillo: piel = d_int_amarillo; break;
    case m_morado: piel = d_int_morado; break;
    case m_blanco: piel = d_int_blanco; break;
    case m_negro: piel = d_int_negro; break;
    case m_aqua: piel = d_int_aqua; break;
    case m_violeta: piel = d_int_violeta; break;
    case m_gris: piel = d_int_gris; break;
    case m_naranja: piel = d_int_naranja; break;
    case m_lima: piel = d_int_lima; break;
    default: piel = d_int_rosado; break;
}

if x != xprevious or y != yprevious
{
    draw_sprite_ext(piel, 4 + anima[0], x, y, o_game.eschum,
        o_game.eschum, 0, c_white, 1);
}
else
{
    draw_sprite_ext(piel, anima[0], x, y, o_game.eschum,
        o_game.eschum, 0, c_white, 1);
}

