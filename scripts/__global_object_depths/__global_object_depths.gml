function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = 0; // o_game
	global.__objectDepths[1] = 0; // o_gamepad
	global.__objectDepths[2] = 0; // o_titulos
	global.__objectDepths[3] = 0; // o_reloj
	global.__objectDepths[4] = 0; // o_opciones
	global.__objectDepths[5] = 0; // o_elman
	global.__objectDepths[6] = 0; // o_selectia
	global.__objectDepths[7] = 0; // o_pacificante
	global.__objectDepths[8] = 0; // o_puerta
	global.__objectDepths[9] = 0; // o_howto
	global.__objectDepths[10] = 0; // o_salon
	global.__objectDepths[11] = 0; // o_maquina
	global.__objectDepths[12] = 0; // o_alimento
	global.__objectDepths[13] = 0; // o_manivela
	global.__objectDepths[14] = 0; // o_pedales
	global.__objectDepths[15] = 0; // o_boton
	global.__objectDepths[16] = 0; // o_ventilador
	global.__objectDepths[17] = 0; // o_grua
	global.__objectDepths[18] = 0; // o_tensor
	global.__objectDepths[19] = 0; // o_bloque
	global.__objectDepths[20] = 0; // o_pavo
	global.__objectDepths[21] = 0; // o_roca
	global.__objectDepths[22] = 0; // o_aro
	global.__objectDepths[23] = 0; // o_torre
	global.__objectDepths[24] = 0; // o_paz
	global.__objectDepths[25] = 0; // o_arbol
	global.__objectDepths[26] = 0; // o_cortina
	global.__objectDepths[27] = 0; // o_edificio
	global.__objectDepths[28] = 0; // o_murito
	global.__objectDepths[29] = 0; // o_globo
	global.__objectDepths[30] = 0; // o_casa
	global.__objectDepths[31] = 0; // o_dron
	global.__objectDepths[32] = 0; // o_jugador
	global.__objectDepths[33] = 0; // o_elmen
	global.__objectDepths[34] = 0; // o_robot
	global.__objectDepths[35] = 0; // o_ave
	global.__objectDepths[36] = 0; // o_ciudadano
	global.__objectDepths[37] = 0; // o_asediador
	global.__objectDepths[38] = 0; // o_munidron
	global.__objectDepths[39] = 0; // o_munibot
	global.__objectDepths[40] = 0; // o_exploproy
	global.__objectDepths[41] = 0; // o_explobot
	global.__objectDepths[42] = 0; // o_cuentabum
	global.__objectDepths[43] = 0; // o_bolago
	global.__objectDepths[44] = 0; // o_bolareg
	global.__objectDepths[45] = 0; // o_proy
	global.__objectDepths[46] = 0; // o_particulas
	global.__objectDepths[47] = 0; // o_semibot
	global.__objectDepths[48] = 0; // o_puntoini
	global.__objectDepths[49] = 0; // o_puntoasedio
	global.__objectDepths[50] = 0; // o_creador
	global.__objectDepths[51] = 0; // o_suelo
	global.__objectDepths[52] = 0; // o_pichirilo
	global.__objectDepths[53] = 0; // o_regalo
	global.__objectDepths[54] = 0; // o_caeregalo
	global.__objectDepths[55] = 0; // o_caemaquina
	global.__objectDepths[56] = 0; // o_altobloq
	global.__objectDepths[57] = 0; // o_decorado
	global.__objectDepths[58] = 0; // o_nodron


	global.__objectNames[0] = "o_game";
	global.__objectNames[1] = "o_gamepad";
	global.__objectNames[2] = "o_titulos";
	global.__objectNames[3] = "o_reloj";
	global.__objectNames[4] = "o_opciones";
	global.__objectNames[5] = "o_elman";
	global.__objectNames[6] = "o_selectia";
	global.__objectNames[7] = "o_pacificante";
	global.__objectNames[8] = "o_puerta";
	global.__objectNames[9] = "o_howto";
	global.__objectNames[10] = "o_salon";
	global.__objectNames[11] = "o_maquina";
	global.__objectNames[12] = "o_alimento";
	global.__objectNames[13] = "o_manivela";
	global.__objectNames[14] = "o_pedales";
	global.__objectNames[15] = "o_boton";
	global.__objectNames[16] = "o_ventilador";
	global.__objectNames[17] = "o_grua";
	global.__objectNames[18] = "o_tensor";
	global.__objectNames[19] = "o_bloque";
	global.__objectNames[20] = "o_pavo";
	global.__objectNames[21] = "o_roca";
	global.__objectNames[22] = "o_aro";
	global.__objectNames[23] = "o_torre";
	global.__objectNames[24] = "o_paz";
	global.__objectNames[25] = "o_arbol";
	global.__objectNames[26] = "o_cortina";
	global.__objectNames[27] = "o_edificio";
	global.__objectNames[28] = "o_murito";
	global.__objectNames[29] = "o_globo";
	global.__objectNames[30] = "o_casa";
	global.__objectNames[31] = "o_dron";
	global.__objectNames[32] = "o_jugador";
	global.__objectNames[33] = "o_elmen";
	global.__objectNames[34] = "o_robot";
	global.__objectNames[35] = "o_ave";
	global.__objectNames[36] = "o_ciudadano";
	global.__objectNames[37] = "o_asediador";
	global.__objectNames[38] = "o_munidron";
	global.__objectNames[39] = "o_munibot";
	global.__objectNames[40] = "o_exploproy";
	global.__objectNames[41] = "o_explobot";
	global.__objectNames[42] = "o_cuentabum";
	global.__objectNames[43] = "o_bolago";
	global.__objectNames[44] = "o_bolareg";
	global.__objectNames[45] = "o_proy";
	global.__objectNames[46] = "o_particulas";
	global.__objectNames[47] = "o_semibot";
	global.__objectNames[48] = "o_puntoini";
	global.__objectNames[49] = "o_puntoasedio";
	global.__objectNames[50] = "o_creador";
	global.__objectNames[51] = "o_suelo";
	global.__objectNames[52] = "o_pichirilo";
	global.__objectNames[53] = "o_regalo";
	global.__objectNames[54] = "o_caeregalo";
	global.__objectNames[55] = "o_caemaquina";
	global.__objectNames[56] = "o_altobloq";
	global.__objectNames[57] = "o_decorado";
	global.__objectNames[58] = "o_nodron";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
