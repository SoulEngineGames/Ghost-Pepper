/// @description Game Logic
if( !instance_exists(objCardSelect) && !instance_exists(objGameOver) && !global.win && !global.lose )
{
	var beingPushed = false;
	var closestPepper = instance_nearest( x, y, objDetectable );
	
	if( distance_to_point(closestPepper.x, closestPepper.y) < objPlayer.pushRange && global.pushing )
	{
		beingPushed = true;
	}
	
	if( beingPushed )
	{
		direction = 180 + point_direction(x,y, closestPepper.x, closestPepper.y);
		spd = 5;
			
		xSpd = lengthdir_x(spd, direction);
		ySpd = lengthdir_y(spd, direction);

		if( !place_meeting(x + xSpd, y, objTable) && !place_meeting(x + xSpd, y, objWall) )
		{
			x += xSpd;
		}
		else
		{
			while( !place_meeting(x + sign(xSpd), y, objTable) && !place_meeting(x + sign(xSpd), y, objWall) )
			{
				x += sign(xSpd);
			}
		}

		if( !place_meeting(x, y + ySpd, objTable) && !place_meeting(x, y + ySpd, objWall) )
		{
			y += ySpd;
		}
		else
		{
			while( !place_meeting(x, y+ sign(ySpd), objTable) && !place_meeting(x, y+ sign(ySpd), objWall) )
			{
				y += sign(ySpd);
			}
		}
	}
	else if( followInstance = noone )
	{
		var changeDir = targetDir - direction;
		if( !(abs( changeDir ) < 0.5) )
		{
			if( abs( changeDir) > 180 )
			{
				direction += (-1*sign(changeDir) * (360 - abs(changeDir)))/ 20;
			}
			else
			{
				direction += (changeDir)/ 20;
			}
		}
	}
	else
	{
		direction = point_direction(x,y, followInstance.x, followInstance.y );
		spd = min( 6, spd + 0.2 );
	
		xSpd = lengthdir_x(spd, direction);
		ySpd = lengthdir_y(spd, direction);

		if( !place_meeting(x + xSpd, y, objTable) )
		{
			x += xSpd;
		}
		else
		{
			while( !place_meeting(x + sign(xSpd), y, objTable) )
			{
				x += sign(xSpd);
			}
		}

		if( !place_meeting(x, y + ySpd, objTable) )
		{
			y += ySpd;
		}
		else
		{
			while( !place_meeting(x, y+ sign(ySpd), objTable) )
			{
				y += sign(ySpd);
			}
		}
	}

	//Lose
	if( place_meeting(x,y,objDetectable) )
	{
		if( objPlayer.bellCount )
		{
			objPlayer.bellCount--;
			instance_create_layer(x,y,"Cards", objPoof);
			instance_destroy();
		}
		else
		{
			global.lose = true;
		}
	}
}
