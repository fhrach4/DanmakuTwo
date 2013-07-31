#pragma once
#ifndef BULLETMANAGER_H
#define BULLETMANAGER_H

#include "../entities/bullet.h"

using namespace std;

class BulletManager
{
	public:
		BulletManager();

		void update();

		void addBullet( Entities::Bullet bullet);

		void setPlayerQuadrent( int quadrent);

	private:

		Entities::Bullet quadrentOne_BulletList[];
		Entities::Bullet quadrentTwo_BulletList[];
		Entities::Bullet quadrentThree_BulletList[];
		Entities::Bullet quadrentFour_BulletList[];
		Entities::Bullet unknownQuadrent_BulletList[];

		//Add an array with pointers to the above arrays
};

#endif
