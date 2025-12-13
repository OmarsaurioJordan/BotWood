depth = -y;

direction = irandom(359);
impulso = 0;
if s_colision(x, y, m_rad_m, o_pavo, m_rad_m, 1, id) != noone
{
    impulso = m_velroca * 0.5;
}

