var timescale = (global.timescale);

if (global.action > 0) return;

var _right = keyboard_check(vk_right);
var _left = keyboard_check(vk_left);
var _jump = keyboard_check_pressed(vk_space);
var _run = keyboard_check(vk_shift);
var subPixel;

var multiplier = 2.5;



moveDirection = (_right - _left);
facings[currentFacing++] = moveDirection;

xspd = (moveDirection * moveSpeed);
jspd = (myjspd * (moveSpeed > trueMoveSpeed ? 1.25 : 1));
//if (!_jump && (yspd < 0 && yspd > myjspd - 0.01)) {
	//yspd = 0;
	//jspd = 0;
//}

if (sliding && (_right || _left)) {
	waitTime++;
	if (waitTime == 1) {
		rightWasTrue = (_right);
		leftWasTrue = (_left);
	}
	_right = false;
	_left = false;
	if (waitTime > seconds(2)) {
		waitTime = 0;
		if (rightWasTrue) _right = true;
		if (leftWasTrue) _left = true;
	}
}

xspd += xgrav * timescale;
lastx = x;
lasty = y;
subPixel = (0.5);
if (place_meeting(x + xspd, y, obj_simplesolid)) {
	var _pxCheck = (subPixel * sign(xspd));
	while (!place_meeting(x + _pxCheck, y, obj_simplesolid)) {
		x += _pxCheck;
	}
	xspd = 0;
	xgrav = 0;
	//reset if you bonk'd
	if (!sliding) { //but only do it if you aren't sliding
		moveSpeed = trueMoveSpeed;
	}
}

x += xspd * timescale;

xgrav -= (0.25 * sign(xgrav));
if (xgrav == 0) {
	
}

//check if we can slide
var edgex;
if (moveDirection == 1) { //right
	edgex = ((x - sprite_get_xoffset(sprite_index)) + sprite_width);
} else if (moveDirection == -1) { //left
	edgex = (x - sprite_get_xoffset(sprite_index));
} else {
	edgex = x;
}
if (!place_meeting(x, y + yspd, obj_simplesolid) && place_meeting((edgex + sign(moveDirection)) + moveDirection, y, obj_simplesolid)) {
	sliding = true;
} else {
	sliding = false;
}

yspd += grav * timescale;
if (yspd > terminalVelocity) yspd = terminalVelocity;
	

//do the fuckin jump
var _checkInAir = (place_meeting(x, max(y, y + yspd), obj_simplesolid));
if (_jump && (_checkInAir || sliding)) {
	yspd = jspd;
	jumping = true;
	
	if (sliding) {
		//printf("facings ({:1}): {:2}", -4, facings[currentFacing - 4]);
		var _dir = -(facings[currentFacing - 4]);
		xgrav = (8 * _dir);
		if (place_meeting(x, y + yspd, obj_simplesolid)) {
			xgrav = 0;
		}
		jumpTime = 0;
		//jumping = false;
	}
}
if (jumping) {
	jumpTime++;
	if (jumpTime >= 24 && !sliding) {
		jumpTime = 0;
		canJump = false;
		jumping = false;
	}
}

subPixel = (0.5);
if (place_meeting(x, y + yspd, obj_simplesolid)) {
	var _pxCheck = (subPixel * sign(yspd));
	while (!place_meeting(x, y + _pxCheck, obj_simplesolid)) {
		y += _pxCheck;
	}
	yspd = 0;
	keyboard_clear(vk_space);
	jumpTime = 0;
	canJump = true;
	alarm[2] = 5;
}

y += yspd;

if (sliding) {
	//TODO: if the player holds the opposite facing key, start a timer then move them away from that
}


if (lastx != x) {
	var maxtime;
	if (_run) {
		mvtime++;
		maxtime = (fps_ideal * 2);
		mvtime = clamp(mvtime, 0, maxtime);
		if (mvtime == 30) mvtime = 0;
		moveSpeed = lerp(moveSpeed, trueMoveSpeed * multiplier, mvtime / maxtime);
		//moveSpeed = clamp(moveSpeed, trueMoveSpeed, trueMoveSpeed * multiplier);
	} else {
		mvtime++;
		maxtime = (fps_ideal);
		mvtime = clamp(mvtime, 0, fps_ideal);
		if (mvtime == 30) mvtime = 0;
		moveSpeed = lerp(moveSpeed, trueMoveSpeed, mvtime / maxtime);
		moveSpeed = clamp(moveSpeed, trueMoveSpeed, trueMoveSpeed * multiplier);
	}
}