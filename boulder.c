#include "boulder.h"
#include "mode4.h"
#include "gba.h"
#include "game.h"  // ✅ Include game.h to access climber and game state

BOULDER boulders[BOULDERCOUNT];  // ✅ Define boulders array

// ----------------------------------------
// Initialize Boulders
// ----------------------------------------
void initBoulders() {
    for (int i = 0; i < BOULDERCOUNT; i++) {
        boulders[i].x = rand() % SCREENWIDTH;
        boulders[i].y = rand() % 30;  // Start near the top
        boulders[i].dx = 0;
        boulders[i].dy = 1 + (rand() % 2);  // Random speed
        boulders[i].width = 3;
        boulders[i].height = 3;
        boulders[i].color = RGB(13,13,13);  // Different color index
    }
}

// ----------------------------------------
// Update Boulders & Check for Collision
// ----------------------------------------
void updateBoulders() {
    for (int i = 0; i < BOULDERCOUNT; i++) {
        boulders[i].y += boulders[i].dy;

        // ✅ Check if boulder collides with climber
        if (checkBoulderCollision(climber.x + 5, climber.y, 16, 32)) {
            goToLose();  // ✅ Transition to lose state
            return;  // Stop checking further
        }

        // Reset boulder if it reaches the bottom
        if (boulders[i].y > SCREENHEIGHT) {
            boulders[i].y = 0;
            boulders[i].x = rand() % SCREENWIDTH;
        }
    }
}

// ----------------------------------------
// Check Collision with Climber
// ----------------------------------------
int checkBoulderCollision(int x, int y, int width, int height) {
    for (int i = 0; i < BOULDERCOUNT; i++) {
        if (x < boulders[i].x + boulders[i].width &&
            x + width > boulders[i].x &&
            y < boulders[i].y + boulders[i].height &&
            y + height > boulders[i].y) {
            return 1;  // ✅ Collision detected
        }
    }
    return 0;
}

// ----------------------------------------
// Draw Boulders
// ----------------------------------------
void drawBoulders() {
    for (int i = 0; i < BOULDERCOUNT; i++) {
        drawRect4(boulders[i].x, boulders[i].y, boulders[i].width, boulders[i].height, boulders[i].color);
    }
}
