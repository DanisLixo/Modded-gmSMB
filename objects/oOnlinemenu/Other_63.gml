if (async_load[? "status"]) {
	if (async_load[? "id"] == global.username) {
        global.username = async_load[? "result"];
    }
	if (async_load[? "id"] == global.ip) {
        global.ip = async_load[? "result"];
    }
	if (async_load[? "id"] == global.port) {
        global.port = async_load[? "result"];
    }
	if (async_load[? "id"] == global.maxplayers) {
        global.maxplayers = async_load[? "result"];
    }
} else {
	if (async_load[? "id"] == global.username) {
        global.username = global.username = (random_range(0, 100) >= 60)? choose(
			"All-Games Tupra",
			"Banana", 
			"Goku",
			"Mario", 
			"Luigi", 
			"Wario",
			"Waluigi",
			"Maria",
			"YourAverageSMBFan", 
			"SampleText", 
			"Unnamed 0") : string(global.clientid);
    }
	if (async_load[? "id"] == global.ip) {
        global.ip = "127.0.0.1";
    }
	if (async_load[? "id"] == global.port) {
        global.port = 7676;
    }
	if (async_load[? "id"] == global.maxplayers) {
        global.maxplayers = 8;
    }
}