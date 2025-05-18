//mira si la parte a fallar en efecto debe fallar
//arg0: parte a fallar
//arg1: id del salon o base del robot
//ret: el mismo argo o -1

var parte = argument0;

switch parte
{
    case m_cabeza:
        if !argument1.cabeza { parte = -1; }
        break;
    
    case m_refrigera:
        if argument1.mach[m_refrigera].estado == m_roto { parte = -1; }
        break;
    
    case m_arriba:
        if argument1.mach[m_arriba].estado == m_roto
        {
            parte = -1;
        }
        else if argument1.mach[m_arriba].golpeado
        {
            if !(argument1.mach[m_derecha].golpeado and
                argument1.mach[m_abajo].golpeado and
                argument1.mach[m_izquierda].golpeado)
            {
                parte = -1;
            }
        }
        break;
    
    case m_abajo:
        if argument1.mach[m_abajo].estado == m_roto
        {
            parte = -1;
        }
        else if argument1.mach[m_abajo].golpeado
        {
            if !(argument1.mach[m_derecha].golpeado and
                argument1.mach[m_arriba].golpeado and
                argument1.mach[m_izquierda].golpeado)
            {
                parte = -1;
            }
        }
        break;
    
    case m_izquierda:
        if argument1.mach[m_izquierda].estado == m_roto
        {
            parte = -1;
        }
        else if argument1.mach[m_izquierda].golpeado
        {
            if !(argument1.mach[m_derecha].golpeado and
                argument1.mach[m_abajo].golpeado and
                argument1.mach[m_arriba].golpeado)
            {
                parte = -1;
            }
        }
        break;
    
    case m_derecha:
        if argument1.mach[m_derecha].estado == m_roto
        {
            parte = -1;
        }
        else if argument1.mach[m_derecha].golpeado
        {
            if !(argument1.mach[m_arriba].golpeado and
                argument1.mach[m_abajo].golpeado and
                argument1.mach[m_izquierda].golpeado)
            {
                parte = -1;
            }
        }
        break;
    
    case m_manecillas:
        if argument1.mach[m_manecillas].estado == m_roto
        {
            parte = -1;
        }
        else if argument1.mach[m_manecillas].golpeado
        {
            if !argument1.mach[m_nomanecillas].golpeado
            {
                parte = -1;
            }
        }
        break;
    
    case m_nomanecillas:
        if argument1.mach[m_nomanecillas].estado == m_roto
        {
            parte = -1;
        }
        else if argument1.mach[m_nomanecillas].golpeado
        {
            if !argument1.mach[m_manecillas].golpeado
            {
                parte = -1;
            }
        }
        break;
    
    case m_disparo:
        if argument1.mach[m_disparo].estado == m_roto
        {
            parte = -1;
        }
        else if argument1.mach[m_disparo].golpeado
        {
            if !argument1.mach[m_tensadisp].golpeado
            {
                parte = -1;
            }
        }
        break;
    
    case m_golpe:
        if argument1.mach[m_golpe].estado == m_roto
        {
            parte = -1;
        }
        else if argument1.mach[m_golpe].golpeado
        {
            if !argument1.mach[m_tensagolp].golpeado
            {
                parte = -1;
            }
        }
        break;
    
    case m_tensadisp:
        if argument1.mach[m_tensadisp].estado == m_roto
        {
            parte = -1;
        }
        else if argument1.mach[m_tensadisp].golpeado
        {
            if !argument1.mach[m_disparo].golpeado
            {
                parte = -1;
            }
        }
        break;
    
    case m_tensagolp:
        if argument1.mach[m_tensagolp].estado == m_roto
        {
            parte = -1;
        }
        else if argument1.mach[m_tensagolp].golpeado
        {
            if !argument1.mach[m_golpe].golpeado
            {
                parte = -1;
            }
        }
        break;
    
    case m_bodega:
        if argument1.mach[m_bodega].estado == m_roto { parte = -1; }
        break;
    
    case m_comida:
        if argument1.mach[m_comida].estado == m_roto { parte = -1; }
        break;
}

return parte;
