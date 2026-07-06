depth = -room_height;

for (var i = 0; i < 360; i += 10)
{
    instance_create(
        x + lengthdir_x(m_radint * o_game.escint, i),
        y + lengthdir_y(m_radint * o_game.escint, i),
        o_pichirilo);
}

sobrecal = false;
calor = 0;
autodestruir = 60000000;
vidas = o_game.maxvidas;

cabeza = true;
laser = true;
reloj_cabeza = 0;
if x < room_width * 0.5
{
    if y < room_height * 0.5
    {
        ident = 0;
    }
    else
    {
        ident = 2;
    }
}
else
{
    if y < room_height * 0.5
    {
        ident = 1;
    }
    else
    {
        ident = 3;
    }
}

// a partir de aqui se hicieron cambios en el branch
var ff = instance_create(x, y - m_radint * o_game.escint * 0.5, o_pichirilo);
ff.direction = 11 + ident;

var d = 0.25;
mach[m_arriba] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 90),
    y + lengthdir_y(m_radint * o_game.escint * d, 90),
    o_pedales);
mach[m_abajo] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 270),
    y + lengthdir_y(m_radint * o_game.escint * d, 270),
    o_pedales);
mach[m_izquierda] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 180),
    y + lengthdir_y(m_radint * o_game.escint * d, 180),
    o_pedales);
mach[m_derecha] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 0),
    y + lengthdir_y(m_radint * o_game.escint * d, 0),
    o_pedales);

d = 0.75;
mach[m_manecillas] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 90 - 15),
    y + lengthdir_y(m_radint * o_game.escint * d, 90 - 15),
    o_manivela);
mach[m_nomanecillas] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 90 + 15),
    y + lengthdir_y(m_radint * o_game.escint * d, 90 + 15),
    o_manivela);

mach[m_disparo] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 150),
    y + lengthdir_y(m_radint * o_game.escint * d, 150),
    o_boton);
mach[m_golpe] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 30),
    y + lengthdir_y(m_radint * o_game.escint * d, 30),
    o_boton);

mach[m_tensadisp] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 180),
    y + lengthdir_y(m_radint * o_game.escint * d, 180),
    o_tensor);
mach[m_tensagolp] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 0),
    y + lengthdir_y(m_radint * o_game.escint * d, 0),
    o_tensor);

mach[m_refrigera] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 240),
    y + lengthdir_y(m_radint * o_game.escint * d, 240),
    o_ventilador);

mach[m_bodega] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 270),
    y + lengthdir_y(m_radint * o_game.escint * d, 270),
    o_grua);

mach[m_comida] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 300),
    y + lengthdir_y(m_radint * o_game.escint * d, 300),
    o_alimento);
/*
var dp = point_direction(x, y, o_suelo.x, o_suelo.y);
var ff = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * 0.35, dp),
    y + lengthdir_y(m_radint * o_game.escint * 0.35, dp),
    o_pichirilo);
ff.direction = 11 + ident;

mach[m_refrigera] = instance_create(x, y, o_ventilador);

var d = 0.75;
mach[m_arriba] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 90),
    y + lengthdir_y(m_radint * o_game.escint * d, 90),
    o_pedales);
mach[m_abajo] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 270),
    y + lengthdir_y(m_radint * o_game.escint * d, 270),
    o_pedales);
mach[m_izquierda] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 180),
    y + lengthdir_y(m_radint * o_game.escint * d, 180),
    o_pedales);
mach[m_derecha] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 0),
    y + lengthdir_y(m_radint * o_game.escint * d, 0),
    o_pedales);

mach[m_manecillas] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 60),
    y + lengthdir_y(m_radint * o_game.escint * d, 60),
    o_manivela);
mach[m_nomanecillas] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 120),
    y + lengthdir_y(m_radint * o_game.escint * d, 120),
    o_manivela);

mach[m_disparo] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 150),
    y + lengthdir_y(m_radint * o_game.escint * d, 150),
    o_boton);
mach[m_golpe] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 30),
    y + lengthdir_y(m_radint * o_game.escint * d, 30),
    o_boton);

mach[m_tensadisp] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 210),
    y + lengthdir_y(m_radint * o_game.escint * d, 210),
    o_tensor);
mach[m_tensagolp] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 330),
    y + lengthdir_y(m_radint * o_game.escint * d, 330),
    o_tensor);

mach[m_bodega] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 240),
    y + lengthdir_y(m_radint * o_game.escint * d, 240),
    o_grua);

mach[m_comida] = instance_create(
    x + lengthdir_x(m_radint * o_game.escint * d, 300),
    y + lengthdir_y(m_radint * o_game.escint * d, 300),
    o_alimento);
*/
