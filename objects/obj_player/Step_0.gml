
current_x = x;
current_y = y;

// Checks if the game isnt paused
if (obj_game_manager.curr_game_state != GAME_STATE.PAUSED){
	if (obj_game_manager.curr_game_state == GAME_STATE.PLAYING){
		if (player_local_id == 0){
			
			_damage_cooldown--;
			_button_cooldown--;
			
			if (player_health <= 0){
				explode(death_explosion)
			}
			
			//Keyboard movement controls ~Weston_1
			//checks for W or up key presses
			if (keyboard_check(ord("W")) || keyboard_check(vk_up)){
				if (current_y-208-(player_ysize/2) > (room_height/2)-(game_height/2)){
					vspeed -= vert_speed;
				}
			}
	
			//checks for A or left key presses
			if (keyboard_check(ord("A")) || keyboard_check(vk_left)){
					if (current_x-(player_xsize/2) > (room_width/2)-(game_width/2)){
				hspeed -= horz_speed;
				}
			}
	
			//checks for S or down key presses
			if (keyboard_check(ord("S")) || keyboard_check(vk_down)){
				if (current_y+(player_ysize/2) < (room_height/2)+(game_height/2)){
					vspeed += vert_speed;
				}
			}
			
			//checks for D or right key presses
			if (keyboard_check(ord("D")) || keyboard_check(vk_right)){
				if (current_x+(player_xsize/2) < (room_width/2)+(game_width/2)){ 
					hspeed += horz_speed;
				}
			}
			//End keybaord movement controls ~Weston
			//trigger controls
			if (keyboard_check(vk_space) || mouse_check_button(mb_left))
				{
					var _trigger_type = 0;
					trigger_pressed(_trigger_type);
				}
			if (keyboard_check(vk_shift) || mouse_check_button(mb_right))
				{
					var _trigger_type = 1;
					trigger_pressed(_trigger_type);
				}
			if (keyboard_check(ord("E")))
				{
					var _trigger_type = 2;
					trigger_pressed(_trigger_type);
				}
			if (keyboard_check(ord("B")))
				{
					if (_button_cooldown <= 0){
						if (!global.debug_mode){
							global.debug_mode = true
							global.cheat_mode = true
						} else {
							global.debug_mode = false
							global.cheat_mode = false
						}
					_button_cooldown = button_cooldown;
					}
				}
			// --- debuging tools
			if (global.debug_mode)
				{
				if (keyboard_check(ord("K")))
					{	
						if (_button_cooldown <= 0){
								global.destroy_all = true;
								alarm[10] = 3;
						_button_cooldown = button_cooldown;
						}
					}
					
				// hide_clouds toggle
				if (keyboard_check(ord("J")))
					{	
						if (_button_cooldown <= 0){
								if (!global.hide_clouds){
									global.hide_clouds = true
								} else {
									global.hide_clouds = false
								}
						_button_cooldown = button_cooldown;
						}
					}
				// hide_shadows
				if (keyboard_check(ord("H")))
					{	
						if (_button_cooldown <= 0){
								if (!global.hide_shadows){
									global.hide_shadows = true
								} else {
									global.hide_shadows = false
								}
						_button_cooldown = button_cooldown;
						}
					}
				}
				
			if (keyboard_check(ord("I")))
				{
					if (_button_cooldown <= 0){
						if (!global.cheat_mode){
							global.cheat_mode = true
						} else {
							global.cheat_mode = false
						}
					_button_cooldown = button_cooldown;
					}
				}
		}
	}
}


