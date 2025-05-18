//recive respuesta actualizacion de servidor, poner esto en async HTTP
//arg0: id instancia con la informacion
/*
with argument0
{
    if ds_map_find_value(async_load, "id") == hand_rv
    {
        if ds_map_find_value(async_load, "status") == 0
        {
            var aux = ds_map_find_value(async_load, "result");
            if aux != version and string_length(aux) <= 8
            {
                newversion = true;
                ini_open("configuracion.ini");
                ini_write_string("config", "newversion", aux);
                ini_close();
            }
        }
    }
}
*/
