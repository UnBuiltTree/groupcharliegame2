/// @description Insert description here
// You can write your code in this editor

enemy_initialize = function(_enemy_type){
	enemy_type = _enemy_type;
	switch (_enemy_type) {
	    case 0:
			sprite_index = spr_enemy_type_0;
	        enemy_health = 3;
			enemy_speed = 1;
			damage_cooldown = 24;
			explosion_type = 2;
	        break;
		case 1:
			sprite_index = spr_enemy_type_1;
	        enemy_health = 1;
			enemy_speed = 2;
			damage_cooldown = 12;
			explosion_type = 2;
	        break;
	    default:
			sprite_index = spr_enemy_type_0;
	        enemy_health = 12;
			enemy_speed = 2;
			damage_cooldown = 24;
			explosion_type = 2;
	        break;
	}
	_damage_cooldown = 0;
	moving_to_target = true;
	direction = point_direction(x, y, target_x, target_y);
	speed = enemy_speed;
	allowed_error = 8;
	show_debug_message("Enemy ID: " + string(enemy_local_id) + " Target X: " + string(target_x) + " Target Y: " + string(target_y));
	
}

pattern_initialize = function(_enemy_type){
	start_x = x;
	start_y = y;
	
	//switch to initialize the values for enemy_move_pattern()
	switch (_enemy_type) {
		case 0:
			move_amplitude = 64;
			current_move = 0;
			move_direction = 1;
			break;
		case 1:
			move_amplitude = 96;
			current_move = 0;
			move_direction = 1;
			break;
		case 2:
			
			break;
		default:
			
			break;
	}
}

enemy_move_pattern = function(_enemy_type){
	switch (_enemy_type) {
		case 0:
			current_move += enemy_speed * move_direction;
			x = start_x + current_move;
			if (abs(current_move) >= move_amplitude) {
	            move_direction *= -1; //changes direction
	        }
			break;
		case 1:
			current_move += enemy_speed * move_direction;
			x = start_x + current_move;
			if (abs(current_move) >= move_amplitude) {
	            move_direction *= -1;
	        }
			break;
		case 2:
			
			break;
		default:
			
			break;
	}
}

explode = function(_explosion_type){
	var _explosion_pos_x = x
	var _explosion_pos_y = y

	// Creates new explosion from the positions
	var _new_explosion = instance_create_layer(_explosion_pos_x, _explosion_pos_y, "Projectiles", obj_explode);
	_new_explosion.owner = self;	
	_new_explosion.correct_instance(_explosion_type);
	instance_destroy(self)
}