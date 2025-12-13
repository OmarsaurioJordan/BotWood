var s = instance_create(room_width * 0.5, room_height * 0.5, o_suelo);
s.resise = sqrt(sqr(room_width * 0.5) + sqr(room_height * 0.5)) / 390;

//puerta del menu
aux = instance_create(room_width * 0.85 + 30, 180, o_puerta);
aux.seleccion = 27;

//opciones de vidas
for (var i = 0; i < 8; i++)
{
    aux = instance_create(room_width * (0.25 + i * 0.5 / 8),
        room_height * 0.8, o_opciones);
    aux.opccc = i;
}
if o_game.onepunch
{
    with o_opciones
    {
        if opccc == o_game.maxvidas - 1
        {
            activa = true;
            break;
        }
    }
}
else if o_game.fatal
{
    with o_opciones
    {
        if opccc == 7
        {
            activa = true;
            break;
        }
    }
}
else
{
    with o_opciones
    {
        if opccc == 6
        {
            activa = true;
            break;
        }
    }
}

//opciones de gamepad
aux = instance_create(room_width * 0.3, room_height * 0.4, o_opciones);
aux.opccc = 8;
if o_game.compartepad
{
    aux.activa = true;
}
aux = instance_create(room_width * 0.3 + 60, room_height * 0.4, o_opciones);
aux.opccc = 9;
if !o_game.compartepad
{
    aux.activa = true;
}

// crear tipo que dice sobre los mapas
instance_create(96, 587, o_pacificante);

instance_create(80, 110, o_titulos);

s_ponemusica();