function ps_enterpipe()
{
	var _peh = instance_place(x,y,oPipeentrance_horizontal)
	var _pev = instance_place(x,y,oPipeentrance_vertical)
	
	depth = 399;
	invincible = -2;
	
	if _peh
	{
		if _peh.image_xscale == 1 {
			x++;
			
			if instance_place(bbox_left,y,oPipeentrance_horizontal) 
			&& bbox_left >= instance_place(bbox_left,y,oPipeentrance_horizontal).bbox_left+16
			{image_alpha = 0;}
		} else {
			x--;
			
			if instance_place(bbox_right,y,oPipeentrance_horizontal) 
			&& bbox_right >= instance_place(bbox_right,y,oPipeentrance_horizontal).bbox_right-16
			{image_alpha = 0;}
		}
			
		if _peh.warper {oGame.spawnx = -1; oGame.spawny = -1;}
		ind += 0.2;
	}
	else if _pev 
	{
		if _pev.image_yscale == 1 {
			y++;
			
			if instance_place(x,bbox_top,oPipeentrance_vertical) 
			&& bbox_top >= instance_place(x,bbox_top,oPipeentrance_vertical).bbox_top+24
			{image_alpha = 0;}
		} else {
			y--;
			
			if instance_place(x,bbox_bottom,oPipeentrance_vertical) 
			&& bbox_bottom >= instance_place(x,bbox_bottom,oPipeentrance_vertical).bbox_bottom-24
			{image_alpha = 0;}
		}
	
		if sprite_exists(ms("sMario_{}_downpipe")) {spr = ms("sMario_{}_downpipe");}
		else if (powerup != "s" && powerup != "sf") {spr = ms("sMario_{}_crouch");}
		
		
		if _pev.warper {oGame.spawnx = -1; oGame.spawny = -1;}
		ind = 0;
	}
	if !place_meeting(x,y,oParpipeentrance)
	{
		if room_exists(pipeinforoom) && !instance_nearest(x,y,oParpipeentrance).special8_4 
		{room_goto(pipeinforoom);}
		if instance_nearest(x,y,oParpipeentrance).warper 
		{
			global.world = instance_nearest(x,y,oParpipeentrance).tworld; 
			global.level = 1; 
			global.hiddenoneup = true;
		}
		if instance_nearest(x,y,oParpipeentrance).special8_4
		{
			oMario.x-=8; oCamera.x-=8; oMario.y = y; oMario.depth = 600;
			if instance_place(x,y,oParpipeexit) {
				if instance_exists(oPiranha) 
				{oPiranha.y = oPiranha.ystart; oPiranha.st = 0;}
				state = ps.exitpipe;
			}
			
		}
	}
	if !place_meeting(x,y,oParpipeentrance) && pipeinforoom == -1
	{
		var me = instance_nearest(x,y,oParpipeentrance);
		var iid = -1;
		
		if instance_exists(oPipeexit_vertical)
		{
			with(oPipeexit_vertical)
			{
				if num = me.num
				{iid = id;}
			}
		
			if iid != -1 && me.num != -1
			{
				oMario.x = iid.x;
				oCamera.x = iid.x;
				if iid.image_yscale == 1 {oMario.y = iid.bbox_bottom;}
				else {oMario.y = iid.bbox_top+2;}
			}
		}
		if instance_exists(oPipeexit_horizontal)
		{
			with(oPipeexit_horizontal)
			{
				if num = me.num
				{iid = id;}
			}
		
			if iid != -1 && me.num != -1
			{
				if iid.image_xscale == 1 {oMario.x = iid.bbox_right; oCamera.x = iid.bbox_right;}
				else {oMario.x = iid.bbox_left; oCamera.x = iid.bbox_left;}
				oMario.y = iid.y;
			}
		}
		state = ps.exitpipe;
	}
}