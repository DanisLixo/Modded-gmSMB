/// @description Initialize Server

//Server Variables
port = global.port
max_players = global.maxplayers

server = network_create_server(network_socket_tcp, port, max_players);

// Display error if server is unable to be created
if (server < 0) {
	show_message_async("Server could not be hosted!\nCheck for any open instances or your internet cconnection.\nAnd try again ig");
	game_restart();
}

total_players = ds_list_create();
//create a map to keep track of clients
server_instances = ds_map_create();

changemode = false;
choosingmode = false;
c = 0
cmsel = 0;
cmsec = 0;

cmoptions = ds_grid_create(2,9)
cmbool = ds_grid_create(2,9)
cmvalue = ds_grid_create(2,9)

addcm = function(sec,pos,label,isforbool = false, value = "nothin")
{
	if isforbool {cmbool[# sec,pos] = label}
	else {cmoptions[# sec,pos] = label} 
	cmvalue[# sec,pos] = value;
}

msg = noone;
nothin = -1

global.teleport_tolvl = true;

apply_settings = function() {
	var nextmusic = choose("Peter_Griffin", "Pokey", "OW_Syobon", "Anton", "Duke", "Martin", "Retro", "Challenge")
				
	var jbuff = buffer_create(32, buffer_grow, 1);
	buffer_seek(jbuff, buffer_seek_start, 0);
	buffer_write(jbuff, buffer_u8, network.hostbegin);
	buffer_write(jbuff, buffer_bool, global.race);	
	buffer_write(jbuff, buffer_u8, global.nextlvltimer);	
	buffer_write(jbuff, buffer_bool, global.schutmode);	
	buffer_write(jbuff, buffer_bool, global.rtxmode);
	buffer_write(jbuff, buffer_bool, global.commandenys);
	buffer_write(jbuff, buffer_u8, global.arena);	
	buffer_write(jbuff, buffer_bool, global.challenge);
	buffer_write(jbuff, buffer_bool, global.pvp);
	buffer_write(jbuff, buffer_bool, global.waiting);
	buffer_write(jbuff, buffer_bool, global.extra);
	buffer_write(jbuff, buffer_bool, global.playercol);
	buffer_write(jbuff, buffer_bool, global.abilities);
	buffer_write(jbuff, buffer_u8, global.world);	
	buffer_write(jbuff, buffer_u8, global.level);	
	buffer_write(jbuff, buffer_bool, global.teleport_tolvl);
	buffer_write(jbuff, buffer_string, nextmusic);
	buffer_write(jbuff, buffer_u8, oServermenu.gtime);

	//network_send_packet(client, jbuff, buffer_tell(jbuff));
				
	//Loop through the total player list (containing sockets) and send the packet to each one
	for (var i = 0; i < ds_list_size(total_players); i++) {
		network_send_packet(ds_list_find_value(total_players, i), jbuff, buffer_tell(jbuff));	
	}
				
	buffer_delete(jbuff);
}