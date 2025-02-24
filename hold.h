#ifndef HOLD_H
#define HOLD_H

// Structs
typedef struct {
    int x;
    int y;
    int width, height;
    // Color of hold (active = green, inactive = red)
    unsigned short color;
    // 1 = Active (green), 0 = Inactive (red)
    int active;
} HOLD;

// Constants
#define HOLDCOUNT 10  // Number of holds

// Global Variables
extern HOLD holds[HOLDCOUNT];

// Function Prototypes
void initHolds();
void updateHolds();
void drawHolds();

#endif
