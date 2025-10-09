#region controls customization
if waitforcontrol < 0
{waitforcontrol = 0;}

if waitforcontrol > 0
{
	waitforcontrol --;
	
	if keyboard_check_pressed(vk_escape)
	{waitforcontrol = -1;}
	
	if keyboard_check_pressed(vk_anykey) && (keyboard_lastkey != vk_enter && keyboard_lastkey != vk_escape)
	{
		variable_global_set(settingkey,keyboard_lastkey)
		waitforcontrol = -1
	}
}

if waitforcontrol != 0
{exit;}

if (section == 5 || section == 6 || section == 7) && keyboard_check_pressed(global.menukh) && resetCtrlsDelay < 1 
{resetCtrlsDelay = 1;}

if resetCtrlsDelay < 0 {resetCtrlsDelay++;}

if (section == 5 || section == 6) && keyboard_check(global.menukh) && resetCtrlsDelay >= 1 {
	resetCtrlsDelay++;
	resetCtrlsTimer--;
}

if keyboard_check_released(global.menukh) {
	resetCtrlsDelay = -60*2;
	resetCtrlsTimer = 60*5;
}
if keysReseted && (resetCtrlsDelay == 0) {
	keysReseted = false;
}

if resetCtrlsDelay >= 60*5 {
	if section == 5 {
		global.menukr = vk_right//ord("D");
		global.menukl = vk_left//ord("A");
		global.menuku = vk_up//ord("W");
		global.menukd = vk_down//ord("S");
		global.menuka = ord("X")//vk_lcontrol;
		global.menukj = ord("Z")//vk_space;
		global.menukh = ord("C")//ord("E");
	} else if section == 6 {
		global.keyr = vk_right//ord("D");
		global.keyl = vk_left//ord("A");
		global.keyu = vk_up//ord("W");
		global.keyd = vk_down//ord("S");
		global.keya = ord("X")//vk_lcontrol;
		global.keyj = ord("Z")//vk_space;
		global.keyh = ord("C")//ord("E");
	} else if section == 7 {
		global.p2_keyr = ord("D");
		global.p2_keyl = ord("A");
		global.p2_keyu = ord("W");
		global.p2_keyd = ord("S");
		global.p2_keya = vk_shift;
		global.p2_keyj = vk_space;
		global.p2_keyh = ord("E");
	}
	
	resetCtrlsDelay = -60*2;
	resetCtrlsTimer = 60*5;
	keysReseted = true;
	
	savesettings(); //Yuh uh, I just copied from the game init script, whatchu gonna do?
}
#endregion

#region selection

switch(categorysel) {
	case 0:
		category = "characters";
	break;
	case 1:
		category = "OCs";
	break;
	case 2:
		category = "png chars";
	break;
	case 3:
		category = "joke chars";
	break;
	default:
		category = "mods";
	break;
}

if keyboard_check_pressed(global.menuku) && sel > 0
{sel -= 1; sfx(sndMenumove,0);}
if keyboard_check_pressed(global.menukd) && sel < optionsnum[section]-1
{sel += 1; sfx(sndMenumove,0);}

var p = (keyboard_check_pressed(global.menukr)-keyboard_check_pressed(global.menukl)); 
	
