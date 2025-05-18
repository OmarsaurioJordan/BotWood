//arg0: posicion x para iniciar chequeo
//arg1: posicion y para iniciar chequeo
//arg2: angulo de busqueda
//arg3: distancia a buscar
//arg4: dimension de paso, radio quien busca
//arg5: objeto con el cual colisionar
//arg6: radio objetos para colisionar
//arg7: id de exclusion de colision, o -1
//ret: true si encontro colision

var respuesta = false;

var xx, yy, otro;
for (var i = argument4; i <= argument3; i += argument4)
{
    xx = argument0 + lengthdir_x(i, argument2);
    yy = argument1 + lengthdir_y(i, argument2);
    otro = s_colision(xx, yy, argument4, argument5,
        argument6, 1, argument7);
    if otro != noone
    {
        if otro.object_index != o_globo and
            otro.object_index != o_asediador and
            otro.object_index != o_robot and
            otro.object_index != o_casa and
            otro.object_index != o_arbol and
            otro.object_index != o_edificio
        {
            respuesta = true;
            break;
        }
    }
}

return respuesta;
