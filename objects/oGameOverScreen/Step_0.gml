//get the shoot key input
shoot = global.shoot;

//fade in
alpha += alphaSpd;
alpha = clamp( alpha, 0, 1 );

//restart
if shoot && alpha >= 1
{
	room_restart();
}