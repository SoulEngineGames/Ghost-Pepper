/// @description slide

if( abs( targetX - x ) > 0.5 )
{
	x += (targetX - x) / 20;
}
if( abs( targetY - y ) > 0.5 )
{
	y += (targetY - y) / 20;
}


if( leaving )
{
	if( selectStatus )
	{
		targetY = -100;
	}
	else
	{
		targetY = 900;
	}
	
	if( abs( y - targetY) < 0.5 )
	{
		instance_destroy();
	}
}
else if( selectStatus )
{
	targetY = 440;
}
else
{
	targetY = 500;
}