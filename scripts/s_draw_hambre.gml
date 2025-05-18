//arg0: id quien llama
//arg1: color de la barra

with argument0
{
    draw_rectangle_colour(xx - 16 * o_game.escint, yy - 90 * o_game.escint,
        xx + 16 * o_game.escint, yy - 96 * o_game.escint,
        c_silver, c_silver, c_silver, c_silver, false);
    draw_rectangle_colour(xx - 16 * o_game.escint, yy - 90 * o_game.escint,
        xx - 16 * o_game.escint + (hambre / m_hambre) * 32 * o_game.escint,
        yy - 96 * o_game.escint, argument1, argument1, argument1, argument1, false);
}
