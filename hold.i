# 1 "hold.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "hold.c"
# 1 "hold.h" 1




typedef struct {
    int x;
    int y;
    int width, height;

    unsigned short color;

    int active;
} HOLD;





extern HOLD holds[10];


void initHolds();
void updateHolds();
void drawHolds();
# 2 "hold.c" 2
# 1 "mode4.h" 1



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
# 5 "mode4.h" 2




void flipPages();
void setPixel4(int x, int y, u8 colorIndex);
void drawRect4(int x, int y, int width, int height, volatile u8 colorIndex);
void fillScreen4(volatile u8 colorIndex);
void drawImage4(int x, int y, int width, int height, const u8 *img, u8 transparentI);
void drawFullscreenImage4(const u16* image);

void drawChar4(int x, int y, char ch, u8 colorIndex);
void drawString4(int x, int y, char* str, u8 colorIndex);
# 3 "hold.c" 2


HOLD holds[10];

void initHolds() {
    for (int i = 0; i < 10; i++) {
        holds[i].x = rand() % 240;
        holds[i].y = 40 + (i * 15);
        holds[i].width = 10;
        holds[i].height = 10;
        holds[i].active = rand() % 2;
        holds[i].color = holds[i].active ? (((0) & 31) | ((31) & 31) << 5 | ((0) & 31) << 10) : (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10);
    }
}

void updateHolds() {

}

void drawHolds() {
    for (int i = 0; i < 10; i++) {
        drawRect4(holds[i].x, holds[i].y, holds[i].width, holds[i].height, holds[i].color);
    }
}
