//contiene las probabilidades de damage en funcion de la zona
//arg0: zona afectada, 0 fente, 1 izquierda/disparo, 2 atras, 3 derecha/golpe
//arg1: cuadra afectada, 0 todas, 1 derecha, 2 arriba, 3 izquierda, 4 abajo
//ret: clave de la zona afectada

var parte = -1;

//empaqueta grupos de sistemas
var p_movilidad, p_golpe, p_disparo, p_complemento, p_punteria;
p_punteria = choose(m_cabeza, m_manecillas, m_nomanecillas);
p_complemento = choose(m_bodega, m_comida, m_refrigera);
p_disparo = choose(m_tensadisp, m_disparo);
p_golpe = choose(m_tensagolp, m_golpe);
switch argument1
{
    case 0: //todas
        p_movilidad = choose(m_arriba, m_izquierda, m_abajo, m_derecha);
        break;
    case 1: //derecha
        p_movilidad = choose(m_arriba, m_izquierda, m_abajo, m_derecha, m_derecha, m_derecha);
        break;
    case 2: //arriba
        p_movilidad = choose(m_arriba, m_arriba, m_arriba, m_izquierda, m_abajo, m_derecha);
        break;
    case 3: //izquierda
        p_movilidad = choose(m_arriba, m_izquierda, m_izquierda, m_izquierda, m_abajo, m_derecha);
        break;
    case 4: //abajo
        p_movilidad = choose(m_arriba, m_izquierda, m_abajo, m_abajo, m_abajo, m_derecha);
        break;
}

var dado = random(1);
switch argument0
{
    case 0: //frente
        if dado <= 0.02 { parte = p_complemento; }
        else if dado <= 0.05 { parte = p_movilidad; }
        else if dado <= 0.13 { parte = p_disparo; }
        else if dado <= 0.2 { parte = p_golpe; }
        else { parte = p_punteria; }
        break;
    
    case 1: //izquierda/disparo
        if dado <= 0.02 { parte = p_golpe; }
        else if dado <= 0.05 { parte = p_movilidad; }
        else if dado <= 0.13 { parte = p_complemento; }
        else if dado <= 0.2 { parte = p_punteria; }
        else { parte = p_disparo; }
        break;
    
    case 2: //atras
        if dado <= 0.02 { parte = p_punteria; }
        else if dado <= 0.05 { parte = p_golpe; }
        else if dado <= 0.13 { parte = p_disparo; }
        else if dado <= 0.2 { parte = p_movilidad; }
        else { parte = p_complemento; }
        break;
    
    case 3: //derecha/golpe
        if dado <= 0.02 { parte = p_disparo; }
        else if dado <= 0.05 { parte = p_movilidad; }
        else if dado <= 0.13 { parte = p_complemento; }
        else if dado <= 0.2 { parte = p_punteria; }
        else { parte = p_golpe; }
        break;
}

return parte;
