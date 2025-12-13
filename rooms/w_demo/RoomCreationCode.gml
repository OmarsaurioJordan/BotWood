var s = instance_create(room_width * 0.75, room_height * 0.55, o_suelo);
s.resise = 0.4 * 0.8;

o_game.escint = 0.8;
instance_create(room_width * 0.25, room_height * 0.55, o_salon);
o_grua.municion = floor(m_municion * 0.5);

var u;
u = instance_create(o_salon.x - 80 * o_game.escint, o_salon.y, o_jugador);
u.quien = m_rojo;
u = instance_create(o_salon.x + 80 * o_game.escint, o_salon.y, o_jugador);
u.quien = m_azul;

var r = instance_create(o_suelo.x, o_suelo.y, o_robot);
r.origen = o_salon.id;

s_ponemusica();