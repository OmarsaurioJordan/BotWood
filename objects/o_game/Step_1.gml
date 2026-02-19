/// @description delta
dlts = min(100000, delta_time);
if pausa {
    dlt = 0;
}
else {
    dlt = dlts * m_esc_dlt;
}
