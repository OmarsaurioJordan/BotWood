if !o_game.pausa
{
    if cae
    {
        s_anima(id, 0, m_anima * 2, 5);
        if anima[0] == 0
        {
            var h = instance_create(x, y, o_decorado);
            h.direction = 18;
            instance_destroy();
        }
    }
    else if imp
    {
        s_anima(id, 1, m_anima, 5);
        if anima[1] == 0
        {
            imp = false;
            anima[1] = 1;
        }
    }
}

