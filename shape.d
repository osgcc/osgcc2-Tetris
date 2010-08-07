module shape;

import std.stdio;
import std.string;
import std.math;
import derelict.sdl.sdl;
import derelict.sdl.image;
import video;
import audio;

class Shape{

//enum for shape types
enum{
LSHAPE	= 0,
LLSHAPE	= 1,
ZSHAPE	= 2,
LZSHAPE	= 3,
TSHAPE	= 4,
SQUARE	= 5,
LINE	= 6
}


	int x, y;
	int w, h;

Video graphics;
Audio snd;
SDL_Surface *shapeSurface;
int [][][] shapes;
	int shapei;

this(int shapeNumber, Video grph, int levelNum){
	x = 360;
	y = 0;	
	shapei = 0;
	graphics = grph;
	snd = new Audio();
	snd.init();
	snd.loadEffects();


	switch(shapeNumber){
	case LSHAPE:
	shapes =[[[1,0,0,0],
		  [1,0,0,0],
		  [1,1,0,0],	
		  [0,0,0,0]],
			
		 [[1,1,1,0],
		  [1,0,0,0],
		  [0,0,0,0],	
		  [0,0,0,0]],
			
		 [[1,1,0,0],
		  [0,1,0,0],
		  [0,1,0,0],	
		  [0,0,0,0]],
			
		 [[0,0,1,0],
		  [1,1,1,0],
		  [0,0,0,0],	
		  [0,0,0,0]]];
		w = 2;
		h = 3;
		shapeSurface = graphics.loadImage("graphics/LSHAPE.png");
		
	break;
	case LLSHAPE:
	shapes =[[[0,1,0,0],
		  [0,1,0,0],
		  [1,1,0,0],	
		  [0,0,0,0]],
			
		 [[1,0,0,0],
		  [1,1,1,0],
		  [0,0,0,0],	
		  [0,0,0,0]],
			
		 [[1,1,0,0],
		  [1,0,0,0],
		  [1,0,0,0],	
		  [0,0,0,0]],
			
		 [[1,1,1,0],
		  [0,0,1,0],
		  [0,0,0,0],	
		  [0,0,0,0]]];
		w = 2;
		h = 3;
		shapeSurface = graphics.loadImage("graphics/LLSHAPE.png");

	break;
	case ZSHAPE:
	shapes =[[[1,0,0,0],
		  [1,1,0,0],
		  [0,1,0,0],	
		  [0,0,0,0]],
			
		 [[0,1,1,0],
		  [1,1,0,0],
		  [0,0,0,0],	
		  [0,0,0,0]],
			
		 [[1,0,0,0],
		  [1,1,0,0],
		  [0,1,0,0],	
		  [0,0,0,0]],
			
		 [[0,1,1,0],
		  [1,1,0,0],
		  [0,0,0,0],	
		  [0,0,0,0]]];
		w = 2;
		h = 3;
		shapeSurface = graphics.loadImage("graphics/ZSHAPE.png");

	break;
	case LZSHAPE:
	shapes =[[[0,1,0,0],
		  [1,1,0,0],
		  [1,0,0,0],	
		  [0,0,0,0]],
			
		 [[1,1,0,0],
		  [0,1,1,0],
		  [0,0,0,0],	
		  [0,0,0,0]],
			
		 [[0,1,0,0],
		  [1,1,0,0],
		  [1,0,0,0],	
		  [0,0,0,0]],
			
		 [[1,1,0,0],
		  [0,1,1,0],
		  [0,0,0,0],	
		  [0,0,0,0]]];

		h = 3;
		w = 2;
		shapeSurface = graphics.loadImage("graphics/LZSHAPE.png");
		

	break;
	case TSHAPE:
	shapes =[[[1,1,1,0],
		  [0,1,0,0],
		  [0,0,0,0],	
		  [0,0,0,0]],
			
		 [[0,1,0,0],
		  [1,1,0,0],
		  [0,1,0,0],	
		  [0,0,0,0]],
			
		 [[0,1,0,0],
		  [1,1,1,0],
		  [0,0,0,0],	
		  [0,0,0,0]],
			
		 [[1,0,0,0],
		  [1,1,0,0],
		  [1,0,0,0],	
		  [0,0,0,0]]];
		w = 3;
		h = 2;
		shapeSurface = graphics.loadImage("graphics/TSHAPE.png");
		

	break;
	case SQUARE:
	shapes =[[[1,1,0,0],
		  [1,1,0,0],
		  [0,0,0,0],	
		  [0,0,0,0]],
			
		 [[1,1,0,0],
		  [1,1,0,0],
		  [0,0,0,0],	
	  	  [0,0,0,0]],
			
		 [[1,1,0,0],
		  [1,1,0,0],
		  [0,0,0,0],	
		  [0,0,0,0]],
			
		 [[1,1,0,0],
		  [1,1,0,0],
		  [0,0,0,0],	
		  [0,0,0,0]]];
		w = 2;
		h = 2;
		shapeSurface = graphics.loadImage("graphics/SQUARE.png");
		

	break;
	case LINE:
	shapes =[[[1,0,0,0],
		  [1,0,0,0],
		  [1,0,0,0],	
		  [1,0,0,0]],
			
		 [[1,1,1,1],
		  [0,0,0,0],
		  [0,0,0,0],	
		  [0,0,0,0]],
			
		 [[1,0,0,0],
		  [1,0,0,0],
		  [1,0,0,0],	
		  [1,0,0,0]],
			
		 [[1,1,1,1],
		  [0,0,0,0],
		  [0,0,0,0],	
		  [0,0,0,0]]];
		w = 1;
		h = 4;
		shapeSurface = graphics.loadImage("graphics/LINE.png"); //change back ***
		

	break;

	default:
		writefln("in the default case");
	break;

	}

}
	
