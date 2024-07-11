kr = keyboard_check(vk_right)
kl = keyboard_check(vk_left)
kd = keyboard_check(global.keyd)
ku = keyboard_check(global.keyu)

kj = keyboard_check(ord("Z"))
ka = keyboard_check(ord("X"))
kh = keyboard_check(global.keyh)

kjp = keyboard_check_pressed(ord("Z"))
kap = keyboard_check_pressed(ord("X"))
khp = keyboard_check_pressed(global.keyh)

kar = keyboard_check_released(ord("X"))
khr = keyboard_check_released(global.keyh)

kup = keyboard_check_pressed(global.keyu)
kdp = keyboard_check_pressed(global.keyd)


if global.chatfocus = true or instance_exists(oPaused)
{kr=0;kl=0;kd=0;kj=0;ka=0;kjp=0;kar=0;kdp=0;kh=0;khp=0;khr=0;}

if instance_exists(oClient)
{
	if global.username = ""
	{
		global.username = (random_range(0, 100) >= 60)? choose(
		"All-Games Tupra",
		"Jalin Rabbei",
		"Ulma Maria",
		"Banana", 
		"Goku",
		"Mario", 
		"Luigi", 
		"YourAverageSMBFan", 
		"SampleText", 
		"Unnamed 0") : global.clientid;}
	
	var user = string(global.username)
	
	//Send Our Data
	var buff = buffer_create(32, buffer_grow, 1);
	buffer_seek(buff, buffer_seek_start, 0);
	buffer_write(buff, buffer_u8, network.move);	
	buffer_write(buff, buffer_u16, my_id);
	buffer_write(buff, buffer_s16, round(x));
	buffer_write(buff, buffer_s16, round(y));
	buffer_write(buff, buffer_f16, image_xscale*scale);					
	buffer_write(buff, buffer_u16, spr);					
	buffer_write(buff, buffer_u16, ind);					
	buffer_write(buff, buffer_string, user);	
	buffer_write(buff, buffer_u8, palindex);	
	buffer_write(buff, buffer_u16, global.palettesprite);		
	buffer_write(buff, buffer_s8, room);
	
	buffer_write(buff, buffer_s8, global.stars);
	network_send_packet(oClient.client, buff, buffer_tell(buff));
	buffer_delete(buff);
	
	if invincible = 0 and global.playercol = true and carried = false {
		if instance_place(x+1,y,oOtherplayer) || instance_place(x-1,y,oOtherplayer)  {x-=hspd;}
		if instance_place(x,bbox_bottom+1,oOtherplayer) and vspd > 0.1	{y-=vspd; grounded = true;}
	}
}

collidecode = false;



if instance_place(x+hspd,bbox_bottom-1+vspd,oParblock) && shoulderbash > 0
{
	if instance_exists(oParblock)
	{
		var block = instance_place(x+hspd,bbox_bottom-1+vspd,oParblock)
				
		if block && block.blockstate = 0
		{block.blockstate = 1; if powerup != "s" {block.triggerbreak = true;}}
		if block && !place_meeting(x,y,block)
		{sfx(sndBump,1);}
	}
}



if y > room_height+30 && !place_meeting(x,y,oSky_fallwarp)
{state = p2.die;}
if y > room_height+32 && instance_place(x,y,oSky_fallwarp)
{room_goto(instance_place(x,y,oSky_fallwarp).troom)}


if gethit = true
{
	if invincible = 0
	{
		invincible = room_speed*3
		if powerup = "s"
		{state = p2.die;}
		else
		{state = p2.shrink; invincible = room_speed*4;}
	}
	gethit = false;
}

if shoulderbash > 0 && grounded
{shoulderbash --;}
if shoulderbash < 0
{shoulderbash = 0}

if invincible > 0
{invincible --; image_alpha = sign(invincible mod 2);}
if  invincible < 0
{invincible ++;}

if starman > 0
{starman --; invincible = -2}


if jumpbuffer > 0 {jumpbuffer --;}
if kjp {jumpbuffer = 7;}

if firetimer > 0 
{firetimer --;}

if starman > 0
{starman --;}

if round(invincible) = 0
{image_alpha = 1;}


if state = p2.title
{spr = ms("sMario_s_idle"); exit;}

if instance_exists(oRacemanager) && !(oRacemanager.start = 0)
{exit;}

switch(state)
{
	case p2.normal:
		ps_normal();
	break;
	case p2.jump:
		ps_jump();
	break;
	case p2.pivot:
		ps_pivot();
	break;
	case p2.die:
		ps_die();
	break;
	case p2.enterpipedown:
		ps_enterpipedown();
	break;
	case p2.enterpiperight:
		ps_enterpiperight();
	break;
	case p2.exitpipeup:
		ps_exitpipeup();
	break;
	case p2.crouch:
		ps_crouch();
	break;
	case p2.grow:
		ps_grow();
	break;
	case p2.shrink:
		ps_shrink();
	break;
	case p2.flagpoledescend:
		ps_flagpoledescend();
	break;
	case p2.flagpolefinish:
		ps_flagpolefinish();
	break;
	case p2.firetransform:
		ps_firetransform();
	break;
	case p2.castleending:
		ps_castleending();
	break;
	case p2.swim:
		ps_swim();
	break;
	case p2.swimidle:
		ps_swimidle();
	break;
	case p2.shoulderbash:
		ps_shoulderbash();
	break;
	case p2.shoulderbashend:
		ps_shoulderbashend();
	break;
	case p2.climb:
		ps_climb();
	break;
	case p2.emerge:
		ps_emerge();
	break;
	case p2.dance0:
		ps_dance0();
	break;
	case p2.nah:
		ps_nah();
	break;
	case p2.spin:
		ps_spin();
	break;
}

if global.rtxmode = true or global.schutmode = true
{
	if mouse_x > x
	{image_xscale = 1;}
	else
	{image_xscale = -1;}
}

if kjp {retrochance = random(100)}

if starman < 130 and global.player = "Max Verstappen" {starman = global.time;}
if global.player = "Max Verstappen" and (state = p2.castleending or state = p2.flagpoledescend or state = p2.flagpolefinish) {starman = 0}