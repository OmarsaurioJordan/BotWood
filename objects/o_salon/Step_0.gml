if !o_game.pausa
{
    if s_chequeorobot(id, m_todomalo)
    {
        if random(1) <= 0.1
        {
            var myd = id;
            with o_robot
            {
                if origen == myd
                {
                    s_particulas(x + 16 - irandom(32),
                        y + 16 - irandom(32), true, 0);
                }
            }
            if random(1) <= 0.7
            {
                audio_play_sound(a_bot_fuego, 5, false);
            }
        }
    }
    else
    {
        //calcular cambios de temperatura
        calor = clamp(calor - dlt * (m_calor / m_natufrio), 0, m_calor);
        if sobrecal
        {
            if calor <= m_calor * 0.75
            {
                sobrecal = false;
            }
            else if random(1) <= 0.1
            {
                var myd = id;
                with o_robot
                {
                    if origen == myd
                    {
                        s_particulas(x + 16 - irandom(32),
                            y + 16 - irandom(32), true, 1);
                    }
                }
                if random(1) <= 0.7
                {
                    audio_play_sound(a_bot_sobrecal, 5, false);
                }
            }
        }
        else
        {
            if calor >= m_calor * 0.95
            {
                sobrecal = true;
            }
        }
        
        //particulas internas juego por vidas
        if o_game.onepunch
        {
            if random(1) < 0.5 * (1 - vidas / o_game.maxvidas)
            {
                s_particulas(
                    x + (m_radint - irandom(m_radint * 2)) * o_game.escint * 0.65,
                    y + (m_radint - irandom(m_radint * 2)) * o_game.escint * 0.65,
                    false, 1);
            }
        }
        
        //intermitencia cabeza
        if !cabeza
        {
            reloj_cabeza += dlt;
            if reloj_cabeza >= m_reactiva
            {
                reloj_cabeza = 0;
                laser = choose(true, false);
            }
        }
        
        //verificar autodestruccion
        var quiet = true;
        var myid = id;
        with o_jugador
        {
            if instance_nearest(x, y, o_salon) == myid and quien < m_rosado
            {
                if maquina != -1 or (xxp != xx or yyp != yy)
                {
                    quiet = false;
                }
            }
        }
        if quiet
        {
            var via = floor(autodestruir / 1000000);
            autodestruir -= dlt
            if autodestruir <= 0
            {
                with o_robot
                {
                    if origen == myid
                    {
                        s_calculadamage(id, 0, true)
                    }
                }
            }
            else if via <= 5
            {
                if via != floor(autodestruir / 1000000)
                {
                    with o_robot
                    {
                        if origen == myid
                        {
                            var aux = instance_create(x, y + 1, o_cuentabum);
                            aux.numero = string(via);
                        }
                    }
                }
            }
        }
        else
        {
            autodestruir = 20000000;
        }
    }
}

