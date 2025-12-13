var val = clamp(reloj, 0, 1500000) / 1500000;
draw_sprite_ext(d_ext_bloque, 8, x, y,
    1 + val * 0.5, 1 + val * 0.5,
    0, c_white, 1 - val * 0.8);

