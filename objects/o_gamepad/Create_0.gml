persistent = true;
depth = -room_height;

for (var i = 0; i < 12; i++)
{
    elcontrol[i, 0] = -1;
    elcontrol[i, 1] = -1;
    gamepad_set_axis_deadzone(i, 0.05);
}

mydelta = 0;
ini_open("configuracion.ini");
msk_lan = ini_read_string("config", "msk_lan", "255.255.255.0");
dir_lan = ini_read_string("config", "dir_lan", "192.168.1.0");
ini_close();
reloj_red = 4;
reloj_ping = 0;
puerto = 4749;
servidor = network_create_socket_ext(network_socket_udp, puerto);
if servidor < 0 {
    show_message_async("Fail creating UDP port, No App gamepads");
}
for (var i = 0; i < 12; i++)
{
    user_ip[i] = "";
    user_final[i] = 0; // ping desconexion
    user_direction[i] = -1;
}
edita_ip = dir_lan + "-" + msk_lan;
ip_x = 0.6; // posicion del boton
ip_y = 0.3;
reloj_blink = 0;
go_keyboard = false;
broadcast = ds_stack_create();
saludo_buf = buffer_create(1, buffer_grow, 1);
buffer_seek(saludo_buf, buffer_seek_start, 0);
buffer_write(saludo_buf, buffer_string, "botwood|0|x");
saludo_size = buffer_tell(saludo_buf);
