var _state = 0;

if (global.debug_mode){_state = 1};

if (global.main_menu == true){
	draw_sprite_tiled_ext(sprite_index, _state, x-320, y, 2, 2, c_white, 1);
} else {
	draw_sprite_tiled_ext(sprite_index, _state, x-160, y, 1, 1, c_white, 1);
}



