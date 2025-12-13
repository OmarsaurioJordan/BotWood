/// @description oleadas asediadores
if !instance_exists(o_asediador) and instance_exists(o_edificio) and instance_exists(o_puntoasedio)
{
    oleada++;
    audio_play_sound(a_map_oleada, 99, false);
    repeat oleada
    {
        var as = instance_find(o_puntoasedio, irandom(instance_number(o_puntoasedio) - 1));
        instance_create(as.x, as.y, o_asediador);
    }
}

