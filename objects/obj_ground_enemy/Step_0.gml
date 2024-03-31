if (enemy_health <= 0) {
    explode(explosion_type);
}
_damage_cooldown--;

if (y > 0){
	if (shooter_type){
		if (enemy_fire_cooldown <= 0){
			// Resets the fire cooldown, uses special burt mode for auto cannon
			enemy_fire_cooldown = enemy_fire_rate;
			// Creates a projectile
			create_projectile(enemy_type);
		} else {
					enemy_fire_cooldown--;
		}
	}
}
	
if (y > 720){
	instance_destroy(self)
}