#include "entity.h"

using namespace Entities;

namespace Entities
{

	Entity( ALLEGRO_BITMAP *sprite )
	{
		xpos = -100;
		ypos = -100;
		this.sprite = sprite;
	}	

	Entity( int xpos, int ypos, ALLEGRO_BITMAP *sprite )
	{
		this.xpos = xpos;
		this.ypos = ypos;
		this.sprite = sprite;
	}

	getxpos()
	{
		return xpos;
	}

	getypos()
	{
		return ypos;
	}

	setxpos( int xpos )
	{
		this.xpos = xpos;
	}

	set ypos()
	{
		this.ypos = ypos;
	}

	destroy()
	{
		delete sprite;
		xpos = -100;
		ypos = -100;
	}

}
