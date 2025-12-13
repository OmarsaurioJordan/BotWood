instance_create(room_width - 405, room_height - 405, o_suelo);
instance_create(0, 0, o_creador);
o_game.pausa = true;
if o_game.cargamapaedit
{
    s_openmap();
}

s_ponemusica();