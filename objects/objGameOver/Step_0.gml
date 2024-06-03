/// @description slide in

//slide in
if( abs( targetY - y ) > 0.5 )
{
	y += (targetY - y) / 20;
}
if( !peppersOut )
{
	if( keyboard_check_pressed( vk_left ) || keyboard_check_pressed( vk_right ) )
	{
		cursorPositionContinue = !cursorPositionContinue;
	}
}

if( keyboard_check_pressed( vk_space ) && !peppersOut )
{
	if( cursorPositionContinue )
	{
		//continue stuff
		if( array_length( objPlayer.peppersOwned ) != 0 )
		{
			alarm[0] = 15;
		}
		else
		{
			targetY = -1500;
			targetTY = -250;
			targetCY = 1500;
			targetEY = 1500;
			
			global.blackout = false;
		}
	}
	else
	{
		game_end();
	}
}
else if( peppersOut )
{
	if( !selected )
	{
		if( keyboard_check_pressed( vk_right ) && selectedIndex != (array_length(pepperOption) - 1) )
		{
			with( pepperOption[ selectedIndex ] )
			{
				selectStatus = false;
			}
			selectedIndex++;
			with( pepperOption[ selectedIndex ] )
			{
				selectStatus = true;
			}
		}
		else if( keyboard_check_pressed( vk_left) && selectedIndex != 0)
		{
			with( pepperOption[ selectedIndex ] )
			{
				selectStatus = false;
			}
			selectedIndex--;
			with( pepperOption[ selectedIndex ] )
			{
				selectStatus = true;
			}
		}

		//removal
		if( keyboard_check_pressed( vk_space ) )
		{
			selected = true;
			instance_destroy( objFollower );
			
			with( objPlayer )
			{	
				spd = 4;
				followerTail = 0;
				bellCount = 0;
				dashTime = 0;
				dashUsed = false;
				invTime = 0;
				invUsed = false;
				inv = false;
				cayenneCount = 0;
				shotUsed = false;
				pushRange = 0;
				pushUsed = false;
				pulseFactor = 0;
				pulsePos = true;
				peppersOwned = [];
				image_xscale = 1;
				image_yscale = 1;
				global.rayLength = 240;
				
				with( instance_create_layer(x,y,"Instances",objFollower) )
				{
					array_push( other.peppersOwned, id );
					other.followerTail = id;
				}
				var followerType = other.pepperOption[ other.selectedIndex ].type;
			
				switch( followerType )
				{
					default:
					case 0:
						//chili
						image_xscale *= 0.8;
						image_yscale *= 0.8;
						break;
					case 1:
						//bell
						bellCount++;
						break;
					case 2:
						//Habenero
						if( !dashTime )
							dashTime = 30;
						else
							dashTime += 15;
						break;
					case 3:
						//jalapeno
						spd += 1;
						break;
					case 4:
						//Carolina
						if( !invTime )
							invTime = 30;
						else
							invTime += 15;
						break;
					case 5:
						//Cayenne
						if( !cayenneCount )
						{
							cayenneCount = 4;
						}
						else
						{
							cayenneCount++;
						}
						break;
					case 6:
						//devil
						global.rayLength *= 0.85;
						break;
					case 7:
						//reaper
						if( !pushRange )
						{
							pushRange = 200;
						}
						else
						{
							pushRange += 50;
						}
				}
			
				with( followerTail )
				{
					image_index = followerType;
				}
			}
			with( objSelectablePepper )
			{
				leaving = true;
			}
			targetY = -1500;
			targetTY = -250;
			targetCY = 1500;
			targetEY = 1500;
			
			global.blackout = false;
		}
	}
}

if( y < -1490 )
{
	instance_destroy();
}