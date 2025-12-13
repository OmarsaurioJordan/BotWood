x = mouse_x;
y = mouse_y;

if keyboard_check_pressed(vk_enter)
{
    audio_play_sound(a_edi_save, 99, false);
    s_savemap();
}

if mouse_wheel_up()
{
    audio_play_sound(a_edi_cambio, 99, false);
    seleccion++;
    if seleccion >= numcosas
    {
        seleccion = 0;
    }
}
else if mouse_wheel_down()
{
    audio_play_sound(a_edi_cambio, 99, false);
    seleccion--;
    if seleccion < 0
    {
        seleccion = numcosas - 1;
    }
}

if mouse_check_button_pressed(mb_left)
{
    if point_distance(x, y, o_suelo.x, o_suelo.y) <
        m_radext * o_suelo.resise
    {
        switch seleccion
        {
            case 0: case 1: case 2:
            case 3: case 4: case 5:
            case 6: case 7: case 8:
            case 10: case 11: case 12:
            case 13: case 15: case 16:
                instance_create(x, y, s_seleobj(seleccion));
                audio_play_sound(a_edi_poner, 99, false);
                break;
            
            case 9:
                if instance_number(o_puntoini) < 4
                {
                    var nn;
                    do
                    {
                        nn = irandom(3);
                        with o_puntoini
                        {
                            if direction == nn
                            {
                                nn = -1;
                                break;
                            }
                        }
                    }
                    until nn != -1;
                    var aux = instance_create(x, y, o_puntoini);
                    aux.direction = nn;
                    audio_play_sound(a_edi_poner, 99, false);
                }
                break;
            
            case 14:
                if instance_number(o_munibot) < m_municion
                {
                    instance_create(x, y, o_munibot);
                    audio_play_sound(a_edi_poner, 99, false);
                }
                break;
            
            case 17:
                if !instance_exists(o_paz)
                {
                    instance_create(x, y, o_paz);
                    audio_play_sound(a_edi_poner, 99, false);
                }
                break;
        }
    }
}
else if mouse_check_button_pressed(mb_right) or keyboard_check(vk_space)
{
    var otro = s_colision(x, y, 0, s_seleobj(seleccion), m_rad_m, 1, -1);
    if otro != noone
    {
        with otro { instance_destroy(); }
        audio_play_sound(a_edi_quitar, 99, false);
    }
}

depth = -y;

