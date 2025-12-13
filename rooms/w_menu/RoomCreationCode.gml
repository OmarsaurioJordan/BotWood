s_ventana();
if !instance_exists(o_game)
{
    instance_create(0, 0, o_game);
    instance_create(0, 0, o_gamepad);
}
o_game.pausa = false;
o_game.minutos = 0;
o_game.segundos = 0;
o_game.reloj = 0;
o_game.alarm[3] = -1;
o_game.alarm[4] = 1;

var s = instance_create(room_width * 0.5, room_height * 0.5, o_suelo);
s.resise = sqrt(sqr(room_width * 0.5) + sqr(room_height * 0.5)) / 390;

var aux;
for (var i = 0; i < 24; i++)
{
    aux = instance_create(
        room_width * 0.5 + lengthdir_x(250, i * 15),
        room_height * 0.5 + 50 + lengthdir_y(250, i * 15),
        o_puerta);
    aux.seleccion = i;
}

//puerta de la configuracion y how to play
aux = instance_create(room_width * 0.85 - 30, 200 - 60, o_puerta);
aux.seleccion = 29;
aux = instance_create(room_width * 0.85 + 60, 200, o_puerta);
aux.seleccion = 30;

//puerta del demo
aux = instance_create(room_width * 0.85 + 45, room_height - 50, o_puerta);
aux.seleccion = 24;

//puerta del editor nuevo y abrir
aux = instance_create(room_width * 0.85, room_height * 0.75, o_puerta);
aux.seleccion = 25;
aux = instance_create(room_width * 0.85 + 60, room_height * 0.75 - 60, o_puerta);
aux.seleccion = 26;

var t;
instance_create(80, 110, o_titulos);
t = instance_create(80, 220, o_titulos);
t.direction = 1;
t = instance_create(80, room_height - 50, o_titulos);
t.direction = 2;
t = instance_create(80, 310, o_titulos);
t.direction = 3;
t = instance_create(80, 400, o_titulos);
t.direction = 4;

// crear tipo que dice sobre los mapas
instance_create(170, 587, o_pacificante);

s_ponemusica();