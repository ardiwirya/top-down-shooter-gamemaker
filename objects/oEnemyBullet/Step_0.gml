//pause self
if screen_pause() {exit;};


//state machine
switch( state )
{
	//wait for enemy to shoot state
	case 0:
	
	//aim for the player
	if instance_exists( oPlayer )
	{
		dir = point_direction( x, y, oPlayer.x, oPlayer.y );
	}
	
	//set depth to make myself more visible 
	depth = -y -50; 
	
	
	
	break;
	
	//shoot / travel
	case 1:
	
		//movement
		xspd = lengthdir_x( spd, dir )
		yspd = lengthdir_y( spd, dir )
		x += xspd;
		y += yspd;
		
		//update depth
		depth = -y;

		
	break;
}


//cleanup

	//out of room boundaries
	var _pad = 16;
	if bbox_right < -_pad || bbox_left > room_width + _pad || bbox_bottom < -_pad || bbox_top > room_height + _pad
	{
		destroy = true;
	}

	//player collision
	if hitConfirm == true && playerDestroy == true { destroy = true; };

	//actually destroy self
	if destroy == true 
	{
		//shoot burst
		create_animated_vfx(sShootBurst, x, y, depth-50);
		
		//destroy
		instance_destroy(); 
	};

	//wall destroy
	if place_meeting( x, y, oSolidWall ) { destroy = true; };