/// @description Insert description here
// You can write your code in this editor

x_center = room_width / 2
y_center = room_height / 2

enemy_initialize = function(_enemy_type){
	enemy_type = _enemy_type;
	spawner_type = false;
	shooter_type = true;
	turret_type = false;
	switch (_enemy_type) {
	    case "enemy_type_1":
			sprite_index = spr_enemy_type_0;
			dmg_sprite = spr_enemy_type_0_dmg;
			sdw_sprite = spr_enemy_type_0_sdw;
	        enemy_health = 12;
			enemy_speed = 1;
			damage_cooldown = 24;
			shooter_type = false;
			spawner_type = true;
			spawn_visable_spr = true;
			enemy_spawn_rate = 200;
			rng_spawn = ((irandom_range(1, 4)*enemy_spawn_rate)-enemy_spawn_rate)/4
			enemy_spawn_cooldown = rng_spawn;
			max_spawns = 3;
			spawn_type = "enemy_type_small_minion"
			explosion_type = "enemy_death_explode_1";
	        break;
		case "enemy_type_2":
			sprite_index = spr_enemy_type_1;
			dmg_sprite = spr_enemy_type_1_dmg;
			sdw_sprite = spr_enemy_type_1_sdw;
	        enemy_health = 6;
			enemy_speed = 2;
			damage_cooldown = 12;
			enemy_fire_rate = 400;
			rng_fire = ((irandom_range(1, 4)*enemy_fire_rate)-enemy_fire_rate)/4
			enemy_fire_cooldown = rng_fire;
			explosion_type = "enemy_death_explode_1";
	        break;
		case "enemy_type_small_minion":
			sprite_index = spr_enemy_type_2;
			dmg_sprite = spr_enemy_type_2_dmg;
			sdw_sprite = spr_enemy_type_2_sdw;
	        enemy_health = 3;
			enemy_speed = 2;
			damage_cooldown = 12;
			enemy_fire_rate = 100;
			rng_fire = ((irandom_range(1, 4)*enemy_fire_rate)-enemy_fire_rate)/4
			enemy_fire_cooldown = rng_fire;
			explosion_type = "enemy_death_explode_1";
	        break;
		case "enemy_type_zepplin_1":
			sprite_index = spr_enemy_type_zepplin_1;
			dmg_sprite = spr_enemy_type_zepplin_1_dmg;
			sdw_sprite = spr_enemy_type_zepplin_1;
	        enemy_health = 48;
			enemy_speed = 0.5;
			damage_cooldown = 24;
			shooter_type = false;
			turret_type = true;
			turret_num = 2;
			turrets = [
			    { _name : "zep_tur_1", turret_sprite : spr_enemy_type_zepplin_1_turr1, xoffset: 0, yoffset: -10, _direction: -90, projectile_direction: 0, turret_fire_cooldown: 15, turret_fire_rate: 100, },
			    { _name : "zep_tur_2", turret_sprite : spr_enemy_type_zepplin_1_turr2, xoffset: 0, yoffset: 26, _direction: -90, projectile_direction: 0, turret_fire_cooldown: 0, turret_fire_rate: 40, },
			];
			enemy_fire_rate = 20;
			spawner_type = false;
			spawn_visable_spr = false;
			enemy_spawn_rate = 100;
			rng_spawn = ((irandom_range(1, 4)*enemy_spawn_rate)-enemy_spawn_rate)/4
			rng_fire = ((irandom_range(1, 4)*enemy_fire_rate)-enemy_fire_rate)/4
			enemy_spawn_cooldown = rng_spawn;
			enemy_fire_cooldown = rng_fire;
			max_spawns = 12;
			spawn_type = "enemy_type_small_minion";
			explosion_type = "enemy_death_explode_1";
	        break;
		case "enemy_type_zepplin_2":
			sprite_index = spr_enemy_type_zepplin_2;
			dmg_sprite = spr_enemy_type_zepplin_2_dmg;
			sdw_sprite = spr_enemy_type_zepplin_2;
	        enemy_health = 64;
			enemy_speed = 0.5;
			damage_cooldown = 24;
			shooter_type = false;
			turret_type = true;
			turret_num = 2;
			turrets = [
			    { _name : "zep_tur_1", turret_sprite : spr_enemy_type_zepplin_1_turr1, xoffset: 26, yoffset: -10, _direction: -90, projectile_direction: 0, turret_fire_cooldown: 15, turret_fire_rate: 100, },
			    { _name : "zep_tur_2", turret_sprite : spr_enemy_type_zepplin_1_turr2, xoffset: 26, yoffset: 26, _direction: -90, projectile_direction: 0, turret_fire_cooldown: 0, turret_fire_rate: 60, },
				{ _name : "zep_tur_3", turret_sprite : spr_enemy_type_zepplin_1_turr1, xoffset: -26, yoffset: -10, _direction: -90, projectile_direction: 0, turret_fire_cooldown: 25, turret_fire_rate: 100, },
			    { _name : "zep_tur_4", turret_sprite : spr_enemy_type_zepplin_1_turr2, xoffset: -26, yoffset: 26, _direction: -90, projectile_direction: 0, turret_fire_cooldown: 5, turret_fire_rate: 60, },
			];
			enemy_fire_rate = 20;
			spawner_type = true;
			spawn_visable_spr = true;
			enemy_spawn_rate = 20;
			rng_spawn = ((irandom_range(1, 4)*enemy_spawn_rate)-enemy_spawn_rate)/4
			rng_fire = ((irandom_range(1, 4)*enemy_fire_rate)-enemy_fire_rate)/4
			enemy_spawn_cooldown = rng_spawn;
			enemy_fire_cooldown = rng_fire;
			max_spawns = 8;
			spawn_type = "enemy_type_small_minion";
			explosion_type = "enemy_death_explode_1";
	        break;
	    default:
			sprite_index = spr_enemy_type_2;
			dmg_sprite = spr_enemy_type_2_dmg;
			sdw_sprite = spr_enemy_type_2_sdw;
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
		case "enemy_type_small_minion":
			current_move = 0;
			move_direction = 1;
			angle = (irandom_range(0, 3)*90);
			current_radius = 0;
			max_radius = 128;
			increase_rate = 1;
			center_x = start_x;
			center_y = start_y;
			r_speed = 0.01 * ((irandom_range(0, 1)*2)-1);
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
		case "enemy_type_small_minion":
			angle += r_speed * move_direction;

			//smoothly increases the radius to create a gradual transition
			if (current_radius < max_radius) {
			    current_radius += increase_rate;
			    current_radius = min(current_radius, max_radius);
			}

			x = center_x + cos(angle) * current_radius;
			y = center_y + sin(angle) * current_radius;
			break;
		default:
			
			break;
	}
}
	
