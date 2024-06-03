/// @description blackout

if( global.win && !global.blackout )
{
	global.blackout = true;
	blackoutAlpha = 0;
	alarm[0] = 45;
}

if( global.lose && !global.blackout )
{
	global.blackout = true;
	blackoutAlpha = 0;
	alarm[1] = 45;
}

if( !audio_is_playing(sndIntro) && !audio_is_playing(sndGameMusic) )
{
	audio_play_sound(sndGameMusic, 1, true);
}


if( keyboard_check_pressed( ord( "I" ) ) )
{
	global.secret = true;
}