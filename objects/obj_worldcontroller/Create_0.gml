debugroom = (room == testroom);

docamsize = true;
cutcam = false;
camsize = 1;

//parse the level and place the objects
if (!debugroom) {
	if (!scr_parse_leveldata(global.level.data)) {
		printf("Failed to parse level data.");
		//return;
	}
}

layer_background_blend(layer_background_get_id("Background"), global.level.background);

instance_create_depth(0, 0, 0, obj_atlas);
instance_create_depth(0, 0, 999999, obj_background);

var pit = instance_create_depth(0, room_height + 50, 0, obj_sawblade);
pit.image_xscale = room_width;
pit.image_yscale = 999;