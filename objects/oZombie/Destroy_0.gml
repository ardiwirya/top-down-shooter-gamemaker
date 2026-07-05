//get rid off bullet if we haven't shoot it yet 
if instance_exists( bulletInst ) && bulletInst.state == 0
{
	bulletInst.destroy = true;
}