	/*public bool move(Board theBoard){

		bool collide = false;

		if(y + (h*30) >= 600) { collide = true; }	
[[[1,0,0,0],
			[1,0,0,0],
			[1,0,0,0],
			[1,0,0,0]]];
		return collide;

	
	}*/
	
	public void draw(){
		for(int i = 0; i < 4; i++){
			for(int j = 0; j < 4; j++) {
				if(shapes[shapei][i][j] == 1) {
					graphics.applySurface(x+(j*30), y+(i*30) , shapeSurface);
				}
			}
		}
	}
	
	public void draw(int shapeNum){
		for(int i = 0; i < 4; i++){
			for(int j = 0; j < 4; j++) {
				if(shapes[0][i][j] == 1) {
					graphics.applySurface(655+(j*30), 25+(i*30) , shapeSurface);
				}
			}
		}
	
	}

	public void rotate() {

		
		int tempx = x / 30;
		tempx = tempx - 8;
		if((tempx + h) > 10) { return; }

		shapei += 1;

		if(shapei > 3) { shapei = 0; }

		int tmp = w;
		w = h;
		h = tmp;

		return;
	}
	
	
	public bool checkCollision(Board theBoard){

		int tempx = 0, tempy = 0;
		tempx = x / 30;
		tempx = tempx - 8;
		tempy = y /30;

		for(int i = 0; i < 4; i++) {
			for(int j = 0; j < 4; j++) {
				printf("tempx = %d, tempy = %d, i = %d, j = %d\n", tempx, tempy, i, j);
				if((y + (h*30)) >= 600 ) {
					if(y <= 0) {
						printf("omgwtfFAAAAILBOAT");
						graphics.cleanUp();
					}
					return true;
				}
				if((shapes[shapei][i][j] == 1) && (theBoard.theBoard[tempy + i + 1][tempx + j] == 1)) {
					if(y <= 0) {
						printf("omgwtfFAAAAILBOAT");
						snd.stopMusic();
						snd.playItsOver();
						graphics.endScreen();
					}
					return true;
				}
			}
		}

		
		
		//printf("no collison");
		return false;

	}

	public void print(){
	for(int i = 0; i < 4; i++){
		for(int j = 0; j < 4; j++){
		printf("%d", shapes[shapei][i][j]);
		}
		writefln();
	}
	}
	public void updateX(int newValue, Board theBoard){
		if((x == 240) && (newValue < 0)) {
			return;
		}
		if((x + (30*(w-1)) == 510) && (newValue > 0)) {
			return;
		}

		int tempx = 0, tempy = 0;
		tempx = x / 30;
		tempx = tempx - 8;
		tempy = y /30;

		if(newValue > 0) {
			for(int i = 0; i < 4; i++) {
			for(int j = 0; j < 4; j++) {
				if((shapes[shapei][i][j] == 1) && (theBoard.theBoard[tempy + i][tempx + j + 1] == 1)) {
				return;
			}
			}}
		} else {

			for(int i = 0; i < 4; i++) {
			for(int j = 0; j < 4; j++) {
				if((shapes[shapei][i][j] == 1) && (theBoard.theBoard[tempy + i][tempx + j - 1] == 1)) {
				return;
			}
			}}
		}

		x += newValue;
	}
	public void updateY(int newValue){
		if((y + (h * 30)) < 600) { 
		y += newValue;
		}
	}
}

class Board {

	int [][]theBoard;
	int lines;
	Video graphics;
	SDL_Surface *shapeSurface;
	SDL_Rect [][] theRects;
Audio aud;

	this(Video grph) {
	aud = new Audio();
	aud.init(); 
	 aud.loadEffects();
	
		graphics = grph;
		lines = 0;

		theBoard =  [[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0]];

		shapeSurface = graphics.loadImage("graphics/ENDSHAPE.png");

		
	}


	public void addBlockToBoard(Shape block) {
		
		int tempx = 0, tempy = 0;
		tempx = block.x / 30;
		tempx = tempx - 8;
		tempy = block.y /30;
		//printf("shapex = %d, shapey = %d\nx = %d, y = %d\n",block.x, block.y, tempx, tempy);
		for(int i = 0; i < 4; i++) {
			for(int j = 0; j < 4; j++) {
				if(block.shapes[block.shapei][i][j] == 1) {	
					theBoard[tempy + i][tempx + j] = 1;
				}
			}
		}

	}

	public void draw() {
		for(int i = 0; i < 10; i++){
			for(int j = 0; j < 20; j++) {
				if(theBoard[j][i] == 1) {
					graphics.applySurface(240+(30*i),j*30,shapeSurface);
				}
			}
		}			

	}

	public int clearLines(int currLvl) {

	int score = 0;

	static const int[] ones = [1,1,1,1,1,1,1,1,1,1];

	for(int i = 0; i < 20; i++) {
		//writefln(theBoard[i]);
		if(theBoard[i] == ones) {
			theBoard[i] = [0,0,0,0,0,0,0,0,0,0];
			for(int j = i; j > 0; j--) {
				theBoard[j] = theBoard[j - 1];
			}
			theBoard[0] = [0,0,0,0,0,0,0,0,0,0];
			score+=currLvl;
			lines++;
		}
	}

	
	 

	if(score == (4 * currLvl)) { 
			 aud.playTetris();
			 score *= 4; } else if (score > 0) { aud.playLine(); }
	return score;
	}
	
	public int getLines(){
		return lines;
	}

}