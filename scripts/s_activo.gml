//reloj para activar y desactivar cuando golpeado
//arg0: id instancia que llama
//arg1: id del reloj
//arg2: periodo del reloj

with argument0
{
    if golpeado
    {
        reloj_anima[argument1] += dlt;
        if reloj_anima[argument1] >= argument2
        {
            reloj_anima[argument1] = 0;
            
            activo = choose(true, false);
        }
    }
    
    if random(1) <= 0.1
    {
        if estado == m_roto
        {
            s_particulas(x + (16 - irandom(32)) * o_game.escint,
                y + (16 - irandom(32)) * o_game.escint, false, 0);
        }
        else if !activo
        {
            s_particulas(x + (16 - irandom(32)) * o_game.escint,
                y + (16 - irandom(32)) * o_game.escint, false, 1);
        }
    }
}
