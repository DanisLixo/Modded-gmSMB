if !onview()
{exit;}

if !play_animation 
{
	if delay != -1
	{ind = 0;}
	else 
	{
		ind = sprite_get_number(spr)-1;
	}
} else {
	if ind >= sprite_get_number(spr)-1 
	{
		sprIndex += 0.3; 
		if delay > -1 {delay++;}
	}
}

if bub_ind != 0 {
	draw_sprite(sRetrossona_bubble,bub_ind,x,bbox_top-4); 
	bub_ind += 0.3;
}
if delay >= 55 {
	play_animation = false; 
	moving = true; 
	delay = -1;
}

draw_sprite(spr, sprIndex, x - sprite_get_width(spr) / 2, bbox_bottom - (sprite_get_height(spr) / 2) + 4);

draw_sprite_ext(sPlatform_LL,0, 
	x - sprite_get_width(spr) / 2, bbox_bottom, 
	sprite_get_height(spr) / sprite_get_width(sPlatform_LL), 
	1, 0, -1, 1);