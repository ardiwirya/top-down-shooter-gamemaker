//draw the weapon behind the player
	if aimDir >= 0 && aimDir < 140
	{
		draw_my_weapon()
	}	


// draw the player
	draw_self();

//draw the weapon
	if aimDir >= 140 && aimDir < 360
	{
		draw_my_weapon();
	}
	
//draw hp as number
//draw_text( x, y, string(hp) );