//mira si el jugador en cuestion no tiene energia
//arg0: codigo del jugador
//ret: escala segun cansancio

var respuesta = 1;
with o_jugador
{
    if quien == argument0
    {
        if agotado
        {
            respuesta = 0.65;
        }
        break;
    }
}
return respuesta;
