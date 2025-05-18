// -1 significa no tipo mapa especifico
if instance_exists(o_edificio) and instance_exists(o_asediador) {
    o_game.tipomapa = 0; // salvar la ciudad de robots
}
else if (instance_exists(o_edificio) or (o_game.inmune and !instance_exists(o_aro))) and
        instance_exists(o_torre) {
    o_game.tipomapa = 1; // atacar a la ciudad blindada o torres
}
else if instance_exists(o_globo) and instance_exists(o_aro) {
    o_game.tipomapa = 2; // futsbol
}
else if instance_exists(o_aro) {
    o_game.tipomapa = 3; // carrera
}
else {
    o_game.tipomapa = 4; // pelea normal
}

