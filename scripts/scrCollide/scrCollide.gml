/// @function collide
/// @description Obligatory for the object to recieve its physics.
function collide()
{
	var _pixel = 0; // = how many pixels will it get out in that frame
	var _pixelLimit = 100000; // pixels limit, if reached the game will detect a freeze and throw you 8 pixels up
	var _freezeDetected = false;
	
	if object_get_parent(object_index) = oMario
	{
		//ground
		collidecode = true;
		grounded = false;
		
		vspd += 0.4;
	
		// Down slope
		if !place_meeting(x,y+1,oSlope) && place_meeting(x,y+8,oSlope)
			&& vspd >= 0
		{
			while (!place_meeting(x,y+1,oSlope))
			{
				y += 1; grounded = true
				_pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}
			}
		}
		if (place_meeting(x,y+4,oSlope) && char = "Sonic") {hspd += 0.025*image_xscale}
		
		if !instance_place(x-5,y-4,oCol) && vspd <= 0
		{
			while instance_place(x,y-4,oCol) && !place_meeting(x-1,y,oCol) && !place_meeting(x,y,oCol) 
			{
				x --;
				_pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}
			} 
		}
		else if !instance_place(x+5,y-4,oCol) && vspd <= 0
		{
			while instance_place(x,y-4,oCol) && !place_meeting(x+1,y,oCol) && !place_meeting(x,y,oCol) 
			{
				x ++;
				_pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}
			}
		}
	
		if !instance_place(x-5,y-4,oElevator) && vspd <= 0
		{while instance_place(x,y-4,oElevator) && !place_meeting(x-1,y,oElevator) && !place_meeting(x,y,oElevator) 
		{
			x --; 
			_pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}
		}}
		else if !instance_place(x+5,y-4,oElevator) && vspd <= 0
		{while instance_place(x,y-4,oElevator) && !place_meeting(x+1,y,oElevator) && !place_meeting(x,y,oElevator) 
		{
			x ++; 
			_pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}
		}}
		if place_meeting(x,y-4,oCol) && vspd < 0
		{
			if instance_exists(oParblock)
			{
				var block = collision_rectangle(x+1,bbox_top,x-1,bbox_top-4,oParblock,true,true)
			
				if block && block.blockstate = 0
				{block.blockstate = 1; 
				if (powerup != "s" && powerup != "sf") || char = "Toad" and global.abilities {block.triggerbreak = true;}}
			}
			
			if !place_meeting(x,bbox_bottom+1,oCol)
			{vspd = 2; swimmin = 0; sfx(sndBump,1);}
		}
		else if instance_place(x,bbox_bottom+vspd,oCol) && vspd >= 0
		{
			while !instance_place(x,bbox_bottom+1,oCol)
			{y ++; _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}
			vspd = 0;
			grounded = true
		}
		
		if place_meeting(x,y-4,oElevator) && vspd < 0
		{
			if !place_meeting(x,bbox_bottom+1,oElevator)
			{vspd = 1; sfx(sndBump,1);}
		}
		else if instance_place(x,bbox_bottom+vspd,oElevator) && vspd >=0
		{
			while !instance_place(x,bbox_bottom+1,oElevator)
			{y ++; _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}
			vspd = 0;
			grounded = true
		}
		
		if (instance_place(x,bbox_bottom+vspd,oSemicol) && vspd >= 0)
		{
			if !instance_place(x,y,oSemicol)
			{
				grounded = true;
				vspd = 0;
			} else {
				while instance_place(x,y,oSemicol) && !instance_place(x,bbox_bottom+1,oSemicol) {y--;}	
			}
				
			while !instance_place(x,bbox_bottom+1,oSemicol) {y++;}
		}
		
		if global.playercol {
			if (instance_place(x,bbox_bottom+vspd,oOtherplayer) && vspd >= 0)
			{
				if !instance_place(x,y,oOtherplayer)
				{
					grounded = true;
					vspd = 0;
				} else {
					while instance_place(x,y,oOtherplayer) && !instance_place(x,bbox_bottom+1,oOtherplayer) {y--; _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}	
				}
				
				while !instance_place(x,bbox_bottom+1,oOtherplayer) {y++; _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}
			}
		}
	
		if vspd > 0 && !place_meeting(x+sign(hspd),y,oCol) && place_meeting(x+hspd,y,oCol)
		{grounded = true; vspd = 0;}
	
		y += vspd
	
		if instance_place(x,y+1,oSlope) && !place_meeting(x,y,oCol) && instance_place(x+hspd,y,oCol) && instance_place(x+hspd,y,oCol).object_index = oCol
		{
			if sign(hspd) = 1 && instance_place(x,y+1,oSlope).image_xscale < 0
			{while bbox_right < instance_place(x,y+1,oSlope).bbox_right {x ++; _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}}
			if sign(hspd) = -1 && instance_place(x,y+1,oSlope).image_xscale > 0
			{while bbox_left > instance_place(x,y+1,oSlope).bbox_left {x --; _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}}
		
			if place_meeting(x,y,oSlope) && !place_meeting(x,y,oCol)
			{while !place_meeting(x,y,oSlope) {y --; _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}}
		}
		
		if instance_place(x,y+vspd,oElevator)
		{
			if !instance_place(x-5,y+vspd,oElevator) && vspd < 0
			{while instance_place(x,y+vspd,oElevator) && !place_meeting(x-1,y,oElevator) {x --; _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}}
			else if !instance_place(x+5,y+vspd,oElevator) && vspd < 0
			{while instance_place(x,y+vspd,oElevator) && !place_meeting(x+1,y,oElevator) {x ++; _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}}
			else
			{
				if (place_meeting(x,y,oElevator) && vspd >= 0) or !place_meeting(x,y,oElevator)
				{
					while !place_meeting(x,y+sign(vspd),oElevator)
					{y += sign(vspd); _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}
					vspd = 0;
				}
		
				if place_meeting(x,y+1,oElevator)
				{grounded = true;}
				if place_meeting(x,y-1,oElevator) && !grounded
				{vspd = 1;}
			}
		}
	
		if place_meeting(x+hspd,y,oCol)
		{
			// vars for up slope
			var yincrease = 0
		
			while place_meeting(x+hspd,y-yincrease,oCol) && yincrease <= abs(2*hspd) && !place_meeting(x,y,oCol)
			{yincrease ++; _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}
		
			//// Collision
			if place_meeting(x+hspd,y-yincrease,oCol)
			{
				while !place_meeting(x+sign(hspd),y,oCol) && !place_meeting(x,y,oCol)
				{x += sign(hspd); _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}
				hspd = 0;
			}
			else  {y -= yincrease;}
		
			yincrease = 0;
		}
		
		if place_meeting(x+hspd,y,oElevator)
		{
			// vars for up slope
			var yincrease = 0
		
			while place_meeting(x+hspd,y-yincrease,oElevator) && yincrease <= abs(2*hspd) && !place_meeting(x,y,oElevator)
			{yincrease ++; _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}
		
			//// Collision
			if place_meeting(x+hspd,y-yincrease,oElevator)
			{
				while !place_meeting(x+sign(hspd),y,oElevator) && !place_meeting(x,y,oElevator)
				{x += sign(hspd); _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}
				hspd = 0;
			}
			else  {y -= yincrease;}
		
			yincrease = 0;
		}
		x += hspd;
	
	
		// Down slope
		if !place_meeting(x,y+1,oSlope) && place_meeting(x,y+8,oSlope)
			&& vspd >= 0 && grounded = true
		{
			while !place_meeting(x,y+1,oSlope)
			{y += 1; grounded = true _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}
		}
	
		vspd = clamp(vspd,-99999,4);
		
		
		if vspd > 0 && !grounded
		{vspd -= 0.1;}
	
	
		if !instance_exists(oIsArena) && instance_number(oMario) < 5
		{
			x = clamp(x,8,room_width-8);
			if char == "Max Verstappen" && (x >= room_width-8 || x <= 8) 
			{hspd = 0;}
			if spawned 
			{x = clamp(x,camera_get_view_x(view_camera[0])+8,camera_get_view_x(view_camera[0])+SCREENW-8);}
			
			y = clamp(y,-32,room_height+64);
		}
		
		if instance_place(x,y,oCol) //&& instance_place(x,y,oCol).object_index != oElevator
		{x += 1;}
		
		if instance_place(x,y,oElevator) //&& instance_place(x,y,oCol).object_index != oElevator
		{x += 1;}
		
		//elevator
	
		if vspd > 0 && !place_meeting(x+sign(hspd),y,oElevator) && place_meeting(x+hspd,y,oElevator)
		{grounded = true; vspd = 0;}
	
		if place_meeting(x+hspd,y,oElevator)
		{
			// vars for up slope
			var yincrease = 0
		
			while place_meeting(x+hspd,y-yincrease,oElevator) && yincrease <= abs(2*hspd) && !place_meeting(x,y,oElevator)
			{yincrease ++; _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}
		
			//// Collision
			if place_meeting(x+hspd,y-yincrease,oElevator)
			{
				while !place_meeting(x+sign(hspd),y,oElevator) && !place_meeting(x,y,oElevator)
				{x += sign(hspd); _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}
				hspd = 0;
			}
			else  {y -= yincrease;}
		
			yincrease = 0;
		}
		
		y -= (_freezeDetected)? 16 : 0;
		x -= (_freezeDetected)? 16 : 0;
		if (_freezeDetected) {show_debug_message(object_get_name(object_index) + " froze the game.")}
		exit;
	}
	grounded = false;
	
	if object_index = oHammerbro
	{
		if (instance_place(x,bbox_bottom+vspd,oCol) && vspd >= 0)
		{
			grounded = true;
			vspd = 0;
			
			if instance_place(x,y,oCol) {
				while instance_place(x,y,oCol) && !instance_place(x,bbox_bottom+1,oCol) 
				{y--; _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}	
			}
				
			while !instance_place(x,bbox_bottom+1,oCol) 
			{y++; _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}
		}
		if (instance_place(x,bbox_bottom+vspd,oSemicol) && vspd >= 0)
		{
			grounded = true;
			vspd = 0;
			
			if instance_place(x,y,oSemicol) {
				while instance_place(x,y,oSemicol) && !instance_place(x,bbox_bottom+1,oSemicol) {y--;}
			}
				
			while !instance_place(x,bbox_bottom+1,oSemicol) {y++;}
		}
		
		x += hspd;
		y += vspd;
		
		vspd += 0.4
		vspd = clamp(vspd,-4,4);
		
		y -= (_freezeDetected)? 16 : 0;
		x -= (_freezeDetected)? 16 : 0;
		if (_freezeDetected) {show_debug_message(object_get_name(object_index) + " froze the game.")}
		exit;
	}
	
	//if place_meeting(x+hspd,y,oCol) && !place_meeting(x,y,oCol)
	//{
	//	while !place_meeting(x+sign(hspd),y,oCol)
	//	{x += sign(hspd);}
	//	hspd = 0;
	//}
	//x += hspd;
	
	
	if instance_place(x,y+vspd,oCol)
	{
		if !instance_place(x-5,y+vspd,oCol) && vspd < 0
		{while instance_place(x,y+vspd,oCol) && !place_meeting(x-1,y,oCol) 
		{x --; _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}}
		else if !instance_place(x+5,y+vspd,oCol) && vspd < 0
		{while instance_place(x,y+vspd,oCol) && !place_meeting(x+1,y,oCol) 
		{x ++; _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}}
		else
		{
			if (place_meeting(x,y,oCol) && vspd >= 0) or !place_meeting(x,y,oCol)
			{
				while !place_meeting(x,y+sign(vspd),oCol)
				{y += sign(vspd); _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}
				vspd = 0;
			}
		
			if place_meeting(x,y+1,oCol)
			{grounded = true;}
			if place_meeting(x,y-1,oCol) && !grounded
			{vspd = 1;}
		}
	}
	
	/*if (instance_place(x,y+vspd,oSemicol) && vspd >= 0)
	{
		if !instance_place(x,y,oSemicol)
		{
			grounded = true;
			vspd = 0;
		} else {
			while instance_place(x,y,oSemicol) && !instance_place(x,bbox_bottom+1,oSemicol) {y--;}	
		}
				
		while !instance_place(x,bbox_bottom+1,oSemicol) {y++;}
	}
	*/
	if instance_place(x,y+vspd,oSemicol)
	{
		if !instance_place(x-5,y+vspd,oSemicol) && vspd < 0
		{while instance_place(x,y+vspd,oSemicol) && !place_meeting(x-1,y,oSemicol) {x --;}}
		else if !instance_place(x+5,y+vspd,oSemicol) && vspd < 0
		{while instance_place(x,y+vspd,oSemicol) && !place_meeting(x+1,y,oSemicol) {x ++;}}
		else
		{
			if (place_meeting(x,y,oSemicol) && vspd >= 0) or !place_meeting(x,y,oSemicol)
			{
				while !place_meeting(x,y+sign(vspd),oSemicol)
				{y += sign(vspd);}
				vspd = 0;
			}
		
			if place_meeting(x,y+1,oSemicol)
			{grounded = true;}
			if place_meeting(x,y-1,oSemicol) && !grounded
			{vspd = 1;}
		}
	}
	if (instance_place(x,bbox_bottom+vspd,oGoomba) && vspd >= 0) && object_index = oGoomba
	{
		if !instance_place(x,y,oGoomba)
		{
			grounded = true;
			vspd = 0;
		} else {
			while instance_place(x,y,oGoomba) && !instance_place(x,bbox_bottom+1,oGoomba) 
			{y--; _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}	
		}
				
		while !instance_place(x,bbox_bottom+1,oGoomba) 
		{y++; _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}
	}
	
	y += vspd;

	if instance_place(x,y+1,oSlope) && !place_meeting(x,y,oCol) && instance_place(x+hspd,y,oCol) && instance_place(x+hspd,y,oCol).object_index = oCol
	{
		if sign(hspd) = 1 && instance_place(x,y+1,oSlope).image_xscale < 0
		{while bbox_right < instance_place(x,y+1,oSlope).bbox_right {x ++;}}
		if sign(hspd) = -1 && instance_place(x,y+1,oSlope).image_xscale > 0
		{while bbox_left > instance_place(x,y+1,oSlope).bbox_left {x --;}}
		
		if place_meeting(x,y,oSlope) && !place_meeting(x,y,oCol)
		{while !place_meeting(x,y,oSlope) {y --;}}
	}
	
	if place_meeting(x+hspd,y,oCol)
	{
		// vars for up slope
		var yincrease = 0
		
		while place_meeting(x+hspd,y-yincrease,oCol) && yincrease <= abs(2*hspd) && !place_meeting(x,y,oCol)
		{yincrease ++; _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}
		
		//// Collision
		if place_meeting(x+hspd,y-yincrease,oCol)
		{
			while !place_meeting(x+sign(hspd),y,oCol) && !place_meeting(x,y,oCol)
			{x += sign(hspd); _pixel++; if (_pixel > _pixelLimit) {_pixel = 0; break; _freezeDetected = true;}}
			hspd = 0;
		}
		else  {y -= yincrease;}
		
		yincrease = 0;
	}
	x += hspd;
	
	// Down slope
	if !place_meeting(x,y+1,oSlope) && place_meeting(x,y+8,oSlope) && vspd > 0
	{
		while !place_meeting(x,y+1,oSlope)
		{y += 1;}
	}
	
	vspd += 0.4
	
	vspd = clamp(vspd,-9999,4);
	
	if (_freezeDetected) {show_debug_message(object_get_name(object_index) + " froze the game.")}
	y -= (_freezeDetected)? 16 : 0;
	x -= (_freezeDetected)? 16 : 0;
}