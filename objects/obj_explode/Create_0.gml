owner = noone;

correct_instance = function(_explosion_type){
	_priority = irandom_range(20, 30);
	switch (_explosion_type) {
	    case "player_small_flak":
			_flip = irandom_range(0, 1);
			switch (_flip){
				case 0:
					sprite_index = spr_explode_one;
					break;
				case 1:
					sprite_index = spr_explode_one;
					image_xscale = -1;
					break;
			}
			lifespan = 4;
			explosion_dmg = 1;
			player_explosion = true;
			audio_play_sound(snd_explode_1, _priority, false);
	        break;
		case "player_plasma_implosion":
	        sprite_index = spr_explode_two;
			lifespan = 8;
			explosion_dmg = 3;
			player_explosion = true;
			audio_play_sound(snd_laser_1, _priority, false);
	        break;
		case "player_aerial_bomb":
	        sprite_index = spr_explode_three;
			lifespan = 4;
			explosion_dmg = 6;
			player_explosion = true;
			audio_play_sound(snd_explode_3, _priority, false);
	        break;
		case "enemy_death_explode_1":
	        sprite_index = spr_explode_three;
			lifespan = 4;
			explosion_dmg = 0;
			player_explosion = true;
			audio_play_sound(snd_explode_3, _priority, false);
	        break;
		case "enemy_projectile_1_explosion":
	        sprite_index = spr_explode_three;
			lifespan = 4;
			explosion_dmg = 4;
			player_explosion = false;
			audio_play_sound(snd_explode_3, _priority, false);
	        break;
	    default:
	        sprite_index = spr_explode_one;
			lifespan = 6;
			explosion_dmg = 1;
	        break;
	}
	
	alarm[0] = lifespan * 6
}