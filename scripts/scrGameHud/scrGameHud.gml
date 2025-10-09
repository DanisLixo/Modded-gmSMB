// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function game_hud() {
	if (room == rmTitle_MK || room == rmWarning || room = rmDemoSplash || string_pos("x2",room_get_name(room)) != 0) {exit;}
	/// handle gui
	draw_set_font(global.fnt)

	var cx = camera_get_view_x(view_camera[0])
	var cy = camera_get_view_y(view_camera[0])
	var tile = 8;
	
	// Score
	var scorestr = string(global.score)		
	while (string_length(scorestr) < 6)	{scorestr = "0"+scorestr;}
	
	var sicon = custom_sprite(sCoinicon);
	var sicon2 = custom_sprite(sCoinicon, global.playertwo);

	if global.multiplayer {
		// MARIO and LUIGI
		var char = string_char_at(string_upper(global.playerName),1)
		draw_text((tile*3)+cx,(tile)+cy,char + "-" + scorestr)
	
		var p2_char = string_char_at(string_upper(global.playertwoName),1)
		var p2_scorestr = string(global.p2_score)	while (string_length(p2_scorestr) < 6)	{p2_scorestr = "0"+p2_scorestr;}
	
		draw_text((tile*3)+cx,(tile*2)+cy,p2_char + "-" + p2_scorestr)

		// Coins
		shader_set(shdColorswap);
			apply_palette(sPalette_gold,global.environment+1,image_alpha)
			draw_sprite(sicon,image_index,(tile*11)+cx,(tile)+cy)
			draw_sprite(sicon2,image_index,(tile*11)+cx,(tile*2)+cy)
		shader_reset();

		var coinstr = string(global.coins);			if (string_length(coinstr) < 2)		{coinstr = "0"+coinstr;}
		var p2_coinstr = string(global.p2_coins);	if (string_length(p2_coinstr) < 2)	{p2_coinstr = "0"+p2_coinstr;}
		draw_text((tile*12)+cx,(tile)+cy,"*"+coinstr)
		draw_text((tile*12)+cx,(tile*2)+cy,"*"+p2_coinstr)
	
		// Hats
		var _setAlpha = oGame.savedpowerup == "h" || (instance_exists(oPlayer) && oPlayer.powerup == "h");
		draw_set_alpha(_setAlpha);
		
		var coindist = string_length(coinstr) < 2? 1 : string_length(coinstr)-2;
		shader_set(shdColorswap);
		apply_palette(sPalette_goomba,global.environment,_setAlpha)
		draw_sprite(sHaticon,image_index,(SCREENW-256)+(tile*(15+coindist))+cx,(tile)+cy);
		shader_reset();
		
		var hatstr = string(global.hats-instance_number(oHatThrow)) if (string_length(hatstr) < 2) {hatstr = "0"+hatstr;}
		draw_text((SCREENW-256)+(tile*(16+coindist))+cx,(tile)+cy, "*" + hatstr);
		
		draw_set_alpha(1);
		
		// P meter
		_setAlpha = oGame.savedpowerup == "c" || (instance_exists(oPlayer) && oPlayer.powerup = "c") || global.player = "Feathy";
		draw_set_alpha(_setAlpha);
		
		shader_set(shdColorswap);
		apply_palette(sPalette_gold,global.environment+1,_setAlpha)
		draw_sprite(sPmeter,global.pind,(SCREENW-256)+(tile*(15+coindist))+cx,(tile)+cy)
		shader_reset();
		
		draw_set_alpha(1);
		
		// Hats
		_setAlpha = oGame.p2savedpowerup == "h" || (instance_exists(oLuigi) && oLuigi.powerup == "h");
		draw_set_alpha(_setAlpha);
		
		var p2_coindist = string_length(p2_coinstr) < 2? 1 : string_length(p2_coinstr)-2;
		shader_set(shdColorswap);
		apply_palette(sPalette_goomba,global.environment,_setAlpha)
		draw_sprite(sHaticon,image_index,(SCREENW-256)+(tile*(15+p2_coindist))+cx,(tile*2)+cy);
		shader_reset();
		
		draw_text((SCREENW-256)+(tile*(16+p2_coindist))+cx,(tile*2)+cy, "*" + hatstr);
		
		draw_set_alpha(1);

		// P meter
		_setAlpha = oGame.p2savedpowerup == "c" || (instance_exists(oLuigi) && oLuigi.powerup = "c") || global.playertwo = "Feathy";
		draw_set_alpha(_setAlpha);
		
		shader_set(shdColorswap);
		apply_palette(sPalette_gold,global.environment+1,_setAlpha)
		draw_sprite(sPmeter,global.p2_pind,(SCREENW-256)+(tile*(15+p2_coindist))+cx,(tile*2)+cy)
		shader_reset();
		
		draw_set_alpha(1);
	} else {
		// MARIO
		draw_text((tile*3)+cx,(tile)+cy,string_upper(global.playerName))
	
		// Score
		draw_text((tile*3)+cx,(tile*2)+cy,scorestr)

		// Coins
		shader_set(shdColorswap);
			apply_palette(sPalette_gold,global.environment+1,image_alpha)
			draw_sprite(sicon,image_index,(tile*11)+cx,(tile*2)+cy)
		shader_reset();

		var coinstr = string(global.coins)	if (string_length(coinstr) < 2)	{coinstr = "0"+coinstr;}
		draw_text((tile*12)+cx,(tile*2)+cy,"*"+coinstr)
		
		
		// Hats
		var _setAlpha = oGame.savedpowerup == "h" || (instance_exists(oPlayer) && oPlayer.powerup == "h");
		draw_set_alpha(_setAlpha);
		
		shader_set(shdColorswap);
		apply_palette(sPalette_goomba,global.environment,_setAlpha)
		draw_sprite(sHaticon,image_index,(tile*11)+cx,(tile)+cy);
		shader_reset();
	
		var hatstr = string(global.hats-instance_number(oHatThrow)); if (string_length(hatstr) < 2) {hatstr = "0"+hatstr;}
		draw_text((tile*12)+cx,(tile)+cy, "*"+hatstr);
		
		draw_set_alpha(1);
		
		// P meter
		_setAlpha = oGame.savedpowerup == "c" || (instance_exists(oPlayer) && oPlayer.powerup = "c") || global.player = "Feathy";
		draw_set_alpha(_setAlpha);
		
		shader_set(shdColorswap);
		apply_palette(sPalette_gold,global.environment+1,_setAlpha)
		draw_sprite(sPmeter,global.pind,(tile*11)+cx,(tile)+cy)
		shader_reset();
		
		draw_set_alpha(1);
	}

	// WORLD
	var mptile = global.multiplayer? 4:2

	if instance_exists(oIsArena)
	{
		var starstr = string(global.goalofstars); if (string_length(starstr) < 2) {starstr = "0"+starstr;}
		draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile)+cy,"GOAL");
		draw_text((SCREENW-(256/2))+(tile*3)+cx,(tile*2)+cy,starstr);
	}
	else if global.challenge {
		draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile)+cy,"RETROED")
		draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*2)+cy,string(global.retros))
	}
	else if string_pos("Title",room_get_name(room)) == 0 && room != rmLobby and room != rmDemoend
	{
		if global.extra {draw_text((SCREENW-(256/2))+(tile*mptile)+cx,(tile)+cy,"EXTRA");}
		else if global.player == "Gemaplys" 
		{draw_text((SCREENW-(256/2))+(tile*mptile)-tile+cx,(tile)+cy,"PELOTAS");}
		else {draw_text((SCREENW-(256/2))+(tile*mptile)+cx,(tile)+cy,"WORLD");}
		if global.level != 0 
		{
			var level  = string(global.world)+"-"+string(global.level);
			draw_text((SCREENW-(256/2))+(tile*mptile)+tile+cx,(tile*2)+cy,level)
		}
	}

	// Time
	draw_text((SCREENW-(256/2))+(tile*9)+cx,(tile)+cy,"TIME")

	if global.time >= 0 and room != rmLeveltransition and room != rmDemoend
	{
		var timestr = string(round(global.time/(room_speed*TIMESEC)))
		while (string_length(timestr) < 3)	{timestr = "0"+timestr;}
		if (string_length(timestr) > 3)	{timestr = "999+";}
		draw_text((SCREENW-(256/2))+(tile*10)+cx,(tile*2)+cy,timestr)


		if instance_exists(oRacemanager) && global.race = true
		{
			var mm = string(oRacemanager.minutes);
			var ss = string(oRacemanager.seconds);
			var mls = string(oRacemanager.milliseconds);
		
		
			while (string_length(mm) < 2)	{mm = "0"+mm;}
			while (string_length(ss) < 2)	{ss = "0"+ss;}
			while (string_length(mls) < 3)	{mls = "0"+mls;}
		
			timestr = mm+":"+ss+":"+mls;
		
			draw_set_halign(fa_right);
			//draw_text((SCREENW/2)+(tile*2)+(tile*11)+cx,cy+tile+tile*2,timestr)
			draw_text((SCREENW-(256/2))+(tile*13)+cx,(tile*3)+cy,timestr)
			draw_set_halign(fa_left);
		}
		if is_onArena()
		{
			draw_set_halign(fa_right);
			//draw_text((SCREENW/2)+(tile*2)+(tile*11)+cx,cy+tile+tile*2,timestr)
			draw_text((SCREENW-(256/2))+(tile*13)+cx,(tile*3)+cy,timestr)
			draw_set_halign(fa_left);
		}
	}
	
	// FPS
	if global.showfps and string_pos("Title",room_get_name(room)) == 0 
	{
		draw_text(cx+(tile*3),cy+(tile*3),"FPS - " + string(fps) + "/" + string(game_get_speed(gamespeed_fps)))
	}
	
	if global.race = true && instance_exists(oRacemanager)
	{
		draw_set_font(fntComic)
	
		var relist = ds_grid_create(ds_grid_width(global.racepos), ds_grid_height(global.racepos))
	
		ds_grid_copy(relist,global.racepos)
	
		ds_grid_sort(relist,0,true);
		
		for (var i = 0; i < ds_grid_height(relist); i++;)
		{
			if global.race = true && relist[# 0,i] > 0
			{
				if i = 1		{draw_set_color(c_yellow);}
				else if i = 2	{draw_set_color(c_ltgrey);}
				else if i = 3	{draw_set_color(c_maroon);}
				else			{draw_set_color(c_white);}
			
				var timestr = string(relist[# 1,i])
				draw_set_font(fntComic)
				draw_text(cx+(tile*2),cy+tile*6+(16*i),timestr + " - " + string(relist[# 2,i]))
			}
		}
		draw_set_font(-1);
		draw_set_color(-1);
	
		ds_grid_destroy(relist);
	}
}