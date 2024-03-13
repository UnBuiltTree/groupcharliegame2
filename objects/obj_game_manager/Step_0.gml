//step event

//checks to see if the game is playing
if(curr_game_state == GAME_STATE.PLAYING){
	if (current_time - last_tick >= tick_time) {
	
    //resets the last_tick time
    last_tick = current_time;
	}
}

