draw_sprite(spr_hud_background, 0, x, y);
draw_set_font(obj_game_manager.time_font);
draw_text((room_width/2)+160+16, 16, string(round(time_left/10)*10));

