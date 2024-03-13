if (hspeed > 0){
	var _sprite_state = 1;
} else if (hspeed < 0){
	var _sprite_state = 2;
} else {
	var _sprite_state = 0;
}

image_index = _sprite_state
draw_sprite(sprite_index, image_index, x, y);





