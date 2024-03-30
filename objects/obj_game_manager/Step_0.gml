//step event

//checks to see if the game is playing
if(curr_game_state == GAME_STATE.PLAYING){
	if (current_time - last_tick >= tick_time) {
    //resets the last_tick time
	if (time_left > 0){
		time_left = time_left - 1;
		gun_cooldown();
		enemy_spawner();
	} else {
		end_of_round();
	}
    last_tick = current_time;
	}
	
	spawn_cooldown--;
	if (global.player_alive == false){
		if (global.player_life >= 1){
			if (spawn_cooldown >= 0){
				spawn_player();
			}
			spawn_cooldown = 60;
			show_debug_message("player is dead")
		} else {
			end_of_round();
			show_debug_message("game over")
		}
		
	}
	
	
}

