#include "myLib.h"

#define SHIFTUP(i) ((i) << 8)
#define SHIFTDOWN(i) ((i) >> 8)

typedef struct {
	int row;
	int col;
    int rdel;
    int cdel;
	int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int active;
    int leftToRight;
    int isCollide;
} SMLBIRDS;

typedef struct {
	int row;
	int col;
    int rdel;
    int cdel;
	int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int active;
} SMLBIRDS2;

typedef struct {
	int row;
	int col;
    int rdel;
    int cdel;
	int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int active;
} LGBIRDS;

// Player Struct
typedef struct {
	int row;
	int col;
	int cdel;
	int rdel;
	int height;
	int width;
	
	int bulletTimer;
	int cDirection;
	int isJump;
	int isDown;
	int maxSpeed;
	int rplayer;
	int aniState;
	int prevAniState;
	int aniCounter;
	int curFrame;

	int jumpmode;
} PLAYER;

typedef struct {
	int row;
	int col;
    int rdel;
    int cdel;
	int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int active;
    int lightUpState;
} LANTERNS;


typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int height;
	int width;
	int active;
	int erased;
} LIVE;


extern int vOff;
extern int hOff;
extern OBJ_ATTR shadowOAM[128];


extern int livesNum;
extern int birdsNum;
extern int lanternNum;

//LEVEL1
void initGame1();
void updateGame1();
void drawGame1();

//Objects 
void initSmlbirds();
void updateSmlbirds();
void drawSmlbirds();
void fireSmlbirds();
void drawHitSmlbirds(SMLBIRDS *s, int j);

void initLanterns();
void updateLanterns();
void drawLanterns();

//Player
void initPlayer();
void drawPlayer();
void updatePlayer();
void firePlayer();

//Live
//init 
void initLive();
//draw
void drawLive();
//update
void updateLive();



