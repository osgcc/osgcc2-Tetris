module video;

import derelict.sdl.sdl;
import derelict.sdl.image;
import derelict.sdl.ttf;
import std.stdio;
import std.string;


class Video{

int SCREEN_WIDTH 	 = 800;
int SCREEN_HEIGHT 	 = 600;
int SCREEN_BPP 	 = 32;
int FRAMES_PER_SECOND = 30;

SDL_Surface *screen;

this(){
	DerelictSDL.load();
	DerelictSDLImage.load();
	DerelictSDLttf.load();
	
}

public SDL_Surface *loadImage(char* fileName){
	//The image that's loaded
	SDL_Surface* loadedImage = null;
	//The image that's optimized
	SDL_Surface* optimizedImage = null;
	
	//load's image
	loadedImage = IMG_Load(fileName);

	//optimizes the image
	optimizedImage = SDL_DisplayFormat(loadedImage);
	SDL_FreeSurface(loadedImage);
	
	//return the optimized image
	return optimizedImage;

} 
public void applySurface(int x, int y, SDL_Surface* source){
	SDL_Rect offset;

	offset.x = x;
	offset.y = y;

	SDL_BlitSurface( source, null, screen, &offset);

}

public void applySurface(int x, int y, SDL_Surface* source, SDL_Surface* destination){
	SDL_Rect offset;
	
	offset.x = x;
	offset.y = y;
	
	SDL_BlitSurface(source, null, destination, &offset);
}

public void init(){SDL_Init(SDL_INIT_EVERYTHING);}

public void init(char* caption){
	
	//init sdl and setup the screen
	SDL_Init(SDL_INIT_EVERYTHING);
	screen = SDL_SetVideoMode(SCREEN_WIDTH, SCREEN_HEIGHT, SCREEN_BPP, SDL_SWSURFACE);

	SDL_WM_SetCaption(caption, null);
}

public void flipScreen(){
	SDL_Flip(screen);
}

public void cleanUp(){
	writefln("in cleanup");
	DerelictSDL.unload();
	DerelictSDLImage.unload();
	DerelictSDLttf.unload();
	writefln("above free surface");
	SDL_FreeSurface(screen);
	SDL_Quit();
}

public void toggleFullScreen(){
	SDL_WM_ToggleFullScreen(screen);
}

public SDL_Surface *getScreen(){
	return screen;
}

public void endScreen(){
	writefln("in endScreen");
	SDL_Surface *image = loadImage("graphics/endScreen.png");
	writefln("below sdl surface");
	for(int i = 0; i < 1000; i++){
		applySurface(0,0,image);
		flipScreen();
	}
	cleanUp();
}

}