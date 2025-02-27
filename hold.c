#include "hold.h"
#include "mode4.h"
#include "gba.h"
#include "pinch.h"
#include "crimp.h"
#include "jug.h"
#include "sloper.h"
#include <stdlib.h>

HOLD holds[HOLDCOUNT];
extern int collectedHolds;

// All holds are set to active to be drawn
// y-positions pre-set
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
    
    // loads hold palettes.
    DMANow(3, (volatile void*)pinchPal, BG_PALETTE, 256 | DMA_ON);
    DMANow(3, (volatile void*)crimpPal, BG_PALETTE, 256 | DMA_ON);
    DMANow(3, (volatile void*)jugPal, BG_PALETTE, 256 | DMA_ON);
    DMANow(3, (volatile void*)sloperPal, BG_PALETTE, 256 | DMA_ON);
}

// Functionality ia to draw every hold that has an 
// index that is NOT less than collectedHolds so that
// holds are collected sequentially (from bottom to top) / (largest y to
// smallest y).
void drawHolds() {
    for (int i = 0; i < HOLDCOUNT; i++) {
        // skip holds that have already been hit
        if (i < collectedHolds)
            continue;
            
        const unsigned short *sprite;
        int width = 32, height = 32;
        if (holds[i].type == PINCH) {
            sprite = pinchBitmap;
        } else if (holds[i].type == CRIMP) {
            sprite = crimpBitmap;
        } else if (holds[i].type == JUG) {
            sprite = jugBitmap;
        } else {
            sprite = sloperBitmap;
        }
        drawImage4(holds[i].x, holds[i].y, width, height, (const u8*)sprite, BLACK);
    }
}
