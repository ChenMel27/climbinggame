#ifndef GAME_H
#define GAME_H

#include "boulder.h"
#include "hold.h"

// ----------------------------------------
// Structs
// ----------------------------------------

typedef struct {
    int x, y;
    int oldX, oldY;
    int dx, dy;
    int width, height;
} CLIMBER;

// ----------------------------------------
// Constants
// ----------------------------------------

#define BLOCKCOUNT 30

// ----------------------------------------
// Global Variables
// ----------------------------------------

extern CLIMBER climber;
extern int score;
extern int round;  // ✅ Track game rounds

// ----------------------------------------
// Function Prototypes
// ----------------------------------------

void initGame();
void updateGame();
void drawGame();

void initClimber();
void updateClimber();
void drawClimber();
void resetGame();
int checkWinCondition();  // ✅ New function to check if player wins the round

#endif // GAME_H
