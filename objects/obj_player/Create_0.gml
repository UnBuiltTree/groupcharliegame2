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
	horz_speed = 4;
	vert_speed = 2;
	
	player_size = 32;
	
	gun_one_fire_rate = 6;
	gun_two_fire_rate = 16;
	gun_three_fire_rate = 24;
	
	global.gun_one_cooldown = 10;
	global.gun_two_cooldown = 10;
	global.gun_three_cooldown = 10;
	
	//variables for player speeds
	hspeed = 0;
	vspeed = 0;
	show_debug_message("Player Created")
}

player_initialize();

create_projectile = function(_projectile_type)
{
	// Offsets for players gun position
	
	_projectile_offset = 0;
	
	// Sets new postions from adjusted positions and players position
	var _projectile_pos_x = x
	var _projectile_pos_y = y - player_size/2

	// Creates new player projectile from the new positions
	var _new_projectile = instance_create_layer(_projectile_pos_x, _projectile_pos_y, "Projectiles", obj_projectile);
	_new_projectile.owner = self;	
	_new_projectile.correct_player(_projectile_type);
	
	// Plays firing audio sound
	//var _sound_spark = audio_play_sound(snd_player_fire, 100, false, 0.3, 0, 1.0);
}

trigger_pressed = function(_trigger_type)
{
	switch (_trigger_type) {
	    case 0:
			show_debug_message("gun1 :" + string(global.gun_one_cooldown))
	        if (global.gun_one_cooldown <= 0)
			{
				// Resets the fire cooldown, uses special burt mode for auto cannon
				show_debug_message("gun1 fired:" + string(global.gun_one_cooldown))
				global.gun_one_cooldown = gun_one_fire_rate;
				// Creates a projectile
				create_projectile("player_machine_gun");
			}
	        break;
		case 1:
			show_debug_message("gun2 :" + string(global.gun_two_cooldown))
	        if (global.gun_two_cooldown <= 0)
			{
				// Resets the fire cooldown, uses special burt mode for auto cannon
				global.gun_two_cooldown = gun_two_fire_rate;
				// Creates a projectile
				create_projectile("player_aerial_bomb");
			}
	        break;
		case 2:
			show_debug_message("gun3 :" + string(global.gun_three_cooldown))
	        if (global.gun_three_cooldown <= 0)
			{
				// Resets the fire cooldown, uses special burt mode for auto cannon
				global.gun_three_cooldown = gun_three_fire_rate;
				// Creates a projectile
				create_projectile("player_implosion_plasma_gun");
			}
	        break;
	}
}
