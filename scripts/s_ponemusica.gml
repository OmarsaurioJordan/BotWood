//pone a sonar la musica de fondo adecuada, dependiendo del room y var sonido

audio_stop_sound(a_mus_editor);
audio_stop_sound(a_mus_menu);
audio_stop_sound(a_mus_lobby);
audio_stop_sound(a_mus_game);

if o_game.sonido == 2
{
    switch room
    {
        case w_menu:
            audio_play_sound(a_mus_menu, 100, true);
            break;
        
        case w_lobby:
            audio_play_sound(a_mus_lobby, 100, true);
            break;
        
        case w_editor:
        case w_configuracion:
            audio_play_sound(a_mus_editor, 100, true);
            break;
        
        default:
            audio_play_sound(a_mus_game, 100, true);
            break;
    }
}
