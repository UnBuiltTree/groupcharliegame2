/// @description Insert description here
// You can write your code in this editor
if (global.main_menu == true){
	draw_sprite_tiled_ext(sprite_index, image_index, x - 320, y - 320, 2, 2, c_white, 0.1);
} else {
	if (!global.hide_clouds){
		draw_sprite_tiled_ext(sprite_index, image_index, x - 160, y - 160, 1, 1, c_white, 0.1);
	}
}

