image_angle =point_direction(x,y,mouse_x,mouse_y);

firingdelay = firingdelay -1;


if (mouse_check_button(mb_left)) && (firingdelay < 0)
{

	firingdelay =5;
	with (instance_create_layer(x,y,"Bullets",Obullet))
	{
		speed =25;
		direction = other.image_angle;
		image_angle = direction;
	}
}


