/// @description sonido tos y pajaros
if instance_exists(o_pacificante) or instance_exists(o_elman)
{
    audio_play_sound(a_men_tos, 99, false);
}
if random(1) < instance_number(o_arbol) / m_arbolespaja
{
    audio_play_sound(a_map_pajaros, 5, false);
}
alarm[2] = room_speed * (10 + irandom(20));

