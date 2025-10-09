///@funtion sfx
///@description Self explanatory, it plays a sound effect.
///@param {Audio Asset} sound The sound to play
///@param {Real} channel Which channel should the audio be played. 
///@description WARNING: modern option will disable the effect of channel use.

function sfx(sound,channel)
{
	var soundstring = sound;
	
	if (!is_string(sound))
	{soundstring = audio_get_name(sound);}
	
	if object_index = oLuigi {var mySnd = soundstring+"_"+global.playertwo;}
	else {var mySnd = soundstring+"_"+global.player;}
	
	if asset_get_index(mySnd) != -1
	{sound = asset_get_index(mySnd);}
	else if ds_map_find_value(global.moddedSounds, mySnd) != undefined
	{sound = ds_map_find_value(global.moddedSounds, mySnd)}
	else
	{sound = asset_get_index(soundstring)}
	
	if global.musicChannels = true && global.volsfx > 0
	{
		if audio_is_playing(sound) {audio_stop_sound(sound);}
		global.sfx[0] = audio_play_sound(sound,1,false,global.volsfx)
		global.sfx[1] = channel
	}
	else
	{
		audio_play_sound(sound,1,false,global.volbgm)
	}
}

/// @desc Set the Background Music.
/// @param {real} bgmstr The music name as a String.
/// @param {bool} loops loops If it should loop or not.
function bgm(bgmstr,loops)
{
	if bgmstr = -1 
	{
		audio_stop_sound(global.ch[0]);
		audio_stop_sound(global.ch[1]);
		audio_stop_sound(global.ch[2]);
		audio_stop_sound(global.ch[3]);
		audio_stop_sound(global.ch[4]);
		exit;
	}
	
	if bgm_is_playing(bgmstr) {exit;}
	
	if instance_exists(oRacemanager) && !(bgmstr = "Levelend" or bgmstr = "GO" or bgmstr = "Demoend" || bgmstr = "Castleend" || bgmstr = "Toadstool")
	{exit;}
	
	if is_string(bgmstr) && global.musicChannels = true && global.volbgm > 0
	{
		audio_stop_sound(global.ch[0]);
		audio_stop_sound(global.ch[1]);
		audio_stop_sound(global.ch[2]);
		audio_stop_sound(global.ch[3]);
		audio_stop_sound(global.ch[4]);
		
		audio_stop_all();
		
		var charname = global.player;
		charname = string_replace(charname," ","_")
			
		var charsound = "mus"+bgmstr+"_"+charname;
		var charthemestr = "mus"+charname;
		
		#region For Mods
		
		if ds_map_find_value(global.moddedChars, charname) != undefined {
			if ds_map_find_value(global.moddedSounds, charsound) != undefined {
				global.ch[4] = audio_play_sound(ds_map_find_value(global.moddedSounds, charsound),1,loops,global.volbgm); 
				exit;
			}
			if ds_map_find_value(global.moddedSounds, charthemestr) != undefined {
				global.ch[4] = audio_play_sound(ds_map_find_value(global.moddedSounds, charthemestr),1,loops,global.volbgm); 
				exit;
			} 
			if global.chAllowed[0] && ds_map_find_value(global.moddedSounds, charsound+"_c0") != undefined 
			{global.ch[0] = audio_play_sound(ds_map_find_value(global.moddedSounds, charsound+"_c0"),1,loops,global.volbgm);}
			if global.chAllowed[1] && ds_map_find_value(global.moddedSounds, charsound+"_c1") != undefined 
			{global.ch[1] = audio_play_sound(ds_map_find_value(global.moddedSounds, charsound+"_c1"),1,loops,global.volbgm);}
			if global.chAllowed[2] && ds_map_find_value(global.moddedSounds, charsound+"_c2") != undefined 
			{global.ch[2] = audio_play_sound(ds_map_find_value(global.moddedSounds, charsound+"_c2"),1,loops,global.volbgm);}
			if global.chAllowed[3] && ds_map_find_value(global.moddedSounds, charsound+"_c3") != undefined 
			{global.ch[3] = audio_play_sound(ds_map_find_value(global.moddedSounds, charsound+"_c3"),1,loops,global.volbgm);}
		
			if ds_map_find_value(global.moddedSounds, charsound+"_c0") != undefined 
			|| ds_map_find_value(global.moddedSounds, charsound+"_c1") != undefined 
			|| ds_map_find_value(global.moddedSounds, charsound+"_c2") != undefined
			|| ds_map_find_value(global.moddedSounds, charsound+"_c3") != undefined {
				global.ch[4] = audio_play_sound(ds_map_find_value(global.moddedSounds, charsound),1,loops,global.volbgm); 
				exit;
			} else if ds_map_find_value(global.moddedSounds, charsound) != undefined {
				global.ch[4] = audio_play_sound(ds_map_find_value(global.moddedSounds, charsound),1,loops,global.volbgm); 
				exit;
			}
		}
		
		#endregion
		
		var sound = "mus"+bgmstr;
		
		var chartheme = asset_get_index("mus"+charname);
		var charsong =	asset_get_index(charsound);
		var c0 = asset_get_index(charsound+"_c0");
		var c1 = asset_get_index(charsound+"_c1");
		var c2 = asset_get_index(charsound+"_c2");
		var c3 = asset_get_index(charsound+"_c3");
		var savior =	asset_get_index(sound);
		
		#region Built-in focused system
		if global.player != "Syobon"  
		{
			if audio_exists(charsong) {
				global.ch[4] = audio_play_sound(charsong,1,loops,global.volbgm); 
				exit;
			} 
			
			if audio_exists(chartheme) && !global.starmanPlaying && bgmstr != "Levelend" && bgmstr != "Castleend" && bgmstr != "Toadstool" && bgmstr != "GO" {
				global.ch[4] = audio_play_sound(chartheme,1,loops,global.volbgm); 
				exit;
			} 
		}
		
		if (global.multiplayer && (c0 == undefined && c1 == undefined && c2 == undefined && c3 == undefined)) 
		{
			charname = global.playertwo;
			charname = string_replace(charname," ","_")
			
			charsound = "mus"+bgmstr+"_"+charname;
			
			c0 = asset_get_index(charsound+"_c0");
			c1 = asset_get_index(charsound+"_c1");
			c2 = asset_get_index(charsound+"_c2");
			c3 = asset_get_index(charsound+"_c3");
		}
		
		if (c0 == undefined && c1 == undefined && c2 == undefined && c3 == undefined) 
		{
			c0 = asset_get_index(sound+"_c0");
			c1 = asset_get_index(sound+"_c1");
			c2 = asset_get_index(sound+"_c2");
			c3 = asset_get_index(sound+"_c3");
		}
		
		if global.chAllowed[0] && audio_exists(c0)  
		{global.ch[0] = audio_play_sound(c0,1,loops,global.volbgm);}
		if global.chAllowed[1] && audio_exists(c1)  
		{global.ch[1] = audio_play_sound(c1,1,loops,global.volbgm);}
		if global.chAllowed[2] && audio_exists(c2) 
		{global.ch[2] = audio_play_sound(c2,1,loops,global.volbgm);}
		if global.chAllowed[3] && audio_exists(c3)  
		{global.ch[3] = audio_play_sound(c3,1,loops,global.volbgm);}
		
		if !audio_exists(c0) && !audio_exists(c1) && !audio_exists(c2) && !audio_exists(c3)
		{
			if audio_exists(savior) {global.ch[4] = audio_play_sound(savior,1,loops,global.volbgm);}
			else if audio_exists(charsong) {global.ch[4] = audio_play_sound(charsong,1,loops,global.volbgm);}
		}
		
		#endregion
	}
	else
	{
		audio_stop_sound(global.ch[4])
		var charname = global.player;
		charname = string_replace(charname," ","_")
		
		var mus = asset_get_index("mus"+bgmstr)
		var charsound = "mus"+bgmstr+"_"+charname;
		var charthemestr = "mus"+charname;
			
		#region For Mods
		if ds_map_find_value(global.moddedChars, charname) != undefined {
			if ds_map_find_value(global.moddedSounds, charsound) != undefined {
				global.ch[4] = audio_play_sound(ds_map_find_value(global.moddedSounds, charsound),1,loops,global.volbgm); 
				exit;
			}
			if ds_map_find_value(global.moddedSounds, charthemestr) != undefined {
				global.ch[4] = audio_play_sound(ds_map_find_value(global.moddedSounds, charthemestr),1,loops,global.volbgm); 
				exit;
			} 
		}
		#endregion
			
		if bgmstr != "Lobby" && bgmstr != "Retro" && bgmstr != "Warning" && bgmstr != "Challenge" && bgmstr != "Demoend" {
			if audio_exists(asset_get_index(charsound)) {
				mus = asset_get_index(charsound);
				global.ch[4] = audio_play_sound(mus,1,loops,global.volbgm); 
				exit;
			} 
			
			if audio_exists(asset_get_index(charthemestr)) && !global.starmanPlaying && bgmstr != "Levelend" && bgmstr != "Castleend" && bgmstr != "Toadstool" && bgmstr != "GO" {
				mus = asset_get_index(charthemestr);
				global.ch[4] = audio_play_sound(mus,1,loops,global.volbgm); 
				exit;
			} 
		}
		global.ch[4] = audio_play_sound(mus,1,loops,global.volbgm);
	}
}

