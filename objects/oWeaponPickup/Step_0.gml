//pause self
if screen_pause() {exit;};

//float in place
floatDir += floatSpd;
y = ystart + dsin( floatDir )*1;


//does the player already have one of these?
	var _size = array_length(global.PlayerWeapon);
	for (var i = 0; i < _size; i++ )
	{
		//check if weapon is already in player's weapon list
		if weapon == global.PlayerWeapon[i]
		{
			//destroy self
			instance_destroy();
			exit;
		}
	}

//add weapon to player's list
if place_meeting(x, y, oPlayer)
{
	
	//add the weapon
	array_push( global.PlayerWeapon, weapon );
	
	//set as the player's weapon
	oPlayer.selectedWeapon = array_length( global.PlayerWeapon ) - 1;
	
	//destroy
	instance_destroy();
	
}