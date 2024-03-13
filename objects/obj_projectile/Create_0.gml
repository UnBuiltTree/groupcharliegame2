// Variable used for the owner of the projectile
owner = noone;

// Speed variable for projectiles inital speed
speed = 4;
// Variable used for storing the speed when the game is paused
last_speed = speed;

spread = 100;
_spread = 0;

correct_player = function(_projectile_type)
{
	// Sets sprite to player fireball
	sprite_index = spr_bullet_one;
	
	switch (_projectile_type) {
	    case 0:
			speed = 4;
			spread = 12;
	        sprite_index = spr_bullet_one;
	        break;
		case 1:
			speed = 3;
			spread = 2;
	        sprite_index = spr_bullet_two;
	        break;
		case 2:
			speed = 6;
			spread = 1;
	        sprite_index = spr_bullet_three;
	        break;
	    default:
	        sprite_index = spr_bullet_one;
	        break;
	}
	
	spread_counter = 0;
	spread_limit = 100;
	_spread = irandom_range(spread*-1, spread);
	
	// Sets direction of projectile to the players gun angle
	direction = 90;
	// Sets the angle of the projectile to the direction
	image_angle = direction-90;
}
