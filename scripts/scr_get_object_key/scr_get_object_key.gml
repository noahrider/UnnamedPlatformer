function scr_get_object_key(objectIndex) {
	switch(objectIndex) {
		case noone: return 0;
		case obj_goalpost: return 1;
		case obj_spawnpoint: return 2;
		case obj_tileobject: return 3;
		case obj_sawblade: return 4;
	}
	
	return noone;
}