/// @description game logic

//slide in
if( abs( targetX - x ) > 0.5 )
{
	x += (targetX - x) / 20;
}

if( x > 195 && alarm[0] = -1 && !instance_exists(objCard) )
{
	alarm[0] = 10;
	alarm[1] = 30;
	alarm[2] = 50;
}

if( !selected )
{
	if( keyboard_check_pressed( vk_right ) && selectedIndex != 2)
	{
		with( cardIdArray[ selectedIndex ] )
		{
			selectStatus = false;
		}
		selectedIndex++;
		with( cardIdArray[ selectedIndex ] )
		{
			selectStatus = true;
		}
	}
	else if( keyboard_check_pressed( vk_left) && selectedIndex != 0)
	{
		with( cardIdArray[ selectedIndex ] )
		{
			selectStatus = false;
		}
		selectedIndex--;
		with( cardIdArray[ selectedIndex ] )
		{
			selectStatus = true;
		}
	}

	//removal
	if( keyboard_check_pressed( vk_space ) && cardsOut )
	{
		selected = true;
		with( objPlayer )
		{	
			var followerType = other.cardTypeArray[ other.selectedIndex ];
			
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
		with( objCard )
		{
			leaving = true;
		}
		targetX = 1450;
		global.blackout = false;
	}
}
if( x > 1400 )
{
	instance_destroy();
}