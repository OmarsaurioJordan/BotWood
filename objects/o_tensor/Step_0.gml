if !o_game.pausa
{
    if estado > 0 and activo
    {
        s_soni_int(a_int_bomba);
        s_anima(id, 0, m_anima * (1 / s_cansado(estado)), 4);
        s_calorhambre(instance_nearest(x, y, o_salon), estado,
            dlt * (m_calor / m_natufrio),
            -dlt * 0.7);
        tension = clamp(tension + dlt * s_cansado(estado), 0, m_tensar);
        if tension == m_tensar
        {
            estado = m_cerrado;
            tension = 0;
            var mm = id;
            with o_jugador
            {
                if maquina == mm
                {
                    maquina = -1;
                    break;
                }
            }
        }
    }
    s_activo(id, 1, m_reactiva);
}

