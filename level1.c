#include <stdlib.h>
#include <time.h>
#include "level1.h"
#include "myLib.h"
#include "spritesheet.h"
#include "gamebg.h"
#include "sound.h"
#include "hitbird.h"
#include "matchSound.h"

//Variables
int aniCounter;
int vOff;
int hOff;
int grav = 50;
//player
PLAYER player;
//SMLBIRDS
//level1
SMLBIRDS smlbird1[4];
//level2
SMLBIRDS smlbird2[4];

LGBIRDS lgbird[2];

LANTERNS lanterns[10];

LIVE live;

int livesNum;
int birdsNum;
//level2
int birds2Num;
//level3
int lgbirdsNum;
int lanternNum;
int level;
OBJ_ATTR shadowOAM[128];
enum { PLAYUP, PLAYDOWN, PLAYHIT, PLAYRIGHT, PLAYLEFT, PLAYIDLE};


//for sound 
SOUND soundA;
SOUND soundB;


void initGame1() {
	DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
   	DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
   	hideSprites();

   	// REG_DISPCTL = MODE0 | BG2_ENABLE;
   	REG_DISPCTL |= SPRITE_ENABLE;
    REG_BG2CNT = BG_SIZE_SMALL| BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

	initPlayer();
	initSmlbirds();
	initLanterns();
	initLive1();
	buttons = BUTTONS;
	aniCounter = 0;
	livesNum = 5;
	birdsNum = 4;
	lanternNum = 0;
	//for level of the game
	level = 1;
	vOff = 0;
	hOff = 0;
}
void updateGame1() {
	// if (level == 1) {
		aniCounter++;
		updatePlayer();
		updateSmlbirds();
		if (level >= 2) {
			updateBird2();
		}
		if (level == 3) {
			updateLGBird();
		}

		updateLanterns();
		updateLive1();

		waitForVBlank();
		DMANow(3, shadowOAM, OAM, 128 * 4);
		if (aniCounter % 3 == 0) {
			// vOff--;
			// hOff++;
		}
		
	// } 

	// if (lanternNum == 10) {
	// 	level = 2;
	// 	initGame2();
	// }
	if (BUTTON_PRESSED(BUTTON_B)) {
		level = 2;
		initGame2();
	} else if (BUTTON_PRESSED(BUTTON_SELECT)) {
		level = 3; 
		initGame3();
	}


	REG_BG2VOFF = vOff;
	REG_BG1VOFF = vOff;
	REG_BG0VOFF = vOff;
	REG_BG0HOFF = hOff / 2;
	
}

void initGame2() {
	// DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
   	// DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
   	// hideSprites();

   	// REG_DISPCTL = MODE0 | BG2_ENABLE;
   	// REG_DISPCTL |= SPRITE_ENABLE;
    // REG_BG2CNT = BG_SIZE_SMALL| BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
	initPlayer();
	initSmlbirds();
	initBird2();
	initLanterns();
	initLive1();
	
	buttons = BUTTONS;
	aniCounter = 0;
	livesNum = 5;
	birdsNum = 4;
	birds2Num = 4;
	lanternNum = 0;
	//for level of the game
	level = 2;
	vOff = 0;
	hOff = 0;
}


