if !o_game.pausa
{
    if estado > 0 and activo
    {
        s_soni_int(a_int_toma);
        s_anima(id, 0, m_anima, 4);
        s_calorhambre(instance_nearest(x, y, o_salon), estado,
            0, dlt * (m_hambre / m_nohambre));
    }
    s_activo(id, 1, m_reactiva);
}

