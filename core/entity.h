#pragma once
#ifndef ENTITY_H
#define ENTITY_H

#include <allegro5/allegro_image.h>

// Container
namespace Entities
{
	class Entity
	{
		private:
			// every entity will have an x and y position
			int xpos, ypos

			// every entity will have a sprite
			ALLEGRO_BITMAP *sprite

		public:
			// Default constructor
			Entity( *sprite);

			Entity( int xpos, int ypos, ALLEGRO_BITMAP *sprite );
			/**
			 * Returs the x position of the entity
			 *
			 * @return int containing the current value
			 **/
			int getxpos() const;

			/**
			 * Returs the y position of the entity
			 *
			 * @return int containing the current value
			 **/
			int getypos() const;

			/**
			 * Changes the entity's x position to the supplied int
			 *
			 * @param int the new x position for the entity
			 **/
			int setxpos( int xpos);

			/**
			 * Changes the entity's y position to the supplied int
			 *
			 * @param int the new y position for the entity
			 **/
			int setypos( int ypos);

			/**
			 * Removes this entity from the field of play and cleans up any
			 * used resources
			 **/
			void destroy()

	}
}
