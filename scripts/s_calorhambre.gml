//modifica las variables de calor del robot y hambre de un jugador
//arg0: id del salon del robot
//arg1: codigo del jugador
//arg2: cambio de la temperatura
//arg3: cambio en el hambre del jugador

with o_jugador
{
    if quien == argument1
    {
        hambre = clamp(hambre + argument3, 0, m_hambre);
        break;
    }
}
argument0.calor = clamp(argument0.calor + argument2, 0, m_calor);
