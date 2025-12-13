if alarm[3] != -1
{
    draw_set_alpha(0.25);
    draw_rectangle_colour(0, 0, room_width, room_height,
        c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
}

if pausa and room != w_editor
{
    draw_sprite(d_pausa, 0, room_width * 0.5, room_height * 0.5);
}

if room == w_menu
{
    draw_set_valign(fa_top);
    draw_set_halign(fa_right);
    draw_text_transformed_colour(room_width - 6, 3,
        string_hash_to_newline("BotWood by Omwekiatl 2020#v:" + m_version),
        0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
    draw_set_valign(fa_bottom);
    with o_gamepad
    {
    draw_text_transformed_colour(room_width - 6, room_height - 3,
        string_hash_to_newline("F1 export Android App file"),
        0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
    }
}
