#ifndef GAME_H
#define GAME_H

#include "boulder.h"
#include "hold.h"
#define BLOCKCOUNT 30

extern int score;
extern int gameRound;

typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int dx;
    int dy;
    int width;
    int height;
    int stronger;
} CLIMBER;
extern CLIMBER climber;
void drawClimber();
void resetGame();
int checkWinCondition();
void initGame();
void updateGame();
void drawGame();
void initClimber();
void updateClimber();

#endif
