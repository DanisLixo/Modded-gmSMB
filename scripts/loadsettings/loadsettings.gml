/// @desc Load settings from the save file and overwrites the game current ones.
function loadsettings()
{
	var sav = "gmsmbsave.ini"
	
	if file_exists(sav)
	{
		ini_open(sav);
		
		// -------------------------------
		var _saveSection = "Character"
		// -------------------------------
	
		global.playerID = ini_read_real(_saveSection,"charid",global.playerID);
		global.paletteindex = ini_read_real(_saveSection,"charpaletteindex",global.paletteindex);
		global.gunID = ini_read_real(_saveSection,"gunid",global.gunID);
	
		global.playertwoID = ini_read_real(_saveSection,"charidp2",global.playertwoID);
		global.p2_paletteindex = ini_read_real(_saveSection,"charpaletteindexp2",global.p2_paletteindex);
	
		// -------------------------------
		_saveSection = "Online"
		// -------------------------------
	
		global.username = ini_read_string(_saveSection,"username",global.username);
		global.ip = ini_read_string(_saveSection,"serverip",global.ip);
		global.port = ini_read_real(_saveSection,"serverport",global.port);
		global.onlinealpha = ini_read_real(_saveSection,"onlineplayersalpha",global.onlinealpha);
	
		// -------------------------------
		_saveSection = "Audio"
		// -------------------------------
	
		global.volsfx = ini_read_real(_saveSection,"sfxvolume",global.volsfx);
		global.volbgm = ini_read_real(_saveSection,"bgmvolume",global.volbgm);
		global.musicChannels = ini_read_real(_saveSection,"classicaudio",global.musicChannels);
		global.opacandastar = ini_read_real(_saveSection,"opacandastar",global.opacandastar);
	
		// -------------------------------
		_saveSection = "Video"
		// -------------------------------
	
		global.fullscreen = ini_read_real(_saveSection,"fullscreen",global.fullscreen);
		global.showpfp = ini_read_real(_saveSection,"showdiscordpfp",global.showpfp);
		global.showfps = ini_read_real(_saveSection,"showfps",global.showfps);
		global.aspectRatioSelected = ini_read_real(_saveSection,"resolution",global.aspectRatioSelected);
		global.letterboxSelected = ini_read_real(_saveSection,"letterbox",global.letterboxSelected);
		global.letterboxDark = ini_read_real(_saveSection,"letterboxdark",global.letterboxDark);
	
		// -------------------------------
		_saveSection = "Controls"
		// -------------------------------
	
		global.keyu = ini_read_real(_saveSection,"up",global.keyu)
		global.keyd = ini_read_real(_saveSection,"down",global.keyd)
		global.keyl = ini_read_real(_saveSection,"left",global.keyl)
		global.keyr = ini_read_real(_saveSection,"right",global.keyr)
		global.keya = ini_read_real(_saveSection,"action",global.keya)
		global.keyj = ini_read_real(_saveSection,"jump",global.keyj)
		global.keyh = ini_read_real(_saveSection,"special",global.keyh)
	
		global.p2_keyu = ini_read_real(_saveSection,"upp2",global.p2_keyu)
		global.p2_keyd = ini_read_real(_saveSection,"downp2",global.p2_keyd)
		global.p2_keyl = ini_read_real(_saveSection,"leftp2",global.p2_keyl)
		global.p2_keyt = ini_read_real(_saveSection,"rightp2",global.p2_keyr)
		global.p2_keya = ini_read_real(_saveSection,"actionp2",global.p2_keya)
		global.p2_keyj = ini_read_real(_saveSection,"jumpp2",global.p2_keyj)
		global.p2_keyh = ini_read_real(_saveSection,"specialp2",global.p2_keyh)
	
		global.menuku = ini_read_real(_saveSection,"upmenu",global.menuku)
		global.menukd = ini_read_real(_saveSection,"downmenu",global.menukd)
		global.menukl = ini_read_real(_saveSection,"leftmenu",global.menukl)
		global.menukr = ini_read_real(_saveSection,"rightmenu",global.menukr)
		global.menuka = ini_read_real(_saveSection,"backmenu",global.menuka)
		global.menukj = ini_read_real(_saveSection,"selectmenu",global.menukj)
		global.menukh = ini_read_real(_saveSection,"thirdmenu",global.menukh)
		
		global.menuCopyCtrls = ini_read_real(_saveSection,"copycontrolsmenu",global.menuCopyCtrls)
	
		// -------------------------------
		_saveSection = "Mod Settings"
		// -------------------------------
	
		global.moveEnys = ini_read_real(_saveSection,"commandenemies",global.moveEnys);
		global.moveObjs = ini_read_real(_saveSection,"commandobjs",global.moveObjs);
		global.moveStatics = ini_read_real(_saveSection,"commandstatics",global.moveStatics);
	
		global.chAllowed[0] = ini_read_real(_saveSection,"playchannel0",global.chAllowed[0]);
		global.chAllowed[1] = ini_read_real(_saveSection,"playchannel1",global.chAllowed[1]);
		global.chAllowed[2] = ini_read_real(_saveSection,"playchannel2",global.chAllowed[2]);
		global.chAllowed[3] = ini_read_real(_saveSection,"playchannel3",global.chAllowed[3]);
	
		global.abilities = ini_read_real(_saveSection,"abilities",global.abilities);
	
		global.titleroomSelected = ini_read_real(_saveSection,"titlescreen",global.titleroomSelected);
		global.blood = ini_read_real(_saveSection,"blood",global.blood);
		global.pupleave = ini_read_real(_saveSection,"puvisual",global.pupleave);
		global.differentTransitions = ini_read_real(_saveSection,"differenttransitions",global.differentTransitions);
	
		// -------------------------------
		_saveSection = "Miscellaneous"
		// -------------------------------
	
		global.hardmode = ini_read_real(_saveSection,"hardmode",global.hardmode);
		global.warpzone = ini_read_real(_saveSection,"warpzone",global.warpzone);
		global.warpzoneScrollPatch = ini_read_real(_saveSection,"warpscrolllock",global.warpzoneScrollPatch);
		global.checkpoints = ini_read_real(_saveSection,"checkpoints",global.checkpoints);
		global.spinypatch = ini_read_real(_saveSection,"spinypatch",global.spinypatch);
		global.nouwstomp = ini_read_real(_saveSection,"stompunderwater",global.nouwstomp);
		
		global.demo = ini_read_real(_saveSection,"finisheddemo",global.demo);
	
		// -------------------------------
		_saveSection = "Modifiers"
		// -------------------------------
	
		global.rmhambro = ini_read_real(_saveSection,"removehammerbros",global.rmhambro);
		global._1upclonebug = ini_read_real(_saveSection,"1upclone",global._1upclonebug);
		global.hatblockspambug = ini_read_real(_saveSection,"hatblockbug",global.hatblockspambug);
		global.enemiesrain = ini_read_real(_saveSection,"enemiesrain",global.enemiesrain);
		global.enymulti = ini_read_real(_saveSection,"enymulti",global.enymulti);
		global.doubleeny = ini_read_real(_saveSection,"doubleeny",global.doubleeny);
		global.bowseronly = ini_read_real(_saveSection,"bowseronly",global.bowseronly);
	
		ini_close();
	}
}