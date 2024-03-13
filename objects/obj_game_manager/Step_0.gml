//step event

//checks to see if the game is playing
if(curr_game_state == GAME_STATE.PLAYING){
	if (current_time - last_tick >= tick_time) {
    //resets the last_tick time
	if (time_left > 0){
		time_left= time_left - 1;
	} else {
		end_of_round();
		room_goto(rm_interim_menu);
	}
    last_tick = current_time;
	}
}

