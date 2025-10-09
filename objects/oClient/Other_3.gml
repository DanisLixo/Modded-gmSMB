disconnecttt();

var reason = "this pop up has to appear so you can get disconnected from the server lol";

if (latency > 0 && timeout > fps*7) { reason = (fps < game_get_speed(gamespeed_fps))? "youre game laggin fr" : "your internet sucks im sorry"; } 
if (latency == 0) { reason = "i got no idea who you connecting to"; }
if (global.gameReseted) { reason = "You pressed F4 lmao" }
if (global.leftGame) { reason = "you left with the quit option, wow" }
show_message($"You got disconnected from the server.\n Reason: {reason}");