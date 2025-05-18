//modalidad por vidas, al acabarse se destruye el robot
//arg0: id robot a operar

var joderlo = false;
argument0.origen.vidas--;
if argument0.origen.vidas == 0
{
    joderlo = true;
}
else if argument0.origen.vidas > 0
{
    audio_play_sound(a_bot_malaparte, 85, false);
    with argument0.origen
    {
        repeat 8
        {
            s_particulas(
                x + (m_radint - irandom(m_radint * 2)) * o_game.escint * 0.65,
                y + (m_radint - irandom(m_radint * 2)) * o_game.escint * 0.65,
                false, 0);
        }
    }
}

if joderlo
{
    //dejar caer las piezas mecanicas
    s_caemaquina(argument0, 0);
    s_caemaquina(argument0, 1);
    s_caemaquina(argument0, 2);
    
    //hacer damage a todo el bot
    argument0.origen.cabeza = false;
    argument0.origen.laser = false;
    for (var i = 0; i < 13; i++)
    {
        argument0.origen.mach[i].estado = m_roto;
    }
    audio_play_sound(a_bot_murio, 85, false);
    
    //dejar caer las bolas
    s_ponebolas(argument0.origen.mach[m_bodega].municion, argument0.x, argument0.y);
    argument0.origen.mach[m_bodega].municion = 0;
    
    //sacar a los jugadores de las maquinas
    var cercano;
    var tipito;
    with o_jugador
    {
        if maquina != -1
        {
            if maquina.estado == m_roto
            {
                maquina = -1;
            }
        }
        
        cercano = instance_nearest(x, y, o_salon);
        if cercano == argument0.origen
        {
            tipito = instance_create(argument0.x, argument0.y, o_ciudadano);
            if quien < m_rosado
            {
                tipito.quien = quien;
            }
            instance_destroy();
        }
    }
}
