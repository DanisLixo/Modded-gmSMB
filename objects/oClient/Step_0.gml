/// @description Latency and Chat Func

#region Timeout + Latency
// Send over the current time to the server
var lbuff = buffer_create(32, buffer_grow, 1);
buffer_seek(lbuff, buffer_seek_start, 0);
buffer_write(lbuff, buffer_u8, network.latency);
buffer_write(lbuff, buffer_u32, current_time);
network_send_packet(client, lbuff, buffer_tell(lbuff));

// Check to see if the player has timed-out
timeout++;		// increment the timeout, so it can be reset in the latency packet
// If timeout wasn't reset in 7 seconds with fps in mind, disconnect and return to menu
if (timeout > fps*7) {
	global.insertclient = false;
	game_restart();
}
#endregion

#region Chat
if keyboard_check_pressed(vk_tab)
{
	global.chatfocus = !global.chatfocus;
	text = "";
	keyboard_string = "";
}

if warntimer > 0
{warntimer --;}

if (global.chatfocus = true)
{
	var maxchar = 32
	if string_length(text) < maxchar
	{
		text = keyboard_string;
	}
	
	//If the user presses enter to send the chat:
	if keyboard_check_released(vk_enter)
	{
		warntimer = 2000
		try {
			var usr = global.username != ""? global.username : "???"
			var sendAs = (instance_exists(oServer))? "[HOST: " + usr + "]: " : "[" + usr + "]: ";
			var messag = sendAs + string(text);
			//Create a buffer (packet) to send to the server	
			var text_buff = buffer_create(32, buffer_grow, 1);
			buffer_seek(text_buff, buffer_seek_start, 0);
			buffer_write(text_buff, buffer_u8, network.chat);
			buffer_write(text_buff, buffer_string, messag);
		
			network_send_packet(client, text_buff, buffer_tell(text_buff));
		
			//Delete the buffer
			buffer_delete(text_buff);
		} catch(comida) {
			ds_list_add(global.CHAT,"Couldn't send message.")
		}
		
		//Reset the text back to nothing, and exit the chat
		text = "";
		keyboard_string = "";
		global.chatfocus = !global.chatfocus;
		
	}
}
// Control how many messages are stored in the chat at once
while (ds_list_size(global.CHAT) > 6) {
	ds_list_delete(global.CHAT, 0);	//Delete the message that was sent the longest ago
}
#endregion

#region Spectate
if (keyboard_check_pressed(vk_f8) && instance_exists(oOtherplayer)) {
	global.prevroom = room;
	
	global.spectate = !global.spectate;
	if !global.spectate 
	{room_goto(global.prevroom); oGame.loadscreen = 0; global.prevroom = -1}
}

if global.spectate {
	if instance_exists(oOtherplayer) {
		with(oOtherplayer) {
			if room != myroom {
				room_goto(myroom);
			}
			oCamera.x = x;
			oCamera.y = y;
		}
	}
}
#endregion

#region Players track (will be deleted to race focus)
if endcounter > 0
{endcounter --;}

with(oOtherplayer) {
	if myroom != rmLobby
	{
		if countme == false {countme = true;}
	}
	else if countme != false {other.players--; countme = false;}
		
	if countme {other.players++; countme = -1;}
}

if Iended >= players && !allfinished {
	if global.nextlvltimer = 0 {
		alarm[2] = room_speed*10
		endcounter = room_speed*10
	}
	else {
		alarm[2] = room_speed*global.nextlvltimer
		endcounter = room_speed*global.nextlvltimer
	}
	
	allfinished = true;
}
#endregion