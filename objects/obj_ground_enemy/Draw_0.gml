var _sprite_state = 0;

if (_damage_cooldown > 0){
	_sprite_state = 1;
}

if (destoryed){
	_sprite_state = 2;
}

image_index = _sprite_state

draw_sprite(sprite_index, image_index, x, y);

if (turret_type && !destoryed){
	draw_sprite_ext(turret_sprite, image_index, x + tur_xoffset, y + tur_yoffset, 1, 1, (round(tur_direction/15)*15) + 90,c_white, 1);
}

