//receive demage
get_demaged( oDemageEnemy );


//death
	if hp <= 0
	{
		//add to the total amount of enemies killed
		global.enemyKillCount++;
		
		//determine if we should drop an item
		if global.enemyKillCount mod 15 == 0
		{
			instance_create_depth(x, y, depth, oHeart)
		}
		
		// Contoh pemanggilan fungsi yang dimodifikasi dengan debugging
// Boom vfx
show_debug_message("Calling create_animated_vfx with x: " + string(x) + " y: " + string(y) + " depth: " + string(depth));
create_animated_vfx(sSmallBoom, x, y, depth);

		
		//destroy self
		instance_destroy();
	}