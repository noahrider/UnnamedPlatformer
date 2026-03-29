if (!global.debug) {
	room_goto_next();
	return;
}

options = [];

array_push(options, "Start game");
array_push(options, "Editor");
array_push(options, "Test room");

selected = 0;