if !o_game.pausa
{
    if cae
    {
        s_anima(id, 0, m_anima * 2, 3);
        if anima[0] == 0
        {
            var h = instance_create(x, y, o_decorado);
            h.direction = 13;
            instance_destroy();
        }
    }
}

