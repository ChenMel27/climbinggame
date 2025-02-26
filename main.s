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
.LC0:
	.ascii	"Train like Adam Ondra\000"
	.align	2
.LC1:
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
	.word	.LC0
	.word	.LC1
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
	ldr	r3, .L33
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L33+4
	moveq	r2, #100663296
	mov	r0, #2
	ldr	r1, .L33+8
	str	r2, [r1]
	ldrh	r2, [r3]
	ldr	r1, .L33+12
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	pop	{r4, lr}
	str	r0, [r1]
	bx	lr
.L34:
	.align	2
.L33:
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
	ldr	r3, .L44
	mov	lr, pc
	bx	r3
	ldr	r3, .L44+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L44+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L44+12
	moveq	r2, #100663296
	ldr	r1, .L44+16
	str	r2, [r1]
	ldrh	r2, [r3]
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, .L44+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L35
	ldr	r3, .L44+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L43
.L35:
	pop	{r4, lr}
	bx	lr
.L43:
	pop	{r4, lr}
	b	goToPause
.L45:
	.align	2
.L44:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	100704256
	.word	videoBuffer
	.word	oldButtons
	.word	buttons
	.size	game, .-game
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
	ldr	r3, .L58
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L58+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L47
	ldr	r2, .L58+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L56
.L47:
	tst	r3, #4
	beq	.L46
	ldr	r3, .L58+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L57
.L46:
	pop	{r4, lr}
	bx	lr
.L56:
	pop	{r4, lr}
	b	goToGame
.L57:
	pop	{r4, lr}
	b	goToStart
.L59:
	.align	2
.L58:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"WIN! Press START to continue\000"
	.text
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L64
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L64+4
	moveq	r2, #100663296
	mov	lr, #3
	ldr	r1, .L64+8
	str	r2, [r1]
	ldrh	r2, [r3]
	ldr	ip, .L64+12
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	mov	r1, #80
	mov	r3, #1
	mov	r0, #50
	ldr	r2, .L64+16
	ldr	r5, .L64+20
	str	lr, [ip]
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	waitForVBlank
	.word	100704256
	.word	videoBuffer
	.word	state
	.word	.LC2
	.word	drawString4
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
	ldr	r3, .L72
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L72+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L66
	ldr	r3, .L72+8
	ldrh	r3, [r3]
	tst	r3, #8
	moveq	r2, #1
	ldreq	r3, .L72+12
	streq	r2, [r3]
.L66:
	pop	{r4, lr}
	bx	lr
.L73:
	.align	2
.L72:
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
	ldr	r3, .L78
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L78+4
	moveq	r2, #100663296
	mov	r0, #4
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
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L89
	mov	lr, pc
	bx	r3
	ldr	r3, .L89+4
	mov	r0, #31
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L89+8
	moveq	r2, #100663296
	ldr	r1, .L89+12
	str	r2, [r1]
	ldrh	r2, [r3]
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, .L89+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L80
	ldr	r3, .L89+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L88
.L80:
	pop	{r4, lr}
	bx	lr
.L88:
	pop	{r4, lr}
	b	goToStart
.L90:
	.align	2
.L89:
	.word	waitForVBlank
	.word	fillScreen4
	.word	100704256
	.word	videoBuffer
	.word	oldButtons
	.word	buttons
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
	ldr	r3, .L103
	mov	lr, pc
	bx	r3
	ldr	r6, .L103+4
	ldr	r7, .L103+8
	ldr	r5, .L103+12
	ldr	fp, .L103+16
	ldr	r10, .L103+20
	ldr	r9, .L103+24
	ldr	r8, .L103+28
	ldr	r4, .L103+32
.L92:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L93:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L93
.L95:
	.word	.L99
	.word	.L98
	.word	.L97
	.word	.L96
	.word	.L94
.L94:
	ldr	r3, .L103+36
	mov	lr, pc
	bx	r3
	b	.L92
.L96:
	mov	lr, pc
	bx	r8
	b	.L92
.L97:
	mov	lr, pc
	bx	r9
	b	.L92
.L98:
	mov	lr, pc
	bx	r10
	b	.L92
.L99:
	mov	lr, pc
	bx	fp
	b	.L92
.L104:
	.align	2
.L103:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.word	lose
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
	ldr	r2, .L108
	moveq	r2, #100663296
	ldr	r1, .L108+4
	str	r2, [r1]
	ldrh	r2, [r3]
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	bx	lr
.L109:
	.align	2
.L108:
	.word	100704256
	.word	videoBuffer
	.size	flipPage, .-flipPage
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	buffer,41,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
