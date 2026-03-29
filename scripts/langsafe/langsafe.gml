function ls_get_font(fontid) {
	return ds_map_find_value(global.fontmap, fontid);
}

function ls_set_font(fontid) {
	var _font = ls_get_font(fontid);
	if (_font == -1) {
		return;
	}
	draw_set_font(_font);
}