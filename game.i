# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1



# 1 "boulder.h" 1



# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;






extern volatile unsigned short* videoBuffer;
# 51 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 70 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 104 "gba.h"
void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl);
# 5 "boulder.h" 2





typedef struct {
    int x, y;
    int oldX, oldY;
    int dx, dy;
    int width, height;
    unsigned short color;
} BOULDER;
# 28 "boulder.h"
extern BOULDER boulders[5];





void initBoulders();
void updateBoulders();
void drawBoulders();
int checkBoulderCollision(int x, int y, int width, int height);
# 5 "game.h" 2
# 1 "hold.h" 1
# 10 "hold.h"
typedef struct {
    int x, y;
    int width, height;
    unsigned short color;
    int active;
} HOLD;
# 27 "hold.h"
extern HOLD holds[10];





void initHolds();
void updateHolds();
void drawHolds();
# 6 "game.h" 2





typedef struct {
    int x, y;
    int oldX, oldY;
    int dx, dy;
    int width, height;
} CLIMBER;
# 28 "game.h"
extern CLIMBER climber;
extern int score;





void initGame();
void updateGame();
void drawGame();

void initClimber();
void updateClimber();
void drawClimber();
# 2 "game.c" 2
# 1 "climber.h" 1
# 21 "climber.h"
extern const unsigned short climberBitmap[512];


extern const unsigned short climberPal[256];
# 3 "game.c" 2
# 1 "mode4.h" 1
# 9 "mode4.h"
void flipPages();
void setPixel4(int x, int y, u8 colorIndex);
void drawRect4(int x, int y, int width, int height, volatile u8 colorIndex);
void fillScreen4(volatile u8 colorIndex);
void drawImage4(int x, int y, int width, int height, const u8 *img, u8 transparentI);
void drawFullscreenImage4(const u16* image);

void drawChar4(int x, int y, char ch, u8 colorIndex);
void drawString4(int x, int y, char* str, u8 colorIndex);
# 4 "game.c" 2




CLIMBER climber;
int score = 0;


int frameCounter = 0;




void initClimber() {
    climber.x = 100;
    climber.y = 120;
    climber.oldX = climber.x;
    climber.oldY = climber.y;
    climber.dx = 2;
    climber.dy = 2;
    climber.width = 32;
    climber.height = 32;
}




void updateClimber() {
    frameCounter++;
    if (frameCounter < 2) return;
    frameCounter = 0;

    if ((~(buttons) & ((1 << 6))) && climber.y > 0)
        climber.y -= climber.dy;
    if ((~(buttons) & ((1 << 7))) && climber.y < 160 - climber.height)
        climber.y += climber.dy;
    if ((~(buttons) & ((1 << 5))) && climber.x > 0)
        climber.x -= climber.dx;
    if ((~(buttons) & ((1 << 4))) && climber.x < 240 - climber.width)
        climber.x += climber.dx;
}




void initGame() {
    initClimber();
    initBoulders();
    initHolds();
    score = 0;
}




void updateGame() {
    updateClimber();
    updateBoulders();
    updateHolds();
}




void drawGame() {
    fillScreen4((((10) & 31) | ((10) & 31) << 5 | ((10) & 31) << 10));
    updateClimber();
    drawClimber();
    drawBoulders();
    drawHolds();
}




void drawClimber() {
    DMANow(3, (volatile void*)climberPal, ((unsigned short*) 0x05000000), 256 | (0 << 26));
    drawImage4(climber.x, climber.y, climber.width, climber.height,
               (const u8*)climberBitmap, climberBitmap[0]);
}
