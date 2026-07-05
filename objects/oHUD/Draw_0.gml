//get cam coordinates
var _camX = camera_get_view_x( view_camera[0] );
var _camY = camera_get_view_y( view_camera[0] );

//draw the player's hp
//var _hpString = "HP:" + string(playerHp) + "/" + string(playerMaxHp);
//draw_text( _camX, _camY, _hpString );

//central HUD coordinates
var _border = 8;
var _hudX = _camX + _border;
var _hudY = _camY + _border;

//draw the player's hp
if instance_exists(oPlayer)
{
	draw_sprite( sHealthbar, 0, _hudX, _hudY );

	for	( var i = 0; i < playerMaxHp; i++ )
	{
		//show current hp
		var _img = 1;
		if i+1 <= playerHp { _img = 2; };
	
		var _sep = 3;
		draw_sprite( sHealthbar, _img, _hudX + _sep*i, _hudY );
	}
}

//draw the enemy kill count
	var _enemyCountOffset = 24;
	var _ecHudX = _hudX;
	var _ecHudY = _hudY + _enemyCountOffset;

	//draw the background/box
	draw_sprite( sEnemyCountHud, 0, _ecHudX, _ecHudY );

	//draw the text
	draw_set_halign( fa_left );
	draw_set_valign( fa_top );
	draw_set_font(  fnt8bit );
	
		//the current enemy kill count
		draw_text( _ecHudX + 25, _ecHudY + 1, string(global.enemyKillCount) );
		
		//total enemies in level count
		draw_text( _ecHudX + 44, _ecHudY + 1, "/" + string(global.enemyRoomMax) );
				

//var _enemyCountStr = "Kill Count:" + string(global.enemyKillCount) + "/" + string(global.enemyRoomMax);
//draw_text(_camX, _camY+32, _enemyCountStr);