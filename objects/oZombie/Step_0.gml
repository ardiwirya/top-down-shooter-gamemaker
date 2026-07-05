//pause self
if screen_pause() {exit;};

//code commands
var _wallCollisions = true;
var _getDamage = true;

//state machine
switch( state )
{
	//spawn in from mausoleum
	case -1:
	
	//fade in
	if image_alpha < 1
	{
		//don't walk while fading in
		spd = 0;
		image_alpha += fadeSpd;
	}
	
	//walk out
	_wallCollisions = false;
	_getDamage = false;
	if image_alpha >= 1
	{
		//set the right speed and direction
		spd = emergeSpd;
		dir = 270;
	}
	
	//switch to the chasing state after out of spawner wall
	if !place_meeting( x, y, oWall )
	{
		state = 0;
	}
	
	break;
	
	//chase state
	case 0:
	#region
	
		//get the player direction
		if instance_exists( oPlayer )
		{
			dir = point_direction( x, y, oPlayer.x, oPlayer.y );	
		}
		
		//set the correct spd
		spd = chaseSpd;
		
		
		//transition to shooting state
		var _camLeft = camera_get_view_x( view_camera[0] );
		var _camRight = _camLeft + camera_get_view_width( view_camera[0] );
		var _camTop = camera_get_view_y( view_camera[0] );
		var _camBottom = _camTop + camera_get_view_height( view_camera[0] );
		
		//only add to timer if onscreen
		if bbox_right > _camLeft && bbox_left < _camRight && bbox_bottom > _camTop && bbox_top < _camBottom	
		{
			shootTimer++;
		}
		
		if shootTimer > cooldownTime
		{
			//go to the shoot state
			state = 1;
			
			//reset timer so the shooting state can use it too
			shootTimer = 0;
		}
	#endregion
	break;
	
	//pause and shoot state
	case 1:
	#region
		
		//get the player direction
		if instance_exists( oPlayer )
		{
			dir = point_direction( x, y, oPlayer.x, oPlayer.y );	
		}
		
		//set the corret speed
		spd = 0;
		
		//stop animating / manually set the image index
		image_index = 0;
		
		//shoot a bullet
		shootTimer++;
		
			//create the bullet
			if shootTimer == 1
			{
				bulletInst = instance_create_depth( x + bulletXoff*face, y + bulletYoff, depth, oEnemyBullet );
			}
			
			//keep the bullet in the zombie's hands
			if shootTimer <= windupTime && instance_exists( bulletInst )
			{
				bulletInst.x = x + bulletXoff*face;
				bulletInst.y = y + bulletYoff;

			}
			
			//shoot the bullet after the windup time is over
			if shootTimer == windupTime && instance_exists( bulletInst )
			{
				//set the bullet state to the movement state
				bulletInst.state = 1;
			}
			
			//recover and return to chasing the player
			if shootTimer > windupTime + recoverTime
			{
			
				//go back to chasing the player
				state = 0;
				
				//reset the timer so we can use it again
				shootTimer = 0;
			
			}
	
	#endregion
	break;
	
	
}

//chase the player
	//getting the speeds
		xspd = lengthdir_x( spd, dir );
		yspd = lengthdir_y( spd, dir );
	
	//get the corret face
	if dir >  90 && dir < 270
	{
		face = -1;
	} else {
		face = 1;
	}
	
	
	//collision
		//wall collisions
			if _wallCollisions == true
			{
				if place_meeting( x + xspd, y, oWall ) { xspd = 0; }
				if place_meeting( x, y + yspd, oWall ) { yspd = 0; }
			}
		//enemy collisions
			if place_meeting( x + xspd, y, oEnemyParent ) { xspd = 0; }
			if place_meeting( x, y + yspd, oEnemyParent ) { yspd = 0; }
	
	
	//moving
		x += xspd;
		y += yspd;
		
	//set the dept
		depth = -y;


// Inherit the parent event
if _getDamage == true
{
	//getting dmg and dying
	event_inherited();
}