var val = clamp(reloj, 0, 1000000) / 1000000;
draw_sprite_ext(d_particulas, 1, x, y - 49,
    (1 + val * 1.5) * 0.3, (1 + val * 1.5) * 0.3,
    direction, c_white, 1 - val * 0.8);

