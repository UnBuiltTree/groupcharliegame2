/// @description Insert description here
// You can write your code in this editor

enemy_initialize = function(_enemy_type){
	switch (_enemy_type) {
	    case 0:
			sprite_index = spr_enemy_type_0;
	        enemy_health = 3;
			damage_cooldown = 24;
			explosion_type = 2;
	        break;
		case 1:
			sprite_index = spr_enemy_type_1;
	        enemy_health = 1;
			damage_cooldown = 12;
			explosion_type = 2;
	        break;
	    default:
			sprite_index = spr_enemy_type_0;
	        enemy_health = 12;
			damage_cooldown = 24;
			explosion_type = 2;
	        break;
	}
	_damage_cooldown = 0;
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