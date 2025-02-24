#include "game.h"
#include "climber.h"
#include "mode4.h"
#include "gba.h"
#include "boulder.h"
#include "hold.h"

CLIMBER climber;
int score = 0;  // ✅ Define the score variable

#define MOVEMENT_DELAY 2
int frameCounter = 0;

// ----------------------------------------
// Initialize Climber
// ----------------------------------------
void initClimber() {
    climber.x = 100;
    climber.y = 120;
    climber.oldX = climber.x;
    climber.oldY = climber.y;
    climber.dx = 2;
    climber.dy = 2;  
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
    initHolds();  // ✅ Initialize holds
    score = 0;  // ✅ Initialize score
}

// ----------------------------------------
// Update Game Logic
// ----------------------------------------
void updateGame() {
    updateClimber();
    updateBoulders();
    updateHolds();  // ✅ Ensure holds are updated
}

// ----------------------------------------
// Draw Game Elements
// ----------------------------------------
void drawGame() {
    fillScreen4(RGB(10,10,10));  // ✅ Set background color
    updateClimber();
    drawClimber();
    drawBoulders();
    drawHolds();  // ✅ Draw holds (active = green, inactive = red)
}

// ----------------------------------------
// Draw Climber
// ----------------------------------------
void drawClimber() {
    DMANow(3, (volatile void*)climberPal, BG_PALETTE, 256 | DMA_16);
    drawImage4(climber.x, climber.y, climber.width, climber.height, 
               (const u8*)climberBitmap, climberBitmap[0]);
}
