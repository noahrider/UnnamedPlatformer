projectName = "project.upx";
preview = false;
saving = false;
saveDialogID = -1;
objectToPlace = noone;
objectPlaceStruct = {};
selectedObject = noone;
mouseHoldTime = 0;
canPlace = true;
settings = {};
pastedata = false;
pastevalue = "";
afterpastefunc = function(){};

ini_open("up.ini");
firstTime = ini_read_real("Editor", "firstTime", true);
settings.snapToGrid = bool(ini_read_real("Editor", "snapToGrid", true));
ini_close();

enum MODE {
	BUILD,
	EDIT,
	DELETE
}


mode = MODE.BUILD;


global.timescale = 0;
global.action = 1;

var overlayWasOpen = is_debug_overlay_open();

dbg_view("Editor:General Settings", false);
dbg_section("Edit Modes", true);
dbg_button("Build", function(){mode = MODE.BUILD});
dbg_button("Edit", function(){mode = MODE.EDIT});
dbg_button("Delete", function(){mode = MODE.DELETE});
dbg_section("File", true);
dbg_button("Load Project", function(){
	var data = "";
	if (keyboard_check_direct(vk_shift)) {
		pastedata = true;
		afterpastefunc = function(){
			instance_destroy(obj_upobject);
			scr_parse_leveldata(pastevalue);
		}
		return;
	}
	instance_destroy(obj_upobject);
	scr_parse_leveldata(data);
});

dbg_view("Editor:Level Settings", false);
dbg_section("Information", true);
dbg_text_input(ref_create(global.level.info, "name"), "Name");
dbg_text_input(ref_create(global.level.info, "desc"), "Description");
dbg_text_input(ref_create(global.level.info, "creator"), "Creator");
dbg_section("Environment");
dbg_color(ref_create(global.level, "background"), "Sky Color");
dbg_section("Export", false);
dbg_button("Export level to .UPL", function(){
	var question, fname;
	question = $"Where do you want to save \"{global.level.info.name}\"?";
	if (keyboard_check_direct(vk_shift)) {
		fname = get_save_filename_ext("*.upl", "", working_directory, question);
	} else {
		fname = get_string(question, working_directory);
	}
	scr_editor_export(fname);
});

dbg_view("Editor:Objects", false);
dbg_section("Tiles", false);
dbg_button("Grass (spr_tile_grass)", function(){objectToPlace = obj_tileobject; objectPlaceStruct = {sprite_index: spr_tile_grass, tileID: 1}});
dbg_button("Dirt (spr_tile_dirt)", function(){objectToPlace = obj_tileobject; objectPlaceStruct = {sprite_index: spr_tile_dirt, tileID: 2}});
dbg_section("Objects", false);
dbg_button("Spawnpoint", function(){objectToPlace = obj_spawnpoint; objectPlaceStruct = {}});
dbg_button("Goalpost", function(){objectToPlace = obj_goalpost; objectPlaceStruct = {}});
dbg_button("Sawblade", function(){objectToPlace = obj_sawblade; objectPlaceStruct = {}});

dbg_view("Editor:Current Object", false);
dbg_section("Variables", true);

show_debug_overlay(false);
if (overlayWasOpen && global.debug) {
	//with (obj_screen) d_FuncShowDebugOverlay();
}


ToggleEditorMenu = function() {
	if (is_debug_overlay_open()) {
		show_debug_overlay(false);
	} else {
		tmpview = dbg_view("temp", false);
		dbg_view_delete(tmpview);
	}
}