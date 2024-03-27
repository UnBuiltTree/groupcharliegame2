if ((_damage_cooldown < 0) && !other.ground_explosion && !other.player_explosion){
	player_health -= other.explosion_dmg;
	_damage_cooldown = damage_cooldown;
	show_debug_message("player took damage, damage cooldown = " + string(_damage_cooldown))
}
