function scr_start() {
	global.debug = false;
	
	#region Constants
	#macro VERSION "up" + (string(date_get_year(GM_build_date)) + (date_get_month(GM_build_date) < 10 ? ("0" + string(date_get_month(GM_build_date))) : string(date_get_month(GM_build_date))) + (date_get_day(GM_build_date) < 10 ? ("0" + string(date_get_day(GM_build_date))) : string(date_get_day(GM_build_date))))
	
	#macro c_select #E53935
	
	#macro FONT_MAIN "main"
	#macro FONT_MAINB "mainb"
	
	#macro OS_WINDOWS 1
	#macro OS_LINUX 2
	#macro OS_MACINTOSH 3
	#endregion Constants
	
	global.action = 0;
	global.time = 0;
	global.timescale = 1;
	
	global.system = -1;
	if (os_type == os_windows) global.system = OS_WINDOWS;
	if (os_type == os_linux) global.system = OS_LINUX;
	if (os_type == os_macosx) global.system = OS_MACINTOSH;
		
	if (global.system == -1) {
		printf("Unable to get the current system type ({:1})", os_type);
	}
	
	global.world = 0;
	global.level = {
		time: 0,
		file: "",
		data: "",
		objects: [],
		background: #0BABF3,
		info: {
			name: "",
			desc: "",
			creator: "",
		},
	};
	
	global.levelnum = 0;
	global.levelList = [];
	
	global.settings = {
		debug: {
			showHiddenObjects: false,
			showHitboxes: false,
		}
	};
	
	global.fontmap = ds_map_create();
	ds_map_add(global.fontmap, FONT_MAIN, fnt_main);
	ds_map_add(global.fontmap, FONT_MAINB, fnt_mainb);
}