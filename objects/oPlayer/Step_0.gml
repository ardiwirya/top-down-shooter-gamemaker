// tombol movement
right = global.right;
left = global.left;
top = global.top;
bottom = global.bottom;
shoot = global.shoot;
changeWeapon = global.changeWeapon;
startKey = global.startKey;

//pause menu
if startKey
{
	if !instance_exists(oPauseMenu)
	{
		instance_create_depth(0, 0, 0, oPauseMenu);
	} else {
		instance_destroy(oPauseMenu);
	}
}

//pause self
if screen_pause() {exit;};


// player movement
#region
		var _horizontal = right - left;
		var _vertikal = bottom - top;
		moveDir = point_direction( 0, 0, _horizontal, _vertikal);
	
		var _spd = 0;
		var _inputLevel = point_distance( 0, 0, _horizontal, _vertikal);
		_inputLevel = clamp( _inputLevel, 0, 1 );
		_spd = moveSpd * _inputLevel;
	
		xspd = lengthdir_x( _spd, moveDir );
		yspd = lengthdir_y( _spd, moveDir );
	
	//kolisi
		if place_meeting( x + xspd, y, oWall )
		{
			xspd = 0;
		}
		if place_meeting( x, y + yspd, oWall )
		{
			yspd = 0;
		}
	
		x += xspd;
		y += yspd;
	
	
	//depth
		depth = -bbox_bottom;
	
#endregion
	

//get demaged
if get_demaged( oDemagePlayer, true )
{
	//hit screen
	instance_create_depth(0, 0, 0, oHitScreen);
	
	//screen pause
	create_screen_pause(25);
	
	//shake the screen
	screen_shake(6);
}

//sprite control
#region
	//player aiming 
		centerY = y + centerYOffset;
		aimDir = point_direction( x, centerY, mouse_x, mouse_y );
	
	//facing direction
		face = round( aimDir/90 );
		if face == 4 { face = 0; };
	
		//animate
		if xspd == 0 && yspd == 0
		{
			image_index = 0;
		}
	
	//set the player sprite
		sprite_index = sprite[face];
#endregion


//weapon swapping
#region
var _playerWeapon = global.PlayerWeapon;

//cycle through weapon
	if changeWeapon{
	
		//change the selection and wrap around
		selectedWeapon++;
		if selectedWeapon >= array_length( _playerWeapon ) { selectedWeapon = 0; };

	}
	
	//set the new weapon
		weapon = _playerWeapon[selectedWeapon];

	if (mouse_wheel_down()) {
	    // Change to next weapon and wrap around
		    selectedWeapon++;
		    if (selectedWeapon >= array_length(_playerWeapon)) { 
		        selectedWeapon = 0; 
		    }
	    // Set the new weapon
			weapon = _playerWeapon[selectedWeapon];
	}

	if (mouse_wheel_up()) {
	    // Change to previous weapon and wrap around
		    selectedWeapon--;
		    if (selectedWeapon < 0) { 
		        selectedWeapon = array_length(_playerWeapon) - 1; 
		    }
	    // Set the new weapon
			weapon = _playerWeapon[selectedWeapon];
	}

#endregion


//shott the weapon
	if shootTimer > 0 { shootTimer--; }
	if shoot && shootTimer <= 0
	{
		//reset the timer
		shootTimer = weapon.cooldown;
	
		//shooting
			//create the bullet
				var _xOffset = lengthdir_x( weapon.length + weaponOffsetDist, aimDir );
				var _yOffset = lengthdir_y( weapon.length + weaponOffsetDist, aimDir );
				
				var _spread = weapon.spread;
				var _spreadDiv = _spread / max(weapon.bulletNum - 1, 1);
				
				var _weaponTipX = x	+ _xOffset;
				var _weaponTipY = centerY + _yOffset;
				
				//create weapon flash
				create_animated_vfx(sShootFlash, _weaponTipX, _weaponTipY, depth-10, aimDir);
				
				//create number of bullet 
				for ( var i = 0; i < weapon.bulletNum; i++ ){
					
					var _bulletInst = instance_create_depth( _weaponTipX, _weaponTipY, depth-100, weapon.bulletObj );
	
					//change the bullet direction
					with( _bulletInst )
					{
						dir = other.aimDir - _spread/2 + _spreadDiv*i;
						
						//turn the bullet to the correct direction at creation if neceserry
						if dirFix == true{
							image_angle = dir;
						}
					}
				}
		}
	
//death / game over
if hp <= 0
{
	//create the game over object
	instance_create_depth(0, 0, -10000, oGameOverScreen);
	
	//boom
	create_animated_vfx(sSmallBoom, x, y, depth);
	
	//destroy ourself
	instance_destroy();
}	