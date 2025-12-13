if ds_map_find_value(async_load, "event_type") == "gamepad discovered"
{
    if o_game.compartepad
    {
        var cc = -1;
        for (var n = 1; n <= 12; n++)
        {
            for (var i = 0; i < 12; i++)
            {
                if elcontrol[i, 0] == n or elcontrol[i, 1] == n { break; }
                else if i == 11 { cc = n; }
            }
            if cc != -1 { break; }
        }
        if cc == -1
        {
            for (var i = 11; i >= 0; i--)
            {
                if elcontrol[i, 1] != -1
                {
                    cc = elcontrol[i, 1];
                    elcontrol[i, 1] = -1;
                    break;
                }
            }
            elcontrol[ds_map_find_value(async_load, "pad_index"), 0] = cc;
        }
        else
        {
            elcontrol[ds_map_find_value(async_load, "pad_index"), 0] = cc;
            cc = -1;
            for (var n = 12; n >= 1; n--)
            {
                for (var i = 0; i < 12; i++)
                {
                    if elcontrol[i, 0] == n or elcontrol[i, 1] == n { break; }
                    else if i == 11 { cc = n; }
                }
                if cc != -1 { break; }
            }
            elcontrol[ds_map_find_value(async_load, "pad_index"), 1] = cc;
        }
    }
    else
    {
        for (var i = 0; i < 12; i++)
        {
            elcontrol[i, 1] = -1;
        }
        var cc = -1;
        for (var n = 1; n <= 12; n++)
        {
            for (var i = 0; i < 12; i++)
            {
                if elcontrol[i, 0] == n { break; }
                else if i == 11 { cc = n; }
            }
            if cc != -1 { break; }
        }
        elcontrol[ds_map_find_value(async_load, "pad_index"), 0] = cc;
    }
    gamepad_set_button_threshold(ds_map_find_value(async_load, "pad_index"), 0.5);
}
else if ds_map_find_value(async_load, "event_type") == "gamepad lost"
{
    var i = ds_map_find_value(async_load, "pad_index");
    elcontrol[i, 0] = -1;
    elcontrol[i, 1] = -1;
    s_set_salgase(1 + i, m_relojlobby);
}
