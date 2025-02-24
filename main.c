#include <stdlib.h>
#include <stdio.h>
#include "gba.h"
#include "mode4.h"
#include "start.h"
#include "game.h"
#include "boulder.h"

// ----------------------------------------
// Function Prototypes
// ----------------------------------------

void initialize();
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
void flipPage();
void updateGame();  // ✅ Ensure updateGame() is defined
void drawGame();    // ✅ Ensure drawGame() is defined

// ----------------------------------------
// Global Variables
// ----------------------------------------

char buffer[41];  // Text buffer

// Game States
enum {
    START,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;

// Buttons
unsigned short buttons;
unsigned short oldButtons;

// ----------------------------------------
// Main Function
// ----------------------------------------

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        // State machine
        switch (state) {
            case START: start(); break;
            case GAME: game(); break;
            case PAUSE: pause(); break;
            case WIN: win(); break;
            case LOSE: lose(); break;
        }
    }
}

// ----------------------------------------
// Initialization Functions
// ----------------------------------------

void initialize() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;

    buttons = REG_BUTTONS;
    oldButtons = 0;

    initGame();  // ✅ Set up game objects (climber, boulders)

    goToStart();
}

// ----------------------------------------
// Game State Functions
// ----------------------------------------

void goToStart() {
    DMANow(3, (volatile void*)startPal, BG_PALETTE, 256 | DMA_ON);
    drawFullscreenImage4(startBitmap);
    waitForVBlank();
    flipPage();

    state = START;
}

void start() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        fillScreen4(BLACK);  // ✅ Clear before transition to prevent flicker
        flipPage();
        goToGame();
    }
}

void goToGame() {
    waitForVBlank();
    fillScreen4(BLACK);
    flipPage();

    initGame();  // ✅ Reset game variables
    state = GAME;
}

void game() {
    updateGame();  // ✅ Handle updates (climber, boulders)
    drawGame();    // ✅ Render game elements
    waitForVBlank();
    flipPage();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
}

void goToPause() {
    waitForVBlank();
    flipPage();
    state = PAUSE;
}

void pause() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToWin() {
    waitForVBlank();
    flipPage();
    state = WIN;
}

void win() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToLose() {
    waitForVBlank();
    flipPage();
    state = LOSE;
}

void lose() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

// ----------------------------------------
// Utility Functions
// ----------------------------------------

void flipPage() {
    if (REG_DISPCTL & DISP_BACKBUFFER) {
        videoBuffer = BACKBUFFER;
    } else {
        videoBuffer = FRONTBUFFER;
    }
    REG_DISPCTL ^= DISP_BACKBUFFER;
}
