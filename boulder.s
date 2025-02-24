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
	.file	"boulder.c"
	.text
	.align	2
	.global	initBoulders
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBoulders, %function
initBoulders:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r8, #0
	ldr	r9, .L6
	ldr	r4, .L6+4
	ldr	r5, .L6+8
	ldr	r7, .L6+12
	add	r6, r9, #180
.L2:
	mov	lr, pc
	bx	r4
	smull	r3, r2, r5, r0
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	str	r0, [r9]
	mov	lr, pc
	bx	r4
	smull	r3, r2, r5, r0
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #1
	str	r8, [r9, #16]
	str	r0, [r9, #4]
	mov	lr, pc
	bx	r4
	mov	r3, #3
	cmp	r0, #0
	and	r0, r0, #1
	rsblt	r0, r0, #0
	add	r0, r0, #1
	str	r0, [r9, #20]
	strh	r7, [r9, #32]	@ movhi
	str	r3, [r9, #24]
	str	r3, [r9, #28]
	add	r9, r9, #36
	cmp	r9, r6
	bne	.L2
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	boulders
	.word	rand
	.word	-2004318071
	.word	15855
	.size	initBoulders, .-initBoulders
	.align	2
	.global	updateBoulders
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBoulders, %function
updateBoulders:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #0
	ldr	r4, .L15
	ldr	r6, .L15+4
	ldr	r5, .L15+8
	add	r8, r4, #180
.L11:
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #20]
	add	r3, r3, r2
	cmp	r3, #160
	strle	r3, [r4, #4]
	bgt	.L14
.L10:
	add	r4, r4, #36
	cmp	r4, r8
	bne	.L11
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L14:
	str	r7, [r4, #4]
	mov	lr, pc
	bx	r6
	smull	r3, r2, r5, r0
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	str	r0, [r4]
	b	.L10
.L16:
	.align	2
.L15:
	.word	boulders
	.word	rand
	.word	-2004318071
	.size	updateBoulders, .-updateBoulders
	.align	2
	.global	checkBoulderCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkBoulderCollision, %function
checkBoulderCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L24
	push	{r4, r5, lr}
	add	r2, r0, r2
	add	r3, r1, r3
	add	r5, ip, #180
.L20:
	ldr	r4, [ip]
	ldr	lr, [ip, #24]
	add	lr, r4, lr
	cmp	lr, r0
	ble	.L18
	cmp	r4, r2
	bge	.L18
	ldr	r4, [ip, #4]
	ldr	lr, [ip, #28]
	add	lr, r4, lr
	cmp	lr, r1
	ble	.L18
	cmp	r4, r3
	blt	.L21
.L18:
	add	ip, ip, #36
	cmp	ip, r5
	bne	.L20
	mov	r0, #0
.L17:
	pop	{r4, r5, lr}
	bx	lr
.L21:
	mov	r0, #1
	b	.L17
.L25:
	.align	2
.L24:
	.word	boulders
	.size	checkBoulderCollision, .-checkBoulderCollision
	.align	2
	.global	drawBoulders
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoulders, %function
drawBoulders:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L30
	ldr	r6, .L30+4
	sub	sp, sp, #8
	add	r5, r4, #180
.L27:
	ldrb	r2, [r4, #32]	@ zero_extendqisi2
	ldr	r3, [r4, #28]
	str	r2, [sp]
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #24]
	add	r4, r4, #36
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L27
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	boulders
	.word	drawRect4
	.size	drawBoulders, .-drawBoulders
	.comm	boulders,180,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
