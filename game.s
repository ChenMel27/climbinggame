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
	str	lr, [sp, #-4]!
	mov	ip, #100
	mov	lr, #0
	mov	r0, #120
	mov	r1, #3
	mov	r2, #32
	ldr	r3, .L4
	str	lr, [r3, #32]
	str	ip, [r3]
	str	ip, [r3, #8]
	str	r0, [r3, #4]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
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
	ldr	r2, .L14
	ldr	r3, [r2]
	adds	r3, r3, #1
	bmi	.L13
	mov	r1, #0
	ldr	r3, .L14+4
	ldrh	r3, [r3]
	tst	r3, #64
	str	r1, [r2]
	bne	.L9
	ldr	r1, .L14+8
	ldr	r2, [r1, #4]
	cmp	r2, #0
	ldrgt	r0, [r1, #20]
	subgt	r2, r2, r0
	strgt	r2, [r1, #4]
.L9:
	tst	r3, #128
	bne	.L10
	ldr	r2, .L14+8
	ldr	r1, [r2, #28]
	ldr	r0, [r2, #4]
	rsb	r1, r1, #160
	cmp	r0, r1
	ldrlt	r1, [r2, #20]
	addlt	r0, r1, r0
	strlt	r0, [r2, #4]
.L10:
	tst	r3, #32
	bne	.L11
	ldr	r1, .L14+8
	ldr	r2, [r1]
	cmp	r2, #0
	ldrgt	r0, [r1, #16]
	subgt	r2, r2, r0
	strgt	r2, [r1]
.L11:
	tst	r3, #16
	bxne	lr
	ldr	r3, .L14+8
	ldr	r2, [r3, #24]
	ldr	r1, [r3]
	rsb	r2, r2, #240
	cmp	r1, r2
	ldrlt	r2, [r3, #16]
	addlt	r1, r2, r1
	strlt	r1, [r3]
	bx	lr
.L13:
	str	r3, [r2]
	bx	lr
.L15:
	.align	2
.L14:
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
	mov	r1, #3
	mov	r2, #32
	mov	ip, #100
	mov	r0, #120
	mov	r4, #0
	ldr	r3, .L18
	ldr	r5, .L18+4
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	ip, [r3]
	str	ip, [r3, #8]
	str	r0, [r3, #4]
	str	r0, [r3, #12]
	str	r4, [r3, #32]
	mov	lr, pc
	bx	r5
	ldr	r3, .L18+8
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r3, .L18+12
	ldr	r2, .L18+16
	str	r4, [r3, #4]
	str	r4, [r3, #8]
	str	r1, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L19:
	.align	2
.L18:
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
	mov	r2, #0
	mov	lr, #100
	mov	ip, #120
	ldr	r3, .L22
	ldr	r0, .L22+4
	ldr	r1, .L22+8
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r2, [r3, #32]
	str	r2, [r0, #4]
	mov	lr, pc
	bx	r1
	ldr	r3, .L22+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
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
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L33
	ldr	r3, [r4, #4]
	cmp	r3, #5
	sub	sp, sp, #20
	ble	.L31
.L25:
	cmp	r3, #6
	movne	r0, #0
	beq	.L32
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L31:
	ldr	r5, .L33+4
	rsb	r3, r3, r3, lsl #3
	add	r0, r5, r3, lsl #2
	ldr	r6, .L33+8
	ldr	r1, [r5, r3, lsl #2]
	ldr	r2, [r0, #12]
	ldr	r3, [r0, #8]
	ldr	ip, [r0, #4]
	ldr	r0, [r6]
	add	r1, r1, #12
	sub	r2, r2, #20
	sub	r3, r3, #28
	str	r1, [sp]
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	mov	r2, #16
	mov	r3, #28
	str	ip, [sp, #4]
	ldr	r1, [r6, #4]
	ldr	r7, .L33+12
	add	r0, r0, #5
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L26
	ldr	r3, [r4, #4]
.L27:
	cmp	r3, #5
	bne	.L25
	mov	r3, #1
	mov	r0, #0
	str	r3, [r6, #32]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L32:
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	cmp	r3, r2
	movlt	r3, r2
	mov	r1, #0
	mov	ip, #100
	mov	r0, #120
	ldr	r2, .L33+8
	str	r3, [r4, #12]
	ldr	r3, .L33+16
	str	r1, [r2, #32]
	str	ip, [r2]
	str	r0, [r2, #4]
	str	r1, [r4, #4]
	mov	lr, pc
	bx	r3
	ldr	r3, .L33+20
	mov	lr, pc
	bx	r3
	mov	r0, #1
	ldr	r2, .L33+24
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L26:
	mov	ip, #239
	ldr	r3, [r4, #4]
	rsb	r3, r3, r3, lsl #3
	add	r1, r5, r3, lsl #2
	ldr	r0, [r5, r3, lsl #2]
	ldr	r7, .L33+28
	ldmib	r1, {r1, r2, r3}
	str	ip, [sp]
	mov	lr, pc
	bx	r7
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
	b	.L27
.L34:
	.align	2
.L33:
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
	bne	.L42
	ldr	r3, .L44
	mov	lr, pc
	bx	r3
	ldr	r3, .L44+4
	ldm	r3, {r0, r1}
	mov	r2, #16
	mov	r3, #32
	ldr	r4, .L44+8
	add	r0, r0, #5
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L43
	pop	{r4, lr}
	bx	lr
.L43:
	ldr	r2, .L44+12
	add	r1, r2, #8
	ldm	r1, {r1, r3}
	cmp	r3, r1
	movlt	r3, r1
	ldr	r1, .L44+16
	str	r3, [r2, #12]
	mov	lr, pc
	bx	r1
	pop	{r4, lr}
	bx	lr
.L42:
	ldr	r3, .L44+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	updateBoulders
	.word	climber
	.word	checkBoulderCollision
	.word	.LANCHOR0
	.word	goToLose
	.word	goToLevelUp
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
	push	{r4, r5, lr}
	ldr	r4, .L52
	ldr	r3, [r4, #32]
	cmp	r3, #1
	mov	r2, #83886080
	mov	r3, #256
	sub	sp, sp, #12
	beq	.L51
	mov	r0, #3
	ldr	r1, .L52+4
	ldr	r5, .L52+8
	mov	lr, pc
	bx	r5
	ldr	r3, .L52+12
.L50:
	ldrb	r2, [r3]	@ zero_extendqisi2
	str	r3, [sp]
	str	r2, [sp, #4]
	add	r2, r4, #24
	ldm	r4, {r0, r1}
	ldm	r2, {r2, r3}
	ldr	r4, .L52+16
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L51:
	mov	r0, #3
	ldr	r1, .L52+20
	ldr	r5, .L52+8
	mov	lr, pc
	bx	r5
	ldr	r3, .L52+24
	b	.L50
.L53:
	.align	2
.L52:
	.word	climber
	.word	climberPal
	.word	DMANow
	.word	climberBitmap
	.word	drawImage4
	.word	strongerPal
	.word	strongerBitmap
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
	ldr	r3, .L56
	mov	lr, pc
	bx	r3
	ldr	r3, .L56+4
	ldr	r4, .L56+8
	ldr	r2, [r3, #8]
	mov	r0, sp
	ldr	r1, .L56+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L56+16
	ldr	r1, .L56+20
	ldr	r2, [r3]
	add	r0, sp, #20
	mov	lr, pc
	bx	r4
	mov	r1, #5
	mov	r2, sp
	mov	r0, r1
	ldr	r4, .L56+24
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
	ldr	r3, .L56+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L56+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L56+36
	mov	lr, pc
	bx	r3
	add	sp, sp, #40
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L57:
	.align	2
.L56:
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
	.global	highScore
	.global	score
	.comm	climber,36,4
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
	.type	highScore, %object
	.size	highScore, 4
highScore:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
