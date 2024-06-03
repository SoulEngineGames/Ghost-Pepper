/// @description sprites


draw_set_color(c_white);
draw_self()

var cursorX = 0;
if( cursorPositionContinue )
	cursorX = contX - 64;
else
	cursorX = exitX - 64;

draw_sprite(sprCursor,0,cursorX,contY);
draw_sprite(sprExit,!cursorPositionContinue,exitX,exitY);
draw_sprite(sprContinue,cursorPositionContinue,contX,contY);
draw_sprite(sprGameOverTitle,0,titleX,titleY);

if( abs( targetTY - titleY ) > 0.5 )
{
	titleY += (targetTY - titleY) / 20;
}
if( abs( targetEY - exitY ) > 0.5 )
{
	exitY += (targetEY - exitY) / 20;
}
if( abs( targetCY - contY ) > 0.5 )
{
	contY += (targetCY - contY) / 20;
}