/// @description intro

draw_set_color(c_white);

var cursorY = 0;
if( cursorPositionStart )
	cursorY = startY;
else
	cursorY = exitY;

draw_sprite(sprCursor,0,96,cursorY);
draw_sprite(sprExit,!cursorPositionStart,exitX,exitY);
draw_sprite(sprStart,cursorPositionStart,startX,startY);
draw_sprite(sprTitle,0,titleX,titleY);

if(!reachedTitle)
{
	if( abs( targetTY - titleY ) > 0.5 )
	{
		titleY += (targetTY - titleY) / 20;
	}
	if( abs( (targetTY + 100) - startY ) > 0.5 )
	{
		startY += ((targetTY + 100) - startY) / 20;
		exitY += ((targetTY + 100) - exitY) / 20;
	}
	else
	{
		reachedTitle = true;
	}
}
else
{
	if( abs( targetTY - titleY ) > 0.5 )
	{
		titleY += (targetTY - titleY) / 20;
	}
	if( abs( targetSY - startY ) > 0.5 )
	{
		startY += (targetSY - startY) / 20;
	}
	if( abs( targetEY - exitY ) > 0.5 )
	{
		exitY += (targetEY - exitY) / 20;
	}
}