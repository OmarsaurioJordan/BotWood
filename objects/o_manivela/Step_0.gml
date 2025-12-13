if !o_game.pausa
{
    if estado > 0 and activo
    {
        s_soni_int(a_int_manivela);
        s_anima(id, 0, m_anima * (1 / s_cansado(estado)), 4);
        s_calorhambre(instance_nearest(x, y, o_salon), estado,
            dlt * (0.6 * s_cansado(estado) + (m_calor / m_natufrio)),
            -dlt * 0.5);
    }
    s_activo(id, 1, m_reactiva);
}

