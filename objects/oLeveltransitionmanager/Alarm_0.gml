var wr = global.world; var lv = global.level;

var lvl = "rm"+string(wr)+"_"+string(lv)
var extralvl = "rmExtra_"+string(wr)+"_"+string(lv)

var rrlvl = "rm" + string(irandom_range(1,8)) + "_" + string(irandom_range(1,4))

if room_exists(asset_get_index(lvl))
{room_goto(asset_get_index(lvl))}
else {room_goto(asset_get_index(rrlvl))}
if global.extra 
{room_goto(asset_get_index(extralvl))} 

setTimer();