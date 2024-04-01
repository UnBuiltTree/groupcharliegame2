if (global.destroy_all){
	instance_destroy(self)
}

direction = direction + _spread;


//image_angle = image_angle + _spread;
if (spread_counter <= spread_limit){
	_spread = 0;
} else {
	spread_counter++;
}
	
	
image_angle = round(direction/15)*15-90;







