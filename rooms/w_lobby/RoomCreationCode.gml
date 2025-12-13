var s = instance_create(room_width * 0.5, room_height * 0.5, o_suelo);
s.resise = sqrt(sqr(room_width * 0.5) + sqr(room_height * 0.5)) / 390;

instance_create(o_suelo.x + 150, room_height * 0.2, o_reloj);
instance_create(o_reloj.x, o_reloj.y + 34, o_puerta); //solo por hacer colision invisible

instance_create(room_width * 0.15, room_height * 0.9, o_pacificante);

o_game.escint = 1;

var p;

p = instance_create(o_suelo.x + 150, o_suelo.y + 40, o_pichirilo);
p.depth = -p.y;
p.direction = 15;

p = instance_create(room_width * 0.25 + 150, room_height * 0.25 + 40, o_pichirilo);
p.depth = -p.y;
p.direction = 11;

p = instance_create(room_width * 0.75 + 150, room_height * 0.25 + 40, o_pichirilo);
p.depth = -p.y;
p.direction = 12;

p = instance_create(room_width * 0.25 + 150, room_height * 0.75 + 40, o_pichirilo);
p.depth = -p.y;
p.direction = 13;

p = instance_create(room_width * 0.75 + 150, room_height * 0.75 + 40, o_pichirilo);
p.depth = -p.y;
p.direction = 14;

instance_create(room_width * 0.25 + 54, room_height * 0.25 + 40 - 96, o_selectia);
instance_create(room_width * 0.75 + 225, room_height * 0.25 + 40 - 96, o_selectia);
instance_create(room_width * 0.25 + 54, room_height * 0.75 + 40 + 96, o_selectia);
instance_create(room_width * 0.75 + 225, room_height * 0.75 + 40 + 96, o_selectia);

for (var i = 1; i <= 12; i++)
{
    p = instance_create(
        o_suelo.x + 150 + lengthdir_x(m_radint * 0.25, (i + 7) * 30),
        o_suelo.y + 40 + lengthdir_y(m_radint * 0.25, (i + 7) * 30),
        o_elmen);
    p.quien = i;
}

var pp = instance_create(room_width * 0.1 + 120, room_height * 0.2, o_puerta);
pp.seleccion = 27;

instance_create(room_width * 0.15, room_height * 0.6, o_semibot);

s_ponemusica();