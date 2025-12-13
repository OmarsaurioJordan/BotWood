/// @description s_set_salgase(quien, valor);
/// @param quien
/// @param  valor
function s_set_salgase(argument0, argument1) {

	with o_jugador {
	    if quien == argument0 {
	        relojsalgase = argument1;
	        break;
	    }
	}
	with o_elmen {
	    if quien == argument0 {
	        relojsalgase = argument1;
	        break;
	    }
	}
	with o_ciudadano {
	    if quien == argument0 {
	        relojsalgase = argument1;
	        break;
	    }
	}




}
