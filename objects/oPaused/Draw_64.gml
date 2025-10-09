//draw_text(SCREENW / 2, 32, "PAUSED")

if instance_exists(oMenu) {exit;}

draw_set_halign(fa_left)

var cx = 0; 
var cy = 0;
var tile = 8;

if pitch > 1 {pitched = true;}
if oGame.delay < 10 {oGame.delay++}
pitch = 1
		
if !instance_exists(oClient) 
{	
	audio_pause_sound(global.ch[0]);
	audio_pause_sound(global.ch[1]);
	audio_pause_sound(global.ch[2]);
	audio_pause_sound(global.ch[3]);
	audio_pause_sound(global.ch[4]);
	
}

#region //animation


draw_set_alpha(0.9);
draw_set_color(c_black);
	draw_rectangle(0,0,SCREENW,SCREENH,false);
draw_set_color(-1);
draw_set_alpha(1); 
	
image_xscale = SCREENW/20;
var yscale_togo = SCREENH/40;
shader_set(shdColorswap);
	apply_palette(sPalette_tilebrown,global.environment,image_alpha)
	draw_sprite_ext(sThetextgavemeideas, 0, SCREENW/2, SCREENH/2, image_xscale, image_yscale, 0, c_white, 1);
shader_reset();

if image_yscale < yscale_togo {image_yscale += 1;}

if image_yscale >= yscale_togo {
	shader_set(shdColorswap);
		apply_palette(sPalette_gold,global.environment+1,image_alpha)
		draw_sprite(sMushsel,oGame.image_index,(SCREENW/3)+4+(tile*-2)+cx,(tile*10)+((tile*2)*psel)+tile+cy)
	shader_reset();
	
	draw_set_font(global.fnt);
	for (var i = 0; i < array_length(options); i++) {
		var i_plus_one = i+1
		var roomnt = asset_get_index("rm"+string(global.world)+"_"+string(global.level));
		draw_text(SCREENW/3,(tile*9)+tile*(2*i_plus_one), options[i])
		
		if options[i] = "RESTART" and (!room_exists(roomnt) || global.sync) and global.extra = false
		{draw_text_color(SCREENW/3,(tile*9)+tile*(2*i_plus_one),options[i],c_yellow,c_yellow,c_yellow,c_yellow,0.6)}
	}
}
			
#endregion
