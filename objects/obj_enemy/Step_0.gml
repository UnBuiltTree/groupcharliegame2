
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
	if (y > 640){
		instance_destroy(self)
	}
}