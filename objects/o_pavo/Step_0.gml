if !o_game.pausa
{
    if impulso != 0
    {
        impulso = clamp(impulso * m_fricmove, 0, m_velroca);
        
        //mover y detectar colision
        var otro = s_colision(x, y, m_rad_m, o_bloque, m_rad_m, 1, id);
        if otro != noone
        {
            switch otro.object_index
            {
                case o_casa:
                    s_demolecasa(otro);
                    break;
                
                case o_pavo:
                    if otro.impulso <= m_velroca * 0.2 and impulso > m_velroca * 0.4
                    {
                        otro.direction = point_direction(x, y, otro.x, otro.y);
                        otro.impulso = clamp(otro.impulso + impulso, 0, m_velroca);
                        impulso = m_velroca * 0.1;
                    }
                    else
                    {
                        direction = point_direction(otro.x, otro.y, x, y);
                        impulso = max(impulso, m_velroca * 0.1);
                    }
                    break;
                
                case o_globo:
                    if otro.impulso < m_velglobo * 0.5
                    {
                        otro.impulso = m_velglobo * 0.5;
                    }
                    otro.direction = point_direction(x, y, otro.x, otro.y);
                    break;
                
                default:
                    direction = point_direction(otro.x, otro.y, x, y);
                    break;
            }
        }
        x += lengthdir_x(impulso * dlt, direction);
        y += lengthdir_y(impulso * dlt, direction);
        
        //limitar a dentro del circulo
        if point_distance(x, y, o_suelo.x, o_suelo.y) > m_radext * o_suelo.resise * 0.9
        {
            var dirrr = point_direction(o_suelo.x, o_suelo.y, x, y);
            x = o_suelo.x + lengthdir_x(m_radext * o_suelo.resise * 0.9, dirrr);
            y = o_suelo.y + lengthdir_y(m_radext * o_suelo.resise * 0.9, dirrr);
        }
        
        depth = -y;
    }
}

