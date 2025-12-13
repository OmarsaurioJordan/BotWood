if !o_game.pausa
{
    s_oscila(id, 0, m_anima * 3, 7);
    s_anima(id, 1, m_anima * 0.5, 4);
    s_errar(id, m_errar, m_errar, 60, 0.333, 0.666);
    
    if xx == 0
    {
        reloj_deposito += dlt
        if reloj_deposito >= 30000000
        {
            reloj_deposito = 0;
            
            if instance_number(o_regalo) < o_game.munidronsuelo
            {
                var otro, xm, ym;
                var dia = m_radext * o_suelo.resise * 0.9;
                var f = 0;
                do
                {
                    do
                    {
                        xm = o_suelo.x + dia - irandom(dia * 2);
                        ym = o_suelo.y + dia - irandom(dia * 2);
                    }
                    until point_distance(xm, ym, o_suelo.x, o_suelo.y) < dia;
                    otro = s_colision(xm, ym, 8, o_bloque, m_rad_m, 1, -1);
                    if otro == noone
                    {
                        otro = s_colision(xm, ym, 8, o_regalo, 8, 1, -1);
                        if otro == noone
                        {
                            otro = s_colision(xm, ym, 8, o_decorado, m_rad_m * 0.5, 1, -1);
                            if otro == noone
                            {
                                otro = s_colision(xm, ym, 8, o_caemaquina, m_rad_m * 0.5, 1, -1);
                            }
                        }
                    }
                    f++;
                }
                until otro == noone or f > 100;
                if f <= 100
                {
                    xx = xm;
                    yy = ym;
                }
            }
        }
        
        if mov_ia
        {
            x += lengthdir_x(m_veldron * dlt, dir_ia);
            y += lengthdir_y(m_veldron * dlt, dir_ia);
            
            //limitar a dentro del circulo
            if point_distance(x, y, o_suelo.x, o_suelo.y) > m_radext * o_suelo.resise
            {
                dir_ia = point_direction(x, y, o_suelo.x, o_suelo.y);
            }
        }
    }
    else
    {
        if point_distance(x, y, xx, yy) <= m_rad_m * 0.25
        {
            instance_create(xx, yy, o_caeregalo);
            xx = 0;
        }
        else
        {
            direction = point_direction(x, y, xx, yy);
            x += lengthdir_x(dlt * m_veldron, direction);
            y += lengthdir_y(dlt * m_veldron, direction);
        }
    }
    
    depth = -y;
}

