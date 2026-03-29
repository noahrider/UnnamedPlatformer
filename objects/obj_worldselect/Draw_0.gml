draw_set_alpha(image_alpha);

world = selected;
info = worlds[world];

draw_sprite_tiled_ext(info.background, 0, -global.time, 0, info.backgroundScale, info.backgroundScale, image_blend, image_alpha);

draw_text_align(160, 20, info.name);

for (var i = 0; i < array_length(info.levelNames); i++) {
	draw_text_selected(20, 80 + (20 * i), $">> {info.levelNames[i]}", (selectedWorld == i));
}

draw_set_alpha(1);