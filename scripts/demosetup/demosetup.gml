// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function demoSetup_create(){
	//Demo setup
	frame = 0;
	demoFileNameCharNum = "demos\\demo" + char + "_" + string(irandom(global.demoCount)) + ".json";
	demoFileNameChar = "demos\\demo_0" + char + ".json";
	demoFileNameNum = "demos\\demo_" + string(irandom(global.demoCount)) + ".json";
	demoFileName = "demos\\demo_" + string(irandom_range(0,3)) + ".json";

	//Tries to load character demo
	if file_exists(demoFileNameCharNum)
	{
		demoFile = file_text_open_read(demoFileNameCharNum);
		demoDataRoot = json_decode(file_text_read_string(demoFile));
		demoData = demoDataRoot[? "root"];
		demoFrames = ds_list_size(demoData);
		demoFile = file_text_close(demoFile);
	} 
	else if file_exists(demoFileNameChar)
	{
		demoFile = file_text_open_read(demoFileNameChar);
		demoDataRoot = json_decode(file_text_read_string(demoFile));
		demoData = demoDataRoot[? "root"];
		demoFrames = ds_list_size(demoData);
		demoFile = file_text_close(demoFile);
	} 
	else if file_exists(demoFileNameNum)
	{
		//Tries to load global data
		demoFile = file_text_open_read(demoFileNameNum);
		demoDataRoot = json_decode(file_text_read_string(demoFile));
		demoData = demoDataRoot[? "root"];
		demoFrames = ds_list_size(demoData);
		demoFile = file_text_close(demoFile);
	}
	else if file_exists(demoFileName)
	{
		//Tries to load global data
		demoFile = file_text_open_read(demoFileName);
		demoDataRoot = json_decode(file_text_read_string(demoFile));
		demoData = demoDataRoot[? "root"];
		demoFrames = ds_list_size(demoData);
		demoFile = file_text_close(demoFile);
	}
	else {frame = -1;} //If non of them exists, there's nothing you can do
}

function demoSetup_step()
{
	if state == ps.title && frame != -1 && room = rmTitle_new && instance_exists(oMenu) 
	&& oMenu.section == 0 
	{playDemo++;}
	
	if keyboard_check_pressed(vk_anykey) {playDemo -= 10;}

	if playDemo > room_speed*8 && frame != -1
	{
		if state == ps.title 
		{state = ps.normal;}
	
		kr = 0
		kl = 0
		kd = 0
		ku = 0
	
		krp = 0
		klp = 0
		kdp = 0
		kup = 0

		kj = 0
		ka = 0
		kh = 0

		kjp = 0
		kap = 0
		khp = 0

		kar = 0
		khr = 0
	
		if instance_exists(oParenemy)
		{
			var distance = collision_rectangle(x, y, x+24,y+24, oParenemy, false,true);  //instance_place(x+24,y,oParenemy);
	
			if distance
			{
				var meny = instance_nearest(x+16,y,oParenemy);
				var xx = meny.x
				var killer = instance_create_depth(xx,y-8,depth,oGoombakiller)
				if instance_exists(killer) killer.goombaTarget = meny;
			}
		}
		if y > room_height-24 {instance_create_depth(x,room_height-8,depth,oSpring).image_alpha = 0;}
		if (frame < demoFrames)
		{
			frameData = demoData[| frame];
			kr = frameData[? "kr"];
			kl = frameData[? "kl"];
			kd = frameData[? "kd"];
			ku = frameData[? "ku"];
		
			krp = frameData[? "krp"];
			klp = frameData[? "klp"];
			kdp = frameData[? "kdp"];
			kup = frameData[? "kup"];
		
			kj = frameData[? "kj"];
			ka = frameData[? "ka"];
		
			kjp = frameData[? "kjp"];
			kap = frameData[? "kap"];
		
			kar = frameData[? "kar"];
		
			frame++;
		} else {room_goto(rmTitle);}
	
		if keyboard_check_pressed(vk_anykey) || state == ps.die || state == ps.flagpolefinish
		{room_goto(rmTitle);}
	}
}