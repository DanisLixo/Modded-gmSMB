/// @self
/// @description I got no idea what this is, prob mimic NES draw sprite limitation. It goes unused tho.

function nes_flicker()
{
	var cx = camera_get_view_x(view_camera[0])
	
	var _list = ds_list_create();
	var _num = collision_line_list(cx,bbox_bottom-1,cx+SCREENW,bbox_bottom-1,oParenemy,true,true,_list,true)
	if _num >= 8
	{image_alpha = choose(0,1);}
	else
	{image_alpha = 1;}
	ds_list_destroy(_list);
	
}