if !o_game.pausa
{
    //poner punto al cual se mirara
    reloj_adonde -= dlt;
    if reloj_adonde <= 0
    {
        reloj_adonde = (m_torredonde + irandom(m_torredonde)) * 0.5;
        
        if choose(true, false)
        {
            var dia = m_radext * o_suelo.resise;
            var xx = o_suelo.x + dia - irandom(dia * 2);
            var yy = o_suelo.y + dia - irandom(dia * 2);
            adondeveo = point_direction(x, y, xx, yy);
        }
        else
        {
            adondeveo = irandom(359);
        }
    }
    
    //mirar a punto puesto
    var ant = s_angulo16(direction);
    var ad = angle_difference(direction, adondeveo);
    if abs(ad) >= 4
    {
        velg = m_velgiro * sign(ad);
    }
    else
    {
        velg *= m_fricgiro;
    }
    direction -= velg * 1.25 * dlt;
    if !audio_is_playing(a_map_torregira) and
        ant != s_angulo16(direction)
    {
        audio_play_sound(a_map_torregira, 5, false);
    }
    
    //recargar disparo
    if reloj_recarga != 0
    {
        reloj_recarga -= dlt;
        if reloj_recarga <= 0
        {
            reloj_recarga = 0;
        }
    }
    else if irandom(1) < 0.333 and //disparar a robots
        (instance_exists(o_edificio) or !conedificios)
    {
        var paso = m_rad_m * 0.5;
        var visto = false;
        var edi = false;
        var xx, yy, otro;
        
        //no haya edificios en frente
        for (var i = paso; i <= m_laser; i += paso)
        {
            xx = x + lengthdir_x(i, direction);
            yy = y + lengthdir_y(i, direction);
            otro = s_colision(xx, yy, paso, o_edificio,
                m_rad_m * 2, 1, -1);
            if otro != noone
            {
                edi = true;
                break;
            }
        }
        
        if !edi
        {
            //buscar si colisiona con robots
            for (var i = paso; i <= m_laser; i += paso)
            {
                xx = x + lengthdir_x(i, direction);
                yy = y + lengthdir_y(i, direction);
                otro = s_colision(xx, yy, paso, o_altobloq,
                    m_rad_m, 1, id);
                if otro != noone
                {
                    if otro.object_index == o_robot
                    {
                        if s_chequeorobot(otro.origen, m_funcional)
                        {
                            visto = true;
                        }
                    }
                    else if otro.object_index == o_asediador
                    {
                        visto = true;
                    }
                    break;
                }
            }
        }
        
        //crear el proyectil
        if visto
        {
            reloj_recarga = m_torrerecarg;
            var pp = instance_create(
                x + lengthdir_x(20, direction),
                y + lengthdir_y(20, direction),
                o_proy);
            pp.direction = direction + 4 - random(8);
            pp.origen = id;
        }
    }
}

