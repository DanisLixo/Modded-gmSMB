globalvar SCREENW; SCREENW = SCREENW_WS;
globalvar SCREENH; SCREENH = SCREENH_OG;

window_set_caption("gmSMBx2 "+VERSION);

var scrsizemult = 3;
window_set_size(SCREENW*scrsizemult,SCREENH*scrsizemult);
surface_resize(application_surface,SCREENW,SCREENH);

global.volsfx = 0.5;
global.volbgm = 0.5;

global.fullscreen = window_get_fullscreen();
global.aspectRatioModes = ["ORIGINAL", "WIDESCREEN"];
global.aspectRatio = "WIDESCREEN"
global.aspectRatioSelected = 0

global.menukj = ord("Z");

global.demo = false;

var sav = "gmsmbsave.ini"
	
	if file_exists(sav)
	{
		ini_open(sav);
		
		// -------------------------------
		var _saveSection = "Audio"
		// -------------------------------
	
		global.volsfx = ini_read_real(_saveSection,"sfxvolume",global.volsfx);
		global.volbgm = ini_read_real(_saveSection,"bgmvolume",global.volbgm);
	
		// -------------------------------
		_saveSection = "Video"
		// -------------------------------
	
		global.fullscreen = ini_read_real(_saveSection,"fullscreen",global.fullscreen);
		global.aspectRatioSelected = ini_read_real(_saveSection,"resolution",global.aspectRatioSelected);
	
		// -------------------------------
		_saveSection = "Controls"
		// -------------------------------
		
		global.menukj = ini_read_real(_saveSection,"selectmenu",global.menukj)
		
		// -------------------------------
		_saveSection = "Miscellaneous"
		// -------------------------------
		
		global.demo = ini_read_real(_saveSection,"finisheddemo",global.demo);
		
		ini_close();
	}

view_enabled = true;
view_visible[0] = true;

resize_screen();

view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = SCREENW*3;
view_hport[0] = SCREENH*3;

view_camera[0] = camera_create_view(0,0,view_wport[0],view_hport[0],0,noone,-1,-1,view_wport[0],view_hport[0]);

image_alpha = 0

memesdemaise = false;
alarm_is_mid = 0

// Camera
global.warpzoneScrollPatch = false;

// Warning
global.player = "Mario";
global.musicChannels = true;
global.moddedSounds = ds_map_create();

global.keyr = vk_right//ord("D");
global.keyl = vk_left//ord("A");
global.keyu = vk_up//ord("W");
global.keyd = vk_down//ord("S");
global.keya = ord("X")//vk_lcontrol;
global.keyj = ord("Z")//vk_space;
global.keyh = ord("C")//ord("E");