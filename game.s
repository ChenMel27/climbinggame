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
	.file	"game.c"
	.text
	.align	2
	.global	initClimber
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initClimber, %function
initClimber:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #100
	mov	r0, #120
	mov	r1, #2
	mov	r2, #32
	ldr	r3, .L3
	stmib	r3, {r0, ip}
	str	ip, [r3]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	bx	lr
.L4:
	.align	2
.L3:
	.word	climber
	.size	initClimber, .-initClimber
	.align	2
	.global	updateClimber
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateClimber, %function
updateClimber:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L13
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #1
	ble	.L12
	mov	r1, #0
	ldr	r3, .L13+4
	ldrh	r3, [r3]
	tst	r3, #64
	str	r1, [r2]
	bne	.L8
	ldr	r1, .L13+8
	ldr	r2, [r1, #4]
	cmp	r2, #0
	ldrgt	r0, [r1, #20]
	subgt	r2, r2, r0
	strgt	r2, [r1, #4]
.L8:
	tst	r3, #128
	bne	.L9
	ldr	r2, .L13+8
	ldr	r1, [r2, #28]
	ldr	r0, [r2, #4]
	rsb	r1, r1, #160
	cmp	r0, r1
	ldrlt	r1, [r2, #20]
	addlt	r0, r1, r0
	strlt	r0, [r2, #4]
.L9:
	tst	r3, #32
	bne	.L10
	ldr	r1, .L13+8
	ldr	r2, [r1]
	cmp	r2, #0
	ldrgt	r0, [r1, #16]
	subgt	r2, r2, r0
	strgt	r2, [r1]
.L10:
	tst	r3, #16
	bxne	lr
	ldr	r3, .L13+8
	ldr	r2, [r3, #24]
	ldr	r1, [r3]
	rsb	r2, r2, #240
	cmp	r1, r2
	ldrlt	r2, [r3, #16]
	addlt	r1, r2, r1
	strlt	r1, [r3]
	bx	lr
.L12:
	str	r3, [r2]
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.word	buttons
	.word	climber
	.size	updateClimber, .-updateClimber
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #32
	mov	ip, #100
	mov	r0, #120
	mov	r1, #2
	ldr	r3, .L17
	push	{r4, lr}
	ldr	r4, .L17+4
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	stmib	r3, {r0, ip}
	str	ip, [r3]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	mov	lr, pc
	bx	r4
	ldr	r3, .L17+8
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L17+12
	pop	{r4, lr}
	str	r2, [r3, #4]
	bx	lr
.L18:
	.align	2
.L17:
	.word	climber
	.word	initBoulders
	.word	initHolds
	.word	.LANCHOR0
	.size	initGame, .-initGame
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updateClimber
	ldr	r3, .L21
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	updateBoulders
	.word	updateHolds
	.size	updateGame, .-updateGame
	.align	2
	.global	drawClimber
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawClimber, %function
drawClimber:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	sub	sp, sp, #8
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L25
	ldr	r4, .L25+4
	mov	lr, pc
	bx	r4
	ldr	r3, .L25+8
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r0, .L25+12
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r0, #24
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r4, .L25+16
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	climberPal
	.word	DMANow
	.word	climberBitmap
	.word	climber
	.word	drawImage4
	.size	drawClimber, .-drawClimber
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #74
	ldr	r3, .L29
	mov	lr, pc
	bx	r3
	bl	updateClimber
	bl	drawClimber
	ldr	r3, .L29+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L29+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	fillScreen4
	.word	drawBoulders
	.word	drawHolds
	.size	drawGame, .-drawGame
	.global	frameCounter
	.global	score
	.comm	climber,32,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	frameCounter, %object
	.size	frameCounter, 4
frameCounter:
	.space	4
	.type	score, %object
	.size	score, 4
score:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
