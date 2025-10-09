#region selection

if !allowMoviment {exit;}

var p = (keyboard_check_pressed(global.menukr)-keyboard_check_pressed(global.menukl));

if menu[# section, sel] = "PLYRS VISIBILITY" && p != 0
{global.onlinealpha += 0.1*p; sfx(sndMenumove,0); savesettings()}

global.onlinealpha = clamp(global.onlinealpha,0,1);

if (keyboard_check_pressed(global.menuka) || keyboard_check_pressed(vk_escape)) 
{
	if section = 1			{section = 0; sel = 0;}
	else if section = 2		{section = 0; sel = 1;}
	else					{instance_destroy()}
		
	sfx(sndMenuback,0);
}

if keyboard_check_pressed(global.menukj) || keyboard_check_pressed(vk_enter) 
{
	switch(menu[# section, sel])
	{
		case "USERNAME - ":
			global.username = get_string_async("Insert a username",global.username)
			sfx(sndMenuselect,0);
			savesettings()
		break;
		case "SET IP - ":
			global.ip = get_string_async("Insert IP (of server)",global.ip)
			if global.ip = "" {loadsettings()}
			sfx(sndMenuselect,0);
			savesettings()
		break;
		case "SET PORT - ":
			global.port = get_integer_async("Insert port (of server)",global.port)
			sfx(sndMenuselect,0);
			try {savesettings();}
			catch(mistake) {global.port = 0;}
		break;
		case "JOIN":
			section = 1
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "HOST":
			section = 2
			sel = 0;
			sfx(sndMenuselect,0);
		break;
		case "JOIN GAME":
			room_goto(rmLobby);
			
			sfx(sndMenuselect,0);
			
			global.world = 0;
			global.level = 0;
			instance_create_depth(0, 0, -1, oClient);
		break;
		case "HOST GAME":
			room_goto(rmServer);
			
			sfx(sndMenuselect,0);
			
			instance_create_depth(0, 0, -1, oServer);
		break;
		case "MAX PLAYERS - ":
			global.maxplayers = get_integer_async("How many max players?",global.maxplayers)
			try {global.maxplayers = clamp(global.maxplayers,2,50);}
			catch(mistake) {global.maxplayers = 8;}
			sfx(sndMenuselect,0);
		break;
		case "BACK":
			if section = 1			{section = 0; sel = 0;}
			else if section = 2		{section = 0; sel = 1;}
			else					{instance_destroy()}
		break;
	}
}

if keyboard_check_pressed(global.menuku) && sel > 0
{sel -= 1; sfx(sndMenumove,0);}
if keyboard_check_pressed(global.menukd) && sel < optionsnum[section]-1
{sel += 1; sfx(sndMenumove,0);}

#endregion