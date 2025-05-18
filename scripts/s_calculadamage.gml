//dice que parte del robot se desmejora luego de un impacto
//arg0: id robot a desmejorar
//arg1: diferencia angular entre frente del robot y colision del impacto
//arg2: true si se desea destruir todo de una vez

//ver si hay algo que destruir
var base = argument0.origen;
if !s_chequeorobot(base, m_todomalo)
{
    //ver cual de las 4 zonas superiores sera mas afectada
    var zona;
    if abs(argument1) <= 45
    {
        zona = 0; //frente
    }
    else if abs(argument1) >= 135
    {
        zona = 2; //atras
    }
    else if argument1 > 0
    {
        zona = 1; //izquierda/disparo
    }
    else
    {
        zona = 3; //derecha/golpe
    }
    
    //ver cual de las 4 zonas inferiores sera mas afectada
    var cuadra;
    if point_distance(argument0.x, argument0.y, o_suelo.x, o_suelo.y) / m_radext <= m_radext * 0.4
    {
        cuadra = 0; //todas con igual probabilidad
    }
    else
    {
        var dirmap = point_direction(o_suelo.x, o_suelo.y, argument0.x, argument0.y);
        if dirmap <= 45
        {
            cuadra = 1; //derecha
        }
        else if dirmap <= 135
        {
            cuadra = 2; //arriba
        }
        else if dirmap <= 225
        {
            cuadra = 3; //izquierda
        }
        else if dirmap <= 315
        {
            cuadra = 4; //abajo
        }
        else
        {
            cuadra = 1; //derecha
        }
    }
    
    //hacer busqueda probabilistica de parte rompible
    var quiensufre;
    do
    {
        quiensufre = s_probabilidamage(zona, cuadra);
        quiensufre = s_chequeodamage(quiensufre, base);
    }
    until quiensufre != -1;
    
    //hacer estadistica de como estan las piezas
    var ch_d = s_chequeorobot(base, m_ataquedis);
    var ch_m = s_chequeorobot(base, m_ataquemel);
    var ch_r = s_chequeorobot(base, m_recolecion);
    
    //hacer damage a la parte escogida
    if quiensufre == m_cabeza
    {
        base.cabeza = false;
        base.laser = false;
    }
    else if !base.mach[quiensufre].golpeado and !o_game.fatal
    {
        base.mach[quiensufre].golpeado = true;
        with base.mach[quiensufre]
        {
            repeat 6
            {
                s_particulas(x + (16 - irandom(32)) * o_game.escint,
                    y + (16 - irandom(32)) * o_game.escint, false, 0);
            }
        }
    }
    else
    {
        base.mach[quiensufre].estado = m_roto;
    }
    
    //mirar si esta comprometida toda una funcion
    if quiensufre != m_cabeza
    {
        if base.mach[quiensufre].estado == m_roto
        {
            switch quiensufre
            {
                case m_arriba:
                case m_derecha:
                case m_abajo:
                case m_izquierda:
                    base.mach[m_arriba].estado = m_roto;
                    base.mach[m_derecha].estado = m_roto;
                    base.mach[m_abajo].estado = m_roto;
                    base.mach[m_izquierda].estado = m_roto;
                    break;
                
                case m_disparo:
                case m_tensadisp:
                    base.mach[m_disparo].estado = m_roto;
                    base.mach[m_tensadisp].estado = m_roto;
                    break;
                
                case m_golpe:
                case m_tensagolp:
                    base.mach[m_golpe].estado = m_roto;
                    base.mach[m_tensagolp].estado = m_roto;
                    break;
                
                case m_manecillas:
                case m_nomanecillas:
                    base.mach[m_manecillas].estado = m_roto;
                    base.mach[m_nomanecillas].estado = m_roto;
                    break;
            }
        }
    }
    
    //si no es funcional el bot, acabar de destruirlo todo
    if !s_chequeorobot(base, m_funcional) or argument2
    {
        base.cabeza = false;
        for (var i = 0; i < 13; i++)
        {
            base.mach[i].estado = m_roto;
        }
    }
    
    //ver si debe caer alguna pieza, dependiendo de las estadisticas tomadas
    if s_chequeorobot(base, m_ataquedis) != ch_d
    {
        s_caemaquina(argument0, 1);
    }
    if s_chequeorobot(base, m_ataquemel) != ch_m
    {
        s_caemaquina(argument0, 0);
    }
    if s_chequeorobot(base, m_recolecion) != ch_r
    {
        s_caemaquina(argument0, 2);
    }
    
    //sacar a los jugadores de las maquinas
    var cercano;
    var tipito;
    var jodido = s_chequeorobot(base, m_todomalo);
    if jodido
    {
        audio_play_sound(a_bot_murio, 85, false);
        base.laser = false;
        //dejar caer las bolas
        s_ponebolas(base.mach[m_bodega].municion, argument0.x, argument0.y);
        base.mach[m_bodega].municion = 0;
    }
    else
    {
        audio_play_sound(a_bot_malaparte, 85, false);
    }
    with o_jugador
    {
        if maquina != -1
        {
            if maquina.estado == m_roto
            {
                maquina = -1;
            }
        }
        
        cercano = instance_nearest(x, y, o_salon);
        if cercano == argument0.origen and jodido
        {
            tipito = instance_create(argument0.x, argument0.y, o_ciudadano);
            if quien < m_rosado
            {
                tipito.quien = quien;
            }
            instance_destroy();
        }
    }
}
