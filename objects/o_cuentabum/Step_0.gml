if !o_game.pausa
{
    asenso += m_velparti * dlt;
    if asenso >= m_asenparti
    {
        instance_destroy();
    }
}

