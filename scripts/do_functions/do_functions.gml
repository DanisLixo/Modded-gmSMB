function do_jump()
{
	if global.environment = e.underwater
	{
		if (char != "Sonic" and global.abilities) {
			if kjp and bbox_top >= 40
			{
				sfx(sndStomp,0);
				
				vspd = -4; 
				state = ps.swim;
				swimmin = 42;
				
				if spintimer > 0 {ind = ind}
				else {ind = 0};
				
				grounded = false;
			}
			if !grounded && (state != ps.swim && state != ps.swimidle)
			{state = ps.swim;}
		}
		else if global.abilities {
			if (kjp or jumpbuffer > 0) && bbox_top >= 48
			{
				jumpbuffer = 0;
		
				if (powerup = "s" || powerup = "sf") || powerup = "sf"
				{sfx(sndJump,1);}
				else
				{sfx(sndJumpbig,1);}
				
				spr = ms("sMario_{}_spinjump"); ind = 0;
				
				vspd = -4 -(abs(hspd)/6);
				state = ps.jump;
		
				grounded = false;
				holdjump = 30;
			}
		}
	}
	else if (grounded || (char = "Dawn" && !doubleJumped)) && (kjp or jumpbuffer > 0)
	{
		if state == ps.jump {doubleJumped = true;}
		jumpbuffer = 0;

		if (powerup = "s" || powerup = "sf")
		{sfx(sndJump,1);}
		else
		{sfx(sndJumpbig,1);}
		
		if sprite_get_number(spr) == 1
			ind = 0;
		else
			ind += 0.3
		
		if (powerup = "s" || powerup = "sf") {spr = ms("sMario_{}_jump");}
		else if !kd {spr = ms("sMario_{}_jump");}
		if char == "Dawn" {
			if !kd  {spr = ms("sMario_{}_jump");}
			else if retrochance >= 90 and char =  "Dawn" and (powerup = "s" || powerup = "sf") 
			{spr = ms("sMario_s_jumpretro");}
		}
		
		if char = "Sonic" {spr = ms("sMario_{}_spinjump");}

		if state = ps.shoulderbash
		{spr = ms("sMario_{}_shoulderbash"); ind = 1;}
		
		vspd = -4 -(abs(hspd)/6);
		if crouch and char = "Goldron" {vspd -= 2;}
		if doubleJumped and char = "Dawn" {vspd += 1.5;}
		state = ps.jump;
		
		grounded = false;
		holdjump = 30;
		
		if insidecar {insidecar = false;}
	}
}

function do_fire()
{
	if global.abilities {
		if firetimer <= 8 && kap 
		{
			if powerup = "h" && instance_number(oHatThrow) < global.hats
			{
				instance_create_depth(x-3,bbox_top+2,depth,oHatThrow).facing = sign(image_xscale);
				firetimer = 10;
				sfx(sndFireballthrown,1);
			}
			if (powerup = "f" || powerup = "sf") && instance_number(oFireball) <= 1
			{
				var fb = instance_create_depth(x-3,bbox_top+2,depth,oFireball);
			
				fb.facing = sign(image_xscale);
				fb.m = id;
				firetimer = 10;
				sfx(sndFireballthrown,1);
			}
			if powerup = "t" && instance_number(oFirearrow) <= 3
			{
				var fb = instance_create_depth(x-3,bbox_top+2,depth,oFirearrow);
			
				fb.facing = sign(image_xscale);
				fb.m = id;
				firetimer = 10;
				sfx(sndFireballthrown,1);
			}
		}
	}
}

function do_spincarp()
{
	if kap && powerup = "c" and spintimer <= 0 {
		spintimer = 30;
	}
	
	if spintimer > 0 {
		spr = ms("sMario_{}_spin"); ind += 0.4;
		if spintimer = 1 and !grounded {
			spr = ms("sMario_{}_jump"); ind = 0
		}
	}
}

function do_shoulderbash()
{
	if khp && shoulderbash = 0 && char = "Wario" and global.abilities
	{
		state = ps.shoulderbash;
		vspd = 0; hspd = 0;
		shoulderbash = room_speed*0.5;
		sfx(sndBoom,1);
	}
}