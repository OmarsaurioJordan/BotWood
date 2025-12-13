if semovio
{
    alf = 1;
}
else
{
    alf = 0.666;
}
switch quien
{
    case m_rojo: s_draw_jugador(id, d_int_rojo, alf); break;
    
    case m_azul: s_draw_jugador(id, d_int_azul, alf); break;
    
    case m_verde: s_draw_jugador(id, d_int_verde, alf); break;
    
    case m_amarillo: s_draw_jugador(id, d_int_amarillo, alf); break;
    
    case m_morado: s_draw_jugador(id, d_int_morado, alf); break;
    
    case m_blanco: s_draw_jugador(id, d_int_blanco, alf); break;
    
    case m_negro: s_draw_jugador(id, d_int_negro, alf); break;
    
    case m_aqua: s_draw_jugador(id, d_int_aqua, alf); break;
    
    case m_violeta: s_draw_jugador(id, d_int_violeta, alf); break;
    
    case m_lima: s_draw_jugador(id, d_int_lima, alf); break;
    
    case m_gris: s_draw_jugador(id, d_int_gris, alf); break;
    
    case m_naranja: s_draw_jugador(id, d_int_naranja, alf); break;
    
    default: s_draw_jugador(id, d_int_rosado, alf); break;
}

