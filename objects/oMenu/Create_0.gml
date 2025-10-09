allowMoviment = false;

alarm[0] = 2;

menu = ds_grid_create(18,9)
globalVars = ds_grid_create(18,9)
optionsnum = array_create(18,0)

timetoparty = rmLeveltransition

section = 0;
sel = 0;
	
menuind = 0

xx = 0
yy = 0

addmenu = function(sec,pos,label, gVar = "MARIO")
{
	menu[# sec,pos] = label;
	globalVars[# sec,pos] = gVar;
	optionsnum[sec] += 1;
}
	
if instance_exists(oPaused)
{
	addmenu(0,0,"VIDEO") //2
	addmenu(0,1,"AUDIO")
	addmenu(0,2,"CONTROLS")
		
	addmenu(1,0,"TOGGLE FULLSCREEN") //8
	addmenu(1,1,"RESET WINDOW")
	addmenu(1,2,"DISCORD PFP - ", "showpfp")
	addmenu(1,3,"SHOW FPS - ", "showfps")
	addmenu(1,4,"LETTERBOX - ")
	addmenu(1,5,"TOGGLE LETTERBOX DARKEN")
	addmenu(1,6,"RESOLUTION")
	
	addmenu(2,0,"WIDESCREEN") //16
	addmenu(2,1,"ORIGINAL")
	addmenu(2,2,"ULTRA WIDE")
	addmenu(2,3,"ROOM WIDTH")
	addmenu(2,4,"LINE")

	addmenu(3,0,"SOUND MODE - ", "musicChannels") //9
	addmenu(3,1,"SFX")
	addmenu(3,2,"BGM")
	addmenu(3,3,"PLAY GANGNAM - ", "opacandastar")

	addmenu(4,0,"MENU") //10
	addmenu(4,1,"PLAYER 1") //10
	if global.multiplayer {addmenu(4,2,"PLAYER 2");}

	addmenu(5,0,"UP") //11
	addmenu(5,1,"DOWN")
	addmenu(5,2,"LEFT")
	addmenu(5,3,"RIGHT")
	addmenu(5,4,"RETURN")
	addmenu(5,5,"SELECT")
	addmenu(5,6,"THE THIRD BUTTON")
	addmenu(5,7,"USE PLAYER 1 CONTROLS")
	
	addmenu(6,0,"UP") //11
	addmenu(6,1,"DOWN")
	addmenu(6,2,"LEFT")
	addmenu(6,3,"RIGHT")
	addmenu(6,4,"ACTION")
	addmenu(6,5,"JUMP")
	addmenu(6,6,"SPECIAL")

	addmenu(7,0,"UP") //12 euacho
	addmenu(7,1,"DOWN")
	addmenu(7,2,"LEFT")
	addmenu(7,3,"RIGHT")
	addmenu(7,4,"ACTION")
	addmenu(7,5,"JUMP")
	addmenu(7,6,"SPECIAL")
} else {
	addmenu(0,0,"CUSTOMIZE")
	addmenu(0,1,"VIDEO")
	addmenu(0,2,"AUDIO")
	addmenu(0,3,"CONTROLS")
	addmenu(0,4,"OTHER")
	addmenu(0,5,"CREDITS1!!")
		
	addmenu(1,0,"TOGGLE FULLSCREEN") //8
	addmenu(1,1,"RESET WINDOW")
	addmenu(1,2,"DISCORD PFP - ", "showpfp")
	addmenu(1,3,"SHOW FPS - ", "showfps")
	addmenu(1,4,"LETTERBOX - ")
	addmenu(1,5,"TOGGLE LETTERBOX DARKEN")
	addmenu(1,6,"RESOLUTION")
	
	addmenu(2,0,"WIDESCREEN") //16
	addmenu(2,1,"ORIGINAL")
	addmenu(2,2,"ULTRA WIDE")
	addmenu(2,3,"ROOM WIDTH")
	addmenu(2,4,"LINE")

	addmenu(3,0,"SOUND MODE - ", "musicChannels") //9
	addmenu(3,1,"SFX")
	addmenu(3,2,"BGM")
	addmenu(3,3,"PLAY GANGNAM - ", "opacandastar")

	addmenu(4,0,"MENU") //10
	addmenu(4,1,"PLAYER 1") //10
	if global.multiplayer {addmenu(4,2,"PLAYER 2");}

	addmenu(5,0,"UP") //11
	addmenu(5,1,"DOWN")
	addmenu(5,2,"LEFT")
	addmenu(5,3,"RIGHT")
	addmenu(5,4,"RETURN")
	addmenu(5,5,"SELECT")
	addmenu(5,6,"THE THIRD BUTTON")
	addmenu(5,7,"USE PLAYER 1 CONTROLS")

	addmenu(6,0,"UP") //12 euacho
	addmenu(6,1,"DOWN")
	addmenu(6,2,"LEFT")
	addmenu(6,3,"RIGHT")
	addmenu(6,4,"ACTION")
	addmenu(6,5,"JUMP")
	addmenu(6,6,"SPECIAL")
	
	addmenu(7,0,"UP") //12 euacho
	addmenu(7,1,"DOWN")
	addmenu(7,2,"LEFT")
	addmenu(7,3,"RIGHT")
	addmenu(7,4,"ACTION")
	addmenu(7,5,"JUMP")
	addmenu(7,6,"SPECIAL")
		
	addmenu(8,0,"PLAYER 1") //5
	if global.multiplayer {addmenu(8,1,"PLAYER 2");}

	addmenu(9,0,"CATEGORY - ") //6
	addmenu(9,1,"PLAYER - ")
	addmenu(9,2,"PALETTE - ")
	addmenu(9,3,"GUN - ")

	addmenu(10,0,"CATEGORY - ") //7
	addmenu(10,1,"PLAYER - ")
	addmenu(10,2,"PALETTE - ")
	
	addmenu(11,0,"COMMANDER SETTINGS") //13
	addmenu(11,1,"AUDIO CHANNELS")
	addmenu(11,2,"PREFERENCES")
	addmenu(11,3,"MISC")
	addmenu(11,4,"MODIFIERS")

	addmenu(12,0,"COMMAND ENEMIES - ", "moveEnys")
	addmenu(12,1,"COMMAND MOVABLE OBJS - ", "moveObjs")
	addmenu(12,2,"COMMAND STATICS - ", "moveStatics")

	addmenu(13,0,"SQUARE 0 - ", "chAllowed")
	addmenu(13,1,"SQUARE 1 - ", "chAllowed")
	addmenu(13,2,"TRIANGLE 2 - ", "chAllowed")
	addmenu(13,3,"NOISE 3 - ", "chAllowed")
	
	addmenu(14,0,"TITLE SCREEN - ") //18
	addmenu(14,1,"DIFFERENT PIPE TRANSITIONS - ", "differentTransitions")
	addmenu(14,2,"BLOOD - ", "blood")
	addmenu(14,3,"POWER UP LOSS VISUAL - ", "pupleave")
	
	addmenu(15,0,"HARD MODE - ", "hardmode") //20
	addmenu(15,1,"WARP ZONE - ", "warpzone")
	addmenu(15,2,"WZ SCROLL LOCK - ", "warpzoneScrollPatch")
	addmenu(15,3,"CHECKPOINTS - ", "checkpoints")
	addmenu(15,4,"LAKITU THROW - ", "spinypatch")
	addmenu(15,5,"STOMP UNDERWATER - ", "nouwstomp")
	
	addmenu(16,0,"REMOVE HAMMER BROS - ", "rmhambro") //19
	addmenu(16,1,"1UP CLONES MARIO - ", "_1upclonebug")
	addmenu(16,2,"OP HAT - ", "hatblockspambug")
	addmenu(16,3,"RAIN OF ENEMIES - ", "enemiesrain")
	addmenu(16,4,"HYDRA ENEMIES - ", "enymulti")
	addmenu(16,5,"DOUBLE TROUBLE - ", "doubleeny")
	addmenu(16,6,"BOWSER MODE - ", "bowseronly")
}

for (var i = 0; i < ds_grid_width(menu); i++) { //easiest shit ever... you know, using this a year ago would be helpful... yeah...
    for (var j = 0; j < ds_grid_height(menu); j++) {
		if menu[# i, j] == 0 {
			addmenu(i,j,"BACK")
			break;
		}
	}
}

category = "Characters"
categorysel = 0;
//Characters
charslist = 7
//OCs
ocslist = charslist + 9
//LQ jokes
lqlist = ocslist + 7
//HQ jokes
hqlist = lqlist + 3

curplayersel = 0;
curplayer2sel = 0;
curgunsel = 0;

waitforcontrol = 0
resetCtrlsDelay = 0;
resetCtrlsTimer = 60*5;
keysReseted = false;

settingkey = global.keyu
setcontrol = function(whichglobalvarname)
{
	waitforcontrol = 60*5;
	settingkey = whichglobalvarname;
}

depth = -999

resapply = false;

marioxs = 0;
marioys = 0;
gunxs = 0;
gunys = 0;