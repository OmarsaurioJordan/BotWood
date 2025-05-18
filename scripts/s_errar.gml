//cada cierto tiempo calcula una nueva trayectoria
//arg0: id instancia que llama
//arg1: tiempo de ciclo fijo de reloj
//arg2: tiempo de ciclo azaroso de reloj
//arg3: angulo maximo de cambio hacia un lado
//arg4: porcentaje probabilidad detener movimiento
//arg5: porcentaje probabilidad continuar movimiento

with argument0
{
    reloj_errar -= dlt;
    if reloj_errar <= 0
    {
        reloj_errar = argument1 + irandom(argument2);
        
        if mov_ia
        {
            if random(1) <= argument4
            {
                mov_ia = false;
            }
            dir_ia += argument3 - irandom(argument3 * 2);
        }
        else
        {
            if random(1) <= argument5
            {
                mov_ia = true;
            }
            dir_ia = irandom(359);
        }
    }
}