void initGame3() {
	initPlayer();
	initSmlbirds();
	initBird2();
	initLGBird();
	initLanterns();
	initLive1();
	buttons = BUTTONS;
	aniCounter = 0;
	livesNum = 5;
	birdsNum = 4;
	birds2Num = 4;
	lgbirdsNum = 3;
	lanternNum = 0;
	//for level of the game
	level = 3;
	vOff = 0;
	hOff = 0;
}
void drawGame1() {
	// if (level == 1) {
		drawPlayer();
		drawSmlbirds();
		drawLanterns();
		drawLive1();

		if (level >= 2) {
			drawBird2();
		}
		if (level == 3) {
			drawLGBird();
		}
		shadowOAM[33].attr0 = (ROWMASK & 5)| ATTR0_4BPP | ATTR0_WIDE;
    	shadowOAM[33].attr1 = (COLMASK & 160) | ATTR1_TINY;
    	shadowOAM[33].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(23, 16);

		shadowOAM[34].attr0 = (ROWMASK & 5) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[34].attr1 = (COLMASK & 30) | ATTR1_TINY;
		shadowOAM[34].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(23, 13);

		shadowOAM[35].attr0 = (ROWMASK & 5) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[35].attr1 = (COLMASK & 40) | ATTR1_TINY;
		shadowOAM[35].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, 12 + birdsNum);

		shadowOAM[36].attr0 = (ROWMASK & 5) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[36].attr1 = (COLMASK & 10) | ATTR1_TINY;
		shadowOAM[36].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(23, 12);

		shadowOAM[37].attr0 = (ROWMASK & 5) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[37].attr1 = (COLMASK & 20) | ATTR1_TINY;
		shadowOAM[37].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, 12 + lanternNum);


		//LEVEL
		shadowOAM[38].attr0 = (ROWMASK & 5) | ATTR0_4BPP | ATTR0_WIDE;
		shadowOAM[38].attr1 = (COLMASK & 100) | ATTR1_SMALL;
		shadowOAM[38].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(23, 18);

		shadowOAM[39].attr0 = (ROWMASK & 5) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[39].attr1 = (COLMASK & 125) | ATTR1_TINY;
		shadowOAM[39].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, 12 + level);


	// }
	if (level >= 2) {
		shadowOAM[40].attr0 = (ROWMASK & 5) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[40].attr1 = (COLMASK & 50) | ATTR1_TINY;
		shadowOAM[40].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(23, 14);
		shadowOAM[41].attr0 = (ROWMASK & 5) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[41].attr1 = (COLMASK & 60) | ATTR1_TINY;
		shadowOAM[41].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, 12 + birds2Num);
	} 
	if (level == 3) {
		shadowOAM[51].attr0 = (ROWMASK & 5) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[51].attr1 = (COLMASK & 70) | ATTR1_TINY;
		shadowOAM[51].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(23, 15);
		shadowOAM[52].attr0 = (ROWMASK & 5) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[52].attr1 = (COLMASK & 80) | ATTR1_TINY;
		shadowOAM[52].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, 12 + lgbirdsNum);
	}
	
}

