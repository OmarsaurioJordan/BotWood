with (other) {
depth = -(room_height * 2);
persistent = true;

globalvar dlt;
dlt = 0;

escint = 1;
eschum = 0.35;
pausa = false;

inmune = false;
munidronsuelo = 0;
oleada = 1;
tipomapa = -1;

ini_open("configuracion.ini");
if ini_read_string("config", "onepunch", "0") == "0" {
    onepunch = false; }
else { onepunch = true; }
if ini_read_string("config", "fatal", "0") == "0" {
    fatal = false; }
else { fatal = true; }
if ini_read_string("config", "compartepad", "0") == "0" {
    compartepad = false; }
else { compartepad = true; }
maxvidas = real(ini_read_string("config", "maxvidas", "3"));
ini_close();

players = "xxxxxxxxxxxx";
bots = "0000";
ayudantes = "0000";
mundo = "bwmap_user.ini";

minutos = 0;
segundos = 0;
reloj = 0;

cargamapaedit = false;

randomize();
alarm[0] = room_speed * 15;

sonido = 2;
audio_master_gain(1);
audio_channel_num(150);

/*
hand_rv = -1;
s_actualizacion(id);
s_http_contador(true);
*/

alarm[2] = 1;

}
