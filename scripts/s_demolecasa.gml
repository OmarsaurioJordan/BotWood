//tumbar una casa
//arg0: id instancia a tumbar

with argument0
{
    if !cae
    {
        cae = true;
        anima[0] = 1;
        audio_play_sound(a_map_caecasa, 80, false);
        repeat 4
        {
            instance_create(x, y, o_ciudadano);
        }
    }
}
