/// @description To demo manager

/*
if global.titleroom == rmTitle_new && (instance_exists(oMario) && oMario.playDemo > room_speed*6)  {
	marioSpawnTimer--
	if marioSpawnTimer <= 0 {
		marioSpawnTimer = irandom_range(60, 180)
		instance_create_depth(-96, 208, depth + 1, oMarioDemorunner)
	}
}
*/

if instance_exists(oCamera) oCamera.x = 0;

if instance_exists(oMario) {
	if global.multiplayer and !instance_exists(oLuigi) {
		instance_create_depth(oMario.x+16,oMario.y,oMario.depth,oLuigi);
	}
	else if !global.multiplayer and instance_exists(oLuigi) 
	{instance_create_depth(oLuigi.x,oLuigi.bbox_top+6,oLuigi.depth-1,oBlow); instance_destroy(oLuigi);}
}

if !allowMoviment {exit;}

#region selection
if keyboard_check_pressed(global.menukj) || keyboard_check_pressed(vk_enter) 
{
	switch(menu[| sel])
	{
		case "EXTRA LEVELS":
			room_goto(timetoparty);
			
			global.extra = true;
			
			global.world = 1 
			global.level = 1 
			
			setTimer(500);
		break;
		case "   PLAYER GAME":
			room_goto(timetoparty);
					
			global.world = 1 
			global.level = 1 
					
			setTimer();
		break;
		case "LEVEL SELECT":
			room_goto(rmLevelselect)
		break;
		case "NETWORK GAME":
			instance_create_depth(x,y,-1,oOnlinemenu);
			sfx(sndMenuselect,0);
			
			allowMoviment = false;
		break
		case "OPTIONS":
			var roomMenuTitle = room == rmTitle_MK? oMenu_marioket : oSelectmenu
		
			instance_create_depth(0,0,-1,roomMenuTitle)
			sfx(sndMenuselect,0);
			
			allowMoviment = false;
		break;
		case "QUIT GAME":
			game_end();
		break;
	}
}

if keyboard_check_pressed(global.menuku) && sel > 0
{sel -= 1; sfx(sndMenumove,0);}
if keyboard_check_pressed(global.menukd) && sel < ds_list_size(menu)-1
{sel += 1; sfx(sndMenumove,0);}

var p = (keyboard_check_pressed(global.menukr)-keyboard_check_pressed(global.menukl)); 
	
if p != 0 
{global.multiplayer = !global.multiplayer;}

#endregion