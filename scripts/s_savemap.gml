//guarda el mapa que se esta editando

if file_exists("bwmap_user.ini")
{
    file_delete("bwmap_user.ini");
}

ini_open("bwmap_user.ini");

var i, n, m;

//guardar todo tal cual, en sus posiciones
for (i = 0; i < 18; i++)
{
    m = object_get_name(s_seleobj(i));
    n = 0;
    with s_seleobj(i)
    {
        ini_write_string(m, "x" + string(n), string(x - o_suelo.x));
        ini_write_string(m, "y" + string(n), string(y - o_suelo.y));
        n++;
    }
}

//guardar informacion especial digerible para el juego
for (i = 0; i < 18; i++)
{
    switch i
    {
        case 0: case 1: case 2:
        case 3: case 4: case 5:
        case 6: case 7: case 8:
        case 10: case 11: case 15:
        case 16:
            break;
        
        case 9:
            with o_puntoini
            {
                ini_write_string("inicio", "x" + string(direction),
                    string(x - o_suelo.x));
                ini_write_string("inicio", "y" + string(direction),
                    string(y - o_suelo.y));
            }
            break;
        
        case 12:
            n = 0;
            with s_seleobj(i)
            {
                ini_write_string("o_puntoasedio", "g" + string(n),
                    string(point_direction(o_suelo.x, o_suelo.y, x, y)));
                n++;
            }
            ini_write_string("o_puntoasedio", "num", string(n));
            break;
        
        case 13:
            ini_write_string("config", "munidron",
                string(instance_number(o_munidron)));
            break;
        
        case 14:
            ini_write_string("config", "munibot",
                string(clamp(instance_number(o_munibot), 0, m_municion)));
            break;
        
        case 17:
            if instance_exists(o_paz)
            {
                ini_write_string("config", "paz", "1");
            }
            else
            {
                ini_write_string("config", "paz", "0");
            }
            break;
    }
}

ini_close();
