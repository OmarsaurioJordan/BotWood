//crea las particulas correspondientes
//arg0: posicion x
//arg1: posicion y
//arg2: true si robot, false interno
//arg3: subimagen de particulas

var hu = instance_create(argument0, argument1, o_particulas);

if argument2
{
    hu.depth = -hu.y;
    hu.extra = 32;
}
else
{
    hu.escala = o_game.escint;
}
hu.tipo = argument3;
