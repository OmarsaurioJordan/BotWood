with o_decorado
{
    direction = choose(33, 33, 33, 34);
    if s_colision(x, y, 0, o_casa, 80, 1, -1) != noone and
        irandom(1) <= 0.75
    {
        direction = 32;
    }
}

