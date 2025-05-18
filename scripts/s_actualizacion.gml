//busca actualizacion en servidor, pero no lo hace muy seguido
//poner esto al iniciar el juego, la instancia arg0 debe tener antes version="1.0.0"
//arg0: id instancia con la informacion
/*
ini_open("configuracion.ini");
if ini_read_string("config", "newversion", argument0.version) != argument0.version
{
    argument0.newversion = true;
}
else
{
    argument0.newversion = false;
    argument0.hand_rv = -1;
    if ini_read_string("config", "dia_revision_actu", "") != string(current_weekday) and
        os_is_network_connected()
    {
        ini_write_string("config", "dia_revision_actu", string(current_weekday));
        argument0.hand_rv = http_get("http://ojorcio.000webhostapp.com/mysql_omarsauriogames.php?ff=rv&game=botwood&version=?&jugadores=?&puntajes=?&descargas=?&ac=?");
    }
}
ini_close();
*/
