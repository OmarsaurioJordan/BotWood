if !o_game.pausa
{
	var donde = -45;
	if es_izquierdo {
		donde = 45;
	}
    var xx = origen.x + lengthdir_x(25, origen.direction + donde);
    var yy = origen.y + lengthdir_y(25, origen.direction + donde);
    
    if point_distance(x, y, xx, yy) < m_rad_m * 0.2
    {
		if es_izquierdo {
			origen.lanzadi = false;
		}
		else {
	        origen.lanzado = false;
		}
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

