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
	.file	"hold.c"
	.text
	.align	2
	.global	initHolds
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHolds, %function
initHolds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	sub	sp, sp, #24
	mov	ip, sp
	mov	r6, #32
	mov	r9, #1
	ldr	lr, .L10
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1}
	ldr	r10, .L10+4
	stm	ip, {r0, r1}
	ldr	r5, .L10+8
	ldr	r8, .L10+12
	add	r7, r10, #168
	sub	r4, sp, #4
.L6:
	mov	lr, pc
	bx	r5
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	add	r2, r3, r3, lsl #1
	add	r3, r3, r2, lsl #2
	ldr	r2, [r4, #4]!
	sub	r0, r0, r3, lsl #4
	stm	r10, {r0, r2}
	str	r6, [r10, #8]
	str	r6, [r10, #12]
	str	r9, [r10, #16]
	mov	lr, pc
	bx	r5
	rsbs	r3, r0, #0
	and	r3, r3, #3
	and	r0, r0, #3
	rsbpl	r0, r3, #0
	and	r0, r0, #255
	cmp	r0, #0
	moveq	r3, #5
	strb	r0, [r10, #20]
	streq	r3, [r10, #24]
	beq	.L3
	cmp	r0, #1
	moveq	r3, #10
	streq	r3, [r10, #24]
	beq	.L3
	cmp	r0, #2
	moveq	r3, #15
	streq	r3, [r10, #24]
	beq	.L3
	cmp	r0, #3
	moveq	r3, #20
	streq	r3, [r10, #24]
.L3:
	add	r10, r10, #28
	cmp	r10, r7
	bne	.L6
	ldr	r4, .L10+16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r3, .L10+20
	ldr	r1, .L10+24
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r3, .L10+20
	ldr	r1, .L10+28
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r3, .L10+20
	ldr	r1, .L10+32
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r3, .L10+20
	ldr	r1, .L10+36
	mov	lr, pc
	bx	r4
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	.word	holds
	.word	rand
	.word	1321528399
	.word	DMANow
	.word	-2147483392
	.word	pinchPal
	.word	crimpPal
	.word	jugPal
	.word	sloperPal
	.size	initHolds, .-initHolds
	.align	2
	.global	drawHolds
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHolds, %function
drawHolds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, #0
	mov	r8, r4
	ldr	r5, .L21
	ldr	r6, .L21+4
	ldr	r7, .L21+8
	ldr	r9, .L21+12
	ldr	fp, .L21+16
	ldr	r10, .L21+20
	sub	sp, sp, #12
.L15:
	ldr	r3, [r6]
	cmp	r3, r4
	bgt	.L13
	ldrb	r3, [r5, #20]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r2, r9
	beq	.L14
	cmp	r3, #1
	beq	.L17
	cmp	r3, #2
	moveq	r2, fp
	movne	r2, r10
.L14:
	mov	r3, #32
	stm	sp, {r2, r8}
	ldm	r5, {r0, r1}
	mov	r2, r3
	mov	lr, pc
	bx	r7
.L13:
	add	r4, r4, #1
	cmp	r4, #6
	add	r5, r5, #28
	bne	.L15
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L17:
	ldr	r2, .L21+24
	b	.L14
.L22:
	.align	2
.L21:
	.word	holds
	.word	collectedHolds
	.word	drawImage4
	.word	pinchBitmap
	.word	jugBitmap
	.word	sloperBitmap
	.word	crimpBitmap
	.size	drawHolds, .-drawHolds
	.comm	holds,168,4
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.word	125
	.word	100
	.word	80
	.word	60
	.word	25
	.word	10
	.ident	"GCC: (devkitARM release 53) 9.1.0"
