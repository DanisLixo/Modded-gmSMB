oMario.kj = -1
oMario.kjp = -1

if handleRoomChange && oMario.x >= 216 
{room_goto(asset_get_index("rm" + string(global.world) + "_" + string(global.level) + "_under"));}