//step event

// Checks to see if the game is playing
if(curr_game_state == GAME_STATE.PLAYING){
	
}

// Step Event
if (current_time - last_tick >= tick_time) {
    // Run your custom tick code here
    show_debug_message("Tick" + string(tick));
    tick++;

	
    // Reset the last_tick time
    last_tick = current_time;
}