function ps_die()
{
	dietimer ++;
	var maxtime = 40;
	
	invincible = -2;
	starman = 0;
	
	depth = -1000
	
	if dietimer = 1
	{
		if instance_number(oMario) < 2 && global.arena == 0
		{
			global.starmanPlaying = false;
			bgm("GO",false);
		}
		else 
		{sfx(sndDieShort,0)}
		
		if global.stars != 0 
		{
			if instance_exists(oClient) 
			{
				var buff = buffer_create(32, buffer_grow, 1);
				buffer_seek(buff, buffer_seek_start, 0);
				buffer_write(buff, buffer_u8, network.stardrop);
				buffer_write(buff, buffer_u8, global.stars);
				buffer_write(buff, buffer_s16, round(x));
				buffer_write(buff, buffer_s16, round(y));
					
				network_send_packet(oClient.client, buff, buffer_tell(buff));
				buffer_delete(buff);
			}
			global.stars = 0;
		}
	}
	
	if dietimer < maxtime
	{hspd = 0; vspd = 0;}
	if dietimer = maxtime
	{vspd = -4.5;}
	if dietimer > maxtime
	{vspd += 0.2;}
	
	spr = ms("sMario_s_die")
	
	if y < room_height+sprite_get_height(spr)+8
	y += vspd
	else if instance_number(oMario) >= 2 {instance_destroy()}
}