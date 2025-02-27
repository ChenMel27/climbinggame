	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"Train like Adam Ondra\000"
	.align	2
.LC2:
	.ascii	"On belay?\000"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #0
	ldr	r2, .L6
	ldr	r3, .L6+4
	str	r4, [r2]
	ldr	r5, .L6+8
	mov	lr, pc
	bx	r3
	mov	r2, #83886080
	ldr	r1, .L6+12
	mov	r0, #3
	ldr	r3, .L6+16
	mov	lr, pc
	bx	r5
	ldr	r0, .L6+20
	ldr	r3, .L6+24
	mov	lr, pc
	bx	r3
	ldr	r5, .L6+28
	mov	r3, #255
	mov	r1, #20
	mov	r0, #10
	ldr	r2, .L6+32
	mov	lr, pc
	bx	r5
	mov	r1, #50
	ldr	r2, .L6+36
	mov	r3, #255
	mov	r0, #10
	mov	lr, pc
	bx	r5
	ldr	r3, .L6+40
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L6+44
	moveq	r2, #100663296
	ldr	r1, .L6+48
	str	r2, [r1]
	ldrh	r2, [r3]
	ldr	r1, .L6+52
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	str	r4, [r1]
	pop	{r4, r5, r6, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	score
	.word	resetGame
	.word	DMANow
	.word	startPal
	.word	-2147483392
	.word	startBitmap
	.word	drawFullscreenImage4
	.word	drawString4
	.word	.LC1
	.word	.LC2
	.word	waitForVBlank
	.word	100704256
	.word	videoBuffer
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #0
	ldr	r0, .L10
	push	{r4, lr}
	ldr	r3, .L10+4
	strh	r0, [r2]	@ movhi
	ldr	r0, .L10+8
	ldrh	ip, [r3, #48]
	ldr	r2, .L10+12
	ldr	r3, .L10+16
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L11:
	.align	2
.L10:
	.word	1044
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	initGame
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L16
	mov	lr, pc
	bx	r3
	mov	r0, #0
	ldr	r3, .L16+4
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L16+8
	moveq	r2, #100663296
	ldr	r1, .L16+12
	str	r2, [r1]
	ldrh	r2, [r3]
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, .L16+16
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L16+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	waitForVBlank
	.word	fillScreen4
	.word	100704256
	.word	videoBuffer
	.word	initGame
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L27
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L18
	ldr	r3, .L27+8
	ldrh	r0, [r3]
	ands	r0, r0, #8
	beq	.L26
.L18:
	pop	{r4, lr}
	bx	lr
.L26:
	ldr	r3, .L27+12
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L27+16
	moveq	r2, #100663296
	ldr	r1, .L27+20
	str	r2, [r1]
	ldrh	r2, [r3]
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	pop	{r4, lr}
	b	goToGame
.L28:
	.align	2
.L27:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	fillScreen4
	.word	100704256
	.word	videoBuffer
	.size	start, .-start
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"Score: %d\000"
	.align	2
.LC4:
	.ascii	"High Score: %d\000"
	.align	2
.LC5:
	.ascii	"Press START to play again\000"
	.text
	.align	2
	.global	scoreboard
	.syntax unified
	.arm
	.fpu softvfp
	.type	scoreboard, %function
scoreboard:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r0, #0
	sub	sp, sp, #52
	ldr	r3, .L38
	mov	lr, pc
	bx	r3
	ldr	r3, .L38+4
	ldr	r1, .L38+8
	ldr	r2, [r3]
	ldr	r5, .L38+12
	add	r0, sp, #4
	mov	lr, pc
	bx	r5
	mov	r1, #10
	ldr	r4, .L38+16
	mov	r0, r1
	mov	r3, #255
	add	r2, sp, #4
	mov	lr, pc
	bx	r4
	ldr	r3, .L38+20
	ldr	r1, .L38+24
	ldr	r2, [r3]
	add	r0, sp, #4
	mov	lr, pc
	bx	r5
	mov	r3, #255
	mov	r1, #30
	mov	r0, #10
	add	r2, sp, #4
	mov	lr, pc
	bx	r4
	mov	r1, #50
	ldr	r2, .L38+28
	mov	r3, #255
	mov	r0, #10
	mov	lr, pc
	bx	r4
	ldr	r3, .L38+32
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L38+36
	moveq	r2, #100663296
	ldr	r1, .L38+40
	str	r2, [r1]
	ldrh	r2, [r3]
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, .L38+44
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L29
	ldr	r3, .L38+48
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L37
.L29:
	add	sp, sp, #52
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L37:
	bl	goToGame
	add	sp, sp, #52
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	fillScreen4
	.word	score
	.word	.LC3
	.word	sprintf
	.word	drawString4
	.word	highScore
	.word	.LC4
	.word	.LC5
	.word	waitForVBlank
	.word	100704256
	.word	videoBuffer
	.word	oldButtons
	.word	buttons
	.size	scoreboard, .-scoreboard
	.align	2
	.global	resumeGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	resumeGame, %function
resumeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L44
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L44+4
	moveq	r2, #100663296
	mov	r0, #1
	ldr	r1, .L44+8
	str	r2, [r1]
	ldrh	r2, [r3]
	ldr	r1, .L44+12
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	pop	{r4, lr}
	str	r0, [r1]
	bx	lr
.L45:
	.align	2
.L44:
	.word	waitForVBlank
	.word	100704256
	.word	videoBuffer
	.word	state
	.size	resumeGame, .-resumeGame
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L50
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L50+4
	moveq	r2, #100663296
	mov	r0, #2
	ldr	r1, .L50+8
	str	r2, [r1]
	ldrh	r2, [r3]
	ldr	r1, .L50+12
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	pop	{r4, lr}
	str	r0, [r1]
	bx	lr
.L51:
	.align	2
.L50:
	.word	waitForVBlank
	.word	100704256
	.word	videoBuffer
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L61
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L61+12
	moveq	r2, #100663296
	ldr	r1, .L61+16
	str	r2, [r1]
	ldrh	r2, [r3]
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, .L61+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L52
	ldr	r3, .L61+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L60
.L52:
	pop	{r4, lr}
	bx	lr
.L60:
	pop	{r4, lr}
	b	goToPause
.L62:
	.align	2
.L61:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	100704256
	.word	videoBuffer
	.word	oldButtons
	.word	buttons
	.size	game, .-game
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"Paused\000"
	.text
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #0
	ldr	r3, .L72
	mov	lr, pc
	bx	r3
	ldr	r4, .L72+4
	mov	r1, #60
	ldr	r2, .L72+8
	mov	r3, #255
	mov	r0, #80
	mov	lr, pc
	bx	r4
	ldr	r3, .L72+12
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L72+16
	moveq	r2, #100663296
	ldr	r1, .L72+20
	str	r2, [r1]
	ldrh	r2, [r3]
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, .L72+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L63
	ldr	r3, .L72+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L71
.L63:
	pop	{r4, lr}
	bx	lr
.L71:
	pop	{r4, lr}
	b	resumeGame
.L73:
	.align	2
.L72:
	.word	fillScreen4
	.word	drawString4
	.word	.LC6
	.word	waitForVBlank
	.word	100704256
	.word	videoBuffer
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToLevelUp
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLevelUp, %function
goToLevelUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L78
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L78+4
	moveq	r2, #100663296
	mov	r0, #3
	ldr	r1, .L78+8
	str	r2, [r1]
	ldrh	r2, [r3]
	ldr	r1, .L78+12
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	pop	{r4, lr}
	str	r0, [r1]
	bx	lr
.L79:
	.align	2
.L78:
	.word	waitForVBlank
	.word	100704256
	.word	videoBuffer
	.word	state
	.size	goToLevelUp, .-goToLevelUp
	.section	.rodata.str1.4
	.align	2
.LC7:
	.ascii	"Flashed! Press START for the next round.\000"
	.text
	.align	2
	.global	levelUp
	.syntax unified
	.arm
	.fpu softvfp
	.type	levelUp, %function
levelUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L89
	mov	lr, pc
	bx	r3
	mov	r0, #0
	ldr	r3, .L89+4
	mov	lr, pc
	bx	r3
	mov	r1, #80
	mov	r3, #255
	mov	r0, r1
	ldr	r2, .L89+8
	ldr	r4, .L89+12
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L89+16
	moveq	r2, #100663296
	ldr	r1, .L89+20
	str	r2, [r1]
	ldrh	r2, [r3]
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, .L89+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L80
	ldr	r3, .L89+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L88
.L80:
	pop	{r4, lr}
	bx	lr
.L88:
	pop	{r4, lr}
	b	resumeGame
.L90:
	.align	2
.L89:
	.word	waitForVBlank
	.word	fillScreen4
	.word	.LC7
	.word	drawString4
	.word	100704256
	.word	videoBuffer
	.word	oldButtons
	.word	buttons
	.size	levelUp, .-levelUp
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L95
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L95+4
	moveq	r2, #100663296
	mov	r0, #4
	ldr	r1, .L95+8
	str	r2, [r1]
	ldrh	r2, [r3]
	ldr	r1, .L95+12
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	str	r0, [r1]
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L96:
	.align	2
.L95:
	.word	waitForVBlank
	.word	100704256
	.word	videoBuffer
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L103
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L103+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L97
	ldr	r3, .L103+8
	ldrh	r3, [r3]
	tst	r3, #8
	moveq	r2, #1
	ldreq	r3, .L103+12
	streq	r2, [r3]
.L97:
	pop	{r4, lr}
	bx	lr
.L104:
	.align	2
.L103:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L109
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L109+4
	moveq	r2, #100663296
	mov	r0, #5
	ldr	r1, .L109+8
	str	r2, [r1]
	ldrh	r2, [r3]
	ldr	r1, .L109+12
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	pop	{r4, lr}
	str	r0, [r1]
	bx	lr
.L110:
	.align	2
.L109:
	.word	waitForVBlank
	.word	100704256
	.word	videoBuffer
	.word	state
	.size	goToLose, .-goToLose
	.section	.rodata.str1.4
	.align	2
.LC8:
	.ascii	"You fell! Press START\000"
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L124
	ldr	r2, .L124+4
	ldr	r3, [r4]
	ldm	r2, {r0, r1, r2}
	add	r3, r3, #1
	sub	sp, sp, #20
	cmp	r3, #14
	add	ip, sp, #16
	stmdb	ip, {r0, r1, r2}
	strle	r3, [r4]
	ble	.L113
	mov	r2, #0
	ldr	r3, [r4, #4]
	cmp	r3, #1
	addle	r3, r3, #1
	str	r2, [r4]
	strle	r3, [r4, #4]
.L113:
	mov	r2, #83886080
	mov	r0, #3
	ldr	r3, .L124+8
	ldr	r1, .L124+12
	ldr	r5, .L124+16
	mov	lr, pc
	bx	r5
	ldr	r3, .L124+20
	ldr	r0, .L124+24
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #4]
	cmp	r3, #2
	ble	.L123
.L115:
	ldr	r3, .L124+28
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L124+32
	moveq	r2, #100663296
	ldr	r1, .L124+36
	str	r2, [r1]
	ldrh	r2, [r3]
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, .L124+40
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L111
	ldr	r3, .L124+44
	ldrh	r3, [r3]
	ands	r3, r3, #8
	moveq	r1, #6
	ldreq	r2, .L124+48
	streq	r3, [r4, #4]
	streq	r3, [r4]
	streq	r1, [r2]
.L111:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L123:
	add	r2, sp, #16
	add	r3, r2, r3, lsl #2
	ldr	r1, [r3, #-12]
	ldr	r2, .L124+52
	ldr	r3, .L124+56
	str	r1, [r2, #4]
	ldr	r5, .L124+60
	mov	lr, pc
	bx	r3
	mov	r3, #255
	mov	r1, #80
	mov	r0, #10
	ldr	r2, .L124+64
	mov	lr, pc
	bx	r5
	b	.L115
.L125:
	.align	2
.L124:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	-2147483392
	.word	climberPal
	.word	DMANow
	.word	drawFullscreenImage4
	.word	losebgBitmap
	.word	waitForVBlank
	.word	100704256
	.word	videoBuffer
	.word	oldButtons
	.word	buttons
	.word	state
	.word	climber
	.word	drawClimber
	.word	drawString4
	.word	.LC8
	.size	lose, .-lose
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L140
	mov	lr, pc
	bx	r3
	ldr	r6, .L140+4
	ldr	r7, .L140+8
	ldr	r5, .L140+12
	ldr	fp, .L140+16
	ldr	r10, .L140+20
	ldr	r9, .L140+24
	ldr	r8, .L140+28
	ldr	r4, .L140+32
.L127:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L128:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L128
.L130:
	.word	.L136
	.word	.L135
	.word	.L134
	.word	.L133
	.word	.L132
	.word	.L131
	.word	.L129
.L129:
	ldr	r3, .L140+36
	mov	lr, pc
	bx	r3
	b	.L127
.L131:
	ldr	r3, .L140+40
	mov	lr, pc
	bx	r3
	b	.L127
.L132:
	ldr	r3, .L140+44
	mov	lr, pc
	bx	r3
	b	.L127
.L133:
	mov	lr, pc
	bx	r8
	b	.L127
.L134:
	mov	lr, pc
	bx	r9
	b	.L127
.L135:
	mov	lr, pc
	bx	r10
	b	.L127
.L136:
	mov	lr, pc
	bx	fp
	b	.L127
.L141:
	.align	2
.L140:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	levelUp
	.word	67109120
	.word	scoreboard
	.word	lose
	.word	win
	.size	main, .-main
	.text
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L145
	moveq	r2, #100663296
	ldr	r1, .L145+4
	str	r2, [r1]
	ldrh	r2, [r3]
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	bx	lr
.L146:
	.align	2
.L145:
	.word	100704256
	.word	videoBuffer
	.size	flipPage, .-flipPage
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	buffer,41,4
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.word	10
	.word	60
	.word	100
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	loseAnimationTimer.5259, %object
	.size	loseAnimationTimer.5259, 4
loseAnimationTimer.5259:
	.space	4
	.type	loseAnimationFrame.5258, %object
	.size	loseAnimationFrame.5258, 4
loseAnimationFrame.5258:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
