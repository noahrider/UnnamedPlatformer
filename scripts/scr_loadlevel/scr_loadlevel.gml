function scr_loadlevel(filename) {
	if (filename_ext(filename) != ".upl") {
		printf(">>ERROR!! incorrect filetype (expected {:1}, got {:2})", ".upl", filename_ext(filename));
		return false;
	}
	var savedir = (temp_directory + (md5_string_utf8(filename_name(filename))) + "/");
	var level = zip_unzip(filename, savedir);
	
	var fileid = file_text_open_read(savedir + "leveldata");
	global.level.data = file_text_read_string(fileid);
	file_text_close(fileid);
	
	ini_open(savedir + "metadata.ini");
	var _roomWidth = ini_read_real("Level", "Width", 640);
	var _roomHeight = ini_read_real("Level", "Width", 480);
	global.level.background = ini_read_real("Level", "BGColor", #0BABF3);
	ini_close();
	_roomWidth = max(_roomWidth, 640);
	_roomHeight = max(_roomHeight, 480);
	room_set_width(room_level, _roomWidth);
	room_set_width(room_level, _roomHeight);
	
	return true;
}