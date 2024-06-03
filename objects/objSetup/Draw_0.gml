/// @description blackout
draw_set_color(c_white);

for( var count = 0; count < objPlayer.bellCount; count++ )
{
	draw_sprite_ext(sprFollower, 1, 64, 736 - (count * 64), 1, 1, 0, c_white, 0.75 );
}

if( global.blackout )
{
	blackoutAlpha = min( 1, blackoutAlpha + (1/45) );
}
else
{
	blackoutAlpha = max( 0, blackoutAlpha - (1/45) );
}
draw_sprite_ext(sprBlackout, 0, 0, 0, 1, 1, 0, c_white, blackoutAlpha);