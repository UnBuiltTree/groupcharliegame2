owner = noone;

create_projectile = function(_projectile_type)
{
	var _projectile_pos_x = x
	var _projectile_pos_y = y

	// Creates new projectile from the new positions
	var _new_projectile = instance_create_layer(_projectile_pos_x, _projectile_pos_y, "Projectiles", obj_projectile);
	_new_projectile.owner = self;	
	_new_projectile.correct_player(_projectile_type);
}

child_projectile_spawner = function(_projectile_type, _explsn_hit_sprite, _explsn_eol_sprite){
	if (_hit == false){
		sprite_index = _explsn_eol_sprite;
		audio_play_sound(snd_explode_airburst, _priority, false);
		for (var i = 0; i < projectile_num; ++i) {
				create_projectile(_projectile_type)
		}
	} else {
		sprite_index = _explsn_hit_sprite;
		audio_play_sound(snd_explode_1, _priority, false);
		}
}

correct_instance = function(_explosion_type){
	_priority = irandom_range(20, 30);
	switch (_explosion_type) {
	    case "player_small_flak":
			_flip = irandom_range(0, 1);
			switch (_flip){
				case 0:
					sprite_index = spr_explode_1;
					break;
				case 1:
					sprite_index = spr_explode_1;
					image_xscale = -1;
					break;
			}
			lifespan = 4;
			explosion_dmg = 1;
			player_explosion = true;
			ground_explosion = false;
			projectile_spawner = false;
			audio_play_sound(snd_explode_1, _priority, false);
	        break;
		case "player_plasma_implosion":
	        sprite_index = spr_explode_3;
			lifespan = 8;
			explosion_dmg = 3;
			player_explosion = true;
			ground_explosion = false;
			projectile_spawner = false;
			audio_play_sound(snd_laser_1, _priority, false);
		case "player_airburst_explosion":
			_explsn_hit_sprite = spr_explode_1;
			_explsn_eol_sprite = spr_explode_2;
			lifespan = 6;
			explosion_dmg = 1;
			player_explosion = true;
			ground_explosion = false;
			projectile_spawner = true;
			projectile_num = 6;
			child_projectile_spawner("player_airburst_flak", _explsn_hit_sprite, _explsn_eol_sprite);
			
		case "player_airburst_flak":
	        sprite_index = spr_explode_2;
			lifespan = 4;
			explosion_dmg = 1;
			player_explosion = true;
			ground_explosion = false;
			projectile_spawner = false;
			audio_play_sound(snd_explode_1, _priority, false);
	        break;
		case "player_aerial_bomb":
	        sprite_index = spr_explode_2;
			lifespan = 4;
			explosion_dmg = 6;
			player_explosion = true;
			ground_explosion = true;
			projectile_spawner = false;
			audio_play_sound(snd_explode_3, _priority, false);
	        break;
		case "enemy_death_explode_1":
	        sprite_index = spr_explode_2;
			lifespan = 4;
			explosion_dmg = 0;
			player_explosion = false;
			ground_explosion = false;
			projectile_spawner = false;
			audio_play_sound(snd_explode_3, _priority, false);
	        break;
		case "player_death_explode_1":
	        sprite_index = spr_explode_2;
			lifespan = 4;
			explosion_dmg = 0;
			player_explosion = true;
			ground_explosion = false;
			projectile_spawner = false;
			audio_play_sound(snd_explode_3, _priority, false);
	        break;
		case "enemy_projectile_1_explosion":
	        sprite_index = spr_explode_1;
			lifespan = 4;
			explosion_dmg = 1;
			player_explosion = false;
			ground_explosion = false;
			projectile_spawner = false;
			audio_play_sound(snd_explode_3, _priority, false);
	        break;
	    default:
	        sprite_index = spr_explode_1;
			lifespan = 6;
			explosion_dmg = 1;
			player_explosion = true;
			ground_explosion = false;
			projectile_spawner = false;
	        break;
	}
	
	alarm[0] = lifespan * 6
}

