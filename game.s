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
	mov	r1, #1
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
	adds	r3, r3, #1
	bmi	.L12
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
	push	{r4, r5, r6, lr}
	mov	r1, #120
	mov	r2, #32
	mov	r0, #100
	mov	r4, #1
	ldr	r3, .L17
	ldr	r5, .L17+4
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r0, [r3]
	str	r0, [r3, #8]
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	mov	lr, pc
	bx	r5
	ldr	r3, .L17+8
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L17+12
	ldr	r1, .L17+16
	str	r2, [r3, #4]
	str	r4, [r1]
	str	r2, [r3, #8]
	pop	{r4, r5, r6, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	climber
	.word	initBoulders
	.word	initHolds
	.word	.LANCHOR0
	.word	.LANCHOR1
	.size	initGame, .-initGame
	.align	2
	.global	resetGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetGame, %function
resetGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	ip, #120
	mov	lr, #100
	mov	r0, #0
	ldr	r3, .L21
	ldr	r1, .L21+4
	ldr	r2, .L21+8
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r1, #4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L21+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	climber
	.word	.LANCHOR0
	.word	initBoulders
	.word	initHolds
	.size	resetGame, .-resetGame
	.align	2
	.global	checkWinCondition
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkWinCondition, %function
checkWinCondition:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L31
	ldr	r3, [r4, #4]
	cmp	r3, #3
	sub	sp, sp, #16
	ble	.L29
.L24:
	cmp	r3, #4
	movne	r0, #0
	beq	.L30
.L23:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	ldr	r5, .L31+4
	rsb	r3, r3, r3, lsl #3
	add	r0, r5, r3, lsl #2
	ldr	r1, [r5, r3, lsl #2]
	ldr	r2, [r0, #12]
	ldr	r3, [r0, #8]
	ldr	lr, [r0, #4]
	ldr	ip, .L31+8
	add	r1, r1, #12
	sub	r2, r2, #20
	sub	r3, r3, #28
	ldr	r0, [ip]
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	str	r1, [sp]
	str	lr, [sp, #4]
	mov	r3, #28
	mov	r2, #16
	ldr	r1, [ip, #4]
	ldr	r6, .L31+12
	add	r0, r0, #5
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L25
	ldr	r3, [r4, #4]
	cmp	r3, #4
	movne	r0, #0
	bne	.L23
.L30:
	mov	ip, #0
	mov	r0, #100
	mov	r1, #120
	ldr	r3, .L31+8
	ldr	r2, .L31+16
	stm	r3, {r0, r1}
	str	ip, [r4, #4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L31+20
	mov	lr, pc
	bx	r3
	mov	r0, #1
	ldr	r2, .L31+24
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	mov	ip, #239
	ldr	r3, [r4, #4]
	rsb	r3, r3, r3, lsl #3
	add	r1, r5, r3, lsl #2
	ldr	r0, [r5, r3, lsl #2]
	ldr	r6, .L31+28
	ldmib	r1, {r1, r2, r3}
	str	ip, [sp]
	mov	lr, pc
	bx	r6
	mov	r1, #0
	ldr	r3, [r4, #4]
	rsb	r2, r3, r3, lsl #3
	add	r5, r5, r2, lsl #2
	ldr	r0, [r4, #8]
	ldr	r2, [r5, #24]
	add	r3, r3, #1
	add	r2, r2, r0
	str	r3, [r4, #4]
	str	r1, [r5, #16]
	str	r2, [r4, #8]
	b	.L24
.L32:
	.align	2
.L31:
	.word	.LANCHOR0
	.word	holds
	.word	climber
	.word	collision
	.word	initBoulders
	.word	initHolds
	.word	.LANCHOR1
	.word	drawRect4
	.size	checkWinCondition, .-checkWinCondition
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
	bl	checkWinCondition
	cmp	r0, #0
	bne	.L40
	ldr	r3, .L42
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+4
	ldm	r3, {r0, r1}
	mov	r2, #16
	mov	r3, #32
	ldr	r4, .L42+8
	add	r0, r0, #5
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L41
	pop	{r4, lr}
	bx	lr
.L41:
	ldr	r3, .L42+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L40:
	ldr	r3, .L42+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	updateBoulders
	.word	climber
	.word	checkBoulderCollision
	.word	goToLose
	.word	goToWin
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
	ldr	r1, .L46
	ldr	r4, .L46+4
	mov	lr, pc
	bx	r4
	ldr	r3, .L46+8
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r0, .L46+12
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r0, #24
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r4, .L46+16
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	climberPal
	.word	DMANow
	.word	climberBitmap
	.word	climber
	.word	drawImage4
	.size	drawClimber, .-drawClimber
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Score: %d\000"
	.align	2
.LC1:
	.ascii	"Round: %d\000"
	.text
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #239
	sub	sp, sp, #40
	ldr	r3, .L50
	mov	lr, pc
	bx	r3
	ldr	r3, .L50+4
	ldr	r4, .L50+8
	ldr	r2, [r3, #8]
	mov	r0, sp
	ldr	r1, .L50+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L50+16
	ldr	r1, .L50+20
	ldr	r2, [r3]
	add	r0, sp, #20
	mov	lr, pc
	bx	r4
	mov	r1, #5
	mov	r2, sp
	mov	r0, r1
	ldr	r4, .L50+24
	mov	r3, #255
	mov	lr, pc
	bx	r4
	mov	r1, #15
	mov	r0, #5
	add	r2, sp, #20
	mov	r3, #255
	mov	lr, pc
	bx	r4
	bl	drawClimber
	ldr	r3, .L50+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L50+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L50+36
	mov	lr, pc
	bx	r3
	add	sp, sp, #40
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	fillScreen4
	.word	.LANCHOR0
	.word	sprintf
	.word	.LC0
	.word	.LANCHOR1
	.word	.LC1
	.word	drawString4
	.word	drawBoulders
	.word	drawHolds
	.word	waitForVBlank
	.size	drawGame, .-drawGame
	.global	frameCounter
	.global	collectedHolds
	.global	gameRound
	.global	score
	.comm	climber,32,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	gameRound, %object
	.size	gameRound, 4
gameRound:
	.word	1
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	frameCounter, %object
	.size	frameCounter, 4
frameCounter:
	.space	4
	.type	collectedHolds, %object
	.size	collectedHolds, 4
collectedHolds:
	.space	4
	.type	score, %object
	.size	score, 4
score:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
