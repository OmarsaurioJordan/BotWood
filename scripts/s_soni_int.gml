//ejecuta sonido interno
//arg0: id sonido a ejecutar

if !audio_is_playing(argument0)
{
    audio_play_sound(argument0, 25, false);
}
