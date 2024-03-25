if (enemy_health <= 0) {
    explode(explosion_type);
}
_damage_cooldown--;

if (shooter_type){
	if (enemy_fire_cooldown <= 0){
		// Resets the fire cooldown, uses special burt mode for auto cannon
		enemy_fire_cooldown = enemy_fire_rate;
		// Creates a projectile
		//create_projectile("player_aerial_bomb");
	} else {
				enemy_fire_cooldown--;
	}
}
	
if (y > 640){
	instance_destroy(self)
}