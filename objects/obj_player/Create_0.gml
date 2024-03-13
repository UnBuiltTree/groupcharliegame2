//Weston_1, 3/12/24

// varables to store the ceneter of the room ~Weston_1
x_center = room_width / 2
y_center = room_height / 2

// gets the varables form obj_game_manager about the game window size
game_width = obj_game_manager.game_width
game_height = obj_game_manager.game_height

//func to initialize the playter ~Weston_1
player_initialize = function(){
	player_local_id = 0;
	player_health = global.player_lives;
	
	
	//variable for players move speed
	move_speed = 4;
	
	player_size = 32;
	
	//variables for player speeds
	hspeed = 0;
	vspeed = 0;
	show_debug_message("Player Created")
}

player_initialize();
