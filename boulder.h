#ifndef BOULDER_H
#define BOULDER_H

#include "gba.h"

typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int dx;
    int dy;
    int width;
    int height;
    unsigned short color;
} BOULDER;

// The numbers of boulders on screen at a one time
#define BOULDERCOUNT 3

extern BOULDER boulders[BOULDERCOUNT];

// Function Prototypes
void initBoulders();
void updateBoulders();
void drawBoulders();
int checkBoulderCollision(int x, int y, int width, int height);

#endif
