if (!global.debug) {
	room_goto_next();
	return;
}

printf("Compiled on {:1}", COMPILE_TIME);

options = [];

array_push(options, "Start game");
array_push(options, "Editor");
array_push(options, "Test room");

selected = 0;