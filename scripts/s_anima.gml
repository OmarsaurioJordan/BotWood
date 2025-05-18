//reloj de animacion para sprites de subimagenes
//arg0: id instancia que llama
//arg1: id de la animacion
//arg2: periodo de la animacion
//arg3: cuantas sub-imagenes son

with argument0
{
    reloj_anima[argument1] += dlt;
    if reloj_anima[argument1] >= ceil(argument2 / argument3)
    {
        reloj_anima[argument1] = 0;
        
        anima[argument1]++;
        if anima[argument1] >= argument3
        {
            anima[argument1] = 0;
        }
    }
}
