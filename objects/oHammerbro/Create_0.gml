if global.rmhambro {
	enemies = ds_list_create();
	enemies[| 0] = oGoomba;
	enemies[| 1] = oNokonoko;
	enemies[| 2] = oNokonoko_red;
	enemies[| 3] = oBuzzy;
	
	instance_change(enemies[| irandom_range(0, ds_list_size(enemies)-1)], true);
}

event_inherited();

hspd = 0.2;
facingdir = -1
c = 1;

state = es.patrol

hammertimer = 120;

spr = sHammerbro;
stomptype = 3

jumptimer = 180;
jump = "tiny";

lowest = room_height-32
actual = noone

aightcomehere = timeunits(120)

bboxturn = true
canjumplow = true;
blocked = false

streak = 0 