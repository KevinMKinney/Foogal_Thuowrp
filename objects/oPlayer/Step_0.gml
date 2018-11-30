//could turn this into script should it get laggy
if (global.delay = 0)
{
	key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
	key_up = keyboard_check(vk_up) or keyboard_check(ord("W"));
	key_down = keyboard_check(vk_down) or keyboard_check(ord("S"));

	var movex = key_right - key_left;
	var movey = key_down - key_up;

	hsp = movex * walksp;
	vsp = movey * walksp;

	//horizontal collision
	if (place_meeting(x + hsp, y, oWall))
	{
		while (!place_meeting(x + sign(hsp), y, oWall))
		{
			x = x + sign(hsp);
		}	
		hsp = 0;
	}	

	x = x + hsp;

	//vertical collision
	if (place_meeting(x, y + vsp, oWall))
	{
		while (!place_meeting(x , y + sign(vsp), oWall))
		{
			y = y + sign(vsp);
		}	
		vsp = 0;
	}	

	y = y + vsp;

	depth = -y;
	global.delay = 32;
	
	//Dr. Beat
	
}

global.delay -= 1;
