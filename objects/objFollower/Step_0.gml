/// @description Game Logic

image_xscale =  objPlayer.image_xscale;
image_yscale = objPlayer.image_yscale;
image_alpha = objPlayer.image_alpha;

if( !instance_exists(objCardSelect) && !instance_exists(objGameOver) && !global.win && !global.lose )
{
var maxSpd = objPlayer.spd;


var dir = point_direction(x, y, followInstance.x, followInstance.y);
var spd = clamp( ( point_distance( x, y, followInstance.x, followInstance.y ) - 32) / 16, 0, 1.75) * maxSpd;

var xDir = lengthdir_x(spd, dir);
var yDir = lengthdir_y(spd, dir);

if( (!place_meeting(x + xDir, y, objTable) || inv) && !place_meeting(x + xDir, y, objWall) )
{
	x += xDir;
}
else
{
	while( !place_meeting(x + sign(xDir), y, objWall) && !place_meeting(x + sign(xDir), y, objTable) )
	{
		x += sign(xDir);
	}
}

if( (!place_meeting(x, y + yDir, objTable) || inv) && !place_meeting(x, y + yDir, objWall) )
{
	y += yDir;
}
else
{
	while( !place_meeting(x, y+ sign(yDir), objWall) && !place_meeting(x, y+ sign(yDir), objTable) )
	{
		y += sign(yDir);
	}
}

if( !global.inv && !place_meeting( x, y, objTable ) )
{
	inv = false;
}
}