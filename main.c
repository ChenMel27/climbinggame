#include <stdlib.h>
#include <stdio.h>
#include "gba.h"
#include "mode4.h"
#include "start.h"
#include "game.h"
#include "boulder.h"
#include "losebg.h"
#include "climber.h"

void initialize();
void goToStart();
void start();
void goToGame();
void resumeGame();
void game();
void goToPause();
void pause();
void goToLevelUp();
void levelUp();
void goToWin();
void win();
void goToLose();
void lose();
void scoreboard();
void flipPage();

char buffer[41];

// In game.c
extern int score;
extern int highScore;

// Game states
enum {
    START,
    GAME,
    PAUSE,
    // Increase rounds
    LEVEL_UP,
    WIN,
    LOSE,
    // Extra credit highest score
    SCOREBOARD
};
int state;

unsigned short buttons;
unsigned short oldButtons;

#define BG_COLOR 10
#define TEXT_COLOR 1

int main() {
    initialize();
    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;
        switch (state) {
            case START: start(); break;
            case GAME: game(); break;
            case PAUSE: pause(); break;
            case LEVEL_UP: levelUp(); break;
            case WIN: win(); break;
            case LOSE: lose(); break;
            case SCOREBOARD: scoreboard(); break;
        }
    }
}

void initialize() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
    buttons = REG_BUTTONS;
    oldButtons = 0;
    initGame();
    
    // Go to start
    goToStart();
}

void goToStart() {
    // Reset game
    score = 0;
    resetGame();
    
    // Mountain start screen (load pal and display)
    DMANow(3, (volatile void*)startPal, BG_PALETTE, 256 | DMA_ON);
    drawFullscreenImage4(startBitmap);

    // Text
    drawString4(10, 20, "Train like Adam Ondra", WHITE);
    drawString4(10, 50, "On belay?", WHITE);

    waitForVBlank();
    flipPage();

    state = START;
}

void start() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        fillScreen4(BLACK);
        flipPage();
        goToGame();
    }
}

void scoreboard() {
    char buffer[41];
    fillScreen4(BLACK);
    
    // Show score board
    sprintf(buffer, "Score: %d", score);
    drawString4(10, 10, buffer, WHITE);
    sprintf(buffer, "High Score: %d", highScore);
    drawString4(10, 30, buffer, WHITE);
    drawString4(10, 50, "Press START to play again", WHITE);
    
    waitForVBlank();
    flipPage();
    
    // Go to game if start is pressed
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
}

void goToGame() {
    waitForVBlank();
    fillScreen4(BLACK);
    flipPage();
    initGame();
    state = GAME;
}

// Resumes the game from pause AND / level up without resetting game variables.
void resumeGame() {
    waitForVBlank();
    flipPage();
    state = GAME;
}

void game() {
    updateGame();
    drawGame();
    waitForVBlank();
    flipPage();
    
    if (0) {
        goToLevelUp();
    }
    
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();  // Pause the game when START is pressed.
    }
}

void goToPause() {
    waitForVBlank();
    flipPage();
    state = PAUSE;
}

void pause() {
    fillScreen4(BLACK);
    drawString4(80, 60, "Paused", WHITE);
    waitForVBlank();
    flipPage();
    
    // In pause u can resumes the game.
    if (BUTTON_PRESSED(BUTTON_START)) {
        resumeGame();
    }
    // No scoreboard transition from pause.
}

void goToLevelUp() {
    waitForVBlank();
    flipPage();
    state = LEVEL_UP;
}

void levelUp() {
    waitForVBlank();
    fillScreen4(BLACK);
    drawString4(10, 80, "Flashed! Press START for the next round.", WHITE);
    flipPage();

    if (BUTTON_PRESSED(BUTTON_START)) {
        resumeGame();
    }
}

void goToWin() {
    waitForVBlank();
    flipPage();
    state = WIN;
    waitForVBlank();
}

void win() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
         state = GAME;
    }
}

void goToLose() {
    waitForVBlank();
    flipPage();
    state = LOSE;
}

void lose() {
    // fixed position for the falling animation
    const int fallPositions[3] = { 10, 60, 100 };
    // Frame count for each animations
    const int delayFrames = 15;

    // Index the array of fall position
    static int loseAnimationFrame = 0;
    // Track the frames per animations
    static int loseAnimationTimer = 0;

    loseAnimationTimer++;
    if (loseAnimationTimer >= delayFrames) {
        loseAnimationTimer = 0;
        if (loseAnimationFrame < 2) {
            loseAnimationFrame++;
        }
    }
    // Draw the lose bg.
    DMANow(3, (volatile void*)climberPal, BG_PALETTE, 256 | DMA_ON);
    drawFullscreenImage4(losebgBitmap);
    
    // Draw the falling climber
    if (loseAnimationFrame < 3) {
        climber.y = fallPositions[loseAnimationFrame];
        drawClimber();
        drawString4(10, 80, "You fell! Press START", WHITE);
    }
    
    waitForVBlank();
    flipPage();
    
    // When START is pressed go to scoreboard.
    if (BUTTON_PRESSED(BUTTON_START)) {
        loseAnimationFrame = 0;
        loseAnimationTimer = 0;
        state = SCOREBOARD;
    }
}

// Page flipping
void flipPage() {
    if (REG_DISPCTL & DISP_BACKBUFFER) {
        videoBuffer = BACKBUFFER;
    } else {
        videoBuffer = FRONTBUFFER;
    }
    REG_DISPCTL ^= DISP_BACKBUFFER;
}
