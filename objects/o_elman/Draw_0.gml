if abs(xprevious - x) < 1 and abs(yprevious - y) < 1
{
    draw_sprite(d_int_rosado, anima[0], x, y);
}
else
{
    draw_sprite(d_int_rosado, 4 + anima[0], x, y);
}

if room == w_menu
{
    var el = instance_nearest(x, y, o_titulos);
    if point_distance(x, y, el.x, el.y) < 75
    {
        var eso = "";
        switch el.direction
        {
            case 1:
                eso = "F4: Full Screen"; break;
            case 2:
                eso = "F2: More Games#(F1: obtain gamepad App)"; break;
            case 3:
                eso = "Tab: Pause"; break;
            case 4:
                eso = "Backspace: Sound"; break;
        }
        draw_set_valign(fa_bottom);
        draw_set_halign(fa_center);
        draw_text_transformed_colour(x - 2, y - 90, string_hash_to_newline(eso),
            m_textoman, m_textoman, 0, c_white, c_white, c_white, c_white, 1);
        draw_text_transformed_colour(x + 2, y - 90, string_hash_to_newline(eso),
            m_textoman, m_textoman, 0, c_white, c_white, c_white, c_white, 1);
        draw_text_transformed_colour(x, y - 90, string_hash_to_newline(eso),
            m_textoman, m_textoman, 0, c_black, c_black, c_black, c_black, 1);
    }
}
else if room == w_configuracion
{
    var el = instance_nearest(x, y, o_opciones);
    if point_distance(x, y, el.x, el.y) < 75
    {
        var eso = "";
        switch el.opccc
        {
            case 0:
                eso = "For Lives#1 Hit#(fast party)"; break;
            case 1:
                eso = "For Lives#2 Hits#(fast party)"; break;
            case 2:
                eso = "For Lives#3 Hits#(fast party)"; break;
            case 3:
                eso = "For Lives#4 Hits#(normal party)"; break;
            case 4:
                eso = "For Lives#5 Hits#(slow party)"; break;
            case 5:
                eso = "For Lives#6 Hits#(slow party)"; break;
            case 6:
                eso = "Realistic Damage#Resistent#(slow party)"; break;
            case 7:
                eso = "Realistic Damage#Aggressive#(fast party)"; break;
            case 8:
                eso = "Gamepad support#2(two) players#¡reconnect pads!"; break;
            case 9:
                eso = "Gamepad for only#one player#¡reconnect pads!"; break;
            case 10:
                eso = "Game will gives you#reparation keys#(not supported yet)"; break;
            case 11:
                eso = "You can't repair#the bot"; break;
            case 12:
                eso = "The AIs will be auto#assigned to balance"; break;
            case 13:
                eso = "You can select the#AIs in lobby"; break;
        }
        draw_set_valign(fa_bottom);
        draw_set_halign(fa_center);
        draw_text_transformed_colour(x - 2, y - 90, string_hash_to_newline(eso),
            m_textoman, m_textoman, 0, c_white, c_white, c_white, c_white, 1);
        draw_text_transformed_colour(x + 2, y - 90, string_hash_to_newline(eso),
            m_textoman, m_textoman, 0, c_white, c_white, c_white, c_white, 1);
        draw_text_transformed_colour(x, y - 90, string_hash_to_newline(eso),
            m_textoman, m_textoman, 0, c_black, c_black, c_black, c_black, 1);
    }
}

