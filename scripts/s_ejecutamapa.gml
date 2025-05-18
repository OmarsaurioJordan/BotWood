//lee el archivo ini y alista el juego para comenzar
//arg0: texto nombre del archivo

ini_open(argument0);

var i, n, m;

for (i = 0; i < 18; i++)
{
    switch i
    {
        case 0: case 1: case 2:
        case 3: case 4: case 5:
        case 6: case 7: case 8:
        case 10: case 11: case 15:
        case 16:
            m = object_get_name(s_seleobj(i));
            if ini_section_exists(m)
            {
                n = 0;
                while ini_key_exists(m, "x" + string(n))
                {
                    instance_create(
                        o_suelo.x + real(ini_read_string(m, "x" + string(n), "0")),
                        o_suelo.y + real(ini_read_string(m, "y" + string(n), "0")),
                        s_seleobj(i));
                    n++;
                }
            }
            break;
        
        case 9:
            with o_salon
            {
                if ini_key_exists("inicio", "x" + string(ident))
                {
                    n = instance_create(
                        o_suelo.x + real(ini_read_string("inicio", "x" + string(ident), "0")),
                        o_suelo.y + real(ini_read_string("inicio", "y" + string(ident), "0")),
                        o_robot);
                }
                else
                {
                    n = instance_create(
                        o_suelo.x + (m_radext - irandom(m_radext * 2)) * o_suelo.resise,
                        o_suelo.x + (m_radext - irandom(m_radext * 2)) * o_suelo.resise,
                        o_robot);
                }
                n.origen = id;
            }
            break;
        
        case 12:
            var g;
            for (var n = 0; n < real(ini_read_string("o_puntoasedio", "num", "0")); n++)
            {
                g = real(ini_read_string("o_puntoasedio", "g" + string(n), "0"));
                instance_create(
                    o_suelo.x + lengthdir_x(m_radext * o_suelo.resise, g),
                    o_suelo.y + lengthdir_y(m_radext * o_suelo.resise, g),
                    o_puntoasedio);
            }
            break;
        
        case 13:
            o_game.munidronsuelo = real(ini_read_string("config", "munidron", "0"));
            break;
        
        case 14:
            var mu = real(ini_read_string("config", "munibot", "0"));
            with o_grua
            {
                municion = mu;
            }
            break;
        
        case 17:
            if ini_read_string("config", "paz", "0") == "0"
            {
                o_game.inmune = false;
            }
            else
            {
                o_game.inmune = true;
            }
            break;
    }
}

ini_close();
