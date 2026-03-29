function scr_get_object_index(objectKey) {
	switch(objectKey) {
		case 0: return noone;
		case 1: return obj_goalpost;
		case 2: return obj_spawnpoint;
		case 3: return obj_tileobject;
		case 4: return obj_sawblade;
	}
	
	return noone;
}