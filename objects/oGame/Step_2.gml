// handle music channels
if global.sfx[0] != -1 && audio_is_playing(global.sfx[0])
{
	audio_sound_gain(global.ch[global.sfx[1]],0,1)
	if global.sfx[1] != 4 and global.chAllowed[global.sfx[1]] = false 
	{audio_sound_gain(global.sfx[0],0,1)}
}
else
{
	if loadscreen == -1
	{
		audio_sound_gain(global.ch[0],global.volbgm,1)
		audio_sound_gain(global.ch[1],global.volbgm,1)
		audio_sound_gain(global.ch[2],global.volbgm,1)
		audio_sound_gain(global.ch[3],global.volbgm,1)
		audio_sound_gain(global.ch[4],global.volbgm,1)
		global.sfx[0] = -1;
	}
}


// handle time
if global.time > 0 && mario_freeze() = 0 && loadscreen = -1 && instance_exists(oPaused) = false
{global.time --;}

if (global.challenge = true || room = rmDemoend || instance_exists(oClient)) and !instance_exists(oRacemanager) and !instance_exists(oIsArena) 
{global.time = -1;}

if instance_exists(oMario) && ((oMario.state = ps.flagpolefinish && oMario.depth = 399)
	or (global.race = true && oMario.finishedrace = true && oMario.state != ps.flagpoledescend))
{
	if !instance_exists(oLuigi) || instance_exists(oLuigi) and (oLuigi.state = ps.flagpolefinish && oLuigi.depth = 399) 
	{
		if global.time > 0
		{
			if timeunits(global.time) mod 20 = 0 {sfx(sndBeep,0);}
			global.time -= timeunits(2)
			global.score += 100;
			global.p2_score += 100;
		}
	}
	
	if !instance_exists(oClient) or (instance_exists(oClient) && global.race = false)
	{
		if global.time <= 0 && triggercastleflag = false
		{
			triggercastleflag = true;
			global.time = 0;
			if instance_exists(oCastleflag)
			{oCastleflag.st = 2; oCastleflag.fireworks = fireworks; oCastleflag.alarm[0] = 20; alarm[1] = room_speed*4.3}
		}
	}
	
}
else
{
	var tget = round(global.time/(room_speed*TIMESEC)) % 10
	if tget = 1 or tget = 3 or tget = 6
	{fireworks = tget;}
	else
	{fireworks = 0;}
}

// TIME UP
if global.race == false
{
	if global.time <= timeunits(100) && global.time >= 0 && timeup >= 0 && room != rmLeveltransition
	{timeup ++;}
	if timeup == 1 && warned == false 
	{bgm("Warning",false);} 
	if timeup > 180 && warned == false // or warned = 1
	{
		warned = true;
		if global.starmanPlaying
		{bgm("Starman",true);}
		else {bgm(global.curbgm,true);}
		pitch = 1.3
	}

	if global.arena == 0 && instance_exists(oMario) && global.time = 0 &&
	  !(oMario.state = ps.castleending ||
		oMario.state = ps.emerge ||
		oMario.state = ps.flagpolefinish ||
		oMario.state = ps.flagpoledescend ||
		oMario.state = ps.title ||
		oMario.state = ps.die)
	{oMario.state = ps.die;}
	if instance_exists(oIsArena) && global.time = 0
	{
		with (oOtherplayer) {
			if mystars >= oIsArena.star_record
			{
				oIsArena.winner = username; 
			}
			if mystars == oIsArena.star_record
			{
				oIsArena.draw++;
			}
		}
		if global.stars >= oIsArena.star_record
		{oIsArena.winner = global.username;}
		if global.stars == oIsArena.star_record
		{oIsArena.draw++;}
		
		oIsArena.win = 0;
	}
	
	if instance_exists(oMario) &&  (oMario.state = ps.castleending || oMario.state = ps.flagpolefinish || oMario.state = ps.die)
	{
		warned = 2;
		pitch = 1;
		
		audio_sound_pitch(global.ch[0],pitch)
		audio_sound_pitch(global.ch[1],pitch)
		audio_sound_pitch(global.ch[2],pitch)
		audio_sound_pitch(global.ch[3],pitch)
		audio_sound_pitch(global.ch[4],pitch)
	}
}
else
{global.time = -1;}

if warned == true {
	if global.time <= timeunits(100) && global.time != -1 {
		pitch = 1.3;
	
		audio_sound_pitch(global.ch[0],pitch)
		audio_sound_pitch(global.ch[1],pitch)
		audio_sound_pitch(global.ch[2],pitch)
		audio_sound_pitch(global.ch[3],pitch)
		audio_sound_pitch(global.ch[4],pitch)
	}
	else {warned = false; pitch = 1;}
}

if global.race = true && instance_exists(oMario) && (oMario.state = ps.normal or oMario.state = ps.jump)
	&& !instance_exists(oRacemanager) && room != rmLobby and string_pos("Title",room_get_name(room)) == 0 
{
	instance_create_depth(x,y,depth,oRacemanager);
}

if (window_get_fullscreen() != global.fullscreen) 
{window_set_fullscreen(global.fullscreen);}

global.player = update_player("p1");
global.playertwo = update_player("p2");
global.gunskin = update_gun();

#region debug keys
// Game reset, there is a pop up when online so you can get disconnected for everyone in the server.
if keyboard_check_pressed(vk_f4)
{
	if instance_exists(oClient) {disconnecttt(); global.gameReseted = true;}
	game_restart()
}
// frame per second shit, barely works as I want it's just for debugingg
if keyboard_check_pressed(vk_f7)
{
	fpsDebug = !fpsDebug
	
	game_set_speed((fpsDebug)? 1 : 60, gamespeed_fps);
}
// 
if keyboard_check_pressed(vk_f11)
{
	global.fullscreen = !window_get_fullscreen();
	savesettings();
}

if keyboard_check_pressed(vk_f12)
{
	if instance_exists(debugtext) 
		{instance_destroy(debugtext)}
	else 
		{instance_create_depth(x,y,depth, debugtext)} //debug test (edit: it has a crash handler now)
	if string_pos("Title", room_get_name(room)) != 0 
		{room_goto(rmTestin);}
}
#endregion
