#ifndef BOULDER_H
#define BOULDER_H

#include "gba.h"

// Structs
typedef struct {
    int x, y;
    int oldX, oldY;
    int dx, dy;
    int width, height;
    unsigned short color;
} BOULDER;

// Constants
#define BOULDERCOUNT 2  // Number of boulders

// Global Variables
extern BOULDER boulders[BOULDERCOUNT];

// Function Prototypes
void initBoulders();
void updateBoulders();
void drawBoulders();
int checkBoulderCollision(int x, int y, int width, int height);

#endif
