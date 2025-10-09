depth = 301

if moving == true {
	if place_meeting(x+g,y,oParblock) {g = -g;}
	if place_meeting(x+g,y,oCol) {g = -g;}
	hspd = g
	collide();
	exit;
}

if mario_freeze()	{exit;}

if instance_exists(oMario) and !(oMario.x > bbox_left - 20 && oMario.x < bbox_right + 20) && st = 1
{
	st = 2;
}

if st >= 2
{
	st ++;
	
	if y > ystart - sprite_height-8
	{y -= 0.5;}
	else 
	{
		var m = collision_rectangle(x-24,y-8,x+24,y+8,oMario,false,true);
		
		if m && global.moveEnys && m.state = ps.nah
		{
			if m.khp {sfx(sndBump,0);}
			moving = true
			if m.image_xscale = 1
				{if g = -1 {g = 1}}
			if m.image_xscale = -1
				{if g = 1 {g = -1}}
		}		
	}
	
	if st > room_speed * 2
	{st = -1;}
}
if st <= -1
{
	if y < ystart
	{y += 0.5;}
	else
	{st = 0;}
}

if st >= 0 && st < 1
{
	st += 0.01;
}