create_projectile = function(_shooter_type, _xoffset, _yoffset, _direction)
{
	var _projectile_pos_x = x + _xoffset;
	var _projectile_pos_y = y /*- (sprite_get_height(sprite_index)/2)*/ + _yoffset;
	
	switch (_shooter_type) {
		case "enemy_type_2":
			_projectile_type = "enemy_projectile_1";
			break;
		case "enemy_type_small_minion":
			_projectile_type = "enemy_projectile_1";
			break;
		case "zep_tur_1":
			_projectile_type = "enemy_projectile_1";
			break;
		case "zep_tur_2":
			_projectile_type = "enemy_projectile_slow_1";
			break;
		case "zep_tur_3":
			_projectile_type = "enemy_projectile_1";
			break;
		case "zep_tur_4":
			_projectile_type = "enemy_projectile_slow_1";
			break;
		default:
			_projectile_type = "enemy_projectile_1";
			break;
	}

	// Creates new projectile from the new positions
	var _new_projectile = instance_create_layer(_projectile_pos_x, _projectile_pos_y, "Projectiles", obj_projectile);
	_new_projectile.owner = self;	
	_new_projectile.correct_player(_projectile_type);
	_new_projectile.direction = _direction;
}

turret_manager = function(_enemy_type) {
    show_debug_message("turret_manager called");
    if (instance_exists(obj_player)) {
        target_x = obj_player.x;
        target_y = obj_player.y;
    }

    switch (_enemy_type) {
        case "enemy_type_zepplin_1":
            // Loop through each turret in the turrets array
            for (var i = 0; i < array_length(turrets); i++) {
                var turret = turrets[i]; // Access the current turret
                // Update direction for each turret
                turret._direction = point_direction(x + turret.xoffset, y + turret.yoffset, target_x, target_y);
                turret.projectile_direction = turret._direction;
                
                // Check and update the fire cooldown
                if (turret.turret_fire_cooldown <= 0) {
                    // Reset the fire cooldown
                    turret.turret_fire_cooldown = turret.turret_fire_rate;
                    // Fire a projectile
                    create_projectile(turret._name, turret.xoffset, turret.yoffset, turret._direction);
                } else {
                    turret.turret_fire_cooldown--;
                }

                // Important: update the turret in the array with its new state
                turrets[i] = turret;
            }
            break;
		case "enemy_type_zepplin_2":
            // Loop through each turret in the turrets array
            for (var i = 0; i < array_length(turrets); i++) {
                var turret = turrets[i]; // Access the current turret
                // Update direction for each turret
                turret._direction = point_direction(x + turret.xoffset, y + turret.yoffset, target_x, target_y);
                turret.projectile_direction = turret._direction;
                
                // Check and update the fire cooldown
                if (turret.turret_fire_cooldown <= 0) {
                    // Reset the fire cooldown
                    turret.turret_fire_cooldown = turret.turret_fire_rate;
                    // Fire a projectile
                    create_projectile(turret._name, turret.xoffset, turret.yoffset, turret._direction);
                } else {
                    turret.turret_fire_cooldown--;
                }

                // Important: update the turret in the array with its new state
                turrets[i] = turret;
            }
            break;
    }
};


create_minion = function(_x_target, _y_target, _enemy_type){
	switch (_enemy_type) {
		case "enemy_type_1":
			_minion_type = "enemy_type_small_minion";
			break;
		case "enemy_type_3":
			
			break;
		default:
			_minion_type = "enemy_type_small_minion";
			break;
	}
	
	enemy_number = obj_game_manager.enemy_number;
	
	_projectile_offset = 0;
	
	var _minion_pos_x = x
	var _minion_pos_y = y + sprite_get_height(sprite_index)/2
    var _unique_id = 1; //start checking IDs with 1
    var _id_found = false;
    var _minion;

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
    _minion = instance_create_layer(_minion_pos_x, _minion_pos_y, "Aerial_Instances", obj_enemy);
    _minion.enemy_local_id = _unique_id; //assigns unique ID to the spawned enemy
	_minion.target_x = _x_target;
	_minion.target_y = _y_target;
	_minion._enemy_number = enemy_number;
	
	
	_minion.enemy_initialize(_enemy_type);
	enemy_number++;
};




explode = function(_explosion_type){
	
	var _explosion_pos_x = x 
	var _explosion_pos_y = y

	// Creates new explosion from the positions
	var _new_explosion = instance_create_layer(_explosion_pos_x, _explosion_pos_y, "Projectiles", obj_explode);
	_new_explosion.owner = self;	
	_new_explosion.correct_instance(_explosion_type);
	instance_destroy(self)
}