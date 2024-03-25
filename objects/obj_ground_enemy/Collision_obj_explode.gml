if ((_damage_cooldown < 0) && other.ground_explosion){
	enemy_health -= other.explosion_dmg;
	_damage_cooldown = damage_cooldown;
	show_debug_message("took damage, damage cooldown = " + string(_damage_cooldown))
}
