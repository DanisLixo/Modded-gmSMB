// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_note(_x = 0, _y = 0, _text = "You game till finish.", _fade = choose(1, fps), _timer = fps*4, _font = global.fnt) {
	if (instance_exists(oNote)) instance_destroy(oNote);
	
	_text = string_upper(_text);
	var note = instance_create_depth(_x, _y, -1000, oNote);
	note.text = _text;
	note.timer = _timer;
	note.fadeTimer = _fade;
	note.useFont = _font;
}