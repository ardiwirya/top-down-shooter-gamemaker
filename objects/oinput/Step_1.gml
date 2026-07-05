//get inputs
global.right = keyboard_check( ord( "D" ) );
global.left = keyboard_check( ord( "A" ) );
global.top = keyboard_check( ord( "W" ) );
global.bottom = keyboard_check( ord( "S" ) );

global.shoot = mouse_check_button( mb_left );
global.changeWeapon = mouse_check_button_pressed( mb_right );

global.startKey = keyboard_check_pressed( vk_enter );