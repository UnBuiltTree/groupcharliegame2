if (global.destroy_all){
	instance_destroy(self)
}

if (enemy_health <= 0) {
    explode(explosion_type);
}
_damage_cooldown--;

if (moving_to_target) {
	move_towards_point(target_x, target_y, speed);
	// Check if the enemy has reached the target location (within a small margin of error)
    if (point_distance(x, y, target_x, target_y) < allowed_error) {
        x = target_x; // Correct position to exactly target position to avoid overshooting
        y = target_y;
        moving_to_target = false; // Stop moving towards the target
        vspeed = 0; // Stop the movement since we've reached the target
		hspeed = 0;
        // Reset or initialize variables for the new movement pattern here
		pattern_initialize(enemy_type);
    }
} else {
	enemy_move_pattern(enemy_type);
	if (turret_type){
				turret_manager(enemy_type);
			}
	if (shooter_type){
		if (enemy_fire_cooldown <= 0)
			{
				// Resets the fire cooldown, uses special burt mode for auto cannon
				enemy_fire_cooldown = enemy_fire_rate;
				// Creates a projectile
				create_projectile(enemy_type, 0, 0, 270);
			} else {
				enemy_fire_cooldown--;
			}
	}
	
	if (spawner_type){
		if (enemy_spawn_cooldown <= 0)
			{
				// Resets the fire cooldown, uses special burt mode for auto cannon
				enemy_spawn_cooldown = enemy_spawn_rate;
				// Creates a projectile
				if (max_spawns > 0){
					create_minion(x_center + ((irandom_range(0, 1)*2)-1)*(irandom_range(0, 2)*12) , y_center - 128 + ((irandom_range(0, 1)*2)-1)*(irandom_range(0, 4)*12), spawn_type);
					max_spawns--;
					if (spawn_visable_spr){
					image_index++;
					};
				}
			} else {
				enemy_spawn_cooldown--;
			}
	}
	
	if (y > 640){
		instance_destroy(self)
	}
}