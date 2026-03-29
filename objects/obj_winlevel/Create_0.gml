global.timescale = 0;

fspeed = 0.05;

fadein = false;
fadeout = false;

message = ">> LEVEL WON! >>";
width = string_width(message);
height = string_height(message);
msgx = 320;
msgy = 30;

alarm[0] = seconds(4);

ResetLevel = function() {
	global.timescale = 1;
	global.action = 0;
	
	global.levelnum++;
	if (global.levelnum >= array_length(global.levelList)) {
		room_goto(room_worldselect);
		return;
	}
	global.level.data = global.levelList[global.levelnum];
	room_restart();
}