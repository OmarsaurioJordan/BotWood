//arg0: posicion x para chequear
//arg1: posicion y para chequear
//arg2: radio de quien busca colision
//arg3: objetos con los que colisionar
//arg4: radio de objetos para colisionar
//arg5: factor de escala general
//arg6: id de exclusion de colision, o -1
//ret: noone si no hay colision, o id objeto

var respuesta = noone;

var ddd = (argument2 + argument4) * argument5;
with argument3
{
    if point_distance(argument0, argument1, x, y) < ddd and
        id != argument6
    {
        respuesta = id;
        break;
    }
}

return respuesta;
