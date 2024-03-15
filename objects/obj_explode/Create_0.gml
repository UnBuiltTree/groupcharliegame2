owner = noone;

correct_instance = function(_explosion_type){
	_priority = irandom_range(20, 30);
	switch (_explosion_type) {
	    case 0:
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
			audio_play_sound(snd_explode_1, _priority, false);
	        break;
		case 1:
	        sprite_index = spr_explode_two;
			lifespan = 8;
			audio_play_sound(snd_laser_1, _priority, false);
	        break;
		case 2:
	        sprite_index = spr_explode_three;
			lifespan = 4;
			audio_play_sound(snd_explode_3, _priority, false);
	        break;
	    default:
	        sprite_index = spr_explode_one;
			lifespan = 6;
	        break;
	}
	
	alarm[0] = lifespan * 6
}