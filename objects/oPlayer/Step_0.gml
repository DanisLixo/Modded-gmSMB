if global.spectate && instance_exists(oOtherplayer) 
{collidecode = false; image_alpha = 0; x = oOtherplayer.x; y = -32; exit;}

//forever wip lmao
if gamepad_is_connected(0) {
	kr = gamepad_button_check(0, gp_padr)
	kl = gamepad_button_check(0, gp_padl)
	kd = gamepad_button_check(0, gp_padd)
	ku = gamepad_button_check(0, gp_padu)

	kj = gamepad_button_check(0, gp_face1)
	ka = gamepad_button_check(0, gp_shoulderr)
	kh = gamepad_button_check(0, gp_face3)

	kjp = gamepad_button_check_pressed(0, gp_face1)
	kap = gamepad_button_check_pressed(0, gp_shoulderr)
	khp = gamepad_button_check_pressed(0, gp_face3)

	kar = gamepad_button_check_released(0, gp_shoulderr)
	khr = gamepad_button_check_released(0, gp_face3)

	krp = gamepad_button_check_pressed(0, gp_padr)
	klp = gamepad_button_check_pressed(0, gp_padl)
	kup = gamepad_button_check_pressed(0, gp_padu)
	kdp = gamepad_button_check_pressed(0, gp_padd)
} else {
kr = keyboard_check(global.keyr)
kl = keyboard_check(global.keyl)
kd = keyboard_check(global.keyd)
ku = keyboard_check(global.keyu)

kj = keyboard_check(global.keyj)
ka = keyboard_check(global.keya)
kh = keyboard_check(global.keyh)

kjp = keyboard_check_pressed(global.keyj)
kap = keyboard_check_pressed(global.keya)
khp = keyboard_check_pressed(global.keyh)

kar = keyboard_check_released(global.keya)
khr = keyboard_check_released(global.keyh)

krp = keyboard_check_pressed(global.keyr)
klp = keyboard_check_pressed(global.keyl)
kup = keyboard_check_pressed(global.keyu)
kdp = keyboard_check_pressed(global.keyd)
}

if global.chatfocus = true || instance_exists(oPaused) || in_cutscene
{	
	kr=0;kl=0;kd=0; krp=0;klp=0;kdp=0;
	kj=0;kjp=0; ka=0;kap=0;kar=0; kh=0;khp=0;khr=0;
}
if instance_exists(oPaused) || in_cutscene {ku=0;kup=0}
	
char = global.player;

if char != "Dawn" && global.partner_active 
{global.partner_active = false;}

//demoSetup_step();
mario128_step();
event_inherited();

if (instance_exists(oClient) && oClient.idd == my_id)
{
	var user = string(global.username)
	
	//Send Our Data
	var buff = buffer_create(64, buffer_fixed, 1);
	buffer_seek(buff, buffer_seek_start, 0);
	buffer_write(buff, buffer_u8, network.move);	
	buffer_write(buff, buffer_u16, my_id);
	buffer_write(buff, buffer_string, user);
	buffer_write(buff, buffer_f16, x);
	buffer_write(buff, buffer_f16, y);
	buffer_write(buff, buffer_f16, image_xscale*scale);
	buffer_write(buff, buffer_f16, image_alpha);					
	buffer_write(buff, buffer_u16, spr);
	buffer_write(buff, buffer_s16, depth);
	buffer_write(buff, buffer_u16, ind);					
	buffer_write(buff, buffer_s16, starman);					
	buffer_write(buff, buffer_u8, palindex);	
	buffer_write(buff, buffer_u16, global.palettesprite);		
	buffer_write(buff, buffer_s8, room);
	
	buffer_write(buff, buffer_s8, global.stars);
	
	network_send_packet(oClient.client, buff, buffer_tell(buff));
	buffer_delete(buff);
	
	if invincible == 0 and global.playercol {
		if place_meeting(x,y-4,oOtherplayer) && vspd < 0
		{
			if instance_place(x,y,oOtherplayer) 
			{
				while !place_meeting(x,y-4,oOtherplayer) {y++;}
			}
			if !place_meeting(x,bbox_bottom+1,oCol)
			{vspd = 2;}
		}
		if instance_place(x,bbox_bottom+vspd,oOtherplayer) && vspd >=0
		{
			while !instance_place(x,bbox_bottom+1,oOtherplayer)
			{y ++;}
			vspd = 0;
			grounded = true
		}
	
		if vspd > 0 && !place_meeting(x+sign(hspd),y,oOtherplayer) && place_meeting(x+hspd,y,oOtherplayer)
		{grounded = true; vspd = 0;}
		
		if place_meeting(x+hspd,y,oOtherplayer)
		{
			x -= hspd;
		}
	}
}

if instance_exists(oLuigi) {
	if (powerup = "s") and (oLuigi.powerup = "s") {global.hats = 0}
}
else {if (powerup = "s") {global.hats = 0}}

if insidecar {
	x = oLuigi.x
	y = oLuigi.y
	image_alpha = 0;
	invincible = 10
}

partner_track();