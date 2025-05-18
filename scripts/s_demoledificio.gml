//tumbar un edificio
//arg0: id instancia a tumbar
//arg1: true si es para tumbarlo todo

with argument0
{
    if argument1
    {
        if estructura == 1
        {
            estructura = 0;
            if anima[0] == 2 and reloj_anima[0] == 0
            {
                anima[0] = 3;
                audio_play_sound(a_map_edificae2, 80, false);
            }
            repeat 4
            {
                instance_create(x, y, o_ciudadano);
            }
        }
        else if estructura == 2
        {
            estructura = 0;
            anima[0] = 1;
            audio_play_sound(a_map_edificae1, 80, false);
            repeat 8
            {
                instance_create(x, y, o_ciudadano);
            }
        }
    }
    else if estructura == 2
    {
        estructura = 1;
        anima[0] = 1;
        audio_play_sound(a_map_edificae2, 80, false);
        repeat 4
        {
            instance_create(x, y, o_ciudadano);
        }
    }
}
