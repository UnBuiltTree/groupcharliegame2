//Create Event

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


tick_time = 100/12; //time in milliseconds for each game tick
last_tick = current_time; //stores the current time

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
}

//initalizes the level  ~Weston_1
level_initialize()

//creates a player within the centre of the room and sets their ID to 0 ~Weston
var _player = instance_create_layer(x_center, y_center+(game_height/4),"Aerial_Instances", obj_player);
_player.player_local_id = 0;
show_debug_message("Player Spawned: " + string(_player.player_local_id));

instance_create_layer(x_center, y_center,"Clouds_1", obj_clouds_1);
instance_create_layer(x_center, y_center-256,"Clouds_2", obj_clouds_2);
instance_create_layer(x_center, y_center,"Ground", obj_ground);
//instance_create_layer(x_center, y_center,"Ground_Instances", spr_ground_tile);

end_of_round = function(){
	curr_game_state = GAME_STATE.ENDED;
}

//code to play music from when we have some ~Weston_1
/*
audio_stop_all();
music = audio_play_sound(snd_music, 100, true);
*/