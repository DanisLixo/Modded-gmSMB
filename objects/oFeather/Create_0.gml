event_inherited()

row = -1

pufunc = function()
{
	var m = instance_place(x,y,oMario)
	
	if m
	{
		with(m)
		{
			if (powerup = "s" || powerup = "sf")
			{state = ps.grow;}
			else if powerup != "c"
			{powerup = "c"; state = ps.transform;}
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
			else if powerup != "c"
			{powerup = "c"; state = ps.transform;}
			else
			{sfx(sndPowerup,1);}
		}
	}
	instance_destroy();
}

moving = false