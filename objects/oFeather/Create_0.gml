event_inherited()

row = -1

pufunc = function()
{
	var m = instance_place(x,y,oMario)
	
	if m
	{
		with(m)
		{
			if powerup = "s"
			{state = ps.grow;}
			else if powerup = "b" || powerup = "f"
			{state = ps.capetransform;}
			else
			{sfx(sndPowerup,1);}
		}
	}
	points(1000,true);
	instance_destroy();
}

moving = false