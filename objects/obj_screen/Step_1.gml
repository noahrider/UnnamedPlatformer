if (global.debug) {
	if (keyboard_check_pressed(ord("Q"))) {
		d_FuncShowDebugOverlay();
	}
	if (keyboard_check_pressed(ord("H"))) {
		global.settings.debug.showHitboxes = !global.settings.debug.showHitboxes;
	}
}