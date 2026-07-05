//pause exit
if screen_pause() {exit;};

//create damage objects
if createdDamageObjects == false
{
	
	//create an object to damage enemies
	damageInst = instance_create_depth( x, y, 0, oDamageAll );
	with(damageInst)
	{
		demage = other.demage;
		mask_index = other.sprite_index;
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}
	
	//set created variable to true so we dont make a million damage objects
	createdDamageObjects = true;
	
}

//get rid of the damage objects once they're done
if floor(image_index) > 1
{
	//destroy
	if instance_exists(damageInst)
	{
		instance_destroy(damageInst);
	}
}