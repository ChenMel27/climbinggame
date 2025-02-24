#include "boulder.h"
#include "mode4.h"
#include "gba.h"

BOULDER boulders[BOULDERCOUNT];  // ✅ Define boulders array

void initBoulders() {
    for (int i = 0; i < BOULDERCOUNT; i++) {
        boulders[i].x = rand() % SCREENWIDTH;
        boulders[i].y = rand() % 30;  // Start near the top
        boulders[i].dx = 0;
        boulders[i].dy = 1 + (rand() % 2);  // Random speed
        boulders[i].width = 3;
        boulders[i].height = 3;
        boulders[i].color = GRAY;  // Different color index
    }
}

void updateBoulders() {
    for (int i = 0; i < BOULDERCOUNT; i++) {
        boulders[i].y += boulders[i].dy;

        // Reset boulder if it reaches the bottom
        if (boulders[i].y > SCREENHEIGHT) {
            boulders[i].y = 0;
            boulders[i].x = rand() % SCREENWIDTH;
        }
    }
}

int checkBoulderCollision(int x, int y, int width, int height) {
    for (int i = 0; i < BOULDERCOUNT; i++) {
        if (x < boulders[i].x + boulders[i].width &&
            x + width > boulders[i].x &&
            y < boulders[i].y + boulders[i].height &&
            y + height > boulders[i].y) {
            return 1;
        }
    }
    return 0;
}

void drawBoulders() {
    for (int i = 0; i < BOULDERCOUNT; i++) {
        drawRect4(boulders[i].x, boulders[i].y, boulders[i].width, boulders[i].height, boulders[i].color);
    }
}
