if !o_game.pausa
{
    asenso += m_velparti * dlt * escala;
    if asenso >= m_asenparti * escala
    {
        instance_destroy();
    }
    
    direction += dlt * 400;
}

