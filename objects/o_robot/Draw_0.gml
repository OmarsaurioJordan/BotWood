//direccion en 16 cortes
var ddd = s_angulo16(direction);

//verificar brazos, recolector y su direccion
var bd, bm, rr, sep;
sep = 18;
rr = -1;
bd = s_cuadra16(ddd);
bm = s_invers16(bd);
if !s_chequeorobot(origen, m_ataquedis)
{
    bd = -1;
}
if !s_chequeorobot(origen, m_ataquemel)
{
    bm = -1;
}
if s_chequeorobot(origen, m_recolecion)
{
    rr = s_invers16(ddd);
}

//recolector al fondo
if rr < 8 and rr >= 0
{
    draw_line_width_colour(x + lengthdir_x(sep, rr * 22.5),
        y + lengthdir_y(sep, rr * 22.5) - 50,
        x + lengthdir_x(sep, rr * 22.5),
        y + lengthdir_y(sep, rr * 22.5) - 5 -
        (1 - origen.mach[m_bodega].accion / m_grua) * 45,
        2, c_gray, c_gray);
    if origen.mach[m_bodega].agarro
    {
        draw_sprite(d_ext_robot, 24, x + lengthdir_x(sep, rr * 22.5),
            y + lengthdir_y(sep, rr * 22.5) - 5 -
            (1 - origen.mach[m_bodega].accion / m_grua) * 45);
    }
    else
    {
        draw_sprite(d_ext_robot, 23, x + lengthdir_x(sep, rr * 22.5),
            y + lengthdir_y(sep, rr * 22.5) - 5 -
            (1 - origen.mach[m_bodega].accion / m_grua) * 45);
    }
    draw_sprite(d_ext_robot, 22, x + lengthdir_x(sep, rr * 22.5),
        y + lengthdir_y(sep, rr * 22.5));
}

//brazito golpeador al fondo
if bm < 8 and bm != -1
{
    if lanzado
    {
        draw_sprite(d_ext_robot, 25 + ddd, x + lengthdir_x(sep, bm * 22.5),
            y + lengthdir_y(sep, bm * 22.5));
    }
    else
    {
        draw_sprite(d_ext_robot, 41 + ddd, x + lengthdir_x(sep, bm * 22.5),
            y + lengthdir_y(sep, bm * 22.5));
    }
}

//brazito disparador al fondo
if bd < 9 and bd > 0
{
    draw_sprite(d_ext_robot, 57 + ddd, x + lengthdir_x(sep, bd * 22.5),
        y + lengthdir_y(sep, bd * 22.5));
}

//piesitos
if !s_chequeorobot(origen, m_movilidad)
{
    draw_sprite(d_ext_robot, 1, x, y);
}
else if semovio_ani
{
    draw_sprite(d_ext_robot, 2 + anima[0], x, y);
}
else// abs(xprevious - x) < 0.2 and abs(yprevious - y) < 0.2
{
    draw_sprite(d_ext_robot, 0, x, y);
}

//cuerpito
draw_sprite(d_ext_robot, 6 + ddd, x, y);

//recolector al frente
if rr >= 8
{
    draw_line_width_colour(x + lengthdir_x(sep, rr * 22.5),
        y + lengthdir_y(sep, rr * 22.5) - 50,
        x + lengthdir_x(sep, rr * 22.5),
        y + lengthdir_y(sep, rr * 22.5) - 5 -
        (1 - origen.mach[m_bodega].accion / m_grua) * 45,
        2, c_gray, c_gray);
    if origen.mach[m_bodega].agarro
    {
        draw_sprite(d_ext_robot, 24, x + lengthdir_x(sep, rr * 22.5),
            y + lengthdir_y(sep, rr * 22.5) - 5 -
            (1 - origen.mach[m_bodega].accion / m_grua) * 45);
    }
    else
    {
        draw_sprite(d_ext_robot, 23, x + lengthdir_x(sep, rr * 22.5),
            y + lengthdir_y(sep, rr * 22.5) - 5 -
            (1 - origen.mach[m_bodega].accion / m_grua) * 45);
    }
    draw_sprite(d_ext_robot, 22, x + lengthdir_x(sep, rr * 22.5),
        y + lengthdir_y(sep, rr * 22.5));
}

//brazito golpeador al frente
if bm >= 8
{
    if lanzado
    {
        draw_sprite(d_ext_robot, 25 + ddd, x + lengthdir_x(sep, bm * 22.5),
            y + lengthdir_y(sep, bm * 22.5));
    }
    else
    {
        draw_sprite(d_ext_robot, 41 + ddd, x + lengthdir_x(sep, bm * 22.5),
            y + lengthdir_y(sep, bm * 22.5));
    }
}

//brazito disparador al frente
if bd >= 9 or bd == 0
{
    draw_sprite(d_ext_robot, 57 + ddd, x + lengthdir_x(sep, bd * 22.5),
        y + lengthdir_y(sep, bd * 22.5));
}

//cabezita
if origen.cabeza
{
    draw_sprite_ext(d_ext_cabeza, origen.ident, x, y - 66,
        1, 1, direction, c_white, 1);
}
else
{
    draw_sprite_ext(d_ext_cabeza, 4 + origen.ident, x, y - 66,
        1, 1, direction, c_white, 1);
}

