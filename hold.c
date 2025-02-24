#include "hold.h"
#include "mode4.h"
#include "gba.h"

HOLD holds[HOLDCOUNT];

void initHolds() {
    for (int i = 0; i < HOLDCOUNT; i++) {
        holds[i].x = rand() % SCREENWIDTH;
        holds[i].y = 40 + (i * 15);
        holds[i].width = 10;
        holds[i].height = 10;
        holds[i].active = rand() % 2;  // Randomly set active (1) or inactive (0)
        holds[i].color = holds[i].active ? GREEN : RED;  // Green for active, Red for inactive
    }
}

void updateHolds() {
    // Future: Logic to change holds' state based on player actions
}

void drawHolds() {
    for (int i = 0; i < HOLDCOUNT; i++) {
        drawRect4(holds[i].x, holds[i].y, holds[i].width, holds[i].height, holds[i].color);
    }
}