function bgm_is_playing(bgmstr)
{
	if is_string(bgmstr)
	{
		if global.volbgm == 0 {return true;}
		
		var charname = global.player;
		charname = string_replace(charname," ","_")
		
		var charsound = "mus"+bgmstr+"_"+charname;
		var charthemestr = "mus"+charname;
		
		#region For Mods
		if ds_map_find_value(global.moddedSounds, charsound) != undefined 
		{
			return audio_is_playing(ds_map_find_value(global.moddedSounds, charsound));
		}
		if ds_map_find_value(global.moddedSounds, charthemestr) != undefined 
		{
			return audio_is_playing(ds_map_find_value(global.moddedSounds, charthemestr));
		} 
		
		if ds_map_find_value(global.moddedSounds, charsound+"_c0") != undefined 
		|| ds_map_find_value(global.moddedSounds, charsound+"_c1") != undefined 
		|| ds_map_find_value(global.moddedSounds, charsound+"_c2") != undefined
		|| ds_map_find_value(global.moddedSounds, charsound+"_c3") != undefined 
		{
			return audio_is_playing(ds_map_find_value(global.moddedSounds, charsound+"_c0"));
		}
		else if ds_map_find_value(global.moddedSounds, charsound) != undefined 
		{
			return audio_is_playing(ds_map_find_value(global.moddedSounds, charsound));
		}
		#endregion
		
		var sound = "mus"+bgmstr;
		
		#region Built-in focused system
		var charsong = asset_get_index(charsound);
		var c0 = audio_exists(asset_get_index(charsound+"_c0"))?	asset_get_index(charsound+"_c0") : asset_get_index(sound+"_c0");
		var c1 = audio_exists(asset_get_index(charsound+"_c1"))?	asset_get_index(charsound+"_c1") : asset_get_index(sound+"_c1");
		var c2 = audio_exists(asset_get_index(charsound+"_c2"))?	asset_get_index(charsound+"_c2") : asset_get_index(sound+"_c2");
		var c3 = audio_exists(asset_get_index(charsound+"_c3"))?	asset_get_index(charsound+"_c3") : asset_get_index(sound+"_c3");
		var savior = asset_get_index(sound);
		
		if audio_exists(charsong)
		{
			return audio_is_playing(charsong);
		} 
		if !audio_exists(c0) && !audio_exists(c1) && !audio_exists(c2) && !audio_exists(c3)
		|| !global.musicChannels
		{
			return audio_is_playing(savior);
		}
		return audio_is_playing(c0);
		#endregion
	}
}