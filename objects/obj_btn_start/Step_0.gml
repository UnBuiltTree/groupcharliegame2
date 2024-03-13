//Weston_1, 3/12/24

//if statement to start what happens after the button sound has played ~Weston_1
if (is_pressed && !audio_exists(sound_button))
{
	//goes to rm_game_room
	room_goto(rm_interim_menu);
}


