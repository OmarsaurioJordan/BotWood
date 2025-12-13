if !o_game.pausa
{
    if !audio_is_playing(a_men_reloj1) and !audio_is_playing(a_men_reloj2)
    {
        if reloj > m_relojlobby * 0.5
        {
            audio_play_sound(a_men_reloj2, 99, false);
        }
        else
        {
            audio_play_sound(a_men_reloj1, 99, false);
        }
    }
    
    reloj += dlt;
    if reloj >= m_relojlobby
    {
        reloj -= m_relojlobby;
        audio_play_sound(a_men_noreloj, 99, false);
    }
    
    var clic = false;
    if mouse_check_button_pressed(mb_left) {
        clic = point_in_rectangle(mouse_x, mouse_y,
            x - 36, y - 36, x + 36, y + 36);
    }
    if clic {
        var todoslistos = true;
        
        //ver en donde estan hubicados los personajes
        o_game.players = "";
        for (var i = 1; i <= 12; i++)
        {
            with o_elmen
            {
                if quien == i
                {
                    if semovio
                    {
                        if point_distance(room_width * 0.25 + 150,
                            room_height * 0.25 + 40, x, y) <= m_radint * 0.6
                        {
                            o_game.players += "0";
                        }
                        else if point_distance(room_width * 0.75 + 150,
                            room_height * 0.25 + 40, x, y) <= m_radint * 0.6
                        {
                            o_game.players += "1";
                        }
                        else if point_distance(room_width * 0.25 + 150,
                            room_height * 0.75 + 40, x, y) <= m_radint * 0.6
                        {
                            o_game.players += "2";
                        }
                        else if point_distance(room_width * 0.75 + 150,
                            room_height * 0.75 + 40, x, y) <= m_radint * 0.6
                        {
                            o_game.players += "3";
                        }
                        else
                        {
                            o_game.players += "x";
                            todoslistos = false;
                        }
                    }
                    else
                    {
                        o_game.players += "x";
                    }
                    break;
                }
            }
        }
        
        if todoslistos
        {
            //ver que robots seran usados
            o_game.bots = "";
            for (var i = 0; i < 4; i++)
            {
                if string_count(string(i), o_game.players) == 0
                {
                    o_game.bots += "0";
                }
                else
                {
                    o_game.bots += "1";
                }
            }
            
            //mirar si se activaran los ayudantes
            if false
            {/*
                var pp;
                for (var i = 0; i < 4; i++)
                {
                    pp[i] = string_count(string(i), o_game.players);
                }
                var mm = max(pp[0], pp[1], pp[2], pp[3]);
                if mm != min(pp[0], pp[1], pp[2], pp[3]) or mm == 1
                {
                    o_game.ayudantes = "";
                    for (var i = 0; i < 4; i++)
                    {
                        if pp[i] != 0 and (pp[i] != mm or pp[i] == 1)
                        {
                            o_game.ayudantes += "1";
                        }
                        else
                        {
                            o_game.ayudantes += "0";
                        }
                    }
                }
                else
                {
                    o_game.ayudantes = "0000";
                }*/
            }
            else
            {
                o_game.ayudantes = "";
                var ese;
                var n = 1;
                for (var j = 0; j < 2; j++)
                {
                    for (var i = 0; i < 2; i++)
                    {
                        ese = instance_nearest(room_width * i, room_height * j, o_selectia);
                        if ese.activa and string_char_at(o_game.bots, n) == "1"
                        {
                            o_game.ayudantes += "1";
                        }
                        else
                        {
                            o_game.ayudantes += "0";
                        }
                        n++;
                    }
                }
            }
            
            //mirar si se puede continuar al juego
            room_goto(w_juego);
        }
    }
}

/* */
/*  */
