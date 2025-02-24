# 1 "boulder.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "boulder.c"
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





extern BOULDER boulders[5];


void initBoulders();
void updateBoulders();
void drawBoulders();
int checkBoulderCollision(int x, int y, int width, int height);
# 2 "boulder.c" 2
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
# 3 "boulder.c" 2


BOULDER boulders[5];

void initBoulders() {
    for (int i = 0; i < 5; i++) {
        boulders[i].x = rand() % 240;
        boulders[i].y = rand() % 30;
        boulders[i].dx = 0;
        boulders[i].dy = 1 + (rand() % 2);
        boulders[i].width = 3;
        boulders[i].height = 3;
        boulders[i].color = (((15) & 31) | ((15) & 31) << 5 | ((15) & 31) << 10);
    }
}

void updateBoulders() {
    for (int i = 0; i < 5; i++) {
        boulders[i].y += boulders[i].dy;


        if (boulders[i].y > 160) {
            boulders[i].y = 0;
            boulders[i].x = rand() % 240;
        }
    }
}

int checkBoulderCollision(int x, int y, int width, int height) {
    for (int i = 0; i < 5; i++) {
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
    for (int i = 0; i < 5; i++) {
        drawRect4(boulders[i].x, boulders[i].y, boulders[i].width, boulders[i].height, boulders[i].color);
    }
}
