//Weston_1, 3/12/24-3:20pm

// global.varables goes here ~Weston_1
	/*
	Added mission_level to keep track of current mission level ~Weston_1
	Added player_lives to keep track of the players current lives
	*/
global.mission_level = 0;
global.player_lives = 5;

// end global.varables ~Weston_1

// varables to store the ceneter of the room ~Weston_1
x_center = room_width / 2
y_center = room_height / 2


// Set the base dimensions for the games window
var base_width = 720;
var base_height = 720;

// Retrieves the display size
var display_width = display_get_width();
var display_height = display_get_height();

// Calculates the scale factor while maintaining the aspect ratio
var scale_factor = min(display_width / base_width, display_height / base_height);

// Calculates the new window size
var new_width = round(base_width * scale_factor);
var new_height = round(base_height * scale_factor);

// Sets the new window size
window_set_size(new_width, new_height);

// Centers the window on the screen
window_center();

// func to create the menu's buttons ~Weston_1
create_buttons = function(){
	instance_create_layer(x_center, y_center, "Buttons", obj_btn_start);
}

create_buttons();

//code for main menu music if we get any ~Weston_1
/*
audio_stop_all();
music = audio_play_sound(snd_menu_music, 100, true);
*/