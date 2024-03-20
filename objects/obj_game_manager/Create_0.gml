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
}

//initalizes the level  ~Weston_1
level_initialize()

//creates a player within the centre of the room and sets their ID to 0 ~Weston
var _player = instance_create_layer(x_center, y_center+(game_height/4),"Aerial_Instances", obj_player);
_player.player_local_id = 0;
show_debug_message("Player Spawned: " + string(_player.player_local_id));

/*this function spawns an enemy at the location and type given 
in arguments with the next available unique ID ~Weston 3/19
*/
spawn_enemy = function(_x_spawn, _y_spawn, _enemy_type){
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
	_enemy.enemy_initialize(_enemy_type);
};

spawn_enemy(x_center, y_center-128, 0);
spawn_enemy(x_center+120, y_center-128, 1);
spawn_enemy(x_center-120, y_center-128, 1);

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
}

//code to play music from when we have some ~Weston_1
/*
audio_stop_all();
music = audio_play_sound(snd_music, 100, true);
*/