// #include <stdlib.h>
// #include "myLib.h"
// #include "start.h"

// extern int state;

// void splash() {
// 	REG_DISPCTL = MODE4 | BG2_ENABLE;
// 	buttons = BUTTONS;

// 	loadPalette(startPal);

// 	flipPage();
// 	drawBackgroundImage4(startBitmap);
	

// 	while(state == SPLASH) {
// 		if(BUTTON_HELD(BUTTON_START)) {
// 			state = L1INSTRUCTIONS;
// 		}
// 	}
// }