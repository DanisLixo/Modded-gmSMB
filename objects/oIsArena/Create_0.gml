arenarespawn = room_speed*15;
star_record = 0;

showresults = false;

if instance_exists(oClient) {
	var buff = buffer_create(4, buffer_grow, 1);
	buffer_seek(buff, buffer_seek_start, 0);
	buffer_write(buff, buffer_u8, network.arenagoal);

	network_send_packet(oClient.client, buff, buffer_tell(buff));
	buffer_delete(buff);
}

counter = 0;
endcounter = -1;

winner = ""
win = -1;

draw = 0;

alarm[0] = 1;
alarm[1] = 50;
start = 0;

global.world = 0;

if instance_exists(oRacemanager) 
{instance_destroy(oRacemanager);}

if ds_grid_height(global.racepos) > 1
{
	ds_grid_destroy(global.racepos)
	global.racepos = ds_grid_create(3,1);
}

starscheck = global.goalofstars

fx = 0

recstr = ""