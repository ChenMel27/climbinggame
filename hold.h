#ifndef HOLD_H
#define HOLD_H

#include "gba.h"
#include "pinch.h"
#include "crimp.h"
#include "jug.h"
#include "sloper.h"

// ----------------------------------------
// Structs
// ----------------------------------------

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
    int points;
} HOLD;

// ----------------------------------------
// Constants
// ----------------------------------------

#define HOLDCOUNT 4  // ✅ Ensure we are using only 4 holds

// ----------------------------------------
// Global Variables
// ----------------------------------------

extern HOLD holds[HOLDCOUNT];  // ✅ Declare `holds` properly

// ----------------------------------------
// Function Prototypes
// ----------------------------------------

void initHolds();
void updateHolds();
void drawHolds();

#endif // HOLD_H
