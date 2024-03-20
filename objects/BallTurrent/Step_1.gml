x=obj_player.x;
y=obj_player.y;



image_angle =point_direction(x,y,mouse_x,mouse_y);
//image_angle =point_direction(x,y,x,y+180)

firingdelay = firingdelay -1;
recoil = max(0,recoil - 1);

if (mouse_check_button(mb_middle)) && (firingdelay < 0)
{
	recoil = 4;
	firingdelay =5;
	with (instance_create_layer(x,y,"Projectiles",Obullet))
	{
		speed =25;
		direction = other.image_angle 
		image_angle = direction;
		
	}
}

x = x - lengthdir_x(recoil,image_angle);
y = y - lengthdir_y(recoil,image_angle);

if(image_angle > 90) && (image_angle <270)
{
	image_yscale = -1;
}
else
{
	image_yscale = 1;
}