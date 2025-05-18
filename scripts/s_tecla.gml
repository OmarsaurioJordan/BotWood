//elige teclas segun el jugador y su proposito funcional
//arg0: codigo de tecla segun proposito
//arg1: clave de jugador
//ret: id de tecla pc

var respuesta = -1;
switch argument1
{
    case m_rojo:
        switch argument0
        {
            case m_up: respuesta = ord('W'); break;
            case m_left: respuesta = ord('A'); break;
            case m_down: respuesta = ord('S'); break;
            case m_right: respuesta = ord('D'); break;
        }
    break;
    
    case m_azul:
        switch argument0
        {
            case m_up: respuesta = vk_up; break;
            case m_left: respuesta = vk_left; break;
            case m_down: respuesta = vk_down; break;
            case m_right: respuesta = vk_right; break;
        }
    break;
    
    case m_verde:
        switch argument0
        {
            case m_up: respuesta = vk_numpad5; break;
            case m_left: respuesta = vk_numpad1; break;
            case m_down: respuesta = vk_numpad2; break;
            case m_right: respuesta = vk_numpad3; break;
        }
    break;
    
    case m_amarillo:
        switch argument0
        {
            case m_up: respuesta = ord('T'); break;
            case m_left: respuesta = ord('F'); break;
            case m_down: respuesta = ord('G'); break;
            case m_right: respuesta = ord('H'); break;
        }
    break;
    
    case m_morado:
        switch argument0
        {
            case m_up: respuesta = ord('I'); break;
            case m_left: respuesta = ord('J'); break;
            case m_down: respuesta = ord('K'); break;
            case m_right: respuesta = ord('L'); break;
        }
    break;
    
    case m_blanco:
        switch argument0
        {
            case m_up: respuesta = ord('1'); break;
            case m_left: respuesta = ord('2'); break;
            case m_down: respuesta = ord('3'); break;
            case m_right: respuesta = ord('4'); break;
        }
    break;
    
    case m_negro:
        switch argument0
        {
            case m_up: respuesta = ord('7'); break;
            case m_left: respuesta = ord('8'); break;
            case m_down: respuesta = ord('9'); break;
            case m_right: respuesta = ord('0'); break;
        }
    break;
    
    case m_aqua:
        switch argument0
        {
            case m_up: respuesta = vk_delete; break;
            case m_left: respuesta = vk_numpad7; break;
            case m_down: respuesta = vk_numpad8; break;
            case m_right: respuesta = vk_numpad9; break;
        }
    break;
    
    case m_lima:
        switch argument0
        {
            case m_up: respuesta = ord('R'); break;
            case m_left: respuesta = ord('5'); break;
            case m_down: respuesta = ord('6'); break;
            case m_right: respuesta = ord('Y'); break;
        }
    break;
    
    case m_violeta:
        switch argument0
        {
            case m_up: respuesta = ord('V'); break;
            case m_left: respuesta = ord('B'); break;
            case m_down: respuesta = ord('N'); break;
            case m_right: respuesta = ord('M'); break;
        }
    break;
    
    case m_naranja:
        switch argument0
        {
            case m_up: respuesta = ord('Q'); break;
            case m_left: respuesta = ord('P'); break;
            case m_down: respuesta = vk_numpad4; break;
            case m_right: respuesta = vk_numpad6; break;
        }
    break;
    
    case m_gris:
        switch argument0
        {
            case m_up: respuesta = ord('Z'); break;
            case m_left: respuesta = ord('X'); break;
            case m_down: respuesta = ord('C'); break;
            case m_right: respuesta = vk_numpad0; break;
        }
    break;
}
return respuesta;
