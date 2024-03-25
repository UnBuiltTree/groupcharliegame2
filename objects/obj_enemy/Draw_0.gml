var _sprite_state = 0;

if (_damage_cooldown > 0){
	_sprite_state = 1;
}

image_index = _sprite_state

draw_sprite(sprite_index, image_index, x, y);