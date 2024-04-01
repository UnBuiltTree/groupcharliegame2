var _sprite_state = 0;


if (hspeed > 0){
	_sprite_state = 4;
} else if (hspeed < 0){
	_sprite_state = 2;
}
if (vspeed < 0){
	_sprite_state = _sprite_state + 1
}

if (global.debug_mode)
{
    draw_set_color(c_orange);
    
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
    
    draw_set_color(c_white);
}

//draw_sprite_ext(sdw_sprite, image_index, x, y+48, 1, 1, 0, c_white, 0.2);

if (_damage_cooldown > 0){
	draw_sprite_ext(dmg_sprite, image_index, x, y, 1, 1, 0, c_white, 1);
}

if (global.cheat_mode){
	draw_sprite_ext(cheat_sprite, image_index, x, y, 1, 1, 0, c_white, 1);
}


image_index = _sprite_state
draw_sprite(sprite_index, image_index, x, y);

draw_sprite(spr_bomb_crosshair, 1, x, y - 192);

