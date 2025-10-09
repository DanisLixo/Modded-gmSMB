/// @desc Save current settings to the save file.
function savesettings()
{
	var sav = "gmsmbsave.ini"
	
	ini_open(sav);	
	
	// -------------------------------
	var _saveSection = "Character"
	// -------------------------------
	
	ini_write_real(_saveSection,"charid",global.playerID);
	ini_write_real(_saveSection,"charpaletteindex",global.paletteindex);
	ini_write_real(_saveSection,"gunid",global.gunID);
	
	ini_write_real(_saveSection,"charidp2",global.playertwoID);
	ini_write_real(_saveSection,"charpaletteidp2",global.p2_paletteindex);
	
	// -------------------------------
	_saveSection = "Online"
	// -------------------------------
	
	ini_write_string(_saveSection,"username",global.username);
	ini_write_string(_saveSection,"serverip",global.ip);
	ini_write_real(_saveSection,"serverport",global.port);
	ini_write_real(_saveSection,"onlineplayersalpha",global.onlinealpha);
	
	// -------------------------------
	_saveSection = "Audio"
	// -------------------------------
	
	ini_write_real(_saveSection,"sfxvolume",global.volsfx);
	ini_write_real(_saveSection,"bgmvolume",global.volbgm);
	ini_write_real(_saveSection,"classicaudio",global.musicChannels);
	ini_write_real(_saveSection,"opacandastar",global.opacandastar);
	
	// -------------------------------
	_saveSection = "Video"
	// -------------------------------
	
	ini_write_real(_saveSection,"fullscreen",global.fullscreen);
	ini_write_real(_saveSection,"showdiscordpfp",global.showpfp);
	ini_write_real(_saveSection,"showfps",global.showfps);
	ini_write_real(_saveSection,"resolution",global.aspectRatioSelected);
	ini_write_real(_saveSection,"letterbox",global.letterboxSelected);
	ini_write_real(_saveSection,"letterboxdark",global.letterboxDark);
	
	// -------------------------------
	_saveSection = "Controls"
	// -------------------------------
	
	ini_write_real(_saveSection,"up",global.keyu)
	ini_write_real(_saveSection,"down",global.keyd)
	ini_write_real(_saveSection,"left",global.keyl)
	ini_write_real(_saveSection,"right",global.keyr)
	ini_write_real(_saveSection,"action",global.keya)
	ini_write_real(_saveSection,"jump",global.keyj)
	ini_write_real(_saveSection,"special",global.keyh)
	
	ini_write_real(_saveSection,"upp2",global.p2_keyu)
	ini_write_real(_saveSection,"downp2",global.p2_keyd)
	ini_write_real(_saveSection,"leftp2",global.p2_keyl)
	ini_write_real(_saveSection,"rightp2",global.p2_keyr)
	ini_write_real(_saveSection,"actionp2",global.p2_keya)
	ini_write_real(_saveSection,"jumpp2",global.p2_keyj)
	ini_write_real(_saveSection,"specialp2",global.p2_keyh)
	
	ini_write_real(_saveSection,"upmenu",global.menuku)
	ini_write_real(_saveSection,"downmenu",global.menukd)
	ini_write_real(_saveSection,"leftmenu",global.menukl)
	ini_write_real(_saveSection,"rightmenu",global.menukr)
	ini_write_real(_saveSection,"backmenu",global.menuka)
	ini_write_real(_saveSection,"selectmenu",global.menukj)
	ini_write_real(_saveSection,"thirdmenu",global.menukh)
	
	ini_write_real(_saveSection,"copycontrolsmenu",global.menuCopyCtrls)
	
	// -------------------------------
	_saveSection = "Mod Settings"
	// -------------------------------
	
	ini_write_real(_saveSection,"commandenemies",global.moveEnys);
	ini_write_real(_saveSection,"commandobjs",global.moveObjs);
	ini_write_real(_saveSection,"commandstatics",global.moveStatics);
	
	ini_write_real(_saveSection,"playchannel0",global.chAllowed[0]);
	ini_write_real(_saveSection,"playchannel1",global.chAllowed[1]);
	ini_write_real(_saveSection,"playchannel2",global.chAllowed[2]);
	ini_write_real(_saveSection,"playchannel3",global.chAllowed[3]);
	
	ini_write_real(_saveSection,"abilities",global.abilities);
	
	ini_write_real(_saveSection,"titlescreen",global.titleroomSelected);
	ini_write_real(_saveSection,"blood",global.blood);
	ini_write_real(_saveSection,"puvisual",global.pupleave);
	ini_write_real(_saveSection,"differenttransitions",global.differentTransitions);
	
	// -------------------------------
	_saveSection = "Miscellaneous"
	// -------------------------------
	
	ini_write_real(_saveSection,"hardmode",global.hardmode);
	ini_write_real(_saveSection,"warpzone",global.warpzone);
	ini_write_real(_saveSection,"warpscrolllock",global.warpzoneScrollPatch);
	ini_write_real(_saveSection,"checkpoints",global.checkpoints);
	ini_write_real(_saveSection,"spinypatch",global.spinypatch);
	ini_write_real(_saveSection,"stompunderwater",global.nouwstomp);
	
	ini_write_real(_saveSection,"finisheddemo",global.demo);
	
	// -------------------------------
	_saveSection = "Modifiers"
	// -------------------------------
	
	ini_write_real(_saveSection,"removehammerbros",global.rmhambro);
	ini_write_real(_saveSection,"1upclone",global._1upclonebug);
	ini_write_real(_saveSection,"hatblockbug",global.hatblockspambug);
	ini_write_real(_saveSection,"enemiesrain",global.enemiesrain);
	ini_write_real(_saveSection,"enymulti",global.enymulti);
	ini_write_real(_saveSection,"doubleeny",global.doubleeny);
	ini_write_real(_saveSection,"bowseronly",global.bowseronly);
	
	ini_close();
}