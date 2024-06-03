/// @description variable setup

targetX = 200;

selectedIndex = 0;
selected = false;
cardsOut = false;

cardOptions = ds_list_create();
ds_list_add( cardOptions, 0,0,0,1,1,1,2,2,2,3,3,3,4,4,5,5,6,7);
ds_list_shuffle( cardOptions );

cardTypeArray = [0,0,0];

var index = 0;

cardTypeArray[0] = cardOptions[| 0];
do
{
	index++;
	cardTypeArray[1] = cardOptions[| index];
}
until( cardTypeArray[0] != cardTypeArray[1] );
do
{
	index++;
	cardTypeArray[2] = cardOptions[| index];
}
until( cardTypeArray[0] != cardTypeArray[2] &&
	   cardTypeArray[1] != cardTypeArray[2] );

cardIdArray = [noone, noone, noone];
