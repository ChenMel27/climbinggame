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
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r1, .L6
	mov	r0, #3
	ldr	r3, .L6+4
	ldr	r4, .L6+8
	mov	lr, pc
	bx	r4
	ldr	r0, .L6+12
	ldr	r3, .L6+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L6+20
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L6+24
	moveq	r2, #100663296
	mov	r0, #0
	ldr	r1, .L6+28
	str	r2, [r1]
	ldrh	r2, [r3]
	ldr	r1, .L6+32
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	pop	{r4, lr}
	str	r0, [r1]
	bx	lr
.L7:
	.align	2
.L6:
	.word	startPal
	.word	-2147483392
	.word	DMANow
	.word	startBitmap
	.word	drawFullscreenImage4
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
	ldr	r3, .L64
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L64+4
	moveq	r2, #100663296
	mov	r0, #3
	ldr	r1, .L64+8
	str	r2, [r1]
	ldrh	r2, [r3]
	ldr	r1, .L64+12
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	pop	{r4, lr}
	str	r0, [r1]
	bx	lr
.L65:
	.align	2
.L64:
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
	ldr	r3, .L73
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L73+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L66
	ldr	r3, .L73+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L72
.L66:
	pop	{r4, lr}
	bx	lr
.L72:
	pop	{r4, lr}
	b	goToStart
.L74:
	.align	2
.L73:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
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
	ldr	r3, .L86
	mov	lr, pc
	bx	r3
	ldr	r6, .L86+4
	ldr	fp, .L86+8
	ldr	r5, .L86+12
	ldr	r10, .L86+16
	ldr	r9, .L86+20
	ldr	r8, .L86+24
	ldr	r7, .L86+28
	ldr	r4, .L86+32
.L76:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L77:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L77
.L79:
	.word	.L82
	.word	.L81
	.word	.L80
	.word	.L78
	.word	.L78
.L78:
	mov	lr, pc
	bx	r7
	b	.L76
.L80:
	mov	lr, pc
	bx	r8
	b	.L76
.L81:
	mov	lr, pc
	bx	r9
	b	.L76
.L82:
	mov	lr, pc
	bx	r10
	b	.L76
.L87:
	.align	2
.L86:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.size	main, .-main
	.text
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
	ldr	r3, .L92
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L92+4
	moveq	r2, #100663296
	mov	r0, #4
	ldr	r1, .L92+8
	str	r2, [r1]
	ldrh	r2, [r3]
	ldr	r1, .L92+12
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	pop	{r4, lr}
	str	r0, [r1]
	bx	lr
.L93:
	.align	2
.L92:
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
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
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
	ldr	r2, .L98
	moveq	r2, #100663296
	ldr	r1, .L98+4
	str	r2, [r1]
	ldrh	r2, [r3]
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	bx	lr
.L99:
	.align	2
.L98:
	.word	100704256
	.word	videoBuffer
	.size	flipPage, .-flipPage
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	buffer,41,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
