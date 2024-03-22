// Variable used for the owner of the projectile
owner = noone;

// Speed variable for projectiles inital speed
speed = 4;
// Variable used for storing the speed when the game is paused
last_speed = speed;

spread = 100;
_spread = 0;
lifespan = 1;
_explosion_type = 1;


correct_player = function(_projectile_type)
{
	/*
	This stores infomation to build the projectile you want, while we do only have a
	single projectile object, the switch below modifyes that object to be thye projectile you want ~Weston
	speed; how fast the projectile moves
	spread; how accuarate the projectile is, the higher the number the lower the accuaracy
	sprite_index; what sprite is used for the projetile
	lifespan; how long the projectile last
	lifespan_rnd; added to lifespan to give randomness
	_explosion_type; if the projectile explodes at the end of its life this is what chages the type of explosion
	*/
	switch (_projectile_type) {
	    case "player_machine_gun":
			speed = 4;
			spread = 8;
	        sprite_index = spr_bullet_one;
			lifespan = 16;
			lifespan_rnd = 2;
			player_projectile = true;
			_explosion_type = "player_small_flak";
			audio_play_sound(snd_gun_fire_1, 10, false);
	        break;
		case "player_implosion_plasma_gun":
			speed = 3;
			spread = 2;
	        sprite_index = spr_bullet_two;
			lifespan = 24;
			lifespan_rnd = 1;
			player_projectile = true;
			_explosion_type = "player_plasma_implosion";
	        break;
		case "player_aerial_bomb":
			speed = 6;
			spread = 1;
	        sprite_index = spr_bullet_three;
			lifespan = 5;
			lifespan_rnd = 0;
			player_projectile = true;
			_explosion_type = "player_aerial_bomb";
			audio_play_sound(snd_gun_fire_2, 10, false);
	        break;
		case "enemy_projectile_1":
			speed = 3;
			spread = 6;
	        sprite_index = spr_bullet_three;
			lifespan = 12;
			lifespan_rnd = 3;
			player_projectile = false;
			_explosion_type = "enemy_projectile_1_explosion";
			audio_play_sound(snd_gun_fire_2, 10, false);
	        break;
	    default:
	        sprite_index = spr_bullet_one;
			lifespan = 10;
			lifespan_rnd = 1;
			player_projectile = true;
			_explosion_type = 0;
	        break;
	}
	
	
	spread_counter = 0;
	spread_limit = 100;
	_spread = irandom_range(spread*-1, spread);
	_lifespan = lifespan + irandom_range(lifespan_rnd*-1, lifespan_rnd);
	alarm[0] = _lifespan * 6
	
	// Sets direction of projectile to the players gun angle
	if (player_projectile){
		direction = 90;
	} else {
		image_yscale = -1;
		direction = 270;
	}
	// Sets the angle of the projectile to the direction
	image_angle = direction-90;
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