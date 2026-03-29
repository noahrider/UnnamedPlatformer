//room_goto(testroom);
//return;

image_alpha = 0;

selected = 0;
selectedWorld = 0;
menuBuffer = 0;
fadein = true;
fadeout = false;
noworlds = true;

worlds = [];
worldsLevelData = [];
WorldMenu = function(name, fname, directory, background, backgroundScale) constructor {
	self.name = name;
	self.fname = fname;
	self.directory = directory;
	self.background = background;
	self.backgroundScale = backgroundScale;
	self.data = [];
	self.levelFileLocs = [];
	self.levelNames = [];
}

var world = file_find_first(program_directory + "assets/data/worlds/*.upw", fa_archive);
while (world != "") {
	noworlds = false;
	printf("Found new world: {:1}", world);
	var savedir = (temp_directory + md5_string_utf8(world) + "/");
	var zippy = zip_unzip(program_directory + "assets/data/worlds/" + world, savedir);
	printf(program_directory + "assets/data/worlds/" + world)
	ini_open(savedir + "metadata.ini");
	var name = ini_read_string("World", "Name", "Unnamed World");
	var bgName = ini_read_string("World", "Background", "");
	var backgroundScale = ini_read_real("World", "backgroundScale", 0.5);
	ini_close();
	var background = sprite_add(savedir + bgName, 1, true, false, 0, 0);
	if (background == -1) {
		background = bg_forest;
	}
	
	array_push(worlds, new WorldMenu(name, world, savedir, background, backgroundScale));
	world = file_find_next();
}

if (array_length(worlds) == 0) {
	show_message("No worlds were found!");
	room_goto(room_intromenu);
	return;
}

for (var i = 0; i < array_length(worlds); i++) {
	var worldsavedir = (temp_directory + md5_string_utf8(worlds[i].fname) + "/");
	printf("worldsavedir: {:1}", worldsavedir);
	var level = file_find_first(worldsavedir + "*.upl", fa_archive);
	while (level != "") {
		var savedir = (worldsavedir + md5_string_utf8(level) + "/");
		var zippy = zip_unzip(worldsavedir + level, savedir);
	
		ini_open(savedir + "metadata.ini");
		var name = ini_read_string("Level", "Name", "Unnamed Level");
		ini_close();
		
		var fileid = file_text_open_read(savedir + "leveldata");
		var data = file_text_read_string(fileid);
		file_text_close(fileid);
		
		array_push(worlds[i].levelFileLocs, worldsavedir + level);
		array_push(worlds[i].levelNames, name);
		array_push(worlds[i].data, data);
		
		level = file_find_next();
	}
	if (array_length(worlds[i].levelNames) == 0) {
		printf(">>WARNING!! loading world with no levels");
	}
}

dosomething = function(){};