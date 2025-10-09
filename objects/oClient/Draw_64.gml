 /// @description Draw Latency and the Chat
draw_set_font(global.fnt);

draw_text(24,32, "PING -  " + string(latency));
if latency > 200 {draw_text(24, 40, "UNSTABLE!!!")}

draw_set_font(fntComicsmall)
//Draw the input box and text
var chatx = SCREENW/2+24
var chaty = SCREENH/2+48

if (global.chatfocus)
{
	draw_set_color(c_black)
	draw_set_alpha(0.5)
	draw_rectangle(chatx-2, chaty-2, SCREENW+2, SCREENH,false)
	draw_set_color(-1)
	draw_set_alpha(1)
	draw_rectangle(chatx, chaty, SCREENW-8, SCREENH/2+48+8, true);
	draw_text(chatx+2, chaty, string(text) + "_");
}
else
{
	draw_set_color(c_black)
	draw_set_alpha(warntimer/5000)
	draw_rectangle(chatx-2, chaty-2, SCREENW+2, SCREENH,false)
	draw_set_color(-1)
	draw_set_alpha(1)
	draw_set_alpha(warntimer/1000)
	draw_text(chatx+2, chaty, "Press TAB to chat.");
	draw_set_alpha(1);
}
//Draw messages from the chat
var yy = chaty;

//Loop through the list and draw the messages
for (var i = ds_list_size(global.CHAT); i >= 0; i--)
{
	if is_string(global.CHAT[| i])
	{
		draw_set_alpha(warntimer/100);
		draw_text_ext(chatx+2,yy,string(global.CHAT[| i]),-1,99999);
		draw_set_alpha(1);
	}
	
	yy += 16;
}

if endcounter != -1
{
	draw_set_color(c_yellow)
	draw_set_font(global.fnt);
	draw_text(6,SCREENH-12,"FINISHING IN "+string(round(endcounter div 60))+"...");
	draw_set_color(-1);
	draw_set_font(-1);
}
if Iended > 0
{
	draw_set_font(global.fnt);
	draw_text(6,SCREENH-24,"PLAYERS REMAINING "+string(Iended)+"/"+string(players)+"!");
	draw_set_font(-1);
}

draw_set_font(-1);