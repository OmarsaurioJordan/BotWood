//arg0: id quien llama
//arg1: sprite de origen
//arg2: transparencia alpha

with argument0
{
    relojmovio = max(0, relojmovio - dlt);
    relojquietin = max(0, relojquietin - dlt);
    if relojquietin != 0 {
        draw_sprite_ext(argument1, anima[0], xx, yy,
            o_game.escint, o_game.escint, 0, c_white, argument2);
    }
    else if relojmovio != 0 {
        draw_sprite_ext(argument1, 4 + anima[0], xx, yy,
            o_game.escint, o_game.escint, 0, c_white, argument2);
    }
    else if abs(xxp - xx) < o_game.escint and abs(yyp - yy) < o_game.escint
    {
        draw_sprite_ext(argument1, anima[0], xx, yy,
            o_game.escint, o_game.escint, 0, c_white, argument2);
        relojmovio = 0;
        relojquietin = 100000;
    }
    else
    {
        draw_sprite_ext(argument1, 4 + anima[0], xx, yy,
            o_game.escint, o_game.escint, 0, c_white, argument2);
        relojmovio = 100000;
        relojquietin = 0;
    }
}
