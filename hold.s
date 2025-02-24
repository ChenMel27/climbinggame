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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r8, #40
	mov	r5, #10
	ldr	r7, .L8
	ldr	r4, .L8+4
	ldr	r6, .L8+8
.L3:
	mov	lr, pc
	bx	r4
	smull	r3, r2, r6, r0
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	str	r8, [r7, #4]
	str	r5, [r7, #8]
	str	r5, [r7, #12]
	str	r0, [r7]
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	and	r0, r0, #1
	mov	r2, r0
	rsblt	r2, r0, #0
	cmp	r0, #0
	movne	r3, #992
	moveq	r3, #31
	add	r8, r8, #15
	cmp	r8, #190
	str	r2, [r7, #20]
	strh	r3, [r7, #16]	@ movhi
	add	r7, r7, #24
	bne	.L3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	holds
	.word	rand
	.word	-2004318071
	.size	initHolds, .-initHolds
	.align	2
	.global	updateHolds
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHolds, %function
updateHolds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateHolds, .-updateHolds
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L15
	ldr	r6, .L15+4
	sub	sp, sp, #8
	add	r5, r4, #240
.L12:
	ldrb	r2, [r4, #16]	@ zero_extendqisi2
	ldr	r3, [r4, #12]
	str	r2, [sp]
	ldm	r4, {r0, r1, r2}
	add	r4, r4, #24
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L12
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	holds
	.word	drawRect4
	.size	drawHolds, .-drawHolds
	.comm	holds,240,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
