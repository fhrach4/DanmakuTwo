#include "../entities/bullet.h"

namespace Entities
{
	Bullet( int xpos, int ypos, ALLEGRO_BITMAP *sprite )
	{
		this.xpos = xpos;
		this.ypos = ypos;
		this.*sprite = *sprite;
	}

	void update()
	{
		//TODO wirte update logic
	}

	bool hasHit( Entity e )
	{
		//TODO write collision detection
		return false;
	}
	
}
