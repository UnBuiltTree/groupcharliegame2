//draw_sprite_ext(sdw_sprite, image_index, x, y+48, -1, -1, 0, c_white, 0.2);

if (global.debug_mode)
{
    draw_set_color(c_orange);
    
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
	
	draw_set_color(c_blue);
	
	if (moving_to_target) {
		
		draw_line(x, y, target_x, target_y);
		
		var bbox_width = bbox_right - bbox_left;
		var bbox_height = bbox_bottom - bbox_top;
		
		var target_bbox_left = target_x - bbox_width * 0.5;
		var target_bbox_top = target_y - bbox_height * 0.5;
		var target_bbox_right = target_x + bbox_width * 0.5;
		var target_bbox_bottom = target_y + bbox_height * 0.5;
		
		draw_rectangle(target_bbox_left, target_bbox_top, target_bbox_right, target_bbox_bottom, true);
		
	}
	
	if (!moving_to_target){
		switch (enemy_type) {
			case "enemy_type_1":
			draw_line(start_x-move_amplitude, start_y, start_x+move_amplitude, start_y);
				break;
			case "enemy_type_2":
			draw_line(start_x-move_amplitude, start_y, start_x+move_amplitude, start_y);
				break;
			case "enemy_type_small_minion":
			draw_circle(start_x, start_y, max_radius, true);
			if (max_radius != current_radius){
				draw_circle(start_x, start_y, current_radius, true);
			}
				break;
		}
	}
    
    draw_set_color(c_white);
}

if (_damage_cooldown > 0){
	draw_sprite_ext(dmg_sprite, image_index, x, y, -1, -1, 0, c_white, 1);
}

draw_sprite_ext(sprite_index, image_index, x, y, -1, -1, 0, c_white, 1);

if (turret_type) { // Check if this enemy should have turrets
    for (var i = 0; i < array_length(turrets); i++) {
        var turret = turrets[i];
        var turret_x = x + turret.xoffset;
        var turret_y = y + turret.yoffset;
        
        // Draw turret sprite, rotated to face the aiming direction
		if (_damage_cooldown > 0){
			draw_sprite_ext(turret.turret_sprite, 1, turret_x, turret_y, 1, 1, (round(turret._direction/15)*15) + 90, c_white, 1);
		} else {
			draw_sprite_ext(turret.turret_sprite, 0, turret_x, turret_y, 1, 1, (round(turret._direction/15)*15) + 90, c_white, 1);
		}
		if (global.debug_mode)
		{
			draw_set_color(c_maroon);
    
		    draw_line(turret_x, turret_y, target_x, target_y);
    
		    draw_set_color(c_white);
		}
    }
}