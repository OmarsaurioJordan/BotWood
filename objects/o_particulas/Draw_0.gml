var val = clamp(asenso, 0, m_asenparti * escala) / (m_asenparti * escala);
draw_sprite_ext(d_particulas, tipo, x, y - (asenso + extra),
    (1 + val * 2) * escala * 0.3, (1 + val * 2) * escala * 0.3,
    direction, c_white, 1 - val * 0.8);

