if !instance_exists(oButton) {instance_activate_object(oButton)}
if !instance_exists(oNekoPresence) {instance_activate_object(oNekoPresence);}

if !allowMoviment {exit;}

var click = keyboard_check_pressed(global.keyd) - keyboard_check_pressed(global.keyu);
psel += click
	
if psel > 3 psel = 0
if psel < 0 psel = 3
	
if click != 0 {sfx(sndMenumove,0)}
	
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(global.keyj)) 
&& oGame.destroy == 0 && oGame.delay >= 10 
	{
	switch psel {
		case 0: 
			instance_destroy(); 
			instance_activate_all();
		break;
		case 1: 				
			allowMoviment = false;
			instance_create_depth(x,y,depth,oMenu)
		break;
		case 2:
			if instance_exists(oClient) && (global.waiting || global.race) 
			&& (instance_exists(oMario) && oMario.finishedrace)
			{sfx(sndBump, 4); break;}
				
			instance_activate_all();
				
			var lvl = "rm"+string(global.world)+"_"+string(global.level)
			var extralvl = "rmExtra_"+string(global.world)+"_"+string(global.level)
				
			if global.extra {
				if room != rmExtra_1_1_under && room_exists(asset_get_index(extralvl)) 
				{room_goto(asset_get_index(extralvl));}
				else
				{room_restart()} 
			} else {
				if !instance_exists(oCheckpointmask) 
				and room_exists(asset_get_index(lvl))
				{room_goto(asset_get_index(lvl));} 
				else 
				{room_restart()} 
			}
				
			setTimer();
			oGame.spawnx = -2;
			oGame.spawny = -2;
			oGame.savedpowerup = "s";
			oGame.p2savedpowerup = "s";
		break;
		case 3: 
			if instance_exists(oClient) {game_restart(); global.leftGame = true;}
			else {
				instance_activate_all();
				room_goto(rmTitle);
			}
		break;
	}
}