void initPlayer() {
	player.row = SHIFTUP(135);
	player.col = 120;
	player.cdel = 2;
	player.rdel = SHIFTUP(0);
	
	player.height = 16;
	player.width = 16;
	player.isJump = 0;
	player.isDown = 1;
	player.maxSpeed = SHIFTUP(1);
	player.rplayer = player.row;
	player.aniState = PLAYIDLE;
}
void drawPlayer() {

	if (player.aniState == PLAYIDLE) {
		shadowOAM[0].attr0 = (ROWMASK & SHIFTDOWN(player.row))| ATTR0_4BPP | ATTR0_SQUARE;
    	shadowOAM[0].attr1 = (COLMASK & player.col) | ATTR1_SMALL;
    	shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 14);
	} else if (player.aniState == PLAYLEFT) {
		shadowOAM[0].attr0 = (ROWMASK & SHIFTDOWN(player.row))| ATTR0_4BPP | ATTR0_SQUARE;
    	shadowOAM[0].attr1 = (COLMASK & player.col) | ATTR1_SMALL;
    	shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID((player.curFrame % 3 * 2), 20);
	} else if (player.aniState == PLAYRIGHT) {
		shadowOAM[0].attr0 = (ROWMASK & SHIFTDOWN(player.row))| ATTR0_4BPP | ATTR0_SQUARE;
    	shadowOAM[0].attr1 = (COLMASK & player.col) | ATTR1_SMALL;
    	shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID((player.curFrame % 3 * 2), 18);
	} else if (player.aniState == PLAYUP) {
		shadowOAM[0].attr0 = (ROWMASK & SHIFTDOWN(player.row))| ATTR0_4BPP | ATTR0_SQUARE;
    	shadowOAM[0].attr1 = (COLMASK & player.col) | ATTR1_SMALL;
    	shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 16);
	} else if (player.aniState == PLAYDOWN) {
		shadowOAM[0].attr0 = (ROWMASK & SHIFTDOWN(player.row))| ATTR0_4BPP | ATTR0_SQUARE;
    	shadowOAM[0].attr1 = (COLMASK & player.col) | ATTR1_SMALL;
    	shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 16);
	} else if (player.aniState == PLAYHIT) {
		shadowOAM[0].attr0 = (ROWMASK & SHIFTDOWN(player.row))| ATTR0_4BPP | ATTR0_SQUARE;
    	shadowOAM[0].attr1 = (COLMASK & player.col) | ATTR1_SMALL;
    	shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2, 16);
	}

	
}
void updatePlayer() {
	if (player.aniState == PLAYIDLE) {
		player.prevAniState = player.aniState;
	}
	player.aniState = PLAYIDLE;
	if(!BUTTON_PRESSED(BUTTON_A) && BUTTON_HELD(BUTTON_LEFT) && (player.col >= player.cdel)) {
		player.aniState = PLAYLEFT;
		player.col -= player.cdel;
		hOff++;
		//press right ==> go right 
	} else if(!BUTTON_PRESSED(BUTTON_A) && BUTTON_HELD(BUTTON_RIGHT) && (player.col + player.width - 1 < SCREENWIDTH - player.cdel)) {
		player.aniState = PLAYRIGHT;
		player.col += player.cdel;
		hOff--;
	} 

	
	//under each player state, have three motions
	if (player.aniState != PLAYIDLE && player.aniState != PLAYUP) {
		if (player.curFrame < 2) {
			player.curFrame++;
		} else {
			player.curFrame = 0;
		}
	}
	

	if (player.aniState == PLAYIDLE) {
		player.curFrame = 0;
	} 

	if (BUTTON_PRESSED(BUTTON_A)) {
		aniCounter = 0;
		if (!player.isJump) {
			player.isJump = 1;
			player.isDown = 0;
			player.rdel -= SHIFTUP(7);
		} 
	}

	if (player.isJump == 1) {
		if (player.rplayer < player.row) {
			player.aniState = PLAYDOWN;
		}
		if (player.rplayer > player.row) {
			player.aniState = PLAYUP;
		}
		
	}
	player.rdel += grav;
	player.rplayer = player.row;

	player.row += player.rdel;
	if (SHIFTDOWN(player.row) > 135) {
		player.rdel = 0;
		player.row = SHIFTUP(135);
		player.isJump = 0;
		
	} 

}

void firePlayer() {
	if (aniCounter <= 120 && player.isJump) {
		if (aniCounter % 3 == 0) {
			player.row -= player.rdel;
		}
	} else {
		
		if (player.row < 135 && player.isJump) {
			if (aniCounter % 3 == 0) {
				player.row += player.rdel;
			}
			
		} else {
			player.isJump = 0;
			// aniCounter = 0;
		}
	}
}



