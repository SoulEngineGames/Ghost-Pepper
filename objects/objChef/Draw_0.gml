/// @description draw logic
if( !instance_exists(objCardSelect) )
{
var coordinate;
var index = 0;


for( var dir = direction - 40 ; dir < direction + 40; dir += 2 )
{
	var currentRay = global.rayLength;
	var xLen = lengthdir_x( currentRay, dir );
	var yLen = lengthdir_y( currentRay, dir );
	
	while( collision_line(x,y,x+xLen, y+yLen, objTable, true, true ))
	{
		currentRay--;
		xLen = lengthdir_x( currentRay, dir );
		yLen = lengthdir_y( currentRay, dir );
	}
	
	//GAME LOGIC
	#region
	var seenInstance = collision_line(x,y,x+xLen, y+yLen, objDetectable, true, true );
	if( seenInstance != noone )
	{
		followInstance = seenInstance;
	}
	#endregion
	
	coordinate[index][0] = x+xLen;
	coordinate[index][1] = y+yLen;
	
	index++;
}

draw_set_color( c_red );
draw_set_alpha( 0.5 );
for( var triangleIndex = 0; triangleIndex < index - 1; triangleIndex++ )
{
	if( global.secret )
	{
		if( triangleIndex < 14 )
		{
			draw_set_color(c_green);
		}
		else if( triangleIndex < 27 )
		{
			draw_set_color(c_white);
		}
		else
		{
			draw_set_color(c_red);
		}
	}
	draw_triangle( x, y, coordinate[triangleIndex][0], coordinate[triangleIndex][1], coordinate[triangleIndex + 1][0], coordinate[triangleIndex + 1][1], false);
}
}

var facing = 0;
if( direction > 90 && direction < 270 )
{
	facing = 1;
}
else
{
	facing = -1;
}

draw_set_color( c_white );
draw_set_alpha( 1 );
draw_sprite_ext(sprChef, chefType, x, y, facing , 1, 0, c_white, 1);