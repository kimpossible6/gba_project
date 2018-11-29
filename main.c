#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"
// #include "game.h"
#include "start.h"
#include "instruction.h"
#include "pause.h"
#include "lose.h"
#include "win.h"
#include "level1.h"
#include "gamebg.h"
#include "sky.h"
#include "sea.h"
#include "sound.h"
#include "theme.h"
#include "gameSong.h"
#include "pauseSong.h"
// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();
void insturction1();
void goToInstruction1();




// States
enum {START, INSTRUCTION, GAME, PAUSE, WIN, LOSE};
int state;
// Button Variables
unsigned short buttons;
unsigned short oldButtons;
SOUND soundA;
SOUND soundB;
// Random Seed
int seed;

// Text Buffer
char buffer[41];

int main() {

    initialize();
    setupSounds();
    setupInterrupts();
    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch(state) {

            case START:
                start();
                break;
            case INSTRUCTION: 
                insturction1();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
               
    }
}

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE0 | BG2_ENABLE;

    // Set up the first state
    goToStart();
}

// Sets up the start state
void goToStart() {

    REG_DISPCTL = MODE0 | BG2_ENABLE;
    REG_BG2CNT = BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    DMANow(3, startPal, PALETTE, 256); 
    DMANow(3, startTiles, &CHARBLOCK[0], startTilesLen / 2);
    DMANow(3, startMap, &SCREENBLOCK[31], startMapLen / 2);
    //vertical blank and flip page 
    waitForVBlank();
    // flipPage();
    // stopSound();
    playSoundA(theme, THEMELEN, THEMEFREQ, 1);

    state = START;

    // Begin the seed randomization
    seed = 0;
}

// start state
void start() {

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Seed the random generator
        // srand(seed);

        goToInstruction1();
        // initGame();
    }
}

void insturction1() {
    seed++;
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();

        // Seed the random generator
        srand(seed);
        goToGame();
        initGame1();

        // initGame();
    }
}

void goToInstruction1() {
    REG_BG2CNT = BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, instructionPal, PALETTE, instructionPalLen/2);
    DMANow(3, instructionTiles, &CHARBLOCK[0], gamebgTilesLen / 2);
    DMANow(3, instructionMap, &SCREENBLOCK[28], gamebgMapLen / 2);
    // DMANow(3, instructionPal, PALETTE, 256);
    // drawFullscreenImage4(instructionBitmap);

    //vertical blank and flip page 
    waitForVBlank();
    // flipPage();

    state = INSTRUCTION;

     
}


// Sets up the game state
void goToGame() {
    playSoundA( gameSong, GAMESONGLEN, GAMESONGFREQ, 1);
    

    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;
    REG_DISPCTL |= BG0_ENABLE;
    DMANow(3, skyPal, PALETTE, skyPalLen/2);
    REG_BG1CNT = BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    
    DMANow(3, skyTiles, &CHARBLOCK[0], skyTilesLen / 2);
    DMANow(3, skyMap, &SCREENBLOCK[31],skyMapLen / 2);

    REG_BG0CNT =  BG_CHARBLOCK(1) | BG_SCREENBLOCK(28)| BG_SIZE_SMALL;
    DMANow(3, seaTiles, &CHARBLOCK[1], seaTilesLen/2);
    DMANow(3, seaMap, &SCREENBLOCK[28], seaMapLen/2);
    state = GAME;
}




// Runs every frame of the game state
void game() {
        updateGame1();
        drawGame1();
    
   

    // Update the score
    // sprintf(buffer, "Pumpkins: %d", pumpkinsRemaining);
    // drawString4(145, 5, buffer, GREENID);
    // sprintf(buffer, "Skulls: %d", skullsRemaining);
    // drawString4(145, 85, buffer, GREENID);
    // sprintf(buffer, "Score: %d", score);
    // drawString4(145, 160, buffer, GREENID);
    
    // fillScreen4(GRAYID);
    // waitForVBlank();
    // flipPage();


    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))  {
        stopSound();
        goToPause();
    }
    else if (birdsNum == 0 && level == 1) 
        goToLose();
    else if (birds2Num == 0 && birdsNum == 0 && level == 2) {
        goToLose();
    } else if (birds2Num == 0 && birdsNum == 0 && lgbirdsNum == 0 && level == 3) {
         goToLose();
    }
    else if (lanternNum == 10 && level == 3) {
        // goToInstruction2();
        goToWin();
    }
}




// Sets up the pause state
void goToPause() {
    playSoundA(pauseSong, PAUSESONGLEN, PAUSESONGFREQ, 1);
    REG_BG2VOFF = 0;
    REG_BG2CNT = BG_SIZE_LARGE| BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    REG_DISPCTL ^= BG0_ENABLE;
    DMANow(3, PausePal, PALETTE, 256); 
    DMANow(3, PauseTiles, &CHARBLOCK[0], PauseTilesLen / 2);
    DMANow(3, PauseMap, &SCREENBLOCK[31], PauseMapLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    waitForVBlank();
    // flipPage();


    state = PAUSE;
}

// Pause State
void pause() {
    
    
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

// Sets up the win state
void goToWin() {

    // DMANow(3, winPal, PALETTE, 256);
    // drawFullscreenImage4(winBitmap);

    waitForVBlank();
    // flipPage();


    state = WIN;
}

// Runs every frame of the win state
void win() {
    
    // Lock the framerate to 60 fps
    REG_BG2VOFF = 0;
    REG_BG2CNT = BG_SIZE_LARGE | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    DMANow(3, winPal, PALETTE, 256); 
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen / 2);
    DMANow(3, winMap, &SCREENBLOCK[31], winMapLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

// Sets up the lose state
void goToLose() {
    REG_BG2VOFF = 0;
    REG_BG2CNT = BG_SIZE_LARGE | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    DMANow(3, losePal, PALETTE, 256); 
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[31], loseMapLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    // DMANow(3, losePal, PALETTE, 256);
    // drawFullscreenImage4(loseBitmap);

    waitForVBlank();
    // flipPage();

    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
     
    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) 
        goToStart();
}