void initSmlbirds() {
	for (int j = 0; j < 4; j++) {
		smlbird1[j].height = 16;
		smlbird1[j].width = 16;
		int random1 = rand() % 3;
		
		//from left to right 
		smlbird1[j].row = rand()% 70 + 30;
		smlbird1[j].col = -10;		
		smlbird1[j].rdel = 1; 
		
		if (random1 == 0) {
			smlbird1[j].cdel = 1;
		} else if (random1 == 1) {
			smlbird1[j].cdel = 2;
		} else {
			smlbird1[j].cdel = 3;
		}
		
		smlbird1[j].aniCounter = 0;
		smlbird1[j].aniState = 0;
		smlbird1[j].prevAniState = 0;
		smlbird1[j].curFrame = 0;
		smlbird1[j].numFrames = 0;
		smlbird1[j].active = 1;
		smlbird1[j].isCollide = 0;
	}
}
void updateSmlbirds() {
	for (int j = 0; j < 4; j++) {
		if (smlbird1[j].col + smlbird1[j].width <= 0 || smlbird1[j].col > SCREENWIDTH ) {
			//decide to fly from left to right or from right to left
			int randomDirection = rand() % 2;
			if (randomDirection == 0) {
				smlbird1[j].leftToRight = 0;
			} else {
				smlbird1[j].leftToRight = 1;
			}

			if (smlbird1[j].leftToRight == 0) {
				smlbird1[j].col = SCREENWIDTH - smlbird1[j].width;
				smlbird1[j].row = myRandom (30) + 40;
				// smlbird1[j].aniState = 1;
				// birdsNum--;
				// smlbird1[j].row += smlbird1[j].rdel;
				// smlbird1[j].cdel *= -1;
				int random1 = rand()%3;
				if (random1 == 0) {
					smlbird1[j].cdel = 1;
				} else if (random1 == 1) {
					smlbird1[j].cdel = 2;
				} else {
					smlbird1[j].cdel = 3;
				}
			} else {
				smlbird1[j].col = 0;
				smlbird1[j].row = rand()% 70 + 30;
				int random1 = rand()%3;
				if (random1 == 0) {
					smlbird1[j].cdel = -1;
				} else if (random1 == 1) {
					smlbird1[j].cdel = -2;
				} else {
					smlbird1[j].cdel = -3;
				}
			}

			
		} 
		//player hits birds collision 
		int colli1 = collision(smlbird1[j].row, smlbird1[j].col, smlbird1[j].height, 
					smlbird1[j].width, SHIFTDOWN(player.row), player.col, player.height, 
					player.width);
		if (colli1 && smlbird1[j].active) {
			smlbird1[j].active = 0;
			smlbird1[j].aniState = 2;
			// smlbird1[j].isCollide = 1;
			drawHitSmlbirds(&smlbird1[j], j); 
			smlbird1[j].curFrame = aniCounter % 6 * 2;

			birdsNum--;
			playSoundB( hitbird, HITBIRDLEN, HITBIRDFREQ, 0);
		}
		// if (smlbird1[j].isCollide == 1) {
		// 	smlbird1[j].numFrames = 1;
		// }


	}	

	// if (aniCounter % 10 == 0) {
		for (int j = 0; j < 4; j++) {
			smlbird1[j].col -= smlbird1[j].cdel;
		}
	// }

	// if (birdsNum == 0) {
	// 	for (int j = 0; j < 4; j++) {
	// 		smlbird1[j].active = 1;
	// 	}
	// }

}

