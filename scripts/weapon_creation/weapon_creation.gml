//constructor template for weapon
function create_weapon( _sprite = sGun, _weaponLength = 0, _bulletObj = oBullet, _cooldown = 1, _bulletNum = 1, _spread = 0, _pickupSprite = sGunPickup ) constructor
{
	sprite = _sprite;
	length = _weaponLength;
	bulletObj = _bulletObj;
	cooldown = _cooldown;
	bulletNum = _bulletNum;
	spread = _spread;
	pickupSprite = _pickupSprite;
	
}



//the player weapon inventory
global.PlayerWeapon = array_create(0);


//the weapon
global.WeaponList = {
	
	m4 : new create_weapon( 
		sGun, 
		sprite_get_bbox_right( sGun ) - sprite_get_xoffset( sGun ),
		oBullet,
		9,
		1,
		0,
		sGunPickup
		),
		
	sniper : new create_weapon(
		sSniper,
		sprite_get_bbox_right( sSniper ) - sprite_get_xoffset( sSniper ),
		oSniperBullet,
		55,
		1,
		0,
		sSniperPickup
		),
		
	shotgun : new create_weapon(
		sShotgun,
		sprite_get_bbox_right( sShotgun ) - sprite_get_xoffset( sShotgun ),
		oShotgunBullet,
		16,
		7,
		80,
		sShotgunPickup
		),

}










