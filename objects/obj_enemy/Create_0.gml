/// @description Insert description here
// You can write your code in this editor

enemy_type = 0;

enemy_initialize = function(_enemy_type){
	switch (_enemy_type) {
	    case 0:
	        enemy_health = 3;
			damage_cooldown = 30;
			_damage_cooldown = 0;
	        break;
	    default:
	        enemy_health = 10;
			damage_cooldown = 30;
			_damage_cooldown = 0;
	        break;
	}
}

enemy_initialize(enemy_type);

explode = function(_explosion_type){
	var _explosion_pos_x = x
	var _explosion_pos_y = y

	// Creates new explosion from the positions
	var _new_explosion = instance_create_layer(_explosion_pos_x, _explosion_pos_y, "Projectiles", obj_explode);
	_new_explosion.owner = self;	
	_new_explosion.correct_instance(_explosion_type);
	instance_destroy(self)
}