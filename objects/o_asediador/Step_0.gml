if !o_game.pausa
{
    s_anima(id, 0, m_anibot, 4);
    s_errar(id, m_asedioerrar * 0.5, m_asedioerrar * 0.5, 30, 0.25, 0.25);
    semovio_ani = false;
    
    //reloj poner bot en mision o a errar
    reloj_loco -= dlt;
    if reloj_loco <= 0
    {
        reloj_loco = m_asedioloco * 0.75 + irandom(m_asedioloco * 0.25);
        if retirada or aburrido
        {
            loco = choose(true, false, false);
        }
        else
        {
            loco = choose(true, true, false);
        }
    }
    
    //seleccionar blanco: edificio
    if instance_exists(o_edificio)
    {
        aburrido = false;
        blanco = instance_nearest(x, y, o_edificio);
    }
    else
    {
        aburrido = true;
        blanco = -1;
    }
    
    //calculo direccion y aceleracion
    var sonara = false;
    acelm = 0;
    if loco
    {
        if mov_ia
        {
            adondevoy = dir_ia;
            acelm = m_acelmove;
            sonara = true;
        }
    }
    else if retirada or aburrido
    {
        adondevoy = point_direction(o_suelo.x, o_suelo.y, x, y);
        acelm = m_acelmove;
        sonara = true;
    }
    else if blanco != -1
    {
        adondevoy = point_direction(x, y, blanco.x, blanco.y);
        acelm = m_acelmove;
        sonara = true;
    }
    if sonara and !audio_is_playing(a_bot_camina)
    {
        audio_play_sound(a_bot_camina, 5, false);
    }
    
    //correccion de direccion para evadir obstaculos
    var lado = choose(-1, 1);
    var subemira = true;
    var mira = 0;
    for (var i = 0; i < 13; i++)
    {
        lado *= -1;
        subemira = !subemira;
        if subemira
        {
            mira += 15;
        }
        if !s_colinea(x, y, adondevoy + mira * lado, m_laser * 0.2,
            m_rad_m * 0.5, o_bloque, m_rad_m, id)
        {
            adondevoy += mira * lado;
            break;
        }
    }
    
    //calculo de velocidad
    velm = clamp(velm * m_fricmove + acelm * dlt,
        -m_velmove, m_velmove);
    
    //calculo colisiones y movimiento
    var otro = s_colision(x, y, m_rad_m, o_bloque, m_rad_m, 1, id);
    if otro == noone
    {
        x += lengthdir_x(velm * dlt, adondevoy);
        y += lengthdir_y(velm * dlt, adondevoy);
        semovio_ani = velm * 1000000 > 3;
    }
    else
    {
        adondevoy = point_direction(otro.x, otro.y, x, y);
        x += lengthdir_x(m_velmove * dlt, adondevoy);
        y += lengthdir_y(m_velmove * dlt, adondevoy);
        dir_ia = adondevoy;
        switch otro.object_index
        {
            case o_casa:
                s_demolecasa(otro);
                break;
            
            case o_arbol:
                s_arbolcosas(otro, true);
                break;
            
            case o_globo:
                if otro.impulso < m_velglobo * 0.5
                {
                    otro.impulso = m_velglobo * 0.5;
                }
                otro.direction = point_direction(x, y, otro.x, otro.y);
                break;
        }
    }
    
    //comprobar colision con blanco: edificio
    if blanco != -1 and !retirada
    {
        otro = s_colision(x, y, m_rad_m * 1.5, blanco, m_rad_m, 1, -1);
        if otro != noone
        {
            var ag = point_direction(x, y, blanco.x, blanco.y);
            if abs(angle_difference(ag, direction)) <= 30 and
                otro.estructura != 0
            {
                instance_create(x + lengthdir_x(20, direction),
                    y + lengthdir_y(20, direction), o_exploproy);
                s_demoledificio(blanco, true);
                retirada = true;
            }
        }
    }
    
    //comprobar si irse del mapa o limitarse
    if point_distance(x, y, o_suelo.x, o_suelo.y) > m_radext * o_suelo.resise
    {
        if retirada or aburrido
        {
            instance_destroy();
        }
        else
        {
            adondevoy = point_direction(o_suelo.x, o_suelo.y, x, y);
            x = o_suelo.x + lengthdir_x(m_radext * o_suelo.resise, adondevoy);
            y = o_suelo.y + lengthdir_y(m_radext * o_suelo.resise, adondevoy);
            dir_ia = point_direction(x, y, o_suelo.x, o_suelo.y);
        }
    }
    
    //mirar a punto donde se dirige
    var pl;
    otro = s_colision(x, y, 0, o_edificio, m_laser * 0.2, 1, -1);
    if otro != noone
    {
        pl = 2;
    }
    else
    {
        pl = 1;
    }
    var ad = angle_difference(direction, adondevoy);
    if abs(ad) >= 4
    {
        velg = m_velgiro * pl * sign(ad);
    }
    else
    {
        velg *= m_fricgiro;
    }
    direction -= velg * 1.75 * dlt;
    
    depth = -y;
}

