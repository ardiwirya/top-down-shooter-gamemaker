//drawing the player weapon
function draw_my_weapon()
{
	//draw the weapon
	//get the weapon off the player body
	var _xOfsett = lengthdir_x( weaponOffsetDist, aimDir );
	var _yOfsett = lengthdir_y( weaponOffsetDist, aimDir );

	//flipp the weapon upright
	var _weaponYscale = 1;
	if	aimDir > 90 && aimDir < 270
	{
		_weaponYscale = -1;
	}

	draw_sprite_ext( weapon.sprite, 0, x + _xOfsett, centerY + _yOfsett, 1, _weaponYscale, aimDir, c_white, image_alpha );
}


//vfx
	function screen_pause()
	{
		//pause self
		if instance_exists(oScreenPause)
		{
			image_speed = 0;
			return true;
		} else {
			image_speed = 1;
			return false;
		}
	}
	function create_screen_pause(_time = 3)
	{
		with( instance_create_depth(0, 0, 0, oScreenPauseTimed) )
		{
			timer = _time;
		}
	}
	function screen_shake(_amount = 4)
	{	
		with(oCamera)
		{
			xShakeAmount = _amount;
			yShakeAmount = _amount;
		}
	}
	function create_animated_vfx(_sprite, _x, _y, _depth, _rot = 0)
{
    // Debugging: Memastikan semua argumen memiliki nilai yang benar
    if (is_undefined(_x) || is_undefined(_y) || is_undefined(_depth)) {
        show_debug_message("Error: Salah satu argumen _x, _y, atau _depth adalah undefined");
        show_debug_message("_x: " + string(_x) + " _y: " + string(_y) + " _depth: " + string(_depth));
        return; // Keluar dari fungsi jika ada argumen yang undefined
    }

    with(instance_create_depth(_x, _y, _depth, oAnimatedVFX))
    {
        sprite_index = _sprite;
        image_angle = _rot;
    }
}


//damage calculation
	//demage create event
	function get_demaged_create( _hp = 10, _iframes = false )
	{
		maxHp = _hp;
		hp = _hp;
		
		//get the iframes
		if _iframes == true
		{
			iframeTimer = 0;
			iframeNumber = 90;
		}
		
		//create the dmg list
		if _iframes == false 
		{
			demageList = ds_list_create();
		}
	}
	
	//demage clean up event
	function get_demaged_cleanup()
	{
		//do not need if we're using iframes
		
		//delete our dmg list data structure to free memory
		ds_list_destroy(demageList);
	}
	
	//dmg step event
	function get_demaged( _demageObj, _iframes = false )
	{
		
		//special exit from iframe timer
		if _iframes == true && iframeTimer > 0
		{
			iframeTimer--; 
			
			if iframeTimer mod 5 == 0 
			{
				if image_alpha == 1
				{
					image_alpha = 0;
				} else { 
					image_alpha = 1;
				}
			}
			
			//clamp hp 
			hp = clamp( hp, 0, maxHp );
			
			//exit by returning the function as false
			return false;
		}
		
		//make sure the iframe blinking stop 
		if _iframes == true
		{
			image_alpha = 1;
		}
		
		
		//receive demage
		var _hitConfirm = false;
		if place_meeting( x, y, _demageObj )
		{
	
			//getting a list of the dmg instance
			
				//create ds list and copy instance to it
				var _instList = ds_list_create();
				instance_place_list( x, y, _demageObj, _instList, false );
				
				
				//get the size of our list
				var _listSize = ds_list_size( _instList )
		
				//loop through the list				
				for( var i = 0; i < _listSize; i++ )
				{
					//get a dmg object instance from the list
					var _inst = ds_list_find_value( _instList, i );
		
					//check if this instance is already in the demage list
					if _iframes == true || ds_list_find_index( demageList, _inst ) == -1
					{
						//add the new dmg instance to the dmg list
						if _iframes == false
						{
							ds_list_add( demageList, _inst );
						}
						
						//take dmg from specific instance
						hp -= _inst.demage;
						_hitConfirm = true;
						
						//tell the dmg instance it has impacted 
						_inst.hitConfirm = true;
						
						//create an impact visual
						if _inst.hitVFX == true
						{
						create_animated_vfx(sShootBurst, _inst.y, _inst.depth-50);
						}
					}
				}
					
				// set iframes if we're hit 
				if _iframes == true && _hitConfirm
				{
					iframeTimer = iframeNumber;
				}
				
			//free memory by destroying the ds list
			ds_list_destroy( _instList );
		}

		//clear the damage list of object that dont exist anymore or arent touching anymore
		if _iframes == false
		{
			var _demageListSize = ds_list_size( demageList );
			for( var i = 0; i < _demageListSize; i++ )
			{
				//if not touching the dmg instance anymore, remove it from the list and set the loop back 1 position
				var _inst = ds_list_find_value( demageList, i );
				if !instance_exists( _inst ) || !place_meeting( x, y, _inst )
				{
					ds_list_delete( demageList, i );
					i--;
					_demageListSize--;
				}
			}
		}
		
		//clamp hp 
		hp = clamp( hp, 0, maxHp );
		
		//return hit confirm variable value
		return _hitConfirm;
	}