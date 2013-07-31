#include <stdio.h>
#include <allegro5/allegro.h>
#include <iostream>

#include "entities/bullet.h"
#include "core/bulletmanager.h"

using namespace std;

int main( int argc, char **argv )
{
	ALLEGRO_DISPLAY *display = NULL;

	// INIT allegro
	if( !al_init() )
	{
		cerr << "Failed ot initialize allegro!" << endl;
		return -1;
	}
	
	// INIT display
	display = al_create_display(1024, 768);
	if( !display )
	{
		cerr << "Failed to create display!" << endl;
		return -1;
	}

	// Force display background to black
	al_clear_to_color(al_map_rgb(0,0,0));

	// Update the display
	al_flip_display();

	// main loop
	while( true )
	{
		// start program here
	}

	// cleanly exit
	al_destroy_display( display );
	return 0;
}
