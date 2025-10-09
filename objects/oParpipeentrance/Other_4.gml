if activated = true && room = troom and !instance_exists(oPaused) and oGame.spawnx != -2 
{
	if instance_exists(oMario) 
	{
		var me = id;
		var iid = -1;
		
		if instance_exists(oPipeexit_vertical)
		{
			with(oPipeexit_vertical)
			{
				if num = me.num
				{iid = id;}
			}
		
			if iid != -1 && num != -1
			{
				oMario.x = iid.x;
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
		
			if iid != -1 && num != -1
			{
				if iid.image_xscale == 1 {oMario.x = iid.bbox_right;}
				else {oMario.x = iid.bbox_left;}
				oMario.y = iid.y;
			}
		}
		
		oMario.state = ps.exitpipe;
	}
}

if room != bornroom 
{
	instance_destroy();
}

