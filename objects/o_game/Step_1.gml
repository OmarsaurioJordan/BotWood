/// @description delta
if pausa {
    dlt = 0;
}
else {
    dlt = min(100000, delta_time) * m_esc_dlt;
}
