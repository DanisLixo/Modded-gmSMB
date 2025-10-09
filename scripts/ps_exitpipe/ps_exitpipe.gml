function ps_exitpipe()
{
	var _peh = instance_place(x,y,oPipeexit_horizontal);
	var _pev = instance_place(x,y,oPipeexit_vertical);
	
	depth = 399;
	invincible = -2;
	
	if _peh && !_pev {
		if _peh.image_xscale == 1 {x--;}
		else {x++;}
	} 
	if (_pev && !_peh) || instance_place(x,y,oPipecutscene) {
		if instance_place(x,y,oPipecutscene) {_pev = instance_place(x,y,oPipecutscene);}
		if _pev.image_yscale == 1 {y--;}
		else {y++;}
	}
	else
	{depth = 0; state = ps.normal;}
}