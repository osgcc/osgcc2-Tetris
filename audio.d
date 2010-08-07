module audio;

import derelict.sdl.mixer;
import derelict.sdl.sdl;
import std.stdio;
import std.string;

class Audio{
Mix_Music *music;
Mix_Chunk *effect1;
Mix_Chunk *effect2;
Mix_Chunk *effect3;
Mix_Chunk *effect4;
Mix_Chunk *effect5;
Mix_Chunk *effect6;

this(){
	music = null;
}

public void lowerMusicVolume(){Mix_VolumeMusic(MIX_MAX_VOLUME/8);}

public void init(){
	DerelictSDLMixer.load();
	DerelictSDL.load();
	Mix_OpenAudio(22050, MIX_DEFAULT_FORMAT, 2, 4096);
}

public void loadMusic(char* filename){
	music = Mix_LoadMUS(filename);
}

public void playMusic(){
	if(Mix_PlayingMusic() == 0){
	Mix_PlayMusic(music, -1);
	}
}

public void pauseMusic(){
	if(Mix_PlayingMusic() == 1){
	Mix_PauseMusic();
	}	
}

public void unpauseMusic(){
	if(Mix_PausedMusic() == 1){
	Mix_ResumeMusic();
	}
}

public void stopMusic(){
	Mix_HaltMusic();
}

public void playBoom(){
	Mix_PlayChannel(-1, effect1, 0);	
}
		
public void playBoop(){
	Mix_PlayChannel(-1, effect2, 0);			
}
		
public void playLine(){
	Mix_PlayChannel(-1, effect3, 0);			
}
		
public void playRotate(){
	Mix_PlayChannel(-1, effect4, 0);			
}
		
public void playTetris(){
	Mix_PlayChannel(-1, effect5, 0);
}
		
public void playItsOver(){
	Mix_PlayChannel(-1, effect6, 0);		
}

public void loadEffects(){
	effect1 = Mix_LoadWAV("sounds/boom.wav");
	effect2 = Mix_LoadWAV("sounds/boop.wav");
	effect3 = Mix_LoadWAV("sounds/line.wav");
	effect4 = Mix_LoadWAV("sounds/rotate.wav");
	effect5 = Mix_LoadWAV("sounds/tetris.wav");
	effect6 = Mix_LoadWAV("sounds/itsover.wav");
}

public void cleanUp(){
	Mix_FreeChunk(effect1);
	Mix_FreeChunk(effect2);
	Mix_FreeChunk(effect3);
	Mix_FreeChunk(effect4);
	Mix_FreeChunk(effect5);
	Mix_FreeChunk(effect6);
	Mix_FreeMusic(music);
	Mix_CloseAudio();
}

}