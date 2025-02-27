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
	add	r6, r9, #108
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
	.word	13741
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L22
	mov	r9, #0
	mov	r4, r7
	ldr	r6, .L22+4
	ldr	r8, .L22+8
	add	r5, r7, #108
.L13:
	mov	r3, r7
	ldr	ip, [r4, #4]
	ldr	r2, [r4, #20]
	ldr	r0, [r6]
	ldr	r10, [r6, #4]
	add	ip, ip, r2
	str	ip, [r4, #4]
	add	lr, r0, #5
	add	fp, r10, #32
	add	r0, r0, #21
.L11:
	ldr	r1, [r3]
	ldr	r2, [r3, #24]
	add	r2, r1, r2
	cmp	lr, r2
	bge	.L9
	cmp	r1, r0
	bge	.L9
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #28]
	add	r2, r1, r2
	cmp	r10, r2
	bge	.L9
	cmp	r1, fp
	blt	.L10
.L9:
	add	r3, r3, #36
	cmp	r3, r5
	bne	.L11
	cmp	ip, #160
	bgt	.L21
.L16:
	add	r4, r4, #36
	cmp	r4, r5
	bne	.L13
.L8:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L21:
	str	r9, [r4, #4]
	mov	lr, pc
	bx	r8
	ldr	r2, .L22+12
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	str	r0, [r4]
	b	.L16
.L10:
	ldr	r3, .L22+16
	mov	lr, pc
	bx	r3
	b	.L8
.L23:
	.align	2
.L22:
	.word	boulders
	.word	climber
	.word	rand
	.word	-2004318071
	.word	goToLose
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
	ldr	ip, .L31
	push	{r4, r5, lr}
	add	r2, r0, r2
	add	r3, r1, r3
	add	r5, ip, #108
.L27:
	ldr	r4, [ip]
	ldr	lr, [ip, #24]
	add	lr, r4, lr
	cmp	lr, r0
	ble	.L25
	cmp	r4, r2
	bge	.L25
	ldr	r4, [ip, #4]
	ldr	lr, [ip, #28]
	add	lr, r4, lr
	cmp	lr, r1
	ble	.L25
	cmp	r4, r3
	blt	.L28
.L25:
	add	ip, ip, #36
	cmp	ip, r5
	bne	.L27
	mov	r0, #0
.L24:
	pop	{r4, r5, lr}
	bx	lr
.L28:
	mov	r0, #1
	b	.L24
.L32:
	.align	2
.L31:
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
	ldr	r4, .L37
	ldr	r6, .L37+4
	sub	sp, sp, #8
	add	r5, r4, #108
.L34:
	ldrb	r2, [r4, #32]	@ zero_extendqisi2
	ldr	r3, [r4, #28]
	str	r2, [sp]
	ldm	r4, {r0, r1}
	ldr	r2, [r4, #24]
	add	r4, r4, #36
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L34
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	boulders
	.word	drawRect4
	.size	drawBoulders, .-drawBoulders
	.comm	boulders,108,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
