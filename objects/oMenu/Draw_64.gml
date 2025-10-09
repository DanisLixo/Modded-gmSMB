menuind += 0.1

menu_background();

xx = (global.aspectRatio = "ORIGINAL")? 48 : 64;
yy = 64;
tsep = 16;

if global.titleroom != rmTitle_old
{
	xx = SCREENW / 2;
}

#region Draw customization section

if room != rmTitle_MK {
	if section == 8 || section == 9 || section == 10 {
		var abilState = global.abilities? "ENABLED" : "DISABLED";
		var abilSubstate = !global.abilities? "ENABLED" : "DISABLED";
			
		draw_set_font(global.fnt)
		draw_set_halign(fa_center);
			
		draw_text(SCREENW/2,208,"ABILITIES ARE "+abilState+"\nPRESS "+ keycode_to_string(global.keyh,true) +" TO "+abilSubstate)
		
		draw_set_font(-1)
		draw_set_halign(-1);
		
		if keyboard_check_pressed(global.keyh) {global.abilities = !global.abilities; savesettings();}
	}

	if section = 9 || section = 10
	{
		var player = section == 10? global.playertwo : global.player
		
		var p = sMario_s_idle
		if sprite_exists(ms("sMario_s_idle", player))
		{p = ms("sMario_s_idle", player);}
		var g = sGun_Default
		if sprite_exists(gs("sGun_Default"))
		{g = gs("sGun_Default");}
	
		//draw_set_font(global.fnt);
		//draw_text(xx-cx/2,yy-16,"CATEGORY - " + string_upper(category))
	
		var scale = 4;
		var scaleg = 2;
		if p = sPeterGriffin
		or p = sDuke
		or p = sPokey
		or p = sMaxVerstappen_s_idle {scale = 0.5;}
		if p = sPeppino {scale = 0.75;}
	
		var sp = (global.aspectRatio = "ORIGINAL")? 48 : 64;
	
		draw_set_font(fntComicsmall)
		draw_set_halign(fa_center);
		
		var palspr = section == 10? global.p2_palettesprite : global.palettesprite;
		var palind = section == 10? global.p2_paletteindex : global.paletteindex;
		var psel = section == 10? curplayer2sel : curplayersel;
			
		shader_set(shdColorswap); 
			apply_palette(palspr,palind,1); 
			draw_sprite_ext(p,0,SCREENW/2+sp,160+32+sin(current_time/800)*5-8,scale+(marioxs*(scale/4)),scale+(marioys*(scale/4)),0,-1,1)
		shader_reset();
		
		draw_text(SCREENW/2+sp,194,"creator: "+global.creatorlist[| psel])
		
		if sel == 3 && section == 9
		{draw_sprite_ext(g,0,SCREENW/2+sp+32,160+32+sin(current_time/800)*5-8-16,scaleg+(gunxs*(scaleg/4)),scaleg+(gunys*(scaleg/4)),0,-1,1)}
		draw_set_halign(fa_left);
	}

	marioxs = lerp(marioxs,0,.2);
	marioys = lerp(marioys,0,.2);
	gunxs = lerp(gunxs,0,.2);
	gunys = lerp(gunys,0,.2);
}
#endregion

#region Draw credits section
if section == 17 
{
	draw_set_halign(fa_left);
	
	xx = (global.aspectRatio = "ORIGINAL")? 32 : 48;
	yy = 24;
	var cyy = 16;
	tsep = 32;
	var bredi_credit = "MADE THE ORIGINAL RECREATION!"
	var dawlate_credit = "MADE THE MOD, ADDING SOME COOL THINGS!"
	var marioket_credit = "MADE SOME THINGS LIKE \nSKIN MOD SUPPORT, A MENU TITLE AND MORE!"
		
	if global.aspectRatio == "ORIGINAL" {
		bredi_credit = "MADE THE ORIGINAL \nRECREATION!"
		dawlate_credit = "MADE THE MOD, ADDING \nSOME COOL THINGS!"
		marioket_credit = "MADE SOME THINGS \nLIKE SKIN MOD SUPPORT, \nA MENU TITLE AND MORE!"
	}
	
	draw_set_font(global.fnt)
	draw_sprite(sIcon_breditiny, 0, xx,cyy+tsep*1)	draw_text(xx-8,cyy+tsep*2,"bredi")
	draw_text(xx*2.1,cyy+tsep*1,bredi_credit)
	draw_sprite(sIcon_dawlatetiny, 0, xx,cyy+tsep*3)	draw_text(xx-8,cyy+tsep*4,"DAWLATE")
	draw_text(xx*2.1,cyy+tsep*3,dawlate_credit)
	draw_sprite(sIcon_mariokettiny, 0, xx,cyy+tsep*5)	draw_text(xx-8,cyy+tsep*6,"MARIOKET")
	draw_text(xx*2.1,cyy+tsep*5,marioket_credit)
}
#endregion

