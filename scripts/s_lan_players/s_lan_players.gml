///s_lan_players();
function s_lan_players() {
	var tot = 0;
	with o_gamepad {
		for (var i = 0; i < 12; i++) {
			if user_ip[i] != "" {
				tot++;
			}
		}
	}
	return tot;
}