if p != 0 {
	if menu[# section, sel] = "SFX"
	{global.volsfx += 0.1*p; audio_play_sound(sndStomp,1,0,global.volsfx); savesettings()}
	else if menu[# section, sel] = "BGM"
	{global.volbgm += 0.1*p; audio_play_sound(sndStomp,1,0,global.volbgm); savesettings()}
	else if p != 0 {sfx(sndMenumove,0);}
	
	global.volbgm = clamp(global.volbgm,0,1);
	global.volsfx = clamp(global.volsfx,0,1);
}


if menu[# section, sel] = "PLAYER - "
{
	if p != 0 {marioxs = -1; marioys = 1;}
		
	if section == 9 {curplayersel += p;}
	else if section == 10 {curplayer2sel += p;}
		
	if p != 0
	{
		if section == 9 {
		global.paletteindex = 1;
		update_playerpalette()
		}
		else if section == 10 {
		global.p2_paletteindex = 1;
		update_playerpalette(true)
		}
	}
	//curplayersel = clamp(curplayersel,0,ds_list_size(global.charlist)-1);
	
	if curplayersel > ds_list_size(global.charlist)-1 {curplayersel = 0;}
	if curplayersel < 0 {curplayersel = ds_list_size(global.charlist)-1;}
	
	if curplayer2sel > ds_list_size(global.charlist)-1 {curplayer2sel = 0;}
	if curplayer2sel < 0 {curplayer2sel = ds_list_size(global.charlist)-1;}
	
	if section == 9 {
		global.player = global.idlist[| curplayersel]
		global.playerName = global.charlist[| curplayersel]
			
		if curplayersel < charslist {
			categorysel = 0
		}
		else if curplayersel >= charslist and curplayersel < ocslist {
			categorysel = 1
		}
		else if curplayersel >= ocslist and curplayersel < lqlist {
			categorysel = 2
		}
		else if curplayersel >= lqlist and curplayersel < hqlist {
			categorysel = 3
		} else {
			categorysel = -1
		}
	} else if section == 10 {
		global.playertwo = global.idlist[| curplayer2sel]
		global.playertwoName = global.charlist[| curplayer2sel]
		
		if curplayer2sel < charslist {
			categorysel = 0
		}
		else if curplayer2sel >= charslist and curplayer2sel < ocslist {
			categorysel = 1
		}
		else if curplayer2sel >= ocslist and curplayer2sel < lqlist {
			categorysel = 2
		}
		else if curplayer2sel >= lqlist and curplayer2sel < hqlist {
			categorysel = 3
		} else {
			categorysel = -1
		}
	}
}

if menu[# section, sel] = "PALETTE - "
{
	if p != 0 {marioxs = -1; marioys = 1;}
	
	if section == 9 {
		global.paletteindex += p;
	
		if global.paletteindex > sprite_get_height(global.palettesprite)-1 {global.paletteindex = 1;}
		if global.paletteindex < 1 {global.paletteindex = sprite_get_height(global.palettesprite)-1;}
	}
	else if section == 10 {
		global.p2_paletteindex += p;
	
		if global.p2_paletteindex > sprite_get_height(global.p2_palettesprite)-1 {global.p2_paletteindex = 1;}
		if global.p2_paletteindex < 1 {global.p2_paletteindex = sprite_get_height(global.p2_palettesprite)-1;}
	}
}

if menu[# section, sel] = "CATEGORY - "
{
	if p != 0 {marioxs = -1; marioys = 1;}
	
	categorysel += p;
	
	if p != 0
	{
		switch(categorysel) {
			case 0:
				curplayersel = 0
				curplayer2sel = 0
				break;
			case 1:
				curplayersel = charslist
				curplayer2sel = charslist
				break;
			case 2:
				curplayersel = ocslist
				curplayer2sel = ocslist
				break;
			case 3:
				curplayersel = lqlist
				curplayer2sel = lqlist
				break;
			case 4:
				curplayersel = hqlist
				curplayer2sel = hqlist
				break;
			default:
				if categorysel > 4 {categorysel = 0; curplayersel = 0; curplayer2sel = 0;}
				else if categorysel < 0 {categorysel = 4; curplayersel = hqlist; curplayer2sel = hqlist;}
			break;
		}
	}
	if section == 9 {global.player = global.idlist[| curplayersel]; global.playerName = global.charlist[| curplayersel]}
	else if section == 10 {global.playertwo = global.idlist[| curplayer2sel]; global.playertwoName = global.charlist[| curplayer2sel]}
}

if menu[# section, sel] = "GUN - "
{
	curgunsel += p;
	if p != 0 {gunxs = -1; gunys = 1;}
	
	if curgunsel > ds_list_size(global.gunlist)-1 {curgunsel = 0;}
	if curgunsel < 0 {curgunsel = ds_list_size(global.gunlist)-1;}
	
	global.gunskin = global.gunlist[| curgunsel]
	
}

// palette
updtplayerpalette()
updtplayertwopalette()

if menu[# section, sel] = "LETTERBOX - "
{
	global.letterboxSelected += p;
	
	if global.letterboxSelected > array_length(global.letterboxes) - 1
	{global.letterboxSelected = 0;}
	if global.letterboxSelected < 0
	{global.letterboxSelected = array_length(global.letterboxes) - 1;}
	
	global.letterboxSprite = global.letterboxes[global.letterboxSelected].spr
}

if menu[# section, sel] = "TITLE SCREEN - "
{
	global.titleroomSelected += p;
	
	if global.titleroomSelected > array_length(global.titlerooms) - 1
	{global.titleroomSelected = 0;}
	if global.titleroomSelected < 0
	{global.titleroomSelected = array_length(global.titlerooms) - 1;}
}

if p != 0 {
	if globalVars[# section, sel] != "MARIO" 
	{
		var globalVariableName = globalVars[# section, sel]; 
		var globalVariable = variable_global_get(globalVariableName);
		
		variable_global_set(globalVariableName, (section == 13)? !globalVariable[sel] : !globalVariable);
	}
	
	savesettings(); //FOR FUCK SAKE MAN LOOK AT THIS SHIT
}

if keyboard_check_pressed(global.menukj) || keyboard_check_pressed(vk_enter) 
{
	if globalVars[# section, sel] != "MARIO" 
	{
		var globalVariableName = globalVars[# section, sel]; 
		var globalVariable = variable_global_get(globalVariableName);
		
		variable_global_set(globalVariableName, (section == 13)? !globalVariable[sel] : !globalVariable);
	}
	
	switch(menu[# section, sel])
	{
		case "CUSTOMIZE":
			if global.multiplayer {section = 8;}
			else {section = 9;}
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "AUDIO":
			section = 3;
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "VIDEO":
			section = 1;
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "TOGGLE FULLSCREEN":
			window_set_fullscreen(!window_get_fullscreen())
			sfx(sndMenuselect,0);
		break;
		case "RESET WINDOW":
			window_set_fullscreen(false)
		
			var scrsizemult = 3;
			window_set_size(SCREENW*scrsizemult,SCREENH*scrsizemult);
			window_center()
			sfx(sndMenuselect,0);
		break;
		case "LETTERBOX - ":
			global.letterboxSelected++
			if global.letterboxSelected > array_length(global.letterboxes) - 1
			{global.letterboxSelected = 0;}
			global.letterboxSprite = global.letterboxes[global.letterboxSelected].spr
			
			sfx(sndMenuselect,0);
			savesettings();
		break;
		case "TITLE SCREEN - ":
			global.titleroomSelected++
			if global.titleroomSelected > array_length(global.titlerooms) - 1
			{global.titleroomSelected = 0;}
			
			sfx(sndMenuselect,0);
			savesettings();
		break;
		case "TOGGLE LETTERBOX DARKEN":
			global.letterboxDark = !global.letterboxDark
			savesettings();
			sfx(sndMenuselect,0);
		break;
		case "RESOLUTION":
			section = 2;
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "CREDITS1!!":
			section = 17;
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "CONTROLS":
			section = 4;
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "UP":
			if section == 5 {setcontrol("menuku")}
			if section == 6 {setcontrol("keyu")}
			if section == 7 {setcontrol("p2_keyu")}
		break
		case "DOWN":
			if section == 5 {setcontrol("menukd")}
			if section == 6 {setcontrol("keyd")}
			if section == 7 {setcontrol("p2_keyd")}
		break
		case "LEFT":
			if section == 5 {setcontrol("menukl")}
			if section == 6 {setcontrol("keyl")}
			if section == 7 {setcontrol("p2_keyl")}
		break
		case "RIGHT":
			if section == 5 {setcontrol("menukr")}
			if section == 6 {setcontrol("keyr")}
			if section == 7 {setcontrol("p2_keyr")}
		break
		case "ACTION":
			if section == 6 {setcontrol("keya")}
			if section == 7 {setcontrol("p2_keya")}
		break
		case "JUMP":
			if section == 6 {setcontrol("keyj")}
			if section == 7 {setcontrol("p2_keyj")}
		break
		case "SPECIAL":
			if section == 6 {setcontrol("keyh")}
			if section == 7 {setcontrol("p2_keyh")}
		break
		case "RETURN":
			setcontrol("menuka")
		break
		case "SELECT":
			setcontrol("menukj")
		break
		case "THE THIRD BUTTON":
			setcontrol("menukh")
		break
		case "USE PLAYER 1 CONTROLS": 
			global.menukr = global.keyr
			global.menukl = global.keyl
			global.menuku = global.keyu
			global.menukd = global.keyd
			global.menuka = global.keya
			global.menukj = global.keyj
			global.menukh = global.keyh
			
			sfx(sndBoom, 1);
		break;
		case "OTHER":
			section = 11;
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "COMMANDER SETTINGS":
			section = 12;
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "AUDIO CHANNELS":
			if (global.musicChannels) {
				section = 13;
				sel = 0;
				sfx(sndMenuselect,0);
			} else {
				create_note(SCREENW/2, SCREENH/1.15, "Set Audio mode to Classic!")
				sfx(sndBreak, 1)
			}
		break;
		case "PREFERENCES":
			section = 14;
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "MODIFIERS":
			section = 16;
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "MISC":
			section = 15;
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "MENU":
			section = 5;
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "PLAYER 1":
			if section == 4 {section = 6;}
			if section == 8 {section = 9;}
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "PLAYER 2":
			if section == 4 {section = 7;}
			if section == 8 {section = 10;}
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		default:
			if menu[# section, sel] != "BACK" and section == 2
			{global.aspectRatio = menu[# section, sel]; resapply = true;}
			
			if file_exists("gmsmbsave.ini")
			{
				ini_open("gmsmbsave.ini");
				if global.aspectRatio == ini_read_string("Video","resolution","WIDESCREEN") || instance_exists(oPaused)
				{resapply = false;}
				ini_close();
			}
			
			resize_screen();
			sfx(sndMenuselect,0);
		break;
	}
}

if (keyboard_check_pressed(global.menuka) || keyboard_check_pressed(vk_escape)) 
|| ((keyboard_check_pressed(global.menukj) || keyboard_check_pressed(vk_enter)) 
&& menu[# section, sel] == "BACK") {
	if section = 0			{instance_destroy();}
	else if section = 1		{section = 0; sel = 1; if instance_exists(oPaused) {sel--;}}
	else if section = 2		{section = 1; sel = 6;}
	else if section = 3		{section = 0; sel = 2; if instance_exists(oPaused) {sel--;}}
	else if section = 4		{section = 0; sel = 3; if instance_exists(oPaused) {sel--;}}
	else if section = 5		{section = 4; sel = 0; savesettings();}
	else if section = 6		{section = 4; sel = 1; savesettings();}
	else if section = 7		{section = 4; sel = 2; savesettings();}
	else if section = 8		{section = 0; sel = 0;}
	else if section = 9		{if global.multiplayer {section = 8; sel = 0;} else {section = 0; sel = 0; if instance_exists(oPaused) {sel--;}}}
	else if section = 10	{section = 8; sel = 1;}
	else if section = 11	{section = 0; sel = 4;}
	else if section = 12	{section = 11; sel = 0;}
	else if section = 13	{section = 11; sel = 1;}
	else if section = 14	{section = 11; sel = 2;}
	else if section = 15	{section = 11; sel = 3;}
	else if section = 16	{section = 11; sel = 4;}
	else if section = 17	{section = 0; sel = 5;}
	
	if resapply {savesettings(); room_restart();}
		
	sfx(sndMenuback,0);
}
#endregion