if (!scr_loadlevel(global.level.file)) {
	show_error("Failed to load level.", true);
	return;
}

room_goto(room_level);