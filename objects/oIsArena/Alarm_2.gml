global.arena++;

if room_exists(asset_get_index("rmArena_"+string(global.arena-1)))
{room_goto(asset_get_index("rmArena_"+string(global.arena-1)));}

else {global.arena = 1; room_goto(asset_get_index("rmArena_"+string(global.arena-1)));}

var buff = buffer_create(6, buffer_grow, 1);
buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff, buffer_u8, network.arenaplace);
buffer_write(buff, buffer_u8, global.arena);
network_send_packet(oClient.client, buff, buffer_tell(buff));
buffer_delete(buff);

if global.arena != 0 && instance_exists(oIsArena)
{instance_destroy(oIsArena);}