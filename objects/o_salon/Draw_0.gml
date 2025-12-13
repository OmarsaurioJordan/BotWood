draw_sprite_ext(d_int_suelo, 0, x, y, o_game.escint, o_game.escint, 0, c_white, 1);

with o_jugador
{
    draw_sprite_ext(d_sombra, 0, xx, yy,
        o_game.escint, o_game.escint, 0, c_white, 1);
}

var bv = 180 * o_game.escint;
if y > room_height * 0.5
{
    bv *= -1;
}
draw_rectangle_colour(x - 80 * o_game.escint, y + bv,
    x + 80 * o_game.escint, y + bv - 6 * o_game.escint,
    c_gray, c_gray, c_gray, c_gray, false);
draw_rectangle_colour(x - 80 * o_game.escint, y + bv,
    x - 80 * o_game.escint + (calor / m_calor) * 160 * o_game.escint,
    y + bv - 6 * o_game.escint, c_orange, c_orange, c_orange, c_orange, false);

