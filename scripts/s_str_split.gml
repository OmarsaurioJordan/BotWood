///s_str_split(str, char_part, sin_vacios, limite);
// arg0: string cadena a partir en array
// arg1: caracter para particion
// arg2: true impedir que halla vacios
// arg3: limite o 0 si ningun limite
// ret: array con los valores string

var vec = noone;
if argument0 != "" {
    var n = 0;
    vec[n] = "";
    var c;
    for (var i = 1; i <= string_length(argument0); i++) {
        c = string_char_at(argument0, i);
        if c == argument1 and (argument3 == 0 or n < argument3 - 1) {
            n++;
            vec[n] = "";
        }
        else {
            vec[n] += c;
        }
    }
    if argument2 {
        var new = noone;
        var m = 0;
        for (var i = 0; i <= n; i++) {
            if vec[i] != "" {
                new[m] = vec[i];
                m++;
            }
        }
        vec = new;
    }
}
return vec;

