//Create Event
global.main_menu = false;
//Weston_1, 3/12/24

// varables to store the ceneter of the room ~Weston_1
x_center = room_width / 2
y_center = room_height / 2

//game states ~Weston_1
enum GAME_STATE
{
	PLAYING,
	PAUSED,
	INTERIM,
	ENDED,
}

game_height = 640
game_width = 320

spawn_cooldown = 60;

_frame = 0;
alarm[1] = 15;

//creates the obj_game_shadow_manager, the shadow manager that draws all player and enemy shadows on the ground.
instance_create_layer(x, y, "Aerial_shadows", obj_game_shadow_manager);


tick_time = 10; // Time in milliseconds for each game tick
last_tick = current_time; // Store the current time

//variables used for the score font used in the hud
time_font = fnt_main_12;
time_colour = c_black;
time_alpha = 1;
time_halign = fa_center;
time_valign = fa_middle;

//switch to hold any values that change for mission levels  ~Weston_1
switch (global.mission_level){
	case 0:
		//varables go here
		time_left = 12*400
		break;
	default:
		//varables go here
		break;
}

//function to initalize the mission ~Weston_1
level_initialize = function(){
	curr_game_state = GAME_STATE.PLAYING;
	global.run_tick = false;
	
	audio_stop_all();
	music = audio_play_sound(snd_mission, 100, true);
}

//initalizes the level  ~Weston_1
level_initialize()
/*
spawn_player = function(){
	//creates a player within the room and sets their ID to 0 ~Weston
	var _player = instance_create_layer(x_center, y_center+(game_height/4),"Aerial_Instances", obj_player);
	_player.player_local_id = 0;
	show_debug_message("Player Spawned: " + string(_player.player_local_id));
	global.player_alive = true;
}*/


spawn_player = function(){
	if (global.player_spawning == false){
		global.player_spawning = true;
		//creates a player within the room and sets their ID to 0 ~Weston
		var _player_spawn = instance_create_layer(x_center, y_center+(game_height/2)+64,"Aerial_Instances", obj_player_spawn);
		_player_spawn.target_x = x_center;
		_player_spawn.target_y = y_center+(game_height/4);
		_player_spawn.spawn_initialize();
		show_debug_message("Player Spawn");
	}
}

spawn_true_player = function(){
	//creates a player within the room and sets their ID to 0 ~Weston
	var _player = instance_create_layer(x_center, y_center+(game_height/4),"Aerial_Instances", obj_player);
	_player.player_local_id = 0;
	show_debug_message("Player Spawned: " + string(_player.player_local_id));
	global.player_spawning = false;
	global.player_alive = true;
}


spawn_player();

/*this function spawns an enemy at the location and type given 
in arguments with the next available unique ID ~Weston 3/19
*/

enemy_number = 1;
wave = 0;

spawn_enemy = function(_x_spawn, _y_spawn, _x_target, _y_target, _enemy_type){
    var _unique_id = 1; //start checking IDs with 1
    var _id_found = false;
    var _enemy;

    //loops until an unused ID is found
    while (!_id_found) {
        _id_found = true; //assume the ID is unique until proven otherwise

        //loop through all instances of obj_enemy to check if the current ID is in use
        with (obj_enemy) {
            if (enemy_local_id == _unique_id) {
                _id_found = false;
                break;
            }
        }

        if (_id_found) {
            //found an unused ID, so break out of the loop
            break;
        } else {
            //the ID was in use, so increase the ID number and check again
            _unique_id += 1;
        }
    }

    //now that a unique ID has been found, spawns the enemy with this ID
    _enemy = instance_create_layer(_x_spawn, _y_spawn, "Aerial_Instances", obj_enemy);
    _enemy.enemy_local_id = _unique_id; //assigns unique ID to the spawned enemy
	_enemy.target_x = _x_target;
	_enemy.target_y = _y_target;
	_enemy._enemy_number = enemy_number;
	
	
	_enemy.enemy_initialize(_enemy_type);
	enemy_number++;
};

