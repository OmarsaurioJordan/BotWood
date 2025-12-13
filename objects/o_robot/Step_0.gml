if !o_game.pausa
{
    s_anima(id, 0, m_anibot, 4);
    semovio_ani = false;
    
    //calcular aceleraciones en funcion de comandos
    acely = 0;
    acelx = 0;
    acelg = 0;
    
    if !origen.sobrecal
    {
        if origen.mach[m_arriba].estado > 0 and origen.mach[m_arriba].activo
        {
            acely -= m_acelmove * s_cansado(origen.mach[m_arriba].estado);
        }
        if origen.mach[m_abajo].estado > 0 and origen.mach[m_abajo].activo
        {
            acely += m_acelmove * s_cansado(origen.mach[m_abajo].estado);
        }
        
        if origen.mach[m_izquierda].estado > 0 and origen.mach[m_izquierda].activo
        {
            acelx -= m_acelmove * s_cansado(origen.mach[m_izquierda].estado);
        }
        if origen.mach[m_derecha].estado > 0 and origen.mach[m_derecha].activo
        {
            acelx += m_acelmove * s_cansado(origen.mach[m_derecha].estado);
        }
        
        if origen.mach[m_manecillas].estado > 0 and origen.mach[m_manecillas].activo
        {
            acelg -= m_acelgiro * s_cansado(origen.mach[m_manecillas].estado);
        }
        if origen.mach[m_nomanecillas].estado > 0 and origen.mach[m_nomanecillas].activo
        {
            acelg += m_acelgiro * s_cansado(origen.mach[m_nomanecillas].estado);
        }
    }
    
    //calcular velocidades
    vely = clamp(vely * m_fricmove + acely * dlt,
        -m_velmove * s_cansado(origen.mach[m_arriba].estado) * m_turbobot,
        m_velmove * s_cansado(origen.mach[m_abajo].estado) * m_turbobot);
    
    velx = clamp(velx * m_fricmove + acelx * dlt,
        -m_velmove * s_cansado(origen.mach[m_izquierda].estado) * m_turbobot,
        m_velmove * s_cansado(origen.mach[m_derecha].estado) * m_turbobot);
    
    velg = clamp(velg * m_fricgiro + acelg * dlt,
        -m_velgiro * s_cansado(origen.mach[m_manecillas].estado) * m_turbobot,
        m_velgiro * s_cansado(origen.mach[m_nomanecillas].estado) * m_turbobot);
    
    //calcular posiciones y colisiones
    direction += velg * dlt;
    
    var otro = s_colision(x, y, m_rad_m, o_bloque, m_rad_m, 1, id);
    
    if impulso != 0
    {
        impulso = clamp(impulso * m_fricmove, 0, m_velroca);
        
        if otro != noone
        {
            dir_imp = point_direction(otro.x, otro.y, x, y);
            if otro.object_index == o_robot
            {
                otro.dir_imp = dir_imp + 180;
                var imp = (impulso + otro.impulso) * 0.5;
                impulso = imp;
                otro.impulso = imp;
            }
            else if otro.object_index == o_pavo
            {
                otro.direction = dir_imp + 180;
                var imp = (impulso + otro.impulso) * 0.5;
                impulso = imp;
                otro.impulso = imp;
            }
        }
        x += lengthdir_x(impulso * dlt, dir_imp);
        y += lengthdir_y(impulso * dlt, dir_imp);
    }
    else
    {
        if otro == noone
        {
            y += vely * dlt;
            x += velx * dlt;
            semovio_ani = point_distance(0, 0, velx, vely) * 1000000 > 5;
        }
        else
        {
            var ddd = point_direction(otro.x, otro.y, x, y);
            x += lengthdir_x(m_velmove * m_turbobot * dlt, ddd);
            y += lengthdir_y(m_velmove * m_turbobot * dlt, ddd);
        }
    }
    
    //que hacer con el colisionado
    if otro != noone
    {
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
    
    //limitar a dentro del circulo
    if point_distance(x, y, o_suelo.x, o_suelo.y) > m_radext * o_suelo.resise * 0.95
    {
        var dirrr = point_direction(o_suelo.x, o_suelo.y, x, y);
        x = o_suelo.x + lengthdir_x(m_radext * o_suelo.resise * 0.95, dirrr);
        y = o_suelo.y + lengthdir_y(m_radext * o_suelo.resise * 0.95, dirrr);
    }
    
    depth = -y;
}

