var _sprite_state = 0;

if (_damage_cooldown > 0){
	_sprite_state = 1;
}

if (destoryed){
	_sprite_state = 2;
}

if (global.debug_mode)
{
    draw_set_color(c_red);
    
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
    
    draw_set_color(c_white);
}

image_index = _sprite_state

draw_sprite(sprite_index, image_index, x, y);

if (turret_type && !destoryed){
	if (global.debug_mode)
		{
		    draw_set_color(c_maroon);
    
		    draw_line(x + tur_xoffset, y + tur_yoffset, target_x, target_y);
    
		    draw_set_color(c_white);
		}
	draw_sprite_ext(turret_sprite, image_index, x + tur_xoffset, y + tur_yoffset, 1, 1, (round(tur_direction/15)*15) + 90,c_white, 1);
}

