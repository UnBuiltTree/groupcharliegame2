/// @description Insert description here
// You can write your code in this editor

enemy_initialize = function(_enemy_type){
	enemy_type = _enemy_type;
	switch (_enemy_type) {
	    case "enemy_type_1":
			sprite_index = spr_enemy_type_0;
	        enemy_health = 12;
			enemy_speed = 1;
			damage_cooldown = 24;
			shooter_type = false;
			explosion_type = "enemy_death_explode_1";
	        break;
		case "enemy_type_2":
			sprite_index = spr_enemy_type_1;
	        enemy_health = 3;
			enemy_speed = 2;
			damage_cooldown = 12;
			shooter_type = true;
			enemy_fire_rate = 400;
			rng_ = ((irandom_range(1, 4)*enemy_fire_rate)-enemy_fire_rate)/4
			enemy_fire_cooldown = rng_;
			explosion_type = "enemy_death_explode_1";
	        break;
	    default:
			sprite_index = spr_enemy_type_0;
	        enemy_health = 12;
			enemy_speed = 2;
			damage_cooldown = 24;
			shooter_type = false;
			explosion_type = "enemy_death_explode_1";
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
		case "enemy_type_1":
			move_amplitude = 64;
			current_move = 0;
			move_direction = 1;
			break;
		case "enemy_type_2":
			move_amplitude = 96;
			current_move = 0;
			move_direction = 1;
			break;
		case "enemy_type_3":
			
			break;
		default:
			
			break;
	}
}

enemy_move_pattern = function(_enemy_type){
	switch (_enemy_type) {
		case "enemy_type_1":
			current_move += enemy_speed * move_direction;
			x = start_x + current_move;
			if (abs(current_move) >= move_amplitude) {
	            move_direction *= -1; //changes direction
	        }
			break;
		case "enemy_type_2":
			current_move += enemy_speed * move_direction;
			x = start_x + current_move;
			if (abs(current_move) >= move_amplitude) {
	            move_direction *= -1;
	        }
			break;
		case "enemy_type_3":
			
			break;
		default:
			
			break;
	}
}

create_projectile = function(_enemy_type)
{
	switch (_enemy_type) {
		case "enemy_type_2":
			_projectile_type = "enemy_projectile_1";
			break;
		case "enemy_type_3":
			
			break;
		default:
			_projectile_type = "enemy_projectile_1";
			break;
	}
	
	_projectile_offset = 0;
	
	var _projectile_pos_x = x
	var _projectile_pos_y = y + sprite_get_height(sprite_index)/2

	// Creates new projectile from the new positions
	var _new_projectile = instance_create_layer(_projectile_pos_x, _projectile_pos_y, "Projectiles", obj_projectile);
	_new_projectile.owner = self;	
	_new_projectile.correct_player(_projectile_type);
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