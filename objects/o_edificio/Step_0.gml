if !o_game.pausa
{
    if estructura == 0
    {
        s_anima(id, 0, m_anima * 2, 5);
        if anima[0] == 0
        {
            var h = instance_create(x, y, o_decorado);
            h.direction = 31;
            instance_destroy();
        }
    }
    else if estructura == 1 and anima[0] < 2
    {
        s_anima(id, 0, m_anima * 2, 5);
    }
}

