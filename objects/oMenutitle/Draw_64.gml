if instance_exists(oOnlinemenu) || instance_exists(oMenu) {exit;}

var cx = camera_get_view_x(view_camera[0])
var cy = camera_get_view_y(view_camera[0])

xx = SCREENW / 2;
yy = y + 136-cy;
tsep = 16;

draw_set_halign(fa_right)
draw_set_font(global.fnt)
	draw_text(SCREENW,SCREENH-8,"GMSMB*2 Ver. "+ VERSION)
draw_set_halign(-1)
draw_set_font(-1)

#region draw text
draw_set_font(global.fnt);
draw_set_halign(fa_center);

var text = "";

text = "!!\n\n" + menu[| sel] + "\n\n!!"

if sel == 0 
{text = "\n\n" + menu[| sel] + "\n\n!!"}
else if sel == ds_list_size(menu)-1 
{text = "!!\n\n" + menu[| sel]}
		
if menu[| sel] == "   PLAYER GAME" {
	var sx = x - 56;
 	var pls = (global.multiplayer)? "2" :"1";
	
	draw_set_halign(fa_left)
	draw_text(sx, yy + tsep + tsep / 2,pls);
	draw_set_halign(fa_center);
			
	draw_sprite_ext(sSetas,oGame.image_index,sx - tsep / 2, yy + tsep + tsep / 2,1,1,0,-1,1);
}
		
draw_text(x,yy + tsep / 2,text);

draw_set_halign(-1)
draw_set_font(-1)
#endregion