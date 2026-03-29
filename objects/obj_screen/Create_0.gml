scr_start();

globalvar fps_ideal;
fps_ideal = game_get_speed(gamespeed_fps);

window_set_size(640 * 2, 480 * 2);

//the gamemaker linus ide cannot load custom fonts???
if (global.system == OS_LINUX) {
	var font = ("data/mainfont.ttf");
	ds_map_set(global.fontmap, FONT_MAIN, font_add(font, 20, false, false, 32, 128));
	ds_map_set(global.fontmap, FONT_MAINB, font_add(font, 40, false, false, 32, 128));
}

if (global.debug) {
	#region Debug menu
	d_InfoText = {
		color: c_white,
		_roominfo: true,
		_fps: true,
	};
	dbg_view("Options", false);
	dbg_section("Root", true);
	dbg_color(ref_create(self.d_InfoText, "color"), "debug txt color");
	dbg_section("Visibility", true);
	dbg_checkbox(ref_create(self.d_InfoText, "_roominfo"), "room name");
	dbg_checkbox(ref_create(self.d_InfoText, "_fps"), "fps");
	
	#endregion Debug menu
	
	show_debug_overlay(true, true, 2, 1, false, -1);
	//show_debug_overlay(false);
	
	d_FuncShowDebugOverlay = function() {
		if (is_debug_overlay_open()) {
			show_debug_overlay(false);
		} else {
			d_OverlayInitView = dbg_view("initalize", false);
			dbg_view_delete(d_OverlayInitView);
		}
	}
}

ls_set_font(FONT_MAIN);

room_goto_next();