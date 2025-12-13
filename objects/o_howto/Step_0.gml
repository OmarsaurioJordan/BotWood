if alarm[0] == -1
{
    if keyboard_check(s_tecla(m_up, m_rojo)) or
        keyboard_check(s_tecla(m_right, m_rojo))
    {
        if imagen < sprite_get_number(d_howto) - 1
        {
            imagen++;
            alarm[0] = room_speed * 0.5;
        }
    }
    else if keyboard_check(s_tecla(m_down, m_rojo)) or
        keyboard_check(s_tecla(m_left, m_rojo))
    {
        if imagen > 0
        {
            imagen--;
            alarm[0] = room_speed * 0.5;
        }
    }
}

