//tumbar un arbol o reproducir animacion impacto bala
//arg0: id instancia a animar
//arg1: true si es para tumbarlo, sino impacto

with argument0
{
    if argument1
    {
        if !cae
        {
            cae = true;
            audio_play_sound(a_map_tumbarbol, 30, false);
            anima[0] = 1;
            repeat choose(1, 1, 1, 2, 2, 3)
            {
                instance_create(x, y, o_ave);
            }
        }
    }
    else if !imp
    {
        imp = true;
    }
}
