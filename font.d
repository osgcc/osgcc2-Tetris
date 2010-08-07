module font;

import std.stdio;
import std.string;
import derelict.sdl.sdl;
import derelict.sdl.ttf;
import derelict.sdl.image;
import video;

class Font{
TTF_Font *font;
SDL_Color textColor;
SDL_Surface *message;
Video graphics;
int x, y;

this(char* filename, Video grph){
	DerelictSDLImage.load();
	DerelictSDL.load();
	DerelictSDLttf.load();
	TTF_Init();
	graphics = grph;

	SDL_Init(SDL_INIT_EVERYTHING);
	textColor.r = 192;
	textColor.g = 192;
	textColor.b = 192;
	font = TTF_OpenFont("font.ttf", 24);
	if(font == null){writefln("font is null");}
	message = null;
}

public void displayMessage(int quadrant, char *theMsg){
	message = TTF_RenderText_Solid(font, theMsg, textColor);
	//if(message == null){writefln("message is null");}
	
	if(quadrant == 1){
	x = 575;
	y = 25;
	}else if(quadrant == 2){
	x = 25;
	y = 25;
	}else if(quadrant == 3){
	x = 25;
	y = 470;
	}else if(quadrant == 4){
	x = 575;
	y = 470;
	}else{
	x = 575;
	y = 20;
	}
	//writefln("inside display Message");
	graphics.applySurface(x,y,message);
	
}
	
	public void cleanUp(){
	TTF_CloseFont(font);
	TTF_Quit();
	}


}