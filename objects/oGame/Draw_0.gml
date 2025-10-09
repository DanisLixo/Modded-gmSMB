depth = dep;

#region Palette Handler (supposed to be other object, sorry)
// handle tile palette
// handle tile palette
var tbr = layer_get_id("Tiles_brown")
if layer_exists(tbr)
{layer_script_begin(tbr,tile_brownpalswap);	layer_script_end(tbr,tile_palreset); dep = layer_get_depth(tbr)-1}

var tgr = layer_get_id("Tiles_green")
if layer_exists(tgr)
{layer_script_begin(tgr,tile_greenpalswap);	layer_script_end(tgr,tile_palreset);}

var tbl = layer_get_id("Tiles_blue")
if layer_exists(tbl)
{layer_script_begin(tbl,tile_bluepalswap);	layer_script_end(tbl,tile_palreset);}

var tbg = layer_get_id("Background")
if layer_exists(tbg)
{layer_script_begin(tbg,bg_palswap);	layer_script_end(tbg,tile_palreset);}

var tr = layer_get_id("RetroWPalette")
if layer_exists(tr)
{layer_script_begin(tr,retro_palswap);	layer_script_end(tr,tile_palreset);}
#endregion

if room = rmServer
{exit;}

game_hud();

draw_set_font(-1);

#region Creepypasta
/* 
var randomAssetNumber = choose(snd1UP,sndBLAST,sndBeanstalk,sndBeep,sndBowserdie,sndBowserfire,sndBreak,sndBump,sndCoin,sndDieShort,sndJump,sndJumpbig,sndPause);
// ok that's enough

//Cant keep the scary cuz bad game design
if debug && instance_exists(oPaused) || destroy > 0 {destroy++;}
if destroy > 0 {
	debug = true; 
	//instance_create_depth(x,y,999,oPaused); 
	global.time = irandom_range(0,10000); 
	global.score = irandom_range(0,10000);
	global.playerName = "Oh no...";
	global.player = "Oh no...";
	global.world = irandom_range(0,9);
	global.level = irandom_range(0,9);
	global.coins = irandom_range(0,999);
	global.showfps = !global.showfps;
	global.showpfp = !global.showfps;
	if instance_exists(oPaused) {instance_destroy(oPaused);}
	
	if destroy%room_speed/1.25 == 0
	{sfx(randomAssetNumber, irandom_range(0,4))}
	
	if destroy == 1 {audio_stop_all();}
	if destroy%12 = 0 && global.environment != e.snow 
	{global.environment++;} 
	else if destroy%12 = 0 && global.environment = e.snow 
	{global.environment = -1;} 
	if destroy%12 = 0 && global.game != gm.LL
	{global.game++;} 
	else if destroy%12 = 0
	{global.game = -1;} 
	if destroy = room_speed*15
	{game_end()}
} 
*/
#endregion 
// Game Pause Screen so many exceptions because pausing is really overpowereed

if string_pos("Title",room_get_name(room)) == 0 and room != rmServer and 
room != rmLeveltransition and triggercastleflag = false && room != rmDemoSplash && room != rmWarning
{
	if delay <= 10 {delay++}
	
	if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_enter)) 
	&& global.chatfocus = false and !instance_exists(oPaused) && !debug and delay > 10
	{
		if !instance_exists(oClient) {instance_deactivate_all(true);} 
		instance_create_depth(0, 0, -999, oPaused); 
		sfx(sndPause,0); delay = 0;
	}
	
	// This is to freeze the game when unfocused.
	if !instance_exists(oClient) 
	{while !window_has_focus() {}} //LMAOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
}