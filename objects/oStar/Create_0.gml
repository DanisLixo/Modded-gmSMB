event_inherited()

grounded = false;

pufunc = function()
{
	var m = instance_place(x,y,oMario)
	if m 
	{
		m.starman = room_speed*21
	
		if m.char = "Peter Griffin" && !instance_exists(oIsArena)
		{m.starman = room_speed*48;}
		if m.char = "Pokey" && !instance_exists(oIsArena)
		{m.starman = room_speed*38;}
	}
	
	if instance_place(x,y,oPartner) 
	{
		oPlayer.starman = room_speed*21
	
		if global.player == "Peter Griffin" && !instance_exists(oIsArena)
		{oPlayer.starman = room_speed*48;}
		if global.player == "Pokey" && !instance_exists(oIsArena)
		{oPlayer.starman = room_speed*38;}
	}
	
	points(1000,true)
	instance_destroy();
}

face = 1;