moveDirection = 0;
trueMoveSpeed = 2;
moveSpeed = trueMoveSpeed;
xspd = 0;
yspd = 0;

grav = 0.275;
terminalVelocity = 4;
myjspd = -6;
jspd = myjspd;
xgrav = 0;

jumpTime = 0;
jumping = false;
canJump = true;
mvtime = 0;
sliding = false;
waitTime = 0;
rightWasTrue = (false);
leftWasTrue = (false);

facings = [];
currentFacing = 0;

if (instance_exists(obj_spawnpoint)) {
	x = obj_spawnpoint.x;
	y = obj_spawnpoint.y;
} else {
	printf(">>WARNING!! no spawn point found");
}