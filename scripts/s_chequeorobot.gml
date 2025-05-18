//mira el estado del robot, a ver si sus sistemas estan en orden
//arg0: id origen del robot
//arg1: clave sistema a averiguar
//ret: true si se cumple la condicion de la clave

var respuesta = true;

switch argument1
{
    case m_todomalo:
        respuesta = false;
        var tot = 0;
        for (var i = 0; i < 13; i++)
        {
            if argument0.mach[i].estado == m_roto
            {
                tot++;
            }
        }
        if !argument0.cabeza
        {
            tot++;
        }
        if tot == 14
        {
            respuesta = true;
        }
    break;
    
    case m_funcional:
        var f_movi = true;
        if !s_chequeorobot(argument0, m_movilidad)
        {
            f_movi = false;
        }
        
        var f_mun = true;
        if argument0.mach[m_bodega].municion == 0
        {
            if argument0.mach[m_bodega].estado == m_roto or !f_movi
            {
                f_mun = false;
            }
        }
        
        var f_pun = true;
        if !f_movi and argument0.mach[m_manecillas].estado == m_roto and
            argument0.mach[m_nomanecillas].estado == m_roto
        {
            f_pun = false;
        }
        
        var f_dist = true;
        if !s_chequeorobot(argument0, m_ataquedis)
        {
            f_dist = false;
        }
        else if !f_mun or !f_pun
        {
            f_dist = false;
        }
        
        var f_mel = true;
        if !f_movi or !s_chequeorobot(argument0, m_ataquemel)
        {
            f_mel = false;
        }
        
        if !f_dist and !f_mel
        {
            respuesta = false;
        }
    break;
    
    case m_movilidad:
        if argument0.mach[m_arriba].estado == m_roto and
            argument0.mach[m_derecha].estado == m_roto and
            argument0.mach[m_abajo].estado == m_roto and
            argument0.mach[m_izquierda].estado == m_roto
        {
            respuesta = false;
        }
    break;
    
    case m_recolecion:
        if argument0.mach[m_bodega].estado == m_roto
        {
            respuesta = false;
        }
    break;
    
    case m_ataquedis:
        if argument0.mach[m_disparo].estado == m_roto and
            argument0.mach[m_tensadisp].estado == m_roto
        {
            respuesta = false;
        }
    break;
    
    case m_ataquemel:
        if argument0.mach[m_golpe].estado == m_roto and
            argument0.mach[m_tensagolp].estado == m_roto
        {
            respuesta = false;
        }
    break;
}

return respuesta;
