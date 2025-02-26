#include "game.h"
#include "climber.h"
#include "mode4.h"
#include "gba.h"
#include "boulder.h"
#include "hold.h"
#include <stdio.h>

// Declare external functions
extern void goToWin(void);
extern void goToLose(void);

// Rename "round" to "gameRound" to avoid conflict with the math function.
CLIMBER climber;
int score = 0;
int gameRound = 1;
int collectedHolds = 0;  // Only the hold at index "collectedHolds" is currently collectible

#define MOVEMENT_DELAY 0
int frameCounter = 0;

#define BG_COLOR    GRAY  // Background palette index
#define TEXT_COLOR  WHITE   // Text palette index

// ----------------------------------------
// Initialize Climber
// ----------------------------------------
void initClimber() {
    climber.x = 100;
    climber.y = 120;
    climber.oldX = climber.x;
    climber.oldY = climber.y;
    climber.dx = 1;
    climber.dy = 1;  
    climber.width = 32;
    climber.height = 32;
}

// ----------------------------------------
// Update Climber Movement
// ----------------------------------------
void updateClimber() {
    frameCounter++;
    if (frameCounter < MOVEMENT_DELAY) return;
    frameCounter = 0;

    if (BUTTON_HELD(BUTTON_UP) && climber.y > 0) 
        climber.y -= climber.dy;
    if (BUTTON_HELD(BUTTON_DOWN) && climber.y < SCREENHEIGHT - climber.height) 
        climber.y += climber.dy;
    if (BUTTON_HELD(BUTTON_LEFT) && climber.x > 0) 
        climber.x -= climber.dx;
    if (BUTTON_HELD(BUTTON_RIGHT) && climber.x < SCREENWIDTH - climber.width) 
        climber.x += climber.dx;
}

// ----------------------------------------
// Initialize Game Elements
// ----------------------------------------
void initGame() {
    initClimber();
    initBoulders();
    initHolds();
    collectedHolds = 0;
    score = 0;
    gameRound = 1;
}

void resetGame() {
    climber.x = 100;
    climber.y = 120;
    collectedHolds = 0;
    initBoulders();
    initHolds();
}

// ----------------------------------------
// Check Holds (Sequential Collection) and Win Condition
// ----------------------------------------
// Only the hold at index "collectedHolds" is eligible for collision detection.
// When it is hit, it is erased and marked as collected, then collectedHolds is incremented.
int checkWinCondition() {
    if (collectedHolds < HOLDCOUNT) {
        if (collision(climber.x + 5, climber.y, 16, 28,
                      holds[collectedHolds].x + 12, holds[collectedHolds].y,
                      holds[collectedHolds].width - 28, holds[collectedHolds].height - 20)) {

            drawRect4(holds[collectedHolds].x, holds[collectedHolds].y,
                      holds[collectedHolds].width, holds[collectedHolds].height, BG_COLOR);
            holds[collectedHolds].active = 0;
            score += holds[collectedHolds].points;
            collectedHolds++;
        }
    }

    if (collectedHolds == HOLDCOUNT) {
        // Optionally, add a bonus here if desired.
        // Reset game elements for the next round.
        collectedHolds = 0;
        climber.x = 100;
        climber.y = 120;
        initBoulders();
        initHolds();
        gameRound++;
        return 1;
    }

    return 0;
}


// ----------------------------------------
// Update Game Logic
// ----------------------------------------
void updateGame() {
    updateClimber();
    
    if (checkWinCondition()) {
        goToWin();
        return;
    }
    
    updateBoulders();

    if (checkBoulderCollision(climber.x + 5, climber.y, 16, 32)) {
        goToLose();
    }
}

// ----------------------------------------
// Draw Game Elements
// ----------------------------------------
void drawGame() {
    fillScreen4(BG_COLOR);
    
    char scoreText[20];
    sprintf(scoreText, "Score: %d", score);
    char roundText[20];
    sprintf(roundText, "Round: %d", gameRound);

    drawString4(5, 5, scoreText, TEXT_COLOR);
    drawString4(5, 15, roundText, TEXT_COLOR);

    drawClimber();
    drawBoulders();
    drawHolds();  // Draw all holds that have not yet been collected sequentially.
    
    waitForVBlank();
}

// ----------------------------------------
// Draw Climber
// ----------------------------------------
void drawClimber() {
    DMANow(3, (volatile void*)climberPal, BG_PALETTE, 256 | DMA_16);
    drawImage4(climber.x, climber.y, climber.width, climber.height, 
               (const u8*)climberBitmap, climberBitmap[0]);
}