//This doesn't need a region, it just change the values that it actually uses, mind blowing I know.

var p = (keyboard_check_pressed(global.menukr)-keyboard_check_pressed(global.menukl)); 

if menu[# section, sel] = "PLAYER - " && p != 0
{
	marioY= 206
	marioYAdd = -7
	smallMarioWalkDex = 0
	bigMarioWalkDex = 0
}

if menu[# section, sel] = "PALETTE - " && p != 0
{
	marioY=206
	marioYAdd = -4
	smallMarioWalkDex = 0
	bigMarioWalkDex = 0
}

if menu[# section, sel] = "CATEGORY - " && p != 0
{
	marioY=206
	marioYAdd = -4
	smallMarioWalkDex = 0
	bigMarioWalkDex = 0
}

// Inherit after the added code because menu clean up before the code
event_inherited();