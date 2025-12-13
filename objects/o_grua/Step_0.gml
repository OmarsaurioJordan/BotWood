if !o_game.pausa
{
    if estado > 0 and activo
    {
        s_soni_int(a_int_enrrolla);
        s_anima(id, 0, m_anima * (1 / s_cansado(estado)), 4);
        s_calorhambre(instance_nearest(x, y, o_salon), estado,
            dlt * (m_calor / m_natufrio),
            -dlt * 0.2);
        if baja
        {
            accion = clamp(accion + dlt * s_cansado(estado), 0, m_grua);
            if accion == m_grua
            {
                baja = false;
            }
        }
        else
        {
            accion = clamp(accion - dlt * s_cansado(estado), 0, m_grua);
            if accion == 0
            {
                baja = true;
                if agarro and municion < m_municion
                {
                    agarro = false;
                    municion++;
                    audio_play_sound(a_bot_muni, 65, false);
                }
            }
        }
    }
    s_activo(id, 1, m_reactiva);
    
    //atraer municion
    if accion >= m_grua * 0.8 and !agarro and estado != m_roto
    {
        var xx, yy
        var myd = id;
        with o_robot
        {
            if origen.mach[m_bodega] == myd
            {
                var rr = s_invers16(s_angulo16(direction)) * 22.5;
                xx = x + lengthdir_x(18, rr);
                yy = y + lengthdir_y(18, rr);
            }
        }
        with o_regalo
        {
            var ddr = point_distance(x, y, xx, yy);
            if ddr <= 6
            {
                myd.agarro = true;
                myd.baja = false;
                audio_play_sound(a_bot_migolpe, 50, false);
                instance_destroy();
            }
            else if ddr <= m_rad_m * 3
            {
                var otro = s_colision(x, y, m_rad_m * 0.5, o_regalo, 0, 1, id)
                if otro == noone
                {
                    var vvr = (1 - ddr / (m_rad_m * 3)) * m_velroca;
                    x += lengthdir_x(vvr * dlt, point_direction(x, y, xx, yy));
                    y += lengthdir_y(vvr * dlt, point_direction(x, y, xx, yy));
                }
                else
                {
                    x += lengthdir_x(m_velroca * dlt, point_direction(otro.x, otro.y, x, y));
                    y += lengthdir_y(m_velroca * dlt, point_direction(otro.x, otro.y, x, y));
                }
            }
        }
    }
}

