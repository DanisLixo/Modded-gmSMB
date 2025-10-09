event_inherited()

grounded = false;

pufunc = function()
{
	var m = instance_place(x,y,oMario)
	
	if m
	{
		with(m)
		{
			if (powerup = "s" || powerup = "sf")
			{state = ps.grow;}
			else if powerup != "f"
			{powerup = "f"; state = ps.transform;}
			else
			{sfx(sndPowerup,1);}
		}
	}
	
	if instance_place(x,y,oPartner) 
	{
		with(oPlayer)
		{
			if (powerup = "s" || powerup = "sf")
			{state = ps.grow;}
			else if powerup != "f"
			{powerup = "f"; state = ps.transform;}
			else
			{sfx(sndPowerup,1);}
		}
	}
	
	instance_destroy();
	points(1000,true);
}

g = 1;
gspd = 0;
moving = false

float = false;
xplace = xstart
feathy = noone