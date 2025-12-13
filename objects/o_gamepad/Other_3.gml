ini_open("configuracion.ini");
ini_write_string("config", "msk_lan", msk_lan);
ini_write_string("config", "dir_lan", dir_lan);
ini_close();
network_destroy(servidor);
