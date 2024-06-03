/// @description Insert description here
// You can write your code in this editor


if( global.pushing )
{
	draw_set_color(c_purple);
	for( var width = 0; width < 5; width++)
	{
		draw_circle(x,y,objPlayer.pushRange + objPlayer.pulseFactor+width,true);
	}
}

draw_set_color(c_white);
draw_self();


