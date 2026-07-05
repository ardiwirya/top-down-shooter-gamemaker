//pause self
if screen_pause() {exit;};

//float in place
floatDir += floatSpd;
y = ystart + dsin( floatDir )*1;

//get collected by the player
if place_meeting(x, y, oPlayer)	
{
	//heal the player
	oPlayer.hp += heal;
	
	//destroy self
	instance_destroy();
}