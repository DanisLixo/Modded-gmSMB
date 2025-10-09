function ps_jumpcut()
{
	spr = ms("sMario_{}_jump"); 
		
	collidecode = true;
	grounded = false;
	vspd += 0.3
		
	x += hspd
	y += vspd
	if instance_place(x,bbox_bottom+vspd,oCol) 
	{state = ps.normal;}
}
