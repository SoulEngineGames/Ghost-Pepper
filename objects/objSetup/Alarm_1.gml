/// @description room gen

//ROOM GEN
	
//clear room
instance_destroy(objTable);
instance_destroy(objChef);
	
//place pasta
with( objTheSpag )
{
	switch( irandom_range(0,3) )
	{
		case 0:
			x = irandom_range( 36, 1364 );
			y = irandom_range( 36, 136 );
			break;
		case 1:
			x = irandom_range( 1264, 1364 );
			y = irandom_range( 36, 764 );
			break;
		case 2:
			x = irandom_range( 36, 1364 );
			y = irandom_range( 664, 764 );
			break;
		case 3:
			x = irandom_range( 36, 136 );
			y = irandom_range( 36, 764 );
			break;
		default:
			x = irandom_range( 36, 1364 );
			y = irandom_range( 36, 136 );
			break;
	}
}
with( objPlayer )
{
	do
	{
		x = irandom_range(36, 1364);
		y = irandom_range(36, 764);
	}until( distance_to_point(objTheSpag.x, objTheSpag.y) > 850 );
}
with( objFollower )
{
	x = objPlayer.x;
	y = objPlayer.y;
}
	
var limitChef  = irandom_range( 5, 7 );
for( var chefCount = 0; chefCount < limitChef; chefCount++ )
{
	with( instance_create_layer( 0, 0, "Instances", objChef) )
	{	var index = 0;
		do
		{
			x = irandom_range(40, 1360);
			y = irandom_range(40, 760);
			index++;
		}
		until( (distance_to_object(objPlayer) > 260 &&
				distance_to_object(objTheSpag) > 260 &&
				distance_to_object(objChef) > 100)
				|| index > 200);
		if( index > 200 )
		{
			instance_destroy();
		}
	}
}
	
var limitTables  = irandom_range( 16, 20 );
for( var tableCount = 0; tableCount < limitTables; tableCount++ )
{
	var tableType = noone;
	switch( irandom_range(0,5) )
	{
		case 0:
			tableType = objTable1;
			break;
		case 1:
			tableType = objTable2;
			break;
		case 2:
			tableType = objTable3;
			break;
		case 3:
			tableType = objTable4;
			break;
		case 4:
			tableType = objTable5;
			break;
		case 5:
			tableType = objTable6;
			break;
		default:
			tableType = objTable1;
			break;
	}
	
	with( instance_create_layer( 0, 0, "Instances", tableType) )
	{	var index = 0;
		do
		{
			x = irandom_range(40, 1360);
			y = irandom_range(40, 760);
			index++;
		}
		until( (distance_to_object(objPlayer) > 100 &&
				distance_to_object(objTheSpag) > 100 &&
				!place_meeting(x,y,objTable) &&
				!place_meeting(x,y,objChef) )
				|| index > 200);
		if( index > 200 )
		{
			instance_destroy();
		}
	}
}
	
instance_create_layer(0,-1400,"UI",objGameOver);
	
global.lose = false;