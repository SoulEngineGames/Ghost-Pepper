/// @description spawn pepper
with( instance_create_layer( 1500, 500, "Cards", objSelectablePepper ) )
{
	type = array_shift(objPlayer.peppersOwned).image_index;
	image_index = type;
	targetX = 227 + (0.5 * other.increment) + other.offset;
	if( other.offset = 0 )
	{
		selectStatus = true;
	}
	other.offset += other.increment;
	array_push( other.pepperOption, id );
}

if( array_length( objPlayer.peppersOwned ) != 0 )
{
	alarm[0] = 15;
}
else
{
	peppersOut = true;
}