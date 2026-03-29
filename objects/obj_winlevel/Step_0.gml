if (fadeout) {
	image_alpha += fspeed;
	if (image_alpha >= 1.2) {
		image_alpha = 1;
		fadeout = false;
		fadein = true;
		ResetLevel();
	}
}
if (fadein) {
	image_alpha -= fspeed;
	if (image_alpha <= -0.1) {
		fadein = false;
		instance_destroy();
	}
}