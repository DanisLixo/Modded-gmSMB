//Stop Recording & Save
if instance_exists(oMario) {
	if (keyboard_check_pressed(vk_f2) || oMario.flagpoletimer > room_speed * 2 - 20)
	{
		demoRecord = false;
				
		if (ds_exists(demoRecordList, ds_type_list))
		{
			var _fileName = "demo_" + string(demoCount) + "_" + string_lower(global.player) + "_" + string_lower(global.aspectRatio) + ".json"
			var _wrapper = ds_map_create();
			
			ds_map_add(_wrapper, "Used Resolution", string_lower(global.aspectRatio));
			ds_map_add(_wrapper, "Used Character", string_lower(global.player));
			
			ds_map_add_list(_wrapper,"Keybinds",demoRecordList);
			var _theLot = json_encode(_wrapper);
			if (file_exists("demos//" + _fileName))
			{
				while (file_exists("demos//" + "demo_" + string(demoCount) + "_" + string_lower(global.player) + "_" + string_lower(global.aspectRatio) + ".json")) {demoCount++;}
			}
			var _recordFile = file_text_open_write("demos//" + _fileName);
			file_text_write_string(_recordFile,_theLot);
			file_text_close(_recordFile);
			ds_map_destroy(_wrapper);
		
		}
	
		instance_create_depth(x,y,depth,oPrerecorder)
		instance_destroy();
	}

	//Record each frame
	if (demoRecord) {
		time++;
		
		if (time >= room_speed*6) {
			oMario.in_cutscene = false;
			
			if (!ds_exists(demoRecordList, ds_type_list)) 
			{
				demoRecordFrames = 1;
				demoRecordList = ds_list_create()
			}
			//Record this frame
			var _frameToRecord = ds_map_create();
			with (oMario) 
			{
				if kr == 1		_frameToRecord[? "kr"] = kr;
				if kl == 1		_frameToRecord[? "kl"] = kl;
				if kd == 1		_frameToRecord[? "kd"] = kd;
				if ku == 1		_frameToRecord[? "ku"] = ku;
			
				if krp == 1		_frameToRecord[? "krp"] = krp;
				if klp == 1		_frameToRecord[? "klp"] = klp;
				if kdp == 1		_frameToRecord[? "kdp"] = kdp;
				if kup == 1		_frameToRecord[? "kup"] = kup;
			
				if kj == 1		_frameToRecord[? "kj"] = kj;
				if ka == 1		_frameToRecord[? "ka"] = ka;
			
				if kjp == 1		_frameToRecord[? "kjp"] = kjp;
				if kap == 1		_frameToRecord[? "kap"] = kap;
			
				if kar == 1		_frameToRecord[? "kar"] = kar;
			}
			ds_list_add(demoRecordList,_frameToRecord);
			ds_list_mark_as_map(demoRecordList,ds_list_size(demoRecordList)-1);
			demoRecordFrames++;
		} else {oMario.in_cutscene = true;}
	}
}