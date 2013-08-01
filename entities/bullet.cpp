#include "../entities/bullet.h"

namespace Entities
{
	Bullet()
	{
		xpos = -100;
		ypos = -100;

		*sprite = void;
		spriteWidth = -1
		spriteHeight = -1

		//Used for quick collision detection tests
		collisionRadius = spriteWidth / 2;

		//Used for more precise collision detetion tests
		hitBox_x1 = xpos - spriteWidth / 2;
		hitBox_x2 = xpos + spriteWidth / 2;
		hitBox_y1 = ypos - spriteHeight / 2;
		hitBox_y2 = ypos + spriteHeight / 2;
	}
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
