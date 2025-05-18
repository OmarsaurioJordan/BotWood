//exparce municion(regalo) por el suelo sin que se solapen
//arg0: numero a poner
//arg1: posicion x
//arg2: posicion y

var aux, xx, yy, f;
repeat argument0
{
    f = 0;
    do
    {
        xx = argument1 - m_rad_m * 1.5 + irandom(m_rad_m * 3);
        yy = argument2 - m_rad_m * 1.5 + irandom(m_rad_m * 3);
        f++;
    }
    until s_colision(xx, yy, m_rad_m * 0.5, o_regalo, 0, 1, -1) == noone or f > 20;
    aux = instance_create(xx, yy, o_regalo);
}
