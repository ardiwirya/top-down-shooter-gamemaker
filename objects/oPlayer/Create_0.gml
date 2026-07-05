//demage setup
	get_demaged_create(20, true);


// variabel untuk movement
	moveDir = 0;
	moveSpd = 2;
	xspd = 0;
	yspd = 0;


// sprite control
	centerYOffset = -15;
	centerY = y + centerYOffset;

	weaponOffsetDist = 4;

	aimDir = 0;

	face = 3;
	sprite[0] = sPlayerRight;
	sprite[1] = sPlayerTop;
	sprite[2] = sPlayerLeft;
	sprite[3] = sPlayerBottom;

//weapon info
	shootTimer = 0; 
	
	//add weapon player to player inv
	array_push( global.PlayerWeapon, global.WeaponList.m4 );

	selectedWeapon = 0;
	weapon = global.PlayerWeapon[selectedWeapon];
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

