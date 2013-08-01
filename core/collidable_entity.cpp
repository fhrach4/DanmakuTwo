namespace Entities
{
	CollidableEntity()
	{
		// call super constructor
		Entity()

		collisionRadius = 0

		hitBox_x1 = xpos
		hitBox_x2 = xpos
		hitBox_y1 = ypos
		hitBox_y2 = ypos
	}

	CollidableEntity(int xpos, int ypos, int collide_x, int collide_y, int collisionRadius, ALLEGRO_BITMAP *sprite)
	{

		Entity(xpos, ypos, *sprite );

		this.collisionRadius = collisionRadius;
		
		hitBox_x1 = xpos -  2, collide_x / 2;
		hitBox_x2 = xpos +  2, collide_x / 2;
		hitBox_y1 = ypos -  2, collide_y / 2;
		hitBox_y2 = ypos +  2, collide_y / 2;
	}

}
