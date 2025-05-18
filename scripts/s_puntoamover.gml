// arg0: id origen
// arg1: id personaje
// arg2: radio minimo de movimiento
// arg3: radio de ubicar el punto xx,yy

var ddd = point_direction(argument0.x, argument0.y, argument1.x, argument1.y);
var xx = argument0.x + lengthdir_x(argument3, ddd);
var yy = argument0.y + lengthdir_y(argument3, ddd);
var kien = argument1.quien;
if point_distance(argument1.x, argument1.y, xx, yy) > argument2
{
    o_gamepad.user_direction[kien - 1] = point_direction(argument1.x, argument1.y, xx, yy);
}
else
{
    o_gamepad.user_direction[kien - 1] = -1;
}

