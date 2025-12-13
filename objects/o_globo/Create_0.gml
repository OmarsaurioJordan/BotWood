depth = -y;

reloj_anima[0] = irandom(m_anima * 3);
anima[0] = 0;

direction = irandom(359);
impulso = 0;
if s_colision(x, y, m_rad_m, o_globo, m_rad_m, 1, id) != noone
{
    impulso = m_velglobo * 0.5;
}