void drawHitSmlbirds(SMLBIRDS *s, int j) {
	if (s -> isCollide) {
		shadowOAM[j + 9].attr0 = (ROWMASK & smlbird1[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    shadowOAM[j + 9].attr1 = (COLMASK & smlbird1[j].col) | ATTR1_SMALL;
	    shadowOAM[j + 9].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(26, smlbird1[j].curFrame);
	}


}
void drawSmlbirds() {
	for (int j = 0; j < 4; j++) {
		if (smlbird1[j].active && smlbird1[j].aniState == 0) {
			if (smlbird1[j].leftToRight == 0) {
				shadowOAM[j + 9].attr0 = (ROWMASK & smlbird1[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 9].attr1 = (COLMASK & smlbird1[j].col) | ATTR1_SMALL;
	    		shadowOAM[j + 9].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, (aniCounter % 6) * 2);
			} else {
				shadowOAM[j + 9].attr0 = (ROWMASK & smlbird1[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 9].attr1 = (COLMASK & smlbird1[j].col) | ATTR1_SMALL;
	    		shadowOAM[j + 9].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2, (aniCounter % 6) * 2);
			}
		
		} else {
			if (smlbird1[j].isCollide) {
				shadowOAM[j + 9].attr0 = (ROWMASK & smlbird1[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 9].attr1 = (COLMASK & smlbird1[j].col) | ATTR1_SMALL;
	    		shadowOAM[j + 9].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(26, smlbird1[j].curFrame);

			} else {
				shadowOAM[j + 9].attr0 = (ROWMASK & smlbird1[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 9].attr1 = (COLMASK & smlbird1[j].col) | ATTR1_SMALL;
	    		shadowOAM[j + 9].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(30, 30);
			}
			
		}
	}
	

}

void initLanterns() {
	for (int j = 0; j < 10; j++) {
		lanterns[j].row = rand()%40 + 30;
		lanterns[j].col = rand()%160 + 30;
		int randomrdel = rand()%2;
		int randomcdel = rand()%2;
    	lanterns[j].rdel = 2;
   		lanterns[j].cdel = 2;
		lanterns[j].width = 16;
		lanterns[j].height = 16;
    	lanterns[j].aniCounter = 0;
    	lanterns[j].aniState = 0;
    	lanterns[j].lightUpState = 0;
    	lanterns[j].prevAniState = 0;
    	lanterns[j].curFrame = 0;
   		lanterns[j].numFrames = 0;
    	lanterns[j].active = 0;
    	int randomAniState = rand() % 10;
    	lanterns[j].aniState = randomAniState;


	}
}
void updateLanterns() {
	for (int j = 0; j < 10; j++) {
		if (lanterns[j].row < 18 || lanterns[j].row + lanterns[j].height > 100) {
			lanterns[j].rdel *= -1;
			lanterns[j].cdel *= -1;
		} else if (lanterns[j].col < 5 || lanterns[j].col + lanterns[j].width > 200) {
			lanterns[j].rdel *= -1;
			lanterns[j].cdel *= -1;

		} 
		if (aniCounter % 10 == 0) {

		
			
			int random = rand()%4;
			if (random == 0) {
				lanterns[j].col += lanterns[j].cdel;
				lanterns[j].row += lanterns[j].rdel;
			} else if (random == 1) {
				lanterns[j].col -= lanterns[j].cdel;
				lanterns[j].row += lanterns[j].rdel;
			} else if (random == 2) {
				lanterns[j].col += lanterns[j].cdel;
				lanterns[j].row -= lanterns[j].rdel;
			} else if (random == 3) {
				lanterns[j].col -= lanterns[j].cdel;
				lanterns[j].row -= lanterns[j].rdel;
			}
		
		}
	}

	// if (lanterns[j].aniState < 10) {

	// }
	

	if (aniCounter % 50 == 0) {
		for (int j = 0; j < 10; j++) {
			if (lanterns[j].aniState < 11 && lanterns[j].lightUpState == 0) {
				lanterns[j].aniState++;
			} else if (lanterns[j].aniState == 11 && lanterns[j].lightUpState == 0) {
				lanterns[j].aniState = 0;
			}
		}
	}




	for (int j = 0; j < 10; j++) {
		int colli1 = collision(lanterns[j].row, lanterns[j].col, lanterns[j].height, 
					lanterns[j].width,SHIFTDOWN(player.row), player.col, player.height, 
					player.width);
		if (colli1 && lanterns[j].aniState >= 8) {
			if (!lanterns[j].active) {
				lanterns[j].active = 1;
				lanterns[j].lightUpState = 1;
				playSoundB( matchSound, MATCHSOUNDLEN, MATCHSOUNDFREQ, 0);
				lanternNum++;
				if (lanterns[j].active) {
					player.aniState = PLAYHIT;
				}
			}
		}

			
		
	}
	if (aniCounter % 50 == 0) {
		for (int j = 0; j < 10; j++) {
			if (lanterns[j].lightUpState >= 1 && lanterns[j].lightUpState < 12) {
				lanterns[j].lightUpState++;
			} else if (lanterns[j].lightUpState == 12) {
				lanterns[j].lightUpState = 1;
			}
		}
	}
	

}
void drawLanterns() {
	for (int j = 0; j < 10; j++) {
		if (!lanterns[j].active) {
			if (lanterns[j].aniState == 0) {
				shadowOAM[j + 17].attr0 = (ROWMASK &lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 17].attr1 = (COLMASK &lanterns[j].col) | ATTR1_TINY;
	    		shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 4);
			} else if (lanterns[j].aniState == 1) {
				//far away from the 
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_TINY;
	    		shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 5);
			} else if (lanterns[j].aniState == 2) {
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_TINY;
	    		shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 6);
			} else if (lanterns[j].aniState == 3) {
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_TINY;
	    		shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 7);
			} else if (lanterns[j].aniState == 4) {
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_TINY;
	    		shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(5, 4);
			} else if (lanterns[j].aniState == 5) {
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_TINY;
	    		shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(5, 5);
			} else if (lanterns[j].aniState == 6) {
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_TINY;
	    		shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(5, 6);
			} else if (lanterns[j].aniState == 7) {
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_SMALL;
	    		shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, 2);
			} else if (lanterns[j].aniState == 8) {
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_SMALL;
	    		shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, 2);
			} else if (lanterns[j].aniState == 9) {
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_SMALL;
	    		shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 2);
			} else if (lanterns[j].aniState == 10) {
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_SMALL;
	    		shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 2);
			} else if (lanterns[j].aniState == 11) {
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_SMALL;
	    		shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 2);
			}
		
	} else {
			if (lanterns[j].lightUpState == 1) {
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
		    	shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_SMALL;
		    	shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, 0);
			} else if (lanterns[j].lightUpState == 2) {
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
		    	shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_SMALL;
		    	shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, 0);
			} else if (lanterns[j].lightUpState == 3) {
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
		    	shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_SMALL;
		    	shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 0);
			} else if (lanterns[j].lightUpState == 4) {
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
		    	shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_SMALL;
		    	shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 0);
			} else if (lanterns[j].lightUpState == 5) {
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
		    	shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_SMALL;
		    	shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 0);
			} else if (lanterns[j].lightUpState == 6) {
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
		    	shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_TINY;
		    	shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 4);
			} else if (lanterns[j].lightUpState == 7) {
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
		    	shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_TINY;
		    	shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 5);
			} else if (lanterns[j].lightUpState == 8) {
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
		    	shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_TINY;
		    	shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 6);
			} else if (lanterns[j].lightUpState == 9) {
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
		    	shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_TINY;
		    	shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 7);
			} else if (lanterns[j].lightUpState == 10) {
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
		    	shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_TINY;
		    	shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(7, 4);
			}  else if (lanterns[j].lightUpState == 11) {
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
		    	shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_TINY;
		    	shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(7, 5);
			} else if (lanterns[j].lightUpState == 12) {
				shadowOAM[j + 17].attr0 = (ROWMASK & lanterns[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
		    	shadowOAM[j + 17].attr1 = (COLMASK & lanterns[j].col) | ATTR1_TINY;
		    	shadowOAM[j + 17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(7, 6);
			} 
		
		}
	}
	
}

