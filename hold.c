#include "hold.h"
#include "mode4.h"
#include "gba.h"
#include "pinch.h"
#include "crimp.h"
#include "jug.h"
#include "sloper.h"
#include <stdlib.h>  // For rand()

// Note: To allow hold.c to know the current sequential index,
// add the following line in hold.h:
//   extern int collectedHolds;

HOLD holds[HOLDCOUNT];
extern int collectedHolds;

// ----------------------------------------
// Initialize Holds (Assuming HOLDCOUNT is 6)
// ----------------------------------------
// All holds are set to active so that they are drawn.
// Their Y-positions are preset so that index 0 is at the bottom.
void initHolds() {
    int presetYValues[HOLDCOUNT] = {125, 100, 80, 60, 25, 10};

    for (int i = 0; i < HOLDCOUNT; i++) {
        holds[i].x = rand() % (SCREENWIDTH - 32);
        holds[i].y = presetYValues[i];
        holds[i].width = 32;
        holds[i].height = 32;
        holds[i].active = 1;  // All holds start active.
        holds[i].type = rand() % 4;
        if (holds[i].type == PINCH)
            holds[i].points = 5;
        else if (holds[i].type == CRIMP)
            holds[i].points = 10;
        else if (holds[i].type == JUG)
            holds[i].points = 15;
        else if (holds[i].type == SLOPER)
            holds[i].points = 20;
    }
    

    // Load all hold palettes.
    DMANow(3, (volatile void*)pinchPal, BG_PALETTE, 256 | DMA_ON);
    DMANow(3, (volatile void*)crimpPal, BG_PALETTE, 256 | DMA_ON);
    DMANow(3, (volatile void*)jugPal, BG_PALETTE, 256 | DMA_ON);
    DMANow(3, (volatile void*)sloperPal, BG_PALETTE, 256 | DMA_ON);
}

// ----------------------------------------
// Draw Holds
// ----------------------------------------
// Draw every hold whose index is not less than collectedHolds so that
// holds are collected sequentially (from bottom to top).
void drawHolds() {
    for (int i = 0; i < HOLDCOUNT; i++) {
        // Skip holds that have already been collected.
        if (i < collectedHolds)
            continue;
            
        const unsigned short *sprite;
        int width = 32, height = 32;
        if (holds[i].type == PINCH)
            sprite = pinchBitmap;
        else if (holds[i].type == CRIMP)
            sprite = crimpBitmap;
        else if (holds[i].type == JUG)
            sprite = jugBitmap;
        else
            sprite = sloperBitmap;

        drawImage4(holds[i].x, holds[i].y, width, height, (const u8*)sprite, BLACK);
    }
}
