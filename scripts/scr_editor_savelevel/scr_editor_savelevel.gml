function scr_editor_savelevel(filename) {
	var data = "UPL!";
	var objectCount = 0;
	with (all) {
		if (!object_is_ancestor(object_index, obj_upobject)) continue;
		objectCount++;
		var variables = variable_instance_get_names(self);
		array_push(variables, "x");
		array_push(variables, "y");
		array_push(variables, "image_xscale");
		array_push(variables, "image_yscale");
		if (!array_contains(variables, "objectKey")) array_push(variables, "objectKey");
		//array_push(variables, "sprite_index");
		for (var i = 0; i < array_length(variables); i++) {
			data += $"{variables[i]}:{variable_instance_get(self, variables[i])},";
		}
		data = string_delete(data, strlen(data), 1);
		data += ";";
	}
	if (objectCount == 0) {
		printf(">>WARNING!! saving level with no objects present");
		data = "UPL!objectKey:1,x:20,y:50,variable:99;objectKey:2,x:50,y:150,variable:50";
	} else data = string_delete(data, strlen(data), 1);
	clipboard_set_text(data);
	printf(data);
	var zippy = zip_create();
	var savedir = (game_save_id + "tmp/" + (md5_string_utf8(filename)) + "/");
	
	var fileid = file_text_open_write(savedir + "leveldata");
	file_text_write_string(fileid, data);
	file_text_close(fileid);
	zip_add_file(zippy, "leveldata", savedir + "leveldata");
	
	ini_open(savedir + "metadata.ini");
	ini_write_real("Level", "Width", room_width);
	ini_write_real("Level", "Height", room_height);
	ini_close();
	zip_add_file(zippy, "metadata.ini", savedir + "metadata.ini");
	
	zip_save(zippy, filename);
	//directory_destroy(savedir);
}