global.time = 0;
global.level += 1;

if instance_exists(oToad)
{global.level = 1; global.world += 1;}

if instance_exists(oRacemanager) {
	var buff = buffer_create(4, buffer_grow, 1);
	buffer_seek(buff, buffer_seek_start, 0);
	buffer_write(buff, buffer_u8, network.raceplace);
	buffer_write(buff, buffer_u8, global.world);				//send the client's ID
	buffer_write(buff, buffer_u8, global.level);				//send the client's ID
	network_send_packet(client, buff, buffer_tell(buff));
	buffer_delete(buff);
}

room_goto(rmLeveltransition)