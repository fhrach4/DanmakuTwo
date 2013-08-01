#ifndef BULLET_H
#define BULLET_H

#include <allegro5/allegro_image.h>

#include "../core/collidable_entity.h"


namespace Entities
{

	class Bullet : CollidableEntity
	{
		private:
			int xpos, ypos;

			ALLEGRO_BITMAP *sprite;
			int spriteWidth;
			int spriteHight;

		public:
			Bullet();

			Bullet( int xpos, int ypos, ALLEGRO_BITMAP *sprite );
	};

}

#endif
