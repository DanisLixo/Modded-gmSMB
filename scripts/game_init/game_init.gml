/// @self
/// @description Game start function.
function init()
{
	randomize();
	
	#macro SCREENW_WS 412
	#macro SCREENW_OG 256
	#macro SCREENW_UW 568
	
	#macro SCREENH_UW 240 // 232 // 240 
	#macro SCREENH_OG 232 // 232 // 240 
	
	globalvar SCREENW; SCREENW = SCREENW_WS;
	globalvar SCREENH; SCREENH = SCREENH_OG;
	
	#macro TIMESEC 0.4
	#macro FNT_SMB font_add_sprite_ext(sFont,"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-+*!.:©bredi/_",0,0)
	#macro FNT_LL font_add_sprite_ext(sFont_LL,"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-+*!.:©bredi/'",0,0)
	#macro FNT_SECRT font_add_sprite_ext(sFont_secrets,"0123456789CDEFNORSTUY!",0,0)
	global.fnt = FNT_SMB
	#macro VERSION "MOD 2.5"
	
	global.fullscreen = window_get_fullscreen();
	#region screen

	var scrsizemult = 3;
	window_set_size(SCREENW*scrsizemult,SCREENH*scrsizemult);
	surface_resize(application_surface,SCREENW,SCREENH);

	view_xport[0] = 0;
	view_yport[0] = 0;
	view_wport[0] = SCREENW;
	view_hport[0] = SCREENH;
	//display_set_gui_size(SCREENW,SCREENH)
		
	#endregion
	
	global.score = 0;
	global.coins = 0;
	global.time = -1;
	
	for (var i = 0; i < 7; i++) {
	    global.foundSecret[i] = false;
	}
	
	global.playerID = 0;
	global.player = "Mario"
	global.playerName = "Mario"
	global.palettesprite = sPalette_mario;
	global.paletteindex = 1;
	
	global.p2_score = 0;
	global.p2_coins = 0;
	
	global.playertwoID = 1;
	global.playertwo = "Luigi";
	global.playertwoName = "Luigi";
	global.p2_palettesprite = sPalette_luigi;
	global.p2_paletteindex = 1;	
	
	global.gunskin = "Default";
	
	global.aspectRatioSelected = 1;
	global.aspectRatioModes = ["ORIGINAL", "WIDESCREEN"];
	global.aspectRatio = global.aspectRatioModes[global.aspectRatioSelected];

	global.letterboxSelected = 0
	global.letterboxDark = 0
	global.letterboxes = [
	{	
		name : "RED",
		spr : sLetterbox_Modern_Red
	},
	{	
		name : "BLUE",
		spr : sLetterbox_Modern_Blue
	},
	{	
		name : "GREEN",
		spr : sLetterbox_Modern_Green
	},
	{	
		name : "YELLOW",
		spr : sLetterbox_Modern_Yellow
	},
	{	
		name : "PINK",
		spr : sLetterbox_Modern_Pink
	},
	{	
		name : "PURPLE",
		spr : sLetterbox_Modern_Purple
	},
	{	
		name : "ORANGE",
		spr : sLetterbox_Modern_Orange
	},
	{	
		name : "SIMPLE",
		spr : sLetterbox_Simple
	},
	{	
		name : "CHARACTER",
		spr : sLetterbox_Character
	}
	]
	global.letterboxSprite = global.letterboxes[global.letterboxSelected].spr;
	
	global.titleroomSelected = 0;
	global.titlerooms = [
	{	
		name : "NEW",
		room : rmTitle_new
	},
	{	
		name : "OLD",
		room : rmTitle_old
	},
	{	
		name : "MARIOKET",
		room : rmTitle_MK
	}
	]
	global.titleroom = global.titlerooms[global.titleroomSelected].room;

	global.showfps = true;
	global.showpfp = true;

	global.ch = [-1, -1, -1, -1, -1] //Sound
	global.sfx = [-1, 0] //Sound
	global.chAllowed = [true, true, true, true];
	
	audio_sound_set_track_position(musSecret4, random_range(0, 15.35));
	
	global.curbgm = "Title"
	global.starmanPlaying = false;
	global.musicChannels = true
	global.opacandastar = true
	global.volsfx = 0.5;
	global.volbgm = 0.5;
	
	global.keyr = vk_right//ord("D");
	global.keyl = vk_left//ord("A");
	global.keyu = vk_up//ord("W");
	global.keyd = vk_down//ord("S");
	global.keya = ord("X")//vk_lcontrol;
	global.keyj = ord("Z")//vk_space;
	global.keyh = ord("C")//ord("E");
	
	global.p2_keyr = ord("D");
	global.p2_keyl = ord("A");
	global.p2_keyu = ord("W");
	global.p2_keyd = ord("S");
	global.p2_keya = vk_shift
	global.p2_keyj = vk_space;
	global.p2_keyh = ord("E");
	
	global.menukr = vk_right//ord("D");
	global.menukl = vk_left//ord("A");
	global.menuku = vk_up//ord("W");
	global.menukd = vk_down//ord("S");
	global.menuka = ord("X")//vk_lcontrol;
	global.menukj = ord("Z")//vk_space;
	global.menukh = ord("C")//ord("E");
	
	global.menuCopyCtrls = 0;
	
	//global.keyrun = vk_shift;
	
	global.moveEnys = true;
	global.moveObjs = true;
	global.moveStatics = false;
	global.partner_active = false;
	global.multiplayer = false;
	global.abilities = true;
	
	#region environment

	enum e
	{
		overworld,
		underground,
		castle,
		underwater,
		mushroom,
		snow,
		night,
		snowday
	}
	global.environment = e.overworld
	
	enum gm
	{
		SMB, LL, ANN
	}
	global.game = gm.SMB;
	
	global.hiddenoneup = false;
	global.secrets_found = 0;
	
	function tile_brownpalswap()
	{
		shader_set(shdColorswap)
		apply_palette(sPalette_tilebrown,global.environment,1)
	}
	function tile_greenpalswap()
	{
		shader_set(shdColorswap)
		apply_palette(sPalette_tilegreen,global.environment,1)
	}
	function tile_bluepalswap()
	{
		shader_set(shdColorswap)
		apply_palette(sPalette_tileblue,global.environment,1)
	}
	function bg_palswap()
	{
		shader_set(shdColorswap)
		apply_palette(sPalette_background,global.environment,1)
	}
	function retro_palswap()
	{
		shader_set(shdColorswap)
		apply_palette(sPalette_mario,global.paletteindex,1)
	}
	function tile_palreset()
	{
		shader_reset();
	}
	#endregion
	
	#region characters
	
	global.moddedSprites = ds_map_create();
	global.moddedSounds = ds_map_create();
	global.moddedChars = ds_map_create();
	global.charlist = []
	global.gunlist = []
	
	ImportModSprites("mods\\character")
	ImportModGSpr("mods\\gun")
	ImportModSounds("mods\\character")

	addplist = function(name,creator,_id = name)
	{
		array_push(global.charlist, {
				name : name,
				creator : creator,
				id : _id
			});
	}
		
	//Characters

	addplist("Mario","nintendo")
	addplist("Luigi","bredi")
	addplist("Toad","nintendo")
	addplist("Wario","sans1m0n")
	addplist("Goomba","seven")
	addplist("Sonic","pixelmarioxp")
	addplist("Syobon","syobon action")

	addplist("Bredi","bredi")
	addplist("Goober","toasterman")
	addplist("Iris","madnyle")
	addplist("Owen","owen")
	addplist("Seven","seven")
	addplist("SucculentKicker","dermo")
	addplist("Goldron","goldron")
	addplist("Dawn","dawlate")
	addplist("Feathy","buchotnik da dolly")
		
	addplist("Anton","summitsphere")
	addplist("Peter Griffin",".")
	addplist("Duke","pacolagamer444")
	addplist("Pokey","POKEY'S MOM")
	addplist("Really small Mario","gemaplys", "1pixelmario")
	addplist("Max Verstappen","enciroyeah")
	addplist("Peppino","tour de la pizza")

	addplist("Martin","seven")
	addplist("Peter","seven")
	addplist("Vito","o            gemaplys", "Gemaplys")
	ImportModCharacter("mods\\character")
		
	// Guns

	addgunlist = function(name)
	{
		array_push(global.gunlist,name);
	}
		
	addgunlist("Default")
	addgunlist("BigHand")
	addgunlist("Emoji")
	addgunlist("AppleEmoji")
	addgunlist("MiniGun")
	ImportModGuns("mods\\gun")
	
	global.gunID = 0;
	#endregion
	
	global.demoCount = -1;
	ImportDemos();
	
	global.debug = true;
	
	global.rtxmode = false;
	global.schutmode = false;
	global.commandenys = false;
	global.race = false;
	global.challenge = false;
	global.extra = false;
	global.playercol = false;
	global.freecam = false;
	global.trippymode = false;
	global.pvp = false;
	
	global.demo = false;
	
	global.hardmode = false; //activates og game hard mode
	global.warpzone = false; //activates warp zone
	global.checkpoints = true; //activates checkpoints
	
	global._1upclonebug = false; //returns the mario 1 up clone bug
	global.hatblockspambug = false; //returns hat broken hitbox
	global.nouwstomp = false; //sets mario to not be able to stomp an enemy underwater
	
	global.spinypatch = true; //patches the way spinies are thrown
	global.warpzoneScrollPatch = true; //patches the warp zone scroll bug
	
	global.rmhambro = false; //replaces hammer bros with a random enemy
	global.enemiesrain = false; //enemies rain
	global.enymulti = false; //killing enys multiplies them in two
	global.doubleeny = false; //enemies are already in two
	global.bowseronly = false; //all enemies are replaced with fake bowsers
	
	global.blood = false; //when shooting an enemy, he will stupidly bleed a lot
	global.pupleave = true; //when taking hit, your powerup will leave you in a broke state
	global.differentTransitions = true; //randomly choose between scrapped screen transitions
	global.transitions = ["Lshapedpipe", "Installedpipe", "Pipejump", "Undergoing", "Lshapedtroll"];
	
	global.racepos = ds_grid_create(3,1);
	global.nextlvltimer = 10
	global.waiting = false
	global.sync = false;
	
	global.arena = 0
	global.goalofstars = 15;
	global.onlinealpha = 0.5;
	
	global.spectate = false;
	
	global.clientid = irandom_range(0,10000);
	global.ip = "127.0.0.1"
	global.port = 7676;
	global.maxplayers = 8;
	global.username = string(global.clientid);
	global.insertclient = false
	
	global.CHAT = ds_list_create();
	global.chatfocus = false;
	
	global.level = 0;
	global.world = 0;
}