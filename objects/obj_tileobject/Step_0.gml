event_inherited();

if (sprite_index == -1 || sprite_index == spr_default) {
	if (tileID == 1) sprite_index = spr_tile_grass;
	if (tileID == 2) sprite_index = spr_tile_dirt;
}

if (sprite_index == spr_tile_grass) tileID = 1;
if (sprite_index == spr_tile_dirt) tileID = 2;