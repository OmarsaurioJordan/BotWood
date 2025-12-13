/// @description  inicio tutorial
var tutorial = false;
ini_open("configuracion.ini");
if ini_read_string("config", "tutorial", "1") != "0" {
    tutorial = true; }
ini_write_string("config", "tutorial", "0");
ini_close();
if tutorial
{
    room_goto(w_howto);
}

