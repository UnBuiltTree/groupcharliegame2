//Weston_1, 3/12/24-3:20pm

// varables to store the ceneter of the room ~Weston_1
x_center = room_width / 2
y_center = room_height / 2

// func to create the menu's buttons ~Weston_1
create_buttons = function(){
	instance_create_layer(x_center, y_center-256, "Buttons", obj_btn_start_mission);
}

create_buttons();

//code for main menu music if we get any ~Weston_1
/*
audio_stop_all();
music = audio_play_sound(snd_menu_music, 100, true);
*/