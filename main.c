#include <stdlib.h>
#include <stdio.h>
#include "gba.h"
#include "mode4.h"
#include "start.h"
#include "game.h"
#include "boulder.h"

// Function Prototypes
void initialize(void);
void goToStart(void);
void start(void);
void goToGame(void);
void game(void);
void goToPause(void);
void pause(void);
void goToWin(void);
void win(void);
void goToLose(void);
void lose(void);
void flipPage(void);
  
// Global text buffer
char buffer[41];

// Game state definitions
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

// Color definitions (using palette indices for Mode 4)
#define BG_COLOR    10    // Background color index
#define TEXT_COLOR  1     // Text color index

// main() - Entry point
int main(void) {
    initialize();
    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;
        switch (state) {
            case START:  start(); break;
            case GAME:   game(); break;
            case PAUSE:  pause(); break;
            case WIN:    win(); break;
            case LOSE:   lose(); break;
        }
    }
}

// ----------------------------------------
// Initialization Functions
// ----------------------------------------
void initialize(void) {
    // Set video mode to Mode 4, enable background 2, and set up page flipping.
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
    buttons = REG_BUTTONS;
    oldButtons = 0;
    
    // Initialize all game objects.
    initGame();
    
    // Start at the start screen.
    goToStart();
}

// ----------------------------------------
// Game State Functions
// ----------------------------------------
void goToStart(void) {
    // Reset game completely for a new play session.
    score = 0;
    // (If you want to completely reset the round, you may also reset gameRound here.)
    resetGame();
    
    // Display the start screen.
    DMANow(3, (volatile void*)startPal, BG_PALETTE, 256 | DMA_ON);
    drawFullscreenImage4(startBitmap);
    drawString4(10, 20, "Train like Adam Ondra", WHITE);
    drawString4(10, 50, "On belay?", WHITE);
    waitForVBlank();
    flipPage();
    state = START;
}

void start(void) {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        fillScreen4(BLACK);  // Clear the screen to prevent flicker.
        flipPage();
        goToGame();
    }
}

void goToGame(void) {
    waitForVBlank();
    fillScreen4(BLACK);
    flipPage();
    initGame();  // Reset game variables (climber, boulders, holds) for a new session or round.
    state = GAME;
}

void game(void) {
    updateGame();
    drawGame();
    waitForVBlank();
    flipPage();
    
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
}

void goToPause(void) {
    waitForVBlank();
    flipPage();
    state = PAUSE;
}

void pause(void) {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToWin(void) {
    waitForVBlank();
    flipPage();
    state = WIN;
    // Draw a win message.
    drawString4(50, 80, "WIN! Press START to continue", TEXT_COLOR);
    waitForVBlank();
}

void win(void) {
    waitForVBlank();
    // When the player presses START on the win screen, simply resume game mode.
    if (BUTTON_PRESSED(BUTTON_START)) {
         state = GAME;
    }
}

void goToLose(void) {
    waitForVBlank();
    flipPage();
    state = LOSE;
}

void lose(void) {
    waitForVBlank();
    fillScreen4(RED);  // Fill screen with red for lose state.
    flipPage();
    
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

// ----------------------------------------
// Utility Function for Page Flipping
// ----------------------------------------
void flipPage(void) {
    if (REG_DISPCTL & DISP_BACKBUFFER) {
        videoBuffer = BACKBUFFER;
    } else {
        videoBuffer = FRONTBUFFER;
    }
    REG_DISPCTL ^= DISP_BACKBUFFER;
}
