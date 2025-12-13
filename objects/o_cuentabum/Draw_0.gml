draw_set_valign(fa_bottom);
draw_set_halign(fa_center);
var val = clamp(asenso, 0, m_asenparti) / m_asenparti;
draw_text_transformed_colour(x, y - (asenso + 75), string_hash_to_newline(numero),
    1 + val * 3, 1 + val * 3,
    0, c_white, c_white, c_white, c_white, 1 - val * 0.8);

