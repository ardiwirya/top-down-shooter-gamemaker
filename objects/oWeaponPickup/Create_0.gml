depth = -y;

//floating
floatDir = 0;
floatSpd = 6;


//set the weapon based on the image index in the room editor
if image_index == 0
{
	weapon = global.WeaponList.m4;
}
if image_index == 1
{
	weapon = global.WeaponList.sniper;
}
if image_index == 2
{
	weapon = global.WeaponList.shotgun;
}

//set the correct sprite
sprite_index = weapon.pickupSprite;
image_index = 0;


//does the player already have one of these?
	var _size = array_length(global.PlayerWeapon);
	for (var i = 0; i < _size; i++ )
	{
		//check if weapon is already in player's weapon list
		if weapon == global.PlayerWeapon[i]
		{
			//destroy self
			instance_destroy();
		}
	}