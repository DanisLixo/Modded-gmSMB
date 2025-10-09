if start >= 1
{
	audio_stop_sound(global.ch[0]);
	audio_stop_sound(global.ch[1]);
	audio_stop_sound(global.ch[2]);
	audio_stop_sound(global.ch[3]);
	audio_stop_sound(global.ch[4]);
	
	if start mod (room_speed) = 0
	{
		image_index += 1;
		if image_index < 3
		{sfx(sndBeep,1);}
		else if image_index = 3
		{audio_play_sound(sndBeep,1,false,global.volsfx,0,1.5);}
	}

	if image_index >= 3
	{
		if (instance_exists(oMario)) {oMario.in_cutscene = false;}
		start = -1;
		starscheck = global.goalofstars;
	}
	start ++;
}

if image_index >= 3 and image_index < 11
{
	image_index += 0.1;
}

if !showresults && round(image_index) >= 3
{
	if (instance_exists(oMario) && oMario.in_cutscene = true && !instance_exists(oPipecutscene)) 
	{oMario.in_cutscene = false;}
	if !(instance_exists(oMario) && oMario.state = ps.die)
	{
		if !bgm_is_playing(global.curbgm)
		{
			bgm(global.curbgm,true) 
		}
	}
	
	if arenarespawn = 0
	{
		with(oParblock)
		{
			instance_create_depth(x,y,depth-10,object_index);
		
			var b = instance_create_depth(x,y,depth,oBLAST);
			b.image_xscale = 0.4;
			b.image_yscale = 0.4;
		
			instance_destroy();
		}
	
		arenarespawn = room_speed*15;
	}
	if arenarespawn > 0
	{arenarespawn --;}

	with (oOtherplayer) {
		if mystars > other.star_record 
		{
			other.star_record = mystars;
		}
	
		if mystars >= global.goalofstars && other.win == -1 
		{
			other.winner = username; 
			other.win = 0;
		}
	}
	if global.stars > star_record 
	{star_record = global.stars;}
	if global.stars >= global.goalofstars && win == -1
	{winner = global.username; win = 0;}
	
	if win == 0 
	{
		showresults = true;
		
		var gg = (draw == 0)? "Castleend" : "Levelend"
	
		bgm(gg, false);
		
		instance_deactivate_object(oSuperstar);
		instance_deactivate_object(oSuperstarspawn);
	}
}

if showresults = true && instance_exists(oClient)
{
	if instance_exists(oIsArena) {
		oIsArena.alarm[2] = room_speed*10
		oIsArena.endcounter = room_speed*10
	}
	if starscheck == global.stars {
		recstr = global.username + " - STARS: " + string(global.stars);
		var nextmusic = choose("Peter_Griffin", "Pokey", "OW_Syobon", "Anton", "Duke", "Martin", "Retro", "Challenge")
		
		var buff = buffer_create(32, buffer_grow, 1);
		buffer_seek(buff, buffer_seek_start, 0);
		buffer_write(buff, buffer_u8, network.sendarenaresult);
		buffer_write(buff, buffer_string, recstr);
		buffer_write(buff, buffer_string, nextmusic);
		
		network_send_packet(oClient.client, buff, buffer_tell(buff));
		buffer_delete(buff);
		
		showresults = 2
	}
	starscheck--;
}
