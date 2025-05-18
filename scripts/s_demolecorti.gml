//tumbar una cortina
//arg0: id instancia a destruir

with argument0
{
    if !cae
    {
        cae = true;
        audio_play_sound(a_map_caemuro, 80, false);
        anima[0] = 1;
    }
}
