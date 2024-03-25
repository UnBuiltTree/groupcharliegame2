var _sprite_state = 0;

if (hspeed > 0){
	_sprite_state = 4;
} else if (hspeed < 0){
	_sprite_state = 2;
}
if (vspeed < 0){
	_sprite_state = _sprite_state + 1
}

image_index = _sprite_state
draw_sprite(sprite_index, image_index, x, y);



draw_sprite(spr_bomb_crosshair, 1, x, y - 192);

