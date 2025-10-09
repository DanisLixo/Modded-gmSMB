// Inherit the parent event
event_inherited();

#region Draw customization section (Since it's different)

if section == 8 || section == 9 || section == 10 {
	var abilState = global.abilities? "ENABLED" : "DISABLED";
	var abilSubstate = !global.abilities? "ENABLED" : "DISABLED";
			
	draw_set_font(global.fnt)
	draw_set_halign(fa_center);
			
	draw_text(SCREENW/2,8,"ABILITIES ARE "+abilState+"\nPRESS "+ keycode_to_string(global.keyh,true) +" TO "+abilSubstate)
		
	draw_set_font(-1)
	draw_set_halign(-1);
		
	if keyboard_check_pressed(global.menukh) {global.abilities = !global.abilities; savesettings();}
}

if section = 9 || section = 10
{
	smallMarioWalkDex += 0.2
	smallMarioWalkDex %= sprite_get_number(marSpr)

	bigMarioWalkDex += 0.2
	bigMarioWalkDex %= sprite_get_number(marSpr2)
		
	marioY += marioYAdd	
		
	var g = sGun_Default
	if sprite_exists(gs("sGun_Default"))
	{g = gs("sGun_Default");}
		
	groundX -= 2
	groundX %= 32
	for (var t = 0; t <= SCREENW+32; t += 32) {
		//show_debug_message(t)
		draw_sprite_ext(sGround_brown, 0, groundX + t, 208, 2, 2, 0, c_white, 1)
	}
		
	var player = section == 10? global.playertwo : global.player
	if marioY >= 206 {
		marioY = 206
		marSpr = sMario_s_walk
		if sprite_exists(ms("sMario_s_walk", player))
		{marSpr = ms("sMario_s_walk", player);}
	
		marSpr2 = sMario_b_walk
		if sprite_exists(ms("sMario_b_walk", player))
		{marSpr2 = ms("sMario_b_walk", player);}
	} else {
		marSpr = sMario_s_jump
		if sprite_exists(ms("sMario_s_jump", player))
		{marSpr = ms("sMario_s_jump", player);}
		
		if string_pos("Luigi", sprite_get_name(marSpr)) == 0 && global.abilities {marioYAdd += 0.4}
		else {marioYAdd += 0.2}
	
		marSpr2 = sMario_b_jump
		if sprite_exists(ms("sMario_b_jump", player))
		{marSpr2 = ms("sMario_b_jump", player);}
	}
			
	var scale = 2;
	var scaleg = 2;
	if marSpr = sPeterGriffin
	|| marSpr = sDuke
	|| marSpr = sPokey
	|| marSpr = sMaxVerstappen_s_idle  {scale = 0.35;}
		
	draw_set_font(fntComicsmall);
	draw_set_halign(fa_center);
		
	var palspr = section == 10? global.p2_palettesprite : global.palettesprite;
	var palind = section == 10? global.p2_paletteindex : global.paletteindex;
	var psel = section == 10? curplayer2sel : curplayersel;
			
	shader_set(shdColorswap); 
	apply_palette(palspr,palind,1); 
	draw_sprite_ext(marSpr,smallMarioWalkDex, SCREENW/2 - 24, marioY, scale, scale, 0, c_white, 1)
	draw_sprite_ext(marSpr2,bigMarioWalkDex, SCREENW/2 + 24, marioY, scale, scale, 0, c_white, 1)
	shader_reset();
	if section == 9
	{draw_sprite_ext(g,0,SCREENW/6,128+sin(current_time/800)*5,scaleg+(gunxs*(scaleg/4)),scaleg+(gunys*(scaleg/4)),0,-1,1);}
			
	draw_text(SCREENW/2, 32, "creator: "+global.creatorlist[| psel])
		
	draw_set_halign(fa_left);
	marioX = lerp(marioX, SCREENW/2 - 24, .1);
}

gunxs = lerp(gunxs,0,.2);
gunys = lerp(gunys,0,.2);
#endregion