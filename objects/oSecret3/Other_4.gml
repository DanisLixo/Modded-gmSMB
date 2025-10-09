if room != bornroom
{
	global.aspectRatio = savedres;
	global.player = savedchar;
	
	resize_screen();
	instance_destroy();
}