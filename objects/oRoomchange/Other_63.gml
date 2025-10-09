if (async_load[? "id"] == gr) {
    if (async_load[? "status"]) {
        gr = async_load[? "result"];
    } else {
		gr = "rm1_1";
    }
	
	if string_pos("Extra", gr) != 0 {global.extra = true;}

	gr = asset_get_index(gr);
	if room_exists(gr)	{room_goto(gr);}	
}