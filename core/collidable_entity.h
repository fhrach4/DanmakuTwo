#pragma once
#ifndef COLLIDABLE_ENTITY_H
#define COLLIDABLE_ENTITY_H
namespace Entities
{
	class CollidableEntity : Entity
	{
		private:
			// Hit box for precise collision detection
			virtual int hitBox_x1, hitBox_x2, hitBox_y1, hitBox_y2;

			// Radius for quick collision detection
			virtual int collisionRadius;

		public:
			CollidableEntity();

			virtual bool testCollision( CollidableEntity e);

			virtual ~CollidableEntity();
	};
}
#endif