enemy_spawner = function(){
	if (instance_exists(obj_enemy)){
		enemies_alive = true
	} else {	
		enemies_alive = false
		switch (wave) {
		    case 0:
		        spawn_enemy(x_center+000, y_center-384, x_center+00, y_center-256, "enemy_type_1");
				spawn_enemy(x_center-224, y_center-384, x_center-32, y_center-128, "enemy_type_2");
				spawn_enemy(x_center+224, y_center-384, x_center+32, y_center-128, "enemy_type_2");
				wave = 1;
		        break;
			case 1:
				spawn_enemy(x_center-48, y_center-480, x_center-48, y_center-160, "enemy_type_2");
				spawn_enemy(x_center-16, y_center-480, x_center-16, y_center-160, "enemy_type_2");
				spawn_enemy(x_center+16, y_center-480, x_center+16, y_center-160, "enemy_type_2");
				spawn_enemy(x_center+48, y_center-480, x_center+48, y_center-160, "enemy_type_2");
				spawn_enemy(x_center-48, y_center-448, x_center-48, y_center-128, "enemy_type_2");
				spawn_enemy(x_center-16, y_center-448, x_center-16, y_center-128, "enemy_type_2");
				spawn_enemy(x_center+16, y_center-448, x_center+16, y_center-128, "enemy_type_2");
				spawn_enemy(x_center+48, y_center-448, x_center+48, y_center-128, "enemy_type_2");
				spawn_enemy(x_center-48, y_center-416, x_center-48, y_center-096, "enemy_type_2");
				spawn_enemy(x_center-16, y_center-416, x_center-16, y_center-096, "enemy_type_2");
				spawn_enemy(x_center+16, y_center-416, x_center+16, y_center-096, "enemy_type_2");
				spawn_enemy(x_center+48, y_center-416, x_center+48, y_center-096, "enemy_type_2");
				wave = 2;
		        break;
			case 2:
				spawn_enemy(x_center+64, y_center-384, x_center, y_center-256, "enemy_type_1");
				spawn_enemy(x_center-64, y_center-448, x_center, y_center-192, "enemy_type_1");
				spawn_enemy(x_center+64, y_center-512, x_center, y_center-128, "enemy_type_1");
				spawn_enemy(x_center-64, y_center-576, x_center, y_center-064, "enemy_type_1");
				wave = 3;
				break;
			case 3:
				spawn_enemy(x_center, y_center-360, x_center, y_center, "enemy_type_1");
				
				spawn_enemy(x_center-16, y_center-480-128, x_center-16, y_center-096-64, "enemy_type_2");
				spawn_enemy(x_center+16, y_center-480-128, x_center+16, y_center-096-64, "enemy_type_2");
				spawn_enemy(x_center-16, y_center-448-128, x_center-16, y_center-128-64, "enemy_type_2");
				spawn_enemy(x_center+16, y_center-448-128, x_center+16, y_center-128-64, "enemy_type_2");
				
				spawn_enemy(x_center-16, y_center-480-256, x_center-16, y_center-096-64, "enemy_type_2");
				spawn_enemy(x_center+16, y_center-480-256, x_center+16, y_center-096-64, "enemy_type_2");
				spawn_enemy(x_center-16, y_center-448-256, x_center-16, y_center-128-64, "enemy_type_2");
				spawn_enemy(x_center+16, y_center-448-256, x_center+16, y_center-128-64, "enemy_type_2");
				
				spawn_enemy(x_center-16, y_center-480-384, x_center-16, y_center-096-64, "enemy_type_2");
				spawn_enemy(x_center+16, y_center-480-384, x_center+16, y_center-096-64, "enemy_type_2");
				spawn_enemy(x_center-16, y_center-448-384, x_center-16, y_center-128-64, "enemy_type_2");
				spawn_enemy(x_center+16, y_center-448-384, x_center+16, y_center-128-64, "enemy_type_2");
				
				
				
				spawn_enemy(x_center-16, y_center-480-128+64, x_center-16, y_center-096, "enemy_type_2");
				spawn_enemy(x_center+16, y_center-480-128+64, x_center+16, y_center-096, "enemy_type_2");
				spawn_enemy(x_center-16, y_center-448-128+64, x_center-16, y_center-128, "enemy_type_2");
				spawn_enemy(x_center+16, y_center-448-128+64, x_center+16, y_center-128, "enemy_type_2");
				
				spawn_enemy(x_center-16, y_center-480-256+64, x_center-16, y_center-096, "enemy_type_2");
				spawn_enemy(x_center+16, y_center-480-256+64, x_center+16, y_center-096, "enemy_type_2");
				spawn_enemy(x_center-16, y_center-448-256+64, x_center-16, y_center-128, "enemy_type_2");
				spawn_enemy(x_center+16, y_center-448-256+64, x_center+16, y_center-128, "enemy_type_2");
				
				spawn_enemy(x_center-16, y_center-480-384+64, x_center-16, y_center-096, "enemy_type_2");
				spawn_enemy(x_center+16, y_center-480-384+64, x_center+16, y_center-096, "enemy_type_2");
				spawn_enemy(x_center-16, y_center-448-384+64, x_center-16, y_center-128, "enemy_type_2");
				spawn_enemy(x_center+16, y_center-448-384+64, x_center+16, y_center-128, "enemy_type_2");
				
				wave = 0;
		        break;
		    default:
				spawn_enemy(x_center+000, y_center-640, x_center+00, y_center-256, "enemy_type_1");
				spawn_enemy(x_center-640, y_center-640, x_center-32, y_center-128, "enemy_type_2");
				spawn_enemy(x_center+640, y_center-640, x_center+32, y_center-128, "enemy_type_2");
				wave = 0;
		        break;
		}
	}
}