#region Draw text
draw_set_halign(fa_center);

if global.titleroom == rmTitle_old
{
	draw_set_halign(fa_left);
}
	
var text = "";
var bii = 0;
draw_set_font(global.fnt);
	
for (var i = 0; i < optionsnum[section]; i ++;)
{
	var backapply = (resapply)? "  APPLY" : "  " + menu[# section, i];
	
	if menu[# section, i] = "SFX"
	{text = menu[# section, i]+" * "+string(round(global.volsfx*100))}
	else if menu[# section, i] = "BGM"
	{text = menu[# section, i]+" * "+string(round(global.volbgm*100))}
	else if menu[# section, i] = "BACK"
	{
		text = backapply;
		
		if draw_get_halign() == fa_left
		{draw_sprite(sBacksel,0,xx,yy+(i*tsep)); text = backapply;}
		else 
		{draw_sprite(sBacksel,0,xx - (string_width(text) / 2), yy + (i*tsep));}
	}
	else if menu[# section, i] = "DISCORD PFP - "
	{
		var ex = "SHOW"
		if global.showpfp = false {ex = "HIDE";}
		text = menu[# section, i] + ex;
	}
	else if menu[# section, i] = "SHOW FPS - "
	{
		var ex = "YES"
		if global.showfps = false {ex = "NO";}
		text = menu[# section, i]+ex;
	}
	else if menu[# section, i] = "LETTERBOX - "
	{
		text = menu[# section, i]+string_upper(global.letterboxes[global.letterboxSelected].name)
	}
	else if menu[# section, i] = "TITLE SCREEN - "
	{
		text = menu[# section, i]+string_upper(global.titlerooms[global.titleroomSelected].name)
	}
	else if menu[# section, i] = "SOUND MODE - "
	{
		var ex = "CLASSIC"
		if global.musicChannels = false {ex = "MODERN";}
		text = menu[# section, i] + ex;
	}
	else if menu[# section, i] = "PLAY GANGNAM - "
	{
		var ex = "YES"
		if global.opacandastar = false {ex = "NO I HATE GANGNAM STYOE!!!!!";}
		text = menu[# section, i]+ex
	}
	
	else if menu[# section, i] = "CATEGORY - "
	{text = menu[# section, i]+string_upper(category);}
	else if menu[# section, i] = "PLAYER - " and section == 9
	{text = menu[# section, i]+string_upper(global.playerName);}
	else if menu[# section, i] = "PLAYER - " and section == 10
	{text = menu[# section, i]+string_upper(global.playertwoName);}
	else if menu[# section, i] = "PALETTE - " and section == 9
	{text = menu[# section, i]+string_upper(global.paletteindex);}
	else if menu[# section, i] = "PALETTE - " and section == 10
	{text = menu[# section, i]+string_upper(global.p2_paletteindex);}
	else if menu[# section, i] = "GUN - "
	{text = menu[# section, i]+string_upper(global.gunskin);}
	else if menu[# section, i] = "MAX PLAYERS - "
	{text = menu[# section, i]+string_upper(global.maxplayers);}
	else if menu[# section, i] = "COMMAND ENEMIES - "
	{
		var ex = "YES"
		if global.moveEnys = false {ex = "NO";}
		text = menu[# section, i]+ex;
	}
	else if menu[# section, i] = "COMMAND MOVABLE OBJS - "
	{
		var ex = "YES"
		if global.moveObjs = false {ex = "NO";}
		text = menu[# section, i]+ex;
	}
	else if menu[# section, i] = "COMMAND STATICS - "
	{
		var ex = "YES"
		if global.moveStatics = false {ex = "NO";}
		text = menu[# section, i]+ex
	}
	else if menu[# section, i] = "SQUARE 0 - "
	{
		var ex = "ACTIVE"
		if global.chAllowed[0] = false {ex = "NOT ACTIVE";}
		text = menu[# section, i]+ex;
	}
	else if menu[# section, i] = "SQUARE 1 - "
	{
		var ex = "ACTIVE"
		if global.chAllowed[1] = false {ex = "NOT ACTIVE";}
		text = menu[# section, i]+ex;
	}
	else if menu[# section, i] = "TRIANGLE 2 - "
	{
		var ex = "ACTIVE"
		if global.chAllowed[2] = false {ex = "NOT ACTIVE";}
		text = menu[# section, i]+ex;
	}
	else if menu[# section, i] = "NOISE 3 - "
	{
		var ex = "ACTIVE"
		if global.chAllowed[3] = false {ex = "NOT ACTIVE";}
		text = menu[# section, i]+ex;
	}
	else if (section == 5 || section == 6 || section == 7) && menu[# section, i] != "BACK"
	{
		var gobal  = global.keyu
		
		if section == 5 {
			switch(menu[# section, i])
			{
				case "UP":		gobal=global.menuku		break;
				case "DOWN":	gobal=global.menukd		break;
				case "LEFT":    gobal=global.menukl		break;
				case "RIGHT":   gobal=global.menukr		break;
				case "RETURN":	gobal=global.menuka		break;
				case "SELECT":  gobal=global.menukj		break;
				case "THE THIRD BUTTON": gobal=global.menukh break;
			}
		}
		
		if section == 6 {
			switch(menu[# section, i])
			{
				case "UP":		gobal=global.keyu		break;
				case "DOWN":	gobal=global.keyd		break;
				case "LEFT":    gobal=global.keyl		break;
				case "RIGHT":   gobal=global.keyr		break;
				case "ACTION":  gobal=global.keya		break;
				case "JUMP":    gobal=global.keyj		break;
				case "SPECIAL": gobal=global.keyh		break;
			}
		}
		
		if section == 7 {
			switch(menu[# section, i])
			{
				case "UP":		gobal=global.p2_keyu		break;
				case "DOWN":	gobal=global.p2_keyd		break;
				case "LEFT":    gobal=global.p2_keyl		break;
				case "RIGHT":   gobal=global.p2_keyr		break;
				case "ACTION":  gobal=global.p2_keya		break;
				case "JUMP":    gobal=global.p2_keyj		break;
				case "SPECIAL": gobal=global.p2_keyh		break;
			}
		}
		
		text = menu[# section, i];
		draw_set_font(fntComic)
		if (menu[# section, i] != "USE PLAYER 1 CONTROLS")
		{draw_text(xx + (tsep*5) + tsep/2,yy+(i*tsep)-4,"( "+keycode_to_string(gobal,false)+" )");}
		draw_set_font(global.fnt)
	
	}
	else if menu[# section, i] = "HARD MODE - "
	{
		var ex = "ENABLED"
		if global.hardmode = false {ex = "DISABLED";}
		text = menu[# section, i]+ex;
	}
	else if menu[# section, i] = "DIFFERENT PIPE TRANSITIONS - "
	{
		var ex = "ENABLED"
		if global.differentTransitions = false {ex = "DISABLED";}
		text = menu[# section, i]+ex;
	}
	else if menu[# section, i] = "WARP ZONE - "
	{
		var ex = "ENABLED"
		if global.warpzone = false {ex = "DISABLED";}
		text = menu[# section, i]+ex;
	}
	else if menu[# section, i] = "BLOOD - "
	{
		var ex = "ENABLED"
		if global.blood = false {ex = "DISABLED";}
		text = menu[# section, i]+ex;
	}
	else if menu[# section, i] = "POWER UP LOSS VISUAL - "
	{
		var ex = "ENABLED"
		if global.pupleave = false {ex = "DISABLED";}
		text = menu[# section, i]+ex;
	}
	else if menu[# section, i] = "WZ SCROLL LOCK - "
	{
		var ex = "LOCK"
		if global.warpzoneScrollPatch = false {ex = "DEFAULT";}
		text = menu[# section, i]+ex;
	}
	else if menu[# section, i] = "CHECKPOINTS - "
	{
		var ex = "ENABLED"
		if global.checkpoints = false {ex = "DISABLED";}
		text = menu[# section, i]+ex;
	}
	else if menu[# section, i] = "LAKITU THROW - "
	{
		var ex = "FIXED"
		if global.spinypatch = false {ex = "DEFAULT";}
		text = menu[# section, i]+ex;
	}
	else if menu[# section, i] = "STOMP UNDERWATER - "
	{
		var ex = "ORIGINAL"
		if global.nouwstomp = false {ex = "FIXED";}
		text = menu[# section, i]+ex;
	}
	else if menu[# section, i] = "REMOVE HAMMER BROS - "
	{
		var ex = "ENABLED"
		if global.rmhambro = false {ex = "DISABLED";}
		text = menu[# section, i]+ex;
	}
	else if menu[# section, i] = "1UP CLONES MARIO - "
	{
		var ex = "ENABLED"
		if global._1upclonebug = false {ex = "DISABLED";}
		text = menu[# section, i]+ex;
	}
	else if menu[# section, i] = "OP HAT - "
	{
		var ex = "ENABLED"
		if global.hatblockspambug = false {ex = "DISABLED";}
		text = menu[# section, i]+ex;
	}
	else if menu[# section, i] = "RAIN OF ENEMIES - "
	{
		var ex = "ENABLED"
		if global.enemiesrain = false {ex = "DISABLED";}
		text = menu[# section, i]+ex;
	}
	else if menu[# section, i] = "HYDRA ENEMIES - "
	{
		var ex = "ENABLED"
		if global.enymulti = false {ex = "DISABLED";}
		text = menu[# section, i]+ex;
	}
	else if menu[# section, i] = "DOUBLE TROUBLE - "
	{
		var ex = "ENABLED"
		if global.doubleeny = false {ex = "DISABLED";}
		text = menu[# section, i]+ex;
	}
	else if menu[# section, i] = "BOWSER MODE - "
	{
		var ex = "ENABLED"
		if global.bowseronly = false {ex = "DISABLED";}
		text = menu[# section, i]+ex;
	}
	else {text = string(menu[# section, i]);}
	
	if i == sel {
		var mushx = (draw_get_halign() = fa_center)? xx - (string_width(text) / 2) - 16 : xx - 16
		shader_set(shdColorswap) 
			apply_palette(sPalette_gold,global.environment+1,1); 
			draw_sprite(sMushsel,oGame.image_index, mushx,yy+(i*tsep));
		shader_reset();
	}
	var charlimit = 1
			
	if global.aspectRatio == "ORIGINAL" 
	{charlimit = (string_length(text) > 20)? 1-((string_length(text)-20)*0.025) : 1;}
	if global.aspectRatio == "WIDESCREEN"
	{charlimit = (string_length(text) > 35)? 1-((string_length(text)-35)*0.025) : 1;}
	draw_text_transformed(xx,yy+(i*tsep),text,charlimit,1,0);
}
#endregion

#region draw misc
if waitforcontrol > 0
{
	draw_set_alpha(0.9)
	draw_rectangle_color(-1,-1,SCREENW+1,SCREENH+1,c_black,c_black,c_black,c_black,false)
	draw_set_alpha(1);

	draw_set_halign(fa_middle)
	draw_text(SCREENW/2,SCREENH/2,"WAITING FOR KEY:  "+string(menu[# section, sel]))
	draw_text(SCREENW/2,SCREENH/2 + 16,waitforcontrol)
	
	draw_text(SCREENW/2,SCREENH-16,"PRESS ESCAPE TO CANCEL")
	draw_set_halign(-1)
}

if (section == 5 || section == 6 || section == 7) {
	var text = (resetCtrlsDelay < 60*3)? "HOLD "+keycode_to_string(global.menukh, true)+" FOR "+string(round(resetCtrlsTimer)/60)+" SECONDS\nTO RESET CONTROLS TO DEFAULT" : "ALMOST THERE!\n"+ string(round(resetCtrlsTimer)/60)+ " SECONDS REMAINING...";
	if resetCtrlsDelay < 0 {
		text = (keysReseted)? "WE ARE DONE!\nKEYS ARE BACK TO DEFAULT. :D" : "OH OK...\nI DIDN'T WANT TO DO IT ANYWAYS..."
	}
	
	draw_set_halign(fa_middle);
	draw_text(SCREENW/2,SCREENH/1.15,text);
	
	draw_set_color(c_red)
	draw_set_alpha(resetCtrlsDelay/300)
	draw_text(SCREENW/2,SCREENH/1.15,text);
	draw_set_halign(-1)
	draw_set_color(-1)
	draw_set_alpha(1)
}
#endregion

draw_set_font(-1)