void initLive1() {
	live.row = 5;
	live.col = 180;
	live.height = 8;
	live.width = 8;
	live.active = 0;
	live.curFrame = 0;
}
void drawLive1() {
	shadowOAM[44].attr0 = (ROWMASK & 5) | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[44].attr1 = (COLMASK & 180) | ATTR1_TINY;
	shadowOAM[44].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(24 + (live.curFrame % 4) * 2, 12 );
}

void updateLive1() {
	if (birdsNum == 3) {
		live.curFrame = 1;
	} else if (birdsNum == 2) {
		live.curFrame = 2;
	} else if (birdsNum == 1) {
		live.curFrame = 3;
	}
}

void initBird2() {
	for (int j = 0; j < 4; j++) {
		smlbird2[j].height = 16;
		smlbird2[j].width = 16;
		int random1 = rand() % 3;
		
		//from left to right 
		smlbird2[j].row = rand()% 70 + 30;
		smlbird2[j].col = -10;		
		smlbird2[j].rdel = 1; 
		
		if (random1 == 0) {
			smlbird2[j].cdel = 1;
		} else if (random1 == 1) {
			smlbird2[j].cdel = 2;
		} else {
			smlbird2[j].cdel = 3;
		}
		
		smlbird2[j].aniCounter = 0;
		smlbird2[j].aniState = 0;
		smlbird2[j].prevAniState = 0;
		smlbird2[j].curFrame = 0;
		smlbird2[j].numFrames = 0;
		smlbird2[j].active = 1;
		smlbird2[j].isCollide = 0;
	}
}

