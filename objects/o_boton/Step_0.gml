if !o_game.pausa
{
    if estado > 0 and activo
    {
        reloj_anima[0] += dlt;
        if reloj_anima[0] >= m_anima
        {
            reloj_anima[0] = 0;
            
            anima[0]++;
            if anima[0] >= 2
            {
                anima[0] = 0;
            }
            
            if anima[0] == 1
            {
                audio_play_sound(a_int_boton, 25, false);
                var myd = id;
                with o_robot
                {
                    if origen.mach[m_disparo] == myd
                    {
                        if origen.mach[m_bodega].municion > 0 and
                            origen.mach[m_tensadisp].estado == m_cerrado
                        {
                            origen.mach[m_bodega].municion--;
                            origen.mach[m_tensadisp].estado = m_nadie;
                            var pp = instance_create(
                                x + lengthdir_x(25, direction + 45),
                                y + lengthdir_y(25, direction + 45),
                                o_proy);
                            pp.direction = direction;
                            pp.origen = id;
                        }
                    }
                    else if origen.mach[m_golpe] == myd
                    {
                        if lanzado == false and origen.mach[m_tensagolp].estado == m_cerrado
                        {
                            lanzado = true;
                            origen.mach[m_tensagolp].estado = m_nadie;
                            var pp = instance_create(
                                x + lengthdir_x(25, direction - 45),
                                y + lengthdir_y(25, direction - 45),
                                o_bolago);
                            pp.direction = direction;
                            pp.origen = id;
                        }
                    }
                }
            }
        }
    }
    s_activo(id, 1, m_reactiva);
}

