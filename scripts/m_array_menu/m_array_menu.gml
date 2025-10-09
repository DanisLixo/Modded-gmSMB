// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
add_menu = function(_label = "TREEROCKER", _sectionList = menu)
{
	array_push(_sectionList, {
		hasSubSections : true,
		label : string_upper(_label), 
		subSections : [],
		savedSubSection : 0
	});
}
add_section = function(_label = "TREEROCKER", _sectionList = menu)
{
	array_push(_sectionList, {
		hasSubSections : false,
		label : _label, 
		options : [],
		savedSel : 0
	});
}

add_option = function(_sec, _label = "TREEROCKER", _type = -1, _opVariable = "", _actions = [], _sectionList = menu)
{
	var _channelKind = 0;
	
	if (_opVariable == "chAllowed") {_channelKind = channelID; channelID++;}
	array_push(_sectionList[_sec].options, {
		label : string_upper(_label), 
		type : _type, 
		opVariable : _opVariable, 
		actions : _actions,
		channel : _channelKind
	});
}