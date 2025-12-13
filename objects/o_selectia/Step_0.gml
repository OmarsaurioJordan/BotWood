if !o_game.pausa
{
    s_anima(id, 0, m_anima, 4);
    
    if mouse_check_button_pressed(mb_left) {
        if point_in_rectangle(mouse_x, mouse_y,
                x - 14, y - 64, x + 14, y) {
            activa = !activa;
        }
    }
    
    /*
    var otro = instance_nearest(x, y, o_elmen);
    if point_distance(x, y, otro.x, otro.y) <= 72
    {
        activa = true;
    }
    else
    {
        activa = false;
    }
    */
}

/* */
/*  */
