//adecuar la escala de los salones
switch o_game.bots
{
    case "1000":
    case "0100":
    case "0010":
    case "0001":
        o_game.escint = 1.5;
        break;
    
    case "1010":
    case "0101":
        o_game.escint = 1.05;
        break;
    
    default:
        o_game.escint = 0.95;
        break;
}

//crear el suelo del mundo
switch o_game.bots
{
    case "1000":
    case "0010":
        instance_create(room_width - 425, room_height - 405, o_suelo);
        break;
    
    case "1010":
        instance_create(room_width - 470, room_height - 405, o_suelo);
        break;
    
    case "0100":
    case "0001":
        instance_create(425, room_height - 405, o_suelo);
        break;
    
    case "0101":
        instance_create(470, room_height - 405, o_suelo);
        break;
    
    default:
        instance_create(room_width * 0.5, room_height - 405, o_suelo);
        break;
}

//crear los salones de juego
switch o_game.bots //salon izquierda arriba
{
    case "1000":
        instance_create(180 * o_game.escint, room_height * 0.5 - 1, o_salon);
        break;
    
    case "1010":
        instance_create(240 * o_game.escint, 240 * o_game.escint, o_salon);
        break;
    
    case "1111":
    case "1110":
    case "1101":
    case "1100":
    case "1011":
    case "1001":
        instance_create(180 * o_game.escint, 240 * o_game.escint, o_salon);
        break;
}
switch o_game.bots //salon derecha arriba
{
    case "0100":
        instance_create(room_width - 180 * o_game.escint, room_height * 0.5 - 1, o_salon);
        break;
    
    case "0101":
        instance_create(room_width - 240 * o_game.escint, 240 * o_game.escint, o_salon);
        break;
    
    case "1111":
    case "1110":
    case "1101":
    case "1100":
    case "0111":
    case "0110":
        instance_create(room_width - 180 * o_game.escint, 240 * o_game.escint, o_salon);
        break;
}
switch o_game.bots //salon izquierda abajo
{
    case "0010":
        instance_create(180 * o_game.escint, room_height * 0.5 + 1, o_salon);
        break;
    
    case "1010":
        instance_create(240 * o_game.escint, room_height - 190 * o_game.escint, o_salon);
        break;
    
    case "0011":
    case "0110":
    case "0111":
    case "1011":
    case "1110":
    case "1111":
        instance_create(180 * o_game.escint, room_height - 190 * o_game.escint, o_salon);
        break;
}
switch o_game.bots //salon derecha abajo
{
    case "0001":
        instance_create(room_width - 180 * o_game.escint, room_height * 0.5 + 1, o_salon);
        break;
    
    case "0101":
        instance_create(room_width - 240 * o_game.escint, room_height - 190 * o_game.escint, o_salon);
        break;
    
    case "0011":
    case "0111":
    case "1001":
    case "1011":
    case "1101":
    case "1111":
        instance_create(room_width - 180 * o_game.escint, room_height - 190 * o_game.escint, o_salon);
        break;
}

//crear a los ayudantes en sus respectivos salones
if instance_exists(o_salon)
{
    var sal, u;
    var n = 1;
    for (var j = 0; j < 2; j++)
    {
        for (var i = 0; i < 2; i++)
        {
            if string_char_at(o_game.ayudantes, n) == "1"
            {
                sal = instance_nearest(room_width * i, room_height * j, o_salon);
                u = instance_create(sal.x, sal.y, o_jugador);
                u.quien = m_rosado + (n - 1);
            }
            n++;
        }
    }
}

//crear jugadores en sus respectivos salones
if instance_exists(o_salon)
{
    var sal, u, g;
    for (var i = 1; i <= 12; i++)
    {
        switch string_char_at(o_game.players, i)
        {
            case "0":
                sal = instance_nearest(0, 0, o_salon);
                break;
            case "1":
                sal = instance_nearest(room_width, 0, o_salon);
                break;
            case "2":
                sal = instance_nearest(0, room_height, o_salon);
                break;
            case "3":
                sal = instance_nearest(room_width, room_height, o_salon);
                break;
            default: //"x"
                sal = noone;
                break;
        }
        if sal != noone
        {
            g = irandom(359);
            u = instance_create(
                sal.x + lengthdir_x(80 * o_game.escint, g),
                sal.y + lengthdir_y(80 * o_game.escint, g),
                o_jugador);
            u.quien = i;
        }
    }
}

//cargar el mapa seleccionado y prepara el juego
s_ejecutamapa(o_game.mundo);
o_game.munidronsuelo *= instance_number(o_salon);
if o_game.munidronsuelo > 0
{
    repeat max(1, instance_number(o_salon))
    {
        instance_create(o_suelo.x + random(1), o_suelo.y + random(1), o_dron);
    }
}
if instance_exists(o_puntoasedio) and instance_exists(o_edificio)
{
    o_game.oleada = 1;
    var as = instance_find(o_puntoasedio, irandom(instance_number(o_puntoasedio) - 1));
    instance_create(as.x, as.y, o_asediador);
}
s_tipomapa();

s_ponemusica();