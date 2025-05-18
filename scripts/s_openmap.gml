//abre el mapa para ser editado, ojo, No para ser jugado

ini_open("bwmap_user.ini");

var i, n, m;

//posicionar todos los objetos
for (i = 0; i < 18; i++)
{
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
}

//verificar color de los robots iniciadores
if ini_section_exists("inicio") and instance_exists(o_puntoini)
{
    for (i = 0; i < 4; i++)
    {
        if ini_key_exists("inicio", "x" + string(i))
        {
            n = instance_nearest(
                o_suelo.x + real(ini_read_string("inicio", "x" + string(i), "0")),
                o_suelo.y + real(ini_read_string("inicio", "y" + string(i), "0")),
                o_puntoini);
            n.direction = i;
        }
    }
}

ini_close();
