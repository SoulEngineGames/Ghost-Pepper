/// @description kill logic

if( place_meeting( x, y, objWall) || place_meeting( x, y, objTable) )
{
	instance_destroy();
}

var chef = instance_place(x, y, objChef);

if( chef != noone )
{
	instance_create_layer(chef.x,chef.y,"Cards", objPoof);
	instance_destroy( chef );
	instance_destroy();
}