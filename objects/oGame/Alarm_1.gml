global.level += 1;

room_goto(rmLeveltransition)

var extralvl = "rmExtra_"+string(global.world)+"_"+string(global.level)

if global.level != 0 && global.race = true
{
	if instance_exists(oRacemanager) 
	{instance_destroy(oRacemanager);}
}
if global.extra && !room_exists(asset_get_index(extralvl)) || global.challenge
{
	if instance_exists(oClient) {room_goto(rmLobby); global.challenge = false;}
	else {room_goto(rmTitle)}
}