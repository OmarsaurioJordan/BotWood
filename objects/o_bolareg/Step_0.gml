if !o_game.pausa
{
    var xx = origen.x + lengthdir_x(25, origen.direction - 45);
    var yy = origen.y + lengthdir_y(25, origen.direction - 45);
    
    if point_distance(x, y, xx, yy) < m_rad_m * 0.2
    {
        origen.lanzado = false;
        audio_play_sound(a_bot_migolpe, 50, false);
        instance_destroy();
    }
    else
    {
        direction = point_direction(x, y, xx, yy);
        x += lengthdir_x(m_velgolp * dlt, direction);
        y += lengthdir_y(m_velgolp * dlt, direction);
    }
    
    depth = -y;
}

