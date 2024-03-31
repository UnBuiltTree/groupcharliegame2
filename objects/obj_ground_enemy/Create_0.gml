enemy_initialize = function(_enemy_type){
	enemy_type = _enemy_type;
	rng_ = irandom_range(0, 50)
	ground_speed = 1;
	_x_offset_step = 0;
	switch (_enemy_type) {
	    case "enemy_ground_type_1":
			sprite_index = spr_ground_enemy;
	        enemy_health = 3;
			damage_cooldown = 24;
			shooter_type = false;
			explosion_type = "enemy_death_explode_1";
	        break;
		case "enemy_ground_type_2":
			sprite_index = spr_ground_enemy;
	        enemy_health = 3;
			damage_cooldown = 12;
			shooter_type = true;
			enemy_fire_rate = 200;
			enemy_fire_cooldown = 0 + rng_;
			explosion_type = "enemy_death_explode_1";
	        break;
		case "enemy_ground_ship_1":
			sprite_index = spr_ground_enemy_ship_1;
	        enemy_health = 3;
			damage_cooldown = 12;
			shooter_type = true;
			enemy_fire_rate = 80;
			enemy_fire_cooldown = 0 + rng_;
			explosion_type = "enemy_death_explode_1";
	        break;
	    default:
			sprite_index = spr_ground_enemy;
	        enemy_health = 12;
			damage_cooldown = 24;
			shooter_type = false;
			explosion_type = "enemy_death_explode_1";
	        break;
	}
	_damage_cooldown = 0;
	vspeed = ground_speed;
	show_debug_message("Enemy ID: " + string(enemy_local_id));
	
}

create_projectile = function(_enemy_type)
{
	switch (_enemy_type) {
		case "enemy_ground_ship_1":
			switch (_x_offset_step){
				case (0):
					_x_offset = -11;
					_projectile_type = "enemy_projectile_1";
					_x_offset_step++;
					break;
				case (1):
					_x_offset = 10;
					_projectile_type = "enemy_projectile_1";
					_x_offset_step++;
					break;
				case (2):
					_x_offset = -18;
					_projectile_type = "enemy_projectile_1";
					_x_offset_step++;
					break;
				case (3):
					_x_offset = 18;
					_projectile_type = "enemy_projectile_1";
					_x_offset_step = 0
					break;
			}
			break;
		default:
			_projectile_type = "enemy_projectile_1";
			_x_offset = 0
			break;
	}
	
	_projectile_offset = 0;
	
	var _projectile_pos_x = x + (sprite_get_width(sprite_index)/2) + _x_offset
	var _projectile_pos_y = y - (sprite_get_height(sprite_index)/2)

	// Creates new projectile from the new positions
	var _new_projectile = instance_create_layer(_projectile_pos_x, _projectile_pos_y, "Projectiles", obj_projectile);
	_new_projectile.owner = self;	
	_new_projectile.correct_player(_projectile_type);
}

explode = function(_explosion_type){
	var _explosion_pos_x = x + (sprite_get_width(sprite_index)/2)
	var _explosion_pos_y = y - (sprite_get_height(sprite_index)/2)

	// Creates new explosion from the positions
	var _new_explosion = instance_create_layer(_explosion_pos_x, _explosion_pos_y, "Ground_Instances", obj_explode);
	_new_explosion.owner = self;	
	_new_explosion.correct_instance(_explosion_type);
	instance_destroy(self)
}