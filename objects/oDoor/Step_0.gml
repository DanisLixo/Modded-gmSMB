var rm = asset_get_index("rm"+string(global.world)+"_"+string(global.level))
var extrarm = asset_get_index("rmExtra_"+string(1)+"_"+string(global.level))

if instance_place(x,y,oMario) {
	if oMario.kup and oMario.grounded && global.arena == 0 {
		if toLobby {room_goto(rmLobby);}
		else if global.extra {room_goto(extrarm);}
		else if global.world > 0 || global.level > 0 {room_goto(rm);} 
	}	
}

while instance_place(x,y,oCol) {y -= 1;}
while !instance_place(x,y+1,oCol) {y += 1;}