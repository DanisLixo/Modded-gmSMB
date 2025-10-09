if !oSecret3.moveCamera oCamera.x = clamp(oCamera.x, SCREENW/2, x)

if instance_place(x,y, oMario) {
	bgm(-1,false)

	oMario.in_cutscene = true;
	oMario.hspd = 0;

	if !oSecret3.moveCamera {
		oSecret3.alarm[0] = 80
		oSecret3.moveCamera = true;
	}	
}