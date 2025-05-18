//hace aparecer en su lugar una pieza cayendo del robot
//arg0: id robot a tratar
//arg1: tipo de pieza, 0:golpe, 1:distancia, 2:grua

with argument0
{
    var ddd = s_angulo16(direction);
    var kae;
    
    switch argument1
    {
        case 0: //golpe
            if lanzado
            {
                lanzado = false;
                with o_bolago
                {
                    if origen == argument0
                    {
                        instance_destroy();
                    }
                }
                with o_bolareg
                {
                    if origen == argument0
                    {
                        instance_destroy();
                    }
                }
            }
            var bm = s_invers16(s_cuadra16(ddd));
            kae = instance_create(
                x + lengthdir_x(18, bm * 22.5),
                y + lengthdir_y(18, bm * 22.5),
                o_caemaquina);
            kae.tipo = 0;
            kae.direction = ddd;
        break;
        
        case 1: //distancia
            var bd = s_cuadra16(ddd);
            kae = instance_create(
                x + lengthdir_x(18, bd * 22.5),
                y + lengthdir_y(18, bd * 22.5),
                o_caemaquina);
            kae.tipo = 1;
            kae.direction = ddd;
        break;
        
        case 2: //grua
            var rr = s_invers16(ddd);
            kae = instance_create(
                x + lengthdir_x(18, rr * 22.5),
                y + lengthdir_y(18, rr * 22.5),
                o_caemaquina);
            kae.tipo = 2;
            if origen.mach[m_bodega].agarro
            {
                origen.mach[m_bodega].agarro = false;
                instance_create(
                    x + lengthdir_x(18, rr * 22.5),
                    y + lengthdir_y(18, rr * 22.5),
                    o_regalo);
            }
        break;
    }
}
