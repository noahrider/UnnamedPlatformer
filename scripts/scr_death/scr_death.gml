function scr_death() {
	var at = obj_atlas;
	instance_create_depth(at.x, at.y, at.depth, obj_deatheffect);
}