spawn_ground_enemy = function(_clm, _row, _enemy_type){
    var _unique_id = 1; //start checking IDs with 1
    var _id_found = false;
    var _enemy;
	_x_spawn = _clm * 64 + 128
	_y_spawn = _row * -64

    //loops until an unused ID is found
    while (!_id_found) {
        _id_found = true; //assume the ID is unique until proven otherwise

        //loop through all instances of obj_enemy to check if the current ID is in use
        with (obj_ground_enemy) {
            if (enemy_local_id == _unique_id) {
                _id_found = false;
                break;
            }
        }

        if (_id_found) {
            //found an unused ID, so break out of the loop
            break;
        } else {
            //the ID was in use, so increase the ID number and check again
            _unique_id += 1;
        }
    }

    //now that a unique ID has been found, spawns the enemy with this ID
    _enemy = instance_create_layer(_x_spawn, _y_spawn, "Ground_Instances", obj_ground_enemy);
    _enemy.enemy_local_id = _unique_id; //assigns unique ID to the spawned enemy
	_enemy._enemy_number = enemy_number;
	
	_enemy.enemy_initialize(_enemy_type);
	enemy_number++;
};

enemy_ground_spawner = function(){
	spawn_ground_enemy(1, 10, "enemy_ground_type_1")
	spawn_ground_enemy(2, 10, "enemy_ground_type_1")
	spawn_ground_enemy(3, 10, "enemy_ground_type_1")
	spawn_ground_enemy(4, 10, "enemy_ground_type_1")
	spawn_ground_enemy(5, 10, "enemy_ground_type_1")
	spawn_ground_enemy(1, 12, "enemy_ground_type_1")
	spawn_ground_enemy(4, 14, "enemy_ground_type_1")
	spawn_ground_enemy(3, 16, "enemy_ground_type_1")
	spawn_ground_enemy(4, 18, "enemy_ground_type_1")
	spawn_ground_enemy(5, 20, "enemy_ground_type_1")
	spawn_ground_enemy(2, 22, "enemy_ground_type_1")
	spawn_ground_enemy(4, 24, "enemy_ground_type_1")
	spawn_ground_enemy(1, 26, "enemy_ground_type_1")
	spawn_ground_enemy(2, 28, "enemy_ground_type_1")
	spawn_ground_enemy(5, 30, "enemy_ground_type_1")
	spawn_ground_enemy(3, 32, "enemy_ground_type_1")
}

enemy_ground_spawner();

instance_create_layer(x_center, y_center,"Clouds_1", obj_clouds_1);
instance_create_layer(x_center, y_center - 256,"Clouds_2", obj_clouds_2);
instance_create_layer(x_center, y_center,"Ground", obj_ground);

gun_cooldown = function(){
	if (global.gun_one_cooldown >= 0){
		global.gun_one_cooldown--
	}
	if (global.gun_two_cooldown >= 0){
		global.gun_two_cooldown--
	}
	if (global.gun_three_cooldown >= 0){
		global.gun_three_cooldown--
	}
}

end_of_round = function(){
	curr_game_state = GAME_STATE.ENDED;
	if (global.player_life == 0){
		//this would be the game over menu, but we dont have
		//that yet so main_menu is used as a place holder ~weston
		room_goto(rm_main_menu);
	} else {
		room_goto(rm_interim_menu);
	}
}
