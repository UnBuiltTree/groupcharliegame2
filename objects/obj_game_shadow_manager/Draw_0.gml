
//checks if surface exists, if not it makes a new one.
if(!surface_exists(shadow_surface)){
	shadow_surface = surface_create(room_width, room_height);
}

//-----------------------------

surface_set_target(shadow_surface);
draw_clear_alpha(c_black, 0);

gpu_set_fog(true, c_black, 0, 1)

//draws shadows for obj_enemy, obj_player, and obj_player_spawn.
with (obj_enemy) {
    draw_sprite_ext(sdw_sprite, image_index, x + obj_game_shadow_manager.sdw_xdist, y + obj_game_shadow_manager.sdw_ydist, -1, -1, 0, c_white, 1);
}
with (obj_player) {
    draw_sprite_ext(sdw_sprite, image_index, x + obj_game_shadow_manager.sdw_xdist, y + obj_game_shadow_manager.sdw_ydist, 1, 1, 0, c_white, 1);
}
with (obj_player_spawn) {
    draw_sprite_ext(sdw_sprite, image_index, x + obj_game_shadow_manager.sdw_xdist, y + obj_game_shadow_manager.sdw_ydist, 1, 1, 0, c_white, 1);
}

gpu_set_fog(false, c_white, 0, 0);

surface_reset_target();

//this is the alpha for the shadows
draw_set_alpha(sdw_alpha);

draw_surface(shadow_surface, 0, 0);

//resets the draw alpha
draw_set_alpha(1);

//-----------------------------


