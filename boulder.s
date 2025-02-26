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
	mov	r9, #0
	mov	r7, r9
	ldr	r8, .L6
	ldr	r4, .L6+4
	ldr	r5, .L6+8
	ldr	r6, .L6+12
.L2:
	mov	lr, pc
	bx	r4
	smull	r3, r2, r5, r0
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	str	r0, [r8]
	mov	lr, pc
	bx	r4
	smull	r3, r2, r5, r0
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #1
	str	r7, [r8, #16]
	str	r0, [r8, #4]
	mov	lr, pc
	bx	r4
	mov	r3, #3
	cmp	r0, #0
	and	r0, r0, #1
	rsblt	r0, r0, #0
	add	r0, r0, #1
	cmp	r9, #1
	str	r0, [r8, #20]
	strh	r6, [r8, #32]	@ movhi
	str	r3, [r8, #24]
	str	r3, [r8, #28]
	add	r8, r8, #36
	bne	.L3
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L3:
	mov	r9, #1
	b	.L2
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
	ldr	r6, .L24
	mov	r7, #0
	mov	r4, r6
	ldr	r5, .L24+4
	ldr	r8, .L24+8
.L13:
	ldr	r0, [r4, #4]
	ldr	r3, [r4, #20]
	mov	lr, #0
	add	r0, r0, r3
	mov	r3, r6
	ldm	r5, {r1, r10}
	str	r0, [r4, #4]
	add	r9, r1, #5
	add	fp, r10, #32
	add	r1, r1, #21
.L11:
	ldr	ip, [r3]
	ldr	r2, [r3, #24]
	add	r2, ip, r2
	cmp	r9, r2
	bge	.L9
	cmp	ip, r1
	bge	.L9
	ldr	ip, [r3, #4]
	ldr	r2, [r3, #28]
	add	r2, ip, r2
	cmp	r10, r2
	blt	.L21
.L9:
	cmp	lr, #1
	add	r3, r3, #36
	movne	lr, #1
	bne	.L11
.L19:
	cmp	r0, #160
	bgt	.L22
.L16:
	cmp	r7, #1
	add	r4, r4, #36
	bne	.L23
.L8:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L23:
	mov	r7, #1
	b	.L13
.L22:
	mov	r3, #0
	str	r3, [r4, #4]
	mov	lr, pc
	bx	r8
	ldr	r2, .L24+12
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	str	r0, [r4]
	b	.L16
.L21:
	cmp	ip, fp
	bge	.L9
	ldr	r3, .L24+16
	mov	lr, pc
	bx	r3
	b	.L8
.L25:
	.align	2
.L24:
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
	push	{r4, r5, lr}
	mov	r5, #0
	ldr	ip, .L34
	add	r2, r0, r2
	add	r3, r1, r3
.L29:
	ldr	r4, [ip]
	ldr	lr, [ip, #24]
	add	lr, r4, lr
	cmp	lr, r0
	ble	.L27
	cmp	r4, r2
	blt	.L33
.L27:
	cmp	r5, #1
	add	ip, ip, #36
	bne	.L31
	mov	r0, #0
.L26:
	pop	{r4, r5, lr}
	bx	lr
.L31:
	mov	r5, #1
	b	.L29
.L33:
	ldr	r4, [ip, #4]
	ldr	lr, [ip, #28]
	add	lr, r4, lr
	cmp	lr, r1
	ble	.L27
	cmp	r4, r3
	bge	.L27
	mov	r0, #1
	b	.L26
.L35:
	.align	2
.L34:
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
	push	{r4, r5, lr}
	ldr	r4, .L38
	ldrb	r2, [r4, #32]	@ zero_extendqisi2
	sub	sp, sp, #12
	ldm	r4, {r0, r1}
	ldr	r3, [r4, #28]
	str	r2, [sp]
	ldr	r5, .L38+4
	ldr	r2, [r4, #24]
	mov	lr, pc
	bx	r5
	ldrb	r2, [r4, #68]	@ zero_extendqisi2
	str	r2, [sp]
	add	r0, r4, #36
	ldr	r3, [r4, #64]
	ldr	r2, [r4, #60]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	boulders
	.word	drawRect4
	.size	drawBoulders, .-drawBoulders
	.comm	boulders,72,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