void drawBird2() {
	for (int j = 0; j < 4; j++) {
		if (smlbird2[j].active && smlbird2[j].aniState == 0) {
			if (smlbird2[j].leftToRight == 0) {
				shadowOAM[j + 45].attr0 = (ROWMASK & smlbird2[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 45].attr1 = (COLMASK & smlbird2[j].col) | ATTR1_SMALL;
	    		shadowOAM[j + 45].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(24, (aniCounter % 6) * 2);
			} else {
				shadowOAM[j + 45].attr0 = (ROWMASK & smlbird2[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 45].attr1 = (COLMASK & smlbird2[j].col) | ATTR1_SMALL;
	    		shadowOAM[j + 45].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, (aniCounter % 6) * 2);
			}
		
		} else {
			if (smlbird1[j].isCollide) {
				shadowOAM[j + 45].attr0 = (ROWMASK & smlbird2[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 45].attr1 = (COLMASK & smlbird2[j].col) | ATTR1_SMALL;
	    		shadowOAM[j + 45].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(26, smlbird2[j].curFrame);

			} else {
				shadowOAM[j + 45].attr0 = (ROWMASK & smlbird2[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 45].attr1 = (COLMASK & smlbird2[j].col) | ATTR1_SMALL;
	    		shadowOAM[j + 45].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(30, 30);
			}
			
		}
	}

	
	
}

void updateBird2() {
	for (int j = 0; j < 4; j++) {
		if (smlbird2[j].col + smlbird2[j].width <= 0 || smlbird2[j].col > SCREENWIDTH ) {
			//decide to fly from left to right or from right to left
			int randomDirection = rand() % 2;
			if (randomDirection == 0) {
				smlbird2[j].leftToRight = 0;
			} else {
				smlbird2[j].leftToRight = 1;
			}

			if (smlbird2[j].leftToRight == 0) {
				smlbird2[j].col = SCREENWIDTH - smlbird2[j].width;
				smlbird2[j].row = myRandom (30) + 50;

				int random1 = rand()%3;
				if (random1 == 0) {
					smlbird2[j].cdel = 1;
				} else if (random1 == 1) {
					smlbird2[j].cdel = 2;
				} else {
					smlbird2[j].cdel = 3;
				}
			} else {
				smlbird2[j].col = 0;
				smlbird2[j].row = myRandom (30) + 50;
				int random1 = rand()%3;
				if (random1 == 0) {
					smlbird2[j].cdel = -1;
				} else if (random1 == 1) {
					smlbird2[j].cdel = -2;
				} else {
					smlbird2[j].cdel = -3;
				}
			}

			
		} 
		//player hits birds collision 
		int colli1 = collision(smlbird2[j].row, smlbird2[j].col, smlbird2[j].height, 
					smlbird2[j].width, SHIFTDOWN(player.row), player.col, player.height, 
					player.width);
		if (colli1 && smlbird2[j].active) {
			smlbird2[j].active = 0;
			smlbird2[j].aniState = 2;
			// smlbird1[j].isCollide = 1;
			drawHitSmlbirds(&smlbird2[j], j); 
			smlbird2[j].curFrame = aniCounter % 6 * 2;
			birds2Num--;
			playSoundB( hitbird, HITBIRDLEN, HITBIRDFREQ, 0);
		}
		// if (smlbird1[j].isCollide == 1) {
		// 	smlbird1[j].numFrames = 1;
		// }
	}
	for (int j = 0; j < 4; j++) {
		smlbird2[j].col -= smlbird2[j].cdel;
	}
}

void initLGBird() {
	for (int j = 0; j < 2; j++) {
		lgbird[j].height = 32;
		lgbird[j].width = 32;
		int random1 = rand() % 3;

		//from left to right 
		lgbird[j].row = myRandom (30) + 50;
		lgbird[j].col = -10;		
		lgbird[j].rdel = 1; 
		
		if (random1 == 0) {
			lgbird[j].cdel = 1;
		} else if (random1 == 1) {
			lgbird[j].cdel = 2;
		} else {
			lgbird[j].cdel = 3;
		}
		
		lgbird[j].aniCounter = 0;
		lgbird[j].aniState = 0;
		lgbird[j].prevAniState = 0;
		lgbird[j].curFrame = 0;
		lgbird[j].numFrames = 0;
		lgbird[j].active = 1;
		lgbird[j].isCollide = 0;
	}
}


void drawLGBird() {
	for (int j = 0; j < 2; j++) {
		if (lgbird[j].active && lgbird[j].aniState == 0) {
			if (lgbird[j].leftToRight == 0) {
				shadowOAM[j + 49].attr0 = (ROWMASK & lgbird[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 49].attr1 = (COLMASK & lgbird[j].col) | ATTR1_MEDIUM;
	    		shadowOAM[j + 49].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(18, 0 + (aniCounter % 2) * 4);
			} else {
				shadowOAM[j + 49].attr0 = (ROWMASK & lgbird[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 49].attr1 = (COLMASK & lgbird[j].col) | ATTR1_MEDIUM;
	    		shadowOAM[j + 49].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(14, 12 + (aniCounter % 2) * 4);
			}
		
		} else {
			if (lgbird[j].isCollide) {
				shadowOAM[j + 49].attr0 = (ROWMASK & lgbird[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 49].attr1 = (COLMASK & lgbird[j].col) | ATTR1_MEDIUM;
	    		shadowOAM[j + 49].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(26, lgbird[j].curFrame);

			} else {
				shadowOAM[j + 49].attr0 = (ROWMASK & lgbird[j].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    		shadowOAM[j + 49].attr1 = (COLMASK & lgbird[j].col) | ATTR1_MEDIUM;
	    		shadowOAM[j + 49].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 28);
			}
			
		}
	}
}
void updateLGBird() {
	for (int j = 0; j < 2; j++) {
		if (lgbird[j].col + lgbird[j].width <= 0 || lgbird[j].col > SCREENWIDTH ) {
			//decide to fly from left to right or from right to left
			int randomDirection = rand() % 2;
			if (randomDirection == 0) {
				lgbird[j].leftToRight = 0;
			} else {
				lgbird[j].leftToRight = 1;
			}

			if (lgbird[j].leftToRight == 0) {
				lgbird[j].col = SCREENWIDTH - lgbird[j].width;
				lgbird[j].row = myRandom (30) + 50;

				int random1 = rand()%3;
				if (random1 == 0) {
					lgbird[j].cdel = 1;
				} else if (random1 == 1) {
					lgbird[j].cdel = 2;
				} else {
					lgbird[j].cdel = 3;
				}
			} else {
				lgbird[j].col = 0;
				lgbird[j].row = myRandom (30) + 50;
				int random1 = rand()%3;
				if (random1 == 0) {
					lgbird[j].cdel = -1;
				} else if (random1 == 1) {
					lgbird[j].cdel = -2;
				} else {
					lgbird[j].cdel = -3;
				}
			}

			
		} 
		//player hits birds collision 
		int colli1 = collision(lgbird[j].row, lgbird[j].col, lgbird[j].height, 
					lgbird[j].width, SHIFTDOWN(player.row), player.col, player.height, 
					player.width);
		if (colli1 && lgbird[j].active) {
			lgbird[j].active = 0;
			lgbird[j].aniState = 2;
			// smlbird1[j].isCollide = 1;
			// drawHitSmlbirds(&lgbird[j], j); 
			lgbird[j].curFrame = aniCounter % 6 * 2;
			lgbirdsNum--;
			playSoundB( hitbird, HITBIRDLEN, HITBIRDFREQ, 0);
		}
		// if (smlbird1[j].isCollide == 1) {
		// 	smlbird1[j].numFrames = 1;
		// }
	}
	for (int j = 0; j < 2; j++) {
		lgbird[j].col -= lgbird[j].cdel;
	}
}