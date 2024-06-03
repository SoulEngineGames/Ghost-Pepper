/// @description Game Logic
if( !instance_exists(objCardSelect) && !instance_exists(objGameOver) && !global.win && !global.lose )
{
//Movement and Collisions
#region
var xDir = keyboard_check(vk_right) - keyboard_check(vk_left);
var yDir = keyboard_check(vk_down) - keyboard_check(vk_up);

xDir *= spd;
yDir *= spd;

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
#endregion

//Powers
#region
if( keyboard_check_pressed( ord("Z") ) && dashTime && !dashUsed )
{
	dashUsed = true;	
	spd *= 3;
	alarm[0] = dashTime;
}
if( keyboard_check_pressed( ord("X") ) && invTime && !invUsed )
{
	invUsed = true;
	global.inv = true;
	inv = true;
	objFollower.inv = true;
	image_alpha = 0.8;
	alarm[1] = invTime;
}
if( keyboard_check_pressed( ord("C") ) && !shotUsed && cayenneCount )
{
	shotUsed = true;
	for( var shotCount = 0; shotCount < cayenneCount; shotCount++ )
	{
		with( instance_create_layer( x,y,"Instances", objItaly ) )
		{
			direction = (360/other.cayenneCount) * shotCount;
			speed = 10
		}
	}
}
if( keyboard_check_pressed( ord("V") ) && !pushUsed && pushRange )
{
	global.pushing = true;
	pushUsed = true; 
	alarm[2] = 45;
}

if( !global.inv && !place_meeting( x, y, objTable ) )
{
	inv = false;
}
#endregion

//Win
#region
if( place_meeting(x,y,objTheSpag) )
{
	//Reset once per levels
	
	dashUsed = false;
	invUsed = false;
	shotUsed = false;
	pushUsed = false;
	with( instance_create_layer(x,y,"Instances",objFollower) )
	{
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
		
		if( other.followerTail != 0 )
		{
			followInstance = other.followerTail;
		}
		
		array_push( other.peppersOwned, id );
		other.followerTail = id;
	}
	global.win = true;
}
#endregion

}