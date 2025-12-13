if maquina == -1
{ 
    switch quien
    {
        case m_rojo: s_draw_jugador(id, d_int_rojo, 1); break;
        
        case m_azul: s_draw_jugador(id, d_int_azul, 1); break;
        
        case m_verde: s_draw_jugador(id, d_int_verde, 1); break;
        
        case m_amarillo: s_draw_jugador(id, d_int_amarillo, 1); break;
        
        case m_morado: s_draw_jugador(id, d_int_morado, 1); break;
        
        case m_blanco: s_draw_jugador(id, d_int_blanco, 1); break;
        
        case m_negro: s_draw_jugador(id, d_int_negro, 1); break;
        
        case m_aqua: s_draw_jugador(id, d_int_aqua, 1); break;
        
        case m_violeta: s_draw_jugador(id, d_int_violeta, 1); break;
        
        case m_naranja: s_draw_jugador(id, d_int_naranja, 1); break;
        
        case m_gris: s_draw_jugador(id, d_int_gris, 1); break;
        
        case m_lima: s_draw_jugador(id, d_int_lima, 1); break;
        
        default: s_draw_jugador(id, d_int_rosado, 1); break;
    }
}

if !agotado or anima[0] == 0 or anima[0] == 2
{
    switch quien
    {
        case m_rojo: s_draw_hambre(id, c_red); break;
        
        case m_azul: s_draw_hambre(id, c_blue); break;
        
        case m_verde: s_draw_hambre(id, c_green); break;
        
        case m_amarillo: s_draw_hambre(id, c_yellow); break;
        
        case m_morado: s_draw_hambre(id, c_purple); break;
        
        case m_blanco: s_draw_hambre(id, c_gray); break;
        
        case m_negro: s_draw_hambre(id, c_dkgray); break;
        
        case m_aqua: s_draw_hambre(id, c_aqua); break;
        
        case m_violeta: s_draw_hambre(id, c_fuchsia); break;
        
        case m_naranja: s_draw_hambre(id, c_orange); break;
        
        case m_gris: s_draw_hambre(id, c_gris); break;
        
        case m_lima: s_draw_hambre(id, c_lime); break;
        
        default: s_draw_hambre(id, c_piel); break;
    }
}

