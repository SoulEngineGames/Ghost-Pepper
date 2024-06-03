/// @description Variable setup

//Randomization
randomize();
global.win = false;
global.blackout = false;
blackoutAlpha = 0;
global.rayLength = 240;
global.inv = false;
global.pushing = false;
global.lose = false;
global.secret = false;
//MUSIC
audio_play_sound(sndIntro, 1, false);

//initial room gen

with( instance_create_layer( 0,0,"Instances",objTheSpag) )
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

with( instance_create_layer( 0,0,"Instances",objPlayer) )
{
	do
	{
		x = irandom_range(36, 1364);
		y = irandom_range(36, 764);
	}until( distance_to_point(objTheSpag.x, objTheSpag.y) > 850 );
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

var limitTables  = irandom_range( 12, 20 );
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

show_debug_message( "done with room gen" );