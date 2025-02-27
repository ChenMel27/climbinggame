#ifndef HOLD_H
#define HOLD_H

#include "gba.h"
#include "pinch.h"
#include "crimp.h"
#include "jug.h"
#include "sloper.h"

typedef enum {
    PINCH,
    CRIMP,
    JUG,
    SLOPER
} HoldType;

typedef struct {
    int x, y;
    int width, height;
    int active;
    HoldType type;
    // certain holds are worth more
    int points;
} HOLD;

// 4 holds at a time - can be built on top of later with levels
#define HOLDCOUNT 6

extern HOLD holds[HOLDCOUNT];
extern int collectedHolds;

void initHolds();
void drawHolds();

#endif
