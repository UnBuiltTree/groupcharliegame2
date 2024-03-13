
current_x = x;
current_y = y;

// Checks if the game isnt paused
if (obj_game_manager.curr_game_state != GAME_STATE.PAUSED){
	if (obj_game_manager.curr_game_state == GAME_STATE.PLAYING){
		if (player_local_id == 0){
			//Keyboard movement controls ~Weston_1
			//checks for W or up key presses
			if (keyboard_check(ord("W")) || keyboard_check(vk_up)){
				if (current_y-(player_size/2) > (room_height/2)-(game_height/2)){
					vspeed -= vert_speed;
				}
			}
	
			//checks for A or left key presses
			if (keyboard_check(ord("A")) || keyboard_check(vk_left)){
					if (current_x-(player_size/2) > (room_width/2)-(game_width/2)){
				hspeed -= horz_speed;
				}
			}
	
			//checks for S or down key presses
			if (keyboard_check(ord("S")) || keyboard_check(vk_down)){
				if (current_y+(player_size/2) < (room_height/2)+(game_height/2)){
					vspeed += vert_speed;
				}
			}
			
			//checks for D or right key presses
			if (keyboard_check(ord("D")) || keyboard_check(vk_right)){
				if (current_x+(player_size/2) < (room_width/2)+(game_width/2)){ 
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
		}
	}
}


