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
    int leftToRight;
    int isCollide;
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
	int isHittingBird;
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
	int curFrame;
} LIVE;





extern int vOff;
extern int hOff;
extern OBJ_ATTR shadowOAM[128];


extern int livesNum;
extern int birdsNum;
extern int birds2Num;
extern int lgbirdsNum;
extern int lanternNum;
extern int level;


//LEVEL1
void initGame1();
void updateGame1();
void drawGame1();

void initGame2();
void updateGame2();
void drawGame2();

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
void initLive1();
//draw
void drawLive1();
//update
void updateLive1();

//level2 birds 
void initBird2();
void drawBird2();
void updateBird2();


//level3 birds 
void initGame3();
void initLGBird();
void drawLGBird();
void updateLGBird();







