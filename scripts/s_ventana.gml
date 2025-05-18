//s_ventana();
//acomoda ventana al tamanno del monitor

var eh, er, w, h;

eh = 0.85;//porcentaje de altura pantalla
er = room_height / room_width;//relaccion h / w ventana

h = display_get_height() * eh;
w = h / er;

if window_get_height() != h {
    window_set_size(w, h);
    window_set_position(
        (display_get_width() - w) * 0.5,
        display_get_height() * 0.05); //distancia respecto borde superior
}

