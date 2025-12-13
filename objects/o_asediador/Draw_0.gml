//abs(xprevious - x) < 0.2 and abs(yprevious - y) < 0.2
if semovio_ani
{
    draw_sprite(d_ext_robot, 2 + anima[0], x, y);
}
else
{
    draw_sprite(d_ext_robot, 0, x, y);
}

draw_sprite(d_ext_robot, 78, x, y);

if retirada
{
    draw_sprite(d_ext_robot, 25 + s_angulo16(direction), x, y);
}
else
{
    draw_sprite(d_ext_robot, 41 + s_angulo16(direction), x, y);
}

