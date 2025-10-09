function ps_jump()
{
	retrochance = random(100);
	
	if global.environment = e.underwater and (char != "Sonic" || char == "Sonic" && !global.abilities)
	{state = ps.swim;}
	else {do_jump()}
	
	if char = "Dawn" and global.environment != e.underwater and !doubleJumped and global.abilities
	{
		do_jump();
	}
	
	var moveh = kr-kl

	var accel = 0.05
	var maxhspd = 1.5
		
	if ka && releasedrunmidjump = false 
	{maxhspd = 3;}
		
	if char = "Sonic" and global.environment != e.underwater and global.abilities 
	{accel = 0.05; maxhspd = 3;}
		
	if moveh = 1 && hspd < maxhspd
	{
		hspd += accel;
		if !ka && hspd > maxhspd
		{hspd -= accel}
	}
	if moveh = -1 && hspd > -maxhspd
	{
		hspd -= accel;
		if !ka && hspd < -maxhspd
		{hspd += accel}
	}
	
	if kar && releasedrunmidjump = false
	{releasedrunmidjump = true;}
	
	if grounded
	{
		doubleJumped = false;
		pmet = 0;
		shoulderbash = -10;
		if kd
		{state = ps.crouch;}
		else if !kd
		{state = ps.normal;}
	}
	
	if holdjump >= 0
	{
		holdjump --;
		
		vspd -= (holdjump/64)
		
		if !kj || vspd > 0
		{holdjump = -1;}
	}
	
	if char = "Luigi" and global.abilities && !crouch
	{vspd -= 0.075;}
	
	if kj and powerup = "c" and sign(vspd) = 1 
	{vspd -= vspd/10}

	if global.abilities {do_spincarp();}
	if !crouch {do_fire();}
	
	if char = "Sonic" {ind += 0.4;}
	else if char = "Luigi" || char = "Martin" {ind += 0.3;}
	else {
		if spr != ms("sMario_{}_walk") {
			if sprite_get_number(spr) == 1
				ind = 0;
			else
				ind += 0.3
		}
	}
	
	collide();
	
	if char = "Feathy" and global.environment != e.underwater 
	and pmach >= 6 and powerup = "c" and holdjump > 0 and global.abilities
	{
		state = ps.fly; 
		holdjump = 30;
		vspd = clamp(vspd,-2,6);
	}
	
	if (vspd >= 0) && !grounded && !crouch && !place_meeting(x,y,oBeanstalk) 
	&& sprite_exists(ms("sMario_{}_fall")) && spr != ms("sMario_{}_jumpretro") 
	{spr = ms("sMario_{}_fall"); ind += 0.1;}
	
	if char == "Dawn" { 
		if retrochance >= 90 and (powerup = "s" || powerup = "sf") {spr = ms("sMario_s_jumpretro");}
		if !crouch && vspd < 0 and doubleJumped {spr = ms("sMario_{}_jumpdouble"); ind += 0.1;}
	}
	if !crouch && pmach >= 6 and spintimer <= 0 && sprite_exists(ms("sMario_{}_runjump"))
	{spr = ms("sMario_{}_runjump");}
	if char = "Sonic" {
		spr = ms("sMario_{}_spinjump");
	}
	if instance_place(x,y,oBeanstalk)
	{x = instance_place(x,y,oBeanstalk).x+8; y -= 1; state = ps.climb;}
	
	sound = false;
}
