spawn_initialize = function(){
	_speed = 3;
	_damage_cooldown = 0;
	moving_to_target = true;
	direction = point_direction(x, y, target_x, target_y);
	speed = _speed;
	allowed_error = 8;
}

end_spawn = function(){
	obj_game_manager.spawn_true_player();
	instance_destroy(self)
}