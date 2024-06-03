/// @description menu select

if( keyboard_check_pressed( vk_up ) || keyboard_check_pressed( vk_down ) )
{
	cursorPositionStart = !cursorPositionStart;
}

if( keyboard_check_pressed( vk_space ) )
{
	if( cursorPositionStart )
	{
		audio_stop_all();
		room_goto_next();
	}
	else
	{
		game_end();
	}
}