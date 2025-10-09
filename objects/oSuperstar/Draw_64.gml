if !onview() {
	ind += 0.05;
	
	var cx = camera_get_view_x(view_camera[0]);
	
	var starpos = sign(oSuperstar.x-cx) == -1? 32 : SCREENW-32

	draw_sprite_ext(sSuperstarpointer, ind, starpos, SCREENH/2,sign(oSuperstar.x-cx),1,0,-1,1)
}