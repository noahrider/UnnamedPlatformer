function collision_object(obj, prec, notme) {
	return collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj, prec, notme);
}