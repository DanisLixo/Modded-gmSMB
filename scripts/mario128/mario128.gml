// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mario128_create(){
	codepos = 0;
	inputlist = ds_list_create()
	inputlist[| 0] = "1"
	inputlist[| 1] = "2"
	inputlist[| 2] = "8"
	inputlist[| 3] = ""
}

function mario128_step(){
	if keyboard_check_pressed(ord(inputlist[| codepos]))
	{
		codepos++;
		if codepos > 2 {
			if instance_number(oPlayer) >= 128
			{
				var marios = instance_number(oPlayer);
				while marios > 2
				{marios--; instance_destroy(instance_nearest(x,y,oPlayer));}
			}
			for (var i = 1; i < 12; ++i) {
				var mario = instance_create_depth(x,y,depth,oPlayer);
				mario.hspd = random_range(-8, 8)
				mario.vspd = random_range(-8, 0)
			}
			codepos = 0;
		}
	}
}