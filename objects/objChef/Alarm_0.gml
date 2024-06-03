/// @description change direction

do
{
	targetDir = irandom_range(0,360);
}
until( abs(direction - targetDir) > 60  &&  abs(direction - targetDir) < 300 );

alarm[0] = irandom_range(120,240);