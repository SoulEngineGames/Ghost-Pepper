/// @description card 2

with( instance_create_layer( 700, -500, "Cards", objCard ) )
{
	switch( other.cardTypeArray[1] )
	{
		default:
		case 0:
			type = "chili"
			text = "Makes you smaller.";
			break;
		case 1:
			type = "bell";
			text = "Removes the first chef that finds you.";
			break;
		case 2:
			type = "habanero";
			text = "Press Z to dash (once per level).";
			break;
		case 3:
			type = "jalapeno";
			text = "Speeds you up.";
			break;
		case 4:
			type = "carolina";
			text = "Press X to walk through walls (once per level).";
			break;
		case 5:
			type = "cayenne";
			text = "Press C to attack chefs (once per level).";
			break
		case 6:
			type = "devil";
			text = "Reduce Chefs' vision";
			break;
		case 7:
			type = "Reaper";
			text = "Press V to Push chefs (once per level).";
			break;
	}
	image_index = other.cardTypeArray[1];
	targetX = 700;
	other.cardIdArray[1] = id;
}