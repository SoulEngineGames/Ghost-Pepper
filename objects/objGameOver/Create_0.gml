/// @description variable setup

targetY = 0;
titleX = 227;
titleY = -231;
targetTY = 64;
contX = 227;
contY = 800;
targetCY = 640;
exitX = 864
exitY = 800;
targetEY = 640;
cursorPositionContinue = true;
increment = 945;
pepperOption = [];
peppersOut = false;
selectedIndex = 0;
selected = false;

if( array_length( objPlayer.peppersOwned ) != 0 )
{
	increment = 945 / array_length( objPlayer.peppersOwned );
}
offset = 0;