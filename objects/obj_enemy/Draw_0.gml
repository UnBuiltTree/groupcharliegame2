draw_sprite_ext(sdw_sprite, image_index, x, y+48, -1, -1, 0, c_white, 0.2);

if (_damage_cooldown > 0){
	draw_sprite_ext(dmg_sprite, image_index, x, y, -1, -1, 0, c_white, 1);
}

draw_sprite_ext(sprite_index, image_index, x, y, -1, -1, 0, c_white, 1);