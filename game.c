#include "game.h"
#include "climber.h"
#include "mode4.h"
#include "gba.h"
#include "boulder.h"
#include "hold.h"
#include "stronger.h"
#include <stdio.h>

extern void goToWin(void);
extern void goToLose(void);
CLIMBER climber;

int score = 0;
int highScore = 0;

// IE level that the player is currently on
int gameRound = 1;

// To be used to ensure that holds are collected in order of 'y' positioning
int collectedHolds = 0;

#define MOVEMENT_DELAY 0
int frameCounter = 0;

#define BG_COLOR GRAY
#define TEXT_COLOR WHITE

// Inital climber vals
void initClimber() {
    climber.x = 100;
    climber.y = 120;
    climber.oldX = climber.x;
    climber.oldY = climber.y;
    climber.dx = 3;
    climber.dy = 3;  
    climber.width = 32;
    climber.height = 32;
    climber.stronger = 0;
}

// Update Climber Movement
void updateClimber() {
    frameCounter++;
    if (frameCounter < MOVEMENT_DELAY)  {
        return;
    }
    frameCounter = 0;

    // Movement <>^v for climber
    if (BUTTON_HELD(BUTTON_UP) && climber.y > 0) 
        climber.y -= climber.dy;
    if (BUTTON_HELD(BUTTON_DOWN) && climber.y < SCREENHEIGHT - climber.height) 
        climber.y += climber.dy;
    if (BUTTON_HELD(BUTTON_LEFT) && climber.x > 0) 
        climber.x -= climber.dx;
    if (BUTTON_HELD(BUTTON_RIGHT) && climber.x < SCREENWIDTH - climber.width) 
        climber.x += climber.dx;
}

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
    climber.stronger = 0;
    collectedHolds = 0;
    initBoulders();
    initHolds();
}

/*
 * Function to:
 * (1) Check holds in order based on y positioning
 * (largest val / bottom first) to simulate real bouldering.
 * Only the hold at index [collectedHolds] is able for collision detection.
 * So, when it is hit, it is erased + collected, then collectedHolds increments.
 * 
 * (2) Win condition for a single level / round
 */ 
int checkWinCondition() {
    if (collectedHolds < HOLDCOUNT) {
        if (collision(climber.x + 5, climber.y, 16, 28, holds[collectedHolds].x + 12, holds[collectedHolds].y,
            holds[collectedHolds].width - 28, holds[collectedHolds].height - 20)) {
            drawRect4(holds[collectedHolds].x, holds[collectedHolds].y,
                      holds[collectedHolds].width, holds[collectedHolds].height, BG_COLOR);
            holds[collectedHolds].active = 0;
            score += holds[collectedHolds].points;
            collectedHolds++;
        }
    }

    /*
     * Changea the image of the climber after they have ONE more 
     * hold left.
     */
    if (collectedHolds == HOLDCOUNT - 1) {
        climber.stronger = 1;
    }

    if (collectedHolds == HOLDCOUNT) {
        // reset the game for the next level / round.
        collectedHolds = 0;
        climber.x = 100;
        climber.y = 120;
        // save high score
        highScore = (score > highScore) ? score : highScore;
        // original image
        climber.stronger = 0;
        initBoulders();
        initHolds();
        gameRound++;
        return 1;
    }
    return 0;
}


// Update game
void updateGame() {
    updateClimber();
    if (checkWinCondition()) {
        goToLevelUp();
        return;
    }

    updateBoulders();
    // Collision with boulders == a loss
    if (checkBoulderCollision(climber.x + 5, climber.y, 16, 32)) {
        highScore = (score > highScore) ? score : highScore;
        goToLose();
    }
}

// Draw game
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
    drawHolds();
    
    waitForVBlank();
}

// Draw climber
void drawClimber() {
    // Draw the stronger version of climber when they have one more hold left
    if (climber.stronger == 1) {
        DMANow(3, (volatile void*)strongerPal, BG_PALETTE, 256 | DMA_16);
        drawImage4(climber.x, climber.y, climber.width, climber.height, (const u8*)strongerBitmap, strongerBitmap[0]);
    // Draw the normal version of climber
    } else {
        DMANow(3, (volatile void*)climberPal, BG_PALETTE, 256 | DMA_16);
        drawImage4(climber.x, climber.y, climber.width, climber.height, 
                   (const u8*)climberBitmap, climberBitmap[0]);
    }
}
