// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function blood() {
	if !global.blood {return false;}
	
	var bloodCount = irandom_range(12,16);
	
	bleeding = true;
	
	for (var i = 0; i < bloodCount; ++i) {
	    var b = instance_create_depth(x,bbox_top,depth-1,oBlood);
		if i mod 4 == 0 {b.colEnabled = false;}
	}
	
	return true;
}

function bleed() {
	if !global.blood 
	{return false;}
	
	if (bleeding) {
	
		var ct = current_time;
	
		if ct mod 12 == 0
		{
			var b = instance_create_depth(x,y-4,depth-1,oBlood)
			b.colEnabled = false;
			b.hspd = 0;
			b.vspd = 4;
		}
	
		return true;	
	}
}