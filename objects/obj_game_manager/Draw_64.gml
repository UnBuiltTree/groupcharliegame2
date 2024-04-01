if(!global.debug_mode){draw_sprite(spr_hud_background, 0, x, y);} else {draw_sprite(spr_hud_background, 1, x, y);}
draw_set_font(obj_game_manager.time_font);
draw_text((room_width/2)+160+16, 16, string(round(time_left/10)*10));


if(curr_game_state == GAME_STATE.PLAYING){
	with (obj_player){
		for (var _i = 0; _i < global.player_health_max; _i++) {
			var _x_pos = 16 + 18 * _i; // Starting x position for the first health bar, then move over for each additional bar. Adjust spacing as needed.
			var _sprite = spr_hud_health; // Default sprite for the health bar
			var _state = 0; // Default state for full health
    
			// Check if the current health bar should be full strength or faded
			if (player_health - 1 < _i) {
				_state = 1;
			}
    
			// Draw the health bar sprite
			draw_sprite_ext(_sprite, _state, _x_pos, 40, 1.0, 1.0, 0, c_white, 1);
		}
	}
	
	if (!global.player_alive){
		for (var _i = 0; _i < global.player_health_max; _i++) {
			var _x_pos = 16 + 18 * _i; // Starting x position for the first health bar, then move over for each additional bar. Adjust spacing as needed.
			var _sprite = spr_hud_health_blink; // Default sprite for the health bar
			var _state = _frame; // Default state for full health
    
			// Check if the current health bar should be full strength or faded
			// Draw the health bar sprite
			draw_sprite_ext(_sprite, _state, _x_pos, 40, 1.0, 1.0, 0, c_white, 1);
		}
	}
	
	for (var _i = 0; _i < global.player_life_max; _i++) {
		var _x_pos = 16 + 36 * _i; // Starting x position for the first health bar, then move over for each additional bar. Adjust spacing as needed.
		var _sprite = spr_hud_life; // Default sprite for the health bar
		var _state = 0; // Default state for full health
		var _added_y = 0;
    
		// Check if the current health bar should be full strength or faded
		if (global.player_life - 1 < _i) {
			_state = 1;
		}
		
		if (3 <= _i) {
			_added_y = 36;
			_x_pos = 16 + 36 * (_i - 3)
		}
    
			// Draw the health bar sprite
		draw_sprite_ext(_sprite, _state, _x_pos, 40 + 18 + _added_y, 1.0, 1.0, 0, c_white, 1);
	}
}