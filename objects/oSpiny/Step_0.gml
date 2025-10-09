if mario_freeze()	{image_speed = 0; exit;}

image_speed = 1;

event_inherited();

switch(state)
{
	case es.patrol:
	
	if eggd = -1 
	{
		if vspd > 4 {vspd = 4;} 
		sprite_index = sSpinyegg; 
		if place_meeting(x,y+3,oCol) {eggd++}
	}
	else if eggd >= 0 and eggd < 5
	{
		hspd = maxhspd*facingdir; 	
		sprite_index = sSpiny
		}
	
	if sign(sin(current_time/100)) != 0
	{xs = round(sign(sin(current_time/100)));}
	

	collide();
	
	break;
	case es.stomp:
	
		ind = 1
	
	break;
}

