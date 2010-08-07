module main;

import std.stdio;
import std.string;
import std.random;
import derelict.sdl.sdl;
import video;
import audio;
import shape;
import timer;
import font;
import std.math;

Shape currentShape, tempShape;
Video graphics;
Audio sound;
SDL_Surface* [] backgrounds;
//SDL_Surface *background;
SDL_Surface *startScreen;
Timer fps;
Font fnt;
bool newShape;
Board board;
int score, currentLevel;
bool keyPressed[512];
bool keyHit[512];
int lvlmax;
int ycounter;
Shape nextpiece;

void main(){
	
	SDL_Event event;
	graphics = new Video();
	sound = new Audio();
	fps = new Timer();
	ycounter = 0;
	currentLevel = 1;
	lvlmax = 50;

	//sound stuff
	sound.init();
	sound.loadMusic("sounds/ghosts.ogg");
	sound.lowerMusicVolume();
	sound.playMusic();
	sound.loadEffects();

	
	
	//graphics stuff
	graphics.init("VIDEO GAEM!!!!");
	
	//crazy hardcoded graphics loads.  bad!!!!
	backgrounds = new SDL_Surface* [12];	

	backgrounds[0] = graphics.loadImage("graphics/level1.png");
	backgrounds[1] = graphics.loadImage("graphics/level2.png");
	backgrounds[2] = graphics.loadImage("graphics/level3.png");
	backgrounds[3] = graphics.loadImage("graphics/level4.png");
	backgrounds[4] = graphics.loadImage("graphics/level5.png");
	backgrounds[5] = graphics.loadImage("graphics/level6.png");
	backgrounds[6] = graphics.loadImage("graphics/level7.png");
	backgrounds[7] = graphics.loadImage("graphics/level8.png");
	backgrounds[8] = graphics.loadImage("graphics/level9.png");
	backgrounds[9] = graphics.loadImage("graphics/level10.png");
	backgrounds[10] = graphics.loadImage("graphics/level11.png");
	backgrounds[11] = graphics.loadImage("graphics/level12.png");
	
	//background = graphics.loadImage("graphics/level1.png");

	startScreen = graphics.loadImage("graphics/startScreen.png");
	
	currentShape = new Shape(Shape.LSHAPE, graphics, 5);	
	nextpiece = new Shape(rand() % 6, graphics, 5);
	
	fnt = new Font("font.ttf", graphics);
	
	graphics.applySurface(0,0,backgrounds[currentLevel -1]);
	currentShape.draw();
	board = new Board(graphics);
	bool done = false;
	bool started = false;
	
	//Shape temp2 = new Shape(Shape.LINE, graphics, 1);
	
	
	Timer time = new Timer();
	time.start();

	while(!started){
	   	if(time.get_ticks() > 3000){
			started = true;	
	   	}
	   	graphics.applySurface(0,0,startScreen);
		graphics.flipScreen();
	}
	
	while(!done){
		fps.start();
		while( SDL_PollEvent(&event) ){

			if(event.type == SDL_QUIT){
				done = true;
			}else if(event.type == SDL_KEYDOWN){
				keyPressed[event.key.keysym.sym] = true;
				keyHit[event.key.keysym.sym] = true;
			}else if(event.type == SDL_KEYUP){
				keyPressed[event.key.keysym.sym] = false;
			}
			if(event.type == SDL_KEYDOWN){
				if((event.key.keysym.sym == SDLK_a) || (event.key.keysym.sym == SDLK_LEFT)){
					currentShape.updateX(-30, board);
				}else if((event.key.keysym.sym == SDLK_d) || (event.key.keysym.sym == SDLK_RIGHT)){		
					currentShape.updateX(30, board);
				}else if((event.key.keysym.sym == SDLK_w) || (event.key.keysym.sym == SDLK_UP)){
					currentShape.rotate();
					sound.playRotate();
				}else if((event.key.keysym.sym == SDLK_n) || (event.key.keysym.sym == SDLK_m)){
						
				}
			}
		}
		if(ycounter >= lvlmax) {
			currentShape.updateY(30);
			ycounter = 0;
			sound.playBoop();
		}
		ycounter++;

		if(keyPressed[SDLK_s] || keyPressed[SDLK_DOWN]){
			currentShape.updateY(30);
		}	
		updateScreen();
		graphics.flipScreen();
	
		if(fps.get_ticks() < 1000/graphics.FRAMES_PER_SECOND){
			SDL_Delay((1000/graphics.FRAMES_PER_SECOND)-fps.get_ticks());
		}
	}
	sound.playItsOver();
	graphics.cleanUp();
   }

void updateScreen() {
	int oldlines = board.getLines();
	int oldscore = score;
	score += board.clearLines(currentLevel);
	if ( score > oldscore) { sound.playLine(); }
	int newlines = board.getLines();
	if(floor(newlines / 5 ) > floor(oldlines / 5)) { 
		currentLevel++; lvlmax -= 8; if(lvlmax < 5) lvlmax = 3; ycounter = 0; 
	}
	graphics.applySurface(0,0,backgrounds[(currentLevel-1) % 12]);
	auto scoreStr = toString(score);
	auto str = toStringz("Score: " ~ scoreStr);
	fnt.displayMessage(2, str);
	auto linesStr = toString(board.getLines());
	auto str2 = toStringz("Lines: " ~ linesStr);
	fnt.displayMessage(4, str2);
	auto lvlStr = toString(currentLevel);
	auto str3 = toStringz("Level: " ~ lvlStr);
	fnt.displayMessage(3, str3);
	auto str4 = toStringz("Next: ");
	fnt.displayMessage(1, str4);
	
	nextpiece.draw(45);
	
	//if(board.getLines() % 5 == 0){currentLevel++;}
	
	int rnd = rand() % 7;
	
	if(currentShape.checkCollision(board)){
		sound.playBoom();
		board.addBlockToBoard(currentShape);
		newShape = true;
	}
	currentShape.draw();
	if(newShape) {
		newShape = false;
		currentShape = nextpiece;
		nextpiece = new Shape(rnd, graphics, 5);
		//nextpiece.x = 100;
		//nextpiece.y = 100;
	}
	board.draw();
}
