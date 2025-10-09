/// @self
/// @description Resizes the screen to the selected resolution option.
function resize_screen(center = true)
{
	global.aspectRatio = global.aspectRatioModes[global.aspectRatioSelected];
	
	switch (global.aspectRatioSelected) {
		case 0: SCREENW = SCREENW_OG; SCREENH = SCREENH_OG; break;
		case 1: SCREENW = SCREENW_WS; SCREENH = SCREENH_OG; break;
	}
	
	var scrsizemult = 3;
	window_set_size(SCREENW*scrsizemult,SCREENH*scrsizemult);
	surface_resize(application_surface,SCREENW,SCREENH);
	camera_set_view_size(view_camera[0], SCREENW, SCREENH)
	
	if (center) window_center();
}