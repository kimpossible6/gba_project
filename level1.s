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
	.file	"level1.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHitSmlbirds.part.0, %function
drawHitSmlbirds.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	rsb	r2, r0, r0, lsl #3
	ldr	lr, .L4
	lsl	r2, r2, #3
	add	r1, lr, r2
	ldr	r3, [r1, #4]
	ldr	ip, .L4+4
	ldr	r1, [r1, #36]
	add	r0, r0, #9
	lsl	r3, r3, #23
	ldrb	lr, [lr, r2]	@ zero_extendqisi2
	lsl	r0, r0, #3
	lsr	r3, r3, #23
	add	r2, r1, #832
	orr	r3, r3, #16384
	add	r1, ip, r0
	strh	lr, [ip, r0]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	smlbird1
	.word	shadowOAM
	.size	drawHitSmlbirds.part.0, .-drawHitSmlbirds.part.0
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #34560
	mov	r6, #120
	mov	r5, #2
	mov	r4, #1
	mov	lr, #256
	mov	r1, #0
	mov	r2, #16
	mov	ip, #5
	ldr	r3, .L8
	str	r6, [r3, #4]
	str	r5, [r3, #8]
	str	r4, [r3, #36]
	str	lr, [r3, #40]
	str	r0, [r3]
	str	r0, [r3, #44]
	str	ip, [r3, #48]
	str	r1, [r3, #12]
	str	r1, [r3, #32]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	pop	{r4, r5, r6, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L24
	ldr	r2, [r3, #48]
	cmp	r2, #5
	beq	.L21
	cmp	r2, #4
	push	{r4, r5}
	beq	.L22
	cmp	r2, #3
	beq	.L23
	cmp	r2, #0
	moveq	r1, #16
	beq	.L20
	cmp	r2, #1
	moveq	r1, #144
	beq	.L20
	cmp	r2, #2
	bne	.L10
	mov	r1, #80
.L20:
	ldr	r2, [r3, #4]
	lsl	r2, r2, #23
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	lsr	r2, r2, #23
	ldr	r3, .L24+4
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	pop	{r4, r5}
	bx	lr
.L22:
	ldr	r2, [r3, #60]
	ldr	r1, .L24+8
	smull	r4, r5, r2, r1
	ldr	r1, [r3, #4]
	sub	r0, r5, r2, asr #31
	add	r0, r0, r0, lsl #1
	sub	r2, r2, r0
	lsl	r1, r1, #23
	ldr	r0, .L24+4
	lsl	r2, r2, #6
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	lsr	r1, r1, #23
	add	r2, r2, #20
	orr	r1, r1, #16384
	strh	r2, [r0, #4]	@ movhi
	strh	r3, [r0]	@ movhi
	strh	r1, [r0, #2]	@ movhi
.L10:
	pop	{r4, r5}
	bx	lr
.L21:
	mov	r1, #14
	ldr	r2, [r3, #4]
	lsl	r2, r2, #23
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	lsr	r2, r2, #23
	ldr	r3, .L24+4
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	bx	lr
.L23:
	ldr	r2, [r3, #60]
	ldr	r1, .L24+8
	smull	r4, r5, r2, r1
	ldr	r1, [r3, #4]
	sub	r0, r5, r2, asr #31
	add	r0, r0, r0, lsl #1
	sub	r2, r2, r0
	lsl	r1, r1, #23
	ldr	r0, .L24+4
	lsl	r2, r2, #6
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	lsr	r1, r1, #23
	add	r2, r2, #18
	orr	r1, r1, #16384
	strh	r2, [r0, #4]	@ movhi
	strh	r3, [r0]	@ movhi
	strh	r1, [r0, #2]	@ movhi
	pop	{r4, r5}
	bx	lr
.L25:
	.align	2
.L24:
	.word	player
	.word	shadowOAM
	.word	1431655766
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame2, %function
drawGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	drawPlayer
	mov	r0, #160
	mov	r1, #752
	ldr	r3, .L28
	ldr	ip, .L28+4
	add	r2, r3, #264
	add	r3, r3, #268
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	strh	r1, [r3]	@ movhi
	pop	{r4, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	shadowOAM
	.word	16389
	.size	drawGame2, .-drawGame2
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #5
	ldr	r3, .L57
	ldr	r2, [r3, #48]
	cmp	r2, #5
	push	{r4, r5, lr}
	streq	r2, [r3, #52]
	ldr	r2, .L57+4
	ldrh	r2, [r2]
	ands	r2, r2, #1
	str	r1, [r3, #48]
	beq	.L32
	ldr	r1, .L57+8
	ldrh	r1, [r1]
	tst	r1, #1
	bne	.L33
.L34:
	mov	r1, #0
.L55:
	str	r1, [r3, #60]
.L38:
	cmp	r2, #0
	ldr	r2, [r3, #32]
	beq	.L39
	ldr	r1, .L57+8
	ldrh	r1, [r1]
	ands	r1, r1, #1
	bne	.L39
	ldr	r0, .L57+12
	cmp	r2, #0
	str	r1, [r0]
	beq	.L56
.L39:
	cmp	r2, #1
	ldr	r1, [r3]
	beq	.L40
.L41:
	ldr	r0, .L57+16
	ldr	r2, [r3, #12]
	ldr	r0, [r0]
	add	r2, r2, r0
	add	r0, r2, r1
	cmp	r0, #34816
	str	r1, [r3, #44]
	str	r0, [r3]
	str	r2, [r3, #12]
	blt	.L30
	mov	r2, #0
	mov	r1, #34560
	str	r2, [r3, #12]
	str	r2, [r3, #32]
	str	r1, [r3]
.L30:
	pop	{r4, r5, lr}
	bx	lr
.L32:
	ldr	r1, .L57+20
	ldrh	r1, [r1, #48]
	tst	r1, #32
	beq	.L46
.L45:
	ldr	r1, .L57+20
	ldrh	r1, [r1, #48]
	ands	r1, r1, #16
	bne	.L34
	ldr	ip, [r3, #4]
	ldr	r0, [r3, #20]
	ldr	lr, [r3, #8]
	add	r0, ip, r0
	rsb	r4, lr, #240
	cmp	r0, r4
	bgt	.L34
	mov	r5, #3
	ldr	r4, .L57+24
	add	ip, ip, lr
	ldr	r0, [r4]
	str	ip, [r3, #4]
	ldr	ip, [r3, #60]
	sub	r0, r0, #1
	cmp	ip, #1
	str	r0, [r4]
	str	r5, [r3, #48]
	bgt	.L55
	b	.L37
.L33:
	ldr	r1, .L57+20
	ldrh	r1, [r1, #48]
	tst	r1, #32
	bne	.L45
.L46:
	ldr	r1, [r3, #4]
	ldr	r0, [r3, #8]
	cmp	r0, r1
	bgt	.L45
	mov	r4, #4
	ldr	lr, .L57+24
	sub	r1, r1, r0
	ldr	ip, [r3, #60]
	ldr	r0, [lr]
	cmp	ip, #1
	add	r0, r0, #1
	str	r1, [r3, #4]
	str	r0, [lr]
	str	r4, [r3, #48]
	bgt	.L34
.L37:
	add	ip, ip, #1
	str	ip, [r3, #60]
	b	.L38
.L56:
	mov	r0, #1
	ldr	r1, [r3, #12]
	sub	r1, r1, #1792
	str	r1, [r3, #12]
	str	r2, [r3, #36]
	str	r0, [r3, #32]
	ldr	r1, [r3]
.L40:
	ldr	r2, [r3, #44]
	cmp	r2, r1
	movlt	r2, #1
	strlt	r2, [r3, #48]
	blt	.L41
	movgt	r2, #0
	strgt	r2, [r3, #48]
	b	.L41
.L58:
	.align	2
.L57:
	.word	player
	.word	oldButtons
	.word	buttons
	.word	aniCounter
	.word	.LANCHOR0
	.word	67109120
	.word	hOff
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame2, %function
updateGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	updatePlayer
	.size	updateGame2, .-updateGame2
	.align	2
	.global	firePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	firePlayer, %function
firePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L75
	ldr	r2, [r3]
	cmp	r2, #120
	ldr	r3, .L75+4
	bgt	.L61
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L62
	ldr	ip, .L75+8
	smull	r0, r1, r2, ip
	sub	r1, r1, r2, asr #31
	add	r1, r1, r1, lsl #1
	cmp	r2, r1
	ldreq	r2, [r3]
	ldreq	r1, [r3, #12]
	subeq	r2, r2, r1
	streq	r2, [r3]
	bx	lr
.L61:
	ldr	r1, [r3]
	cmp	r1, #134
	ble	.L74
.L62:
	mov	r2, #0
	str	r2, [r3, #32]
	bx	lr
.L74:
	ldr	r0, [r3, #32]
	cmp	r0, #0
	beq	.L62
	ldr	r0, .L75+8
	push	{r4, r5}
	smull	r4, r5, r2, r0
	sub	r0, r5, r2, asr #31
	add	r0, r0, r0, lsl #1
	cmp	r2, r0
	ldreq	r2, [r3, #12]
	addeq	r1, r2, r1
	streq	r1, [r3]
.L60:
	pop	{r4, r5}
	bx	lr
.L76:
	.align	2
.L75:
	.word	aniCounter
	.word	player
	.word	1431655766
	.size	firePlayer, .-firePlayer
	.align	2
	.global	initSmlbirds
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSmlbirds, %function
initSmlbirds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r10, #1
	ldr	r4, .L84
	ldr	r5, .L84+4
	ldr	r8, .L84+8
	ldr	r7, .L84+12
	add	r6, r4, #224
.L81:
	mov	r3, #16
	str	r3, [r4, #20]
	str	r3, [r4, #16]
	mov	lr, pc
	bx	r5
	smull	r2, r3, r0, r8
	sub	r9, r3, r0, asr #31
	add	r9, r9, r9, lsl #1
	sub	r9, r0, r9
	mov	lr, pc
	bx	r5
	mvn	r1, #9
	smull	r2, r3, r0, r7
	add	r2, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #3
	sub	r3, r0, r3, lsl #1
	cmp	r9, #0
	add	r3, r3, #30
	str	r10, [r4, #8]
	str	r3, [r4]
	str	r1, [r4, #4]
	streq	r10, [r4, #12]
	beq	.L79
	cmp	r9, #1
	moveq	r3, #2
	movne	r3, #3
	str	r3, [r4, #12]
.L79:
	mov	r3, #0
	str	r10, [r4, #44]
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	str	r3, [r4, #32]
	str	r3, [r4, #36]
	str	r3, [r4, #40]
	str	r3, [r4, #52]
	add	r4, r4, #56
	cmp	r4, r6
	bne	.L81
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	smlbird1
	.word	rand
	.word	1431655766
	.word	-368140053
	.size	initSmlbirds, .-initSmlbirds
	.align	2
	.global	updateSmlbirds
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSmlbirds, %function
updateSmlbirds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L119
	mov	r7, #0
	mov	r4, r5
	sub	sp, sp, #28
	ldr	r6, .L119+4
	ldr	r9, .L119+8
	ldr	r8, .L119+12
	ldr	r10, .L119+16
	ldr	fp, .L119+20
	str	r5, [sp, #20]
.L97:
	ldr	r1, [r4, #4]
	cmp	r1, #240
	movle	r2, #0
	movgt	r2, #1
	ldr	r3, [r4, #16]
	add	r0, r1, r3
	cmp	r0, #0
	orrle	r2, r2, #1
	cmp	r2, #0
	beq	.L87
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	and	r0, r0, #1
	mov	r3, r0
	rsblt	r3, r0, #0
	cmp	r3, #0
	bne	.L88
	ldr	r2, [r4, #16]
	rsb	r2, r2, #240
	str	r2, [r4, #4]
	str	r3, [r4, #48]
	mov	r0, #30
	ldr	r3, .L119+24
	mov	lr, pc
	bx	r3
	add	r0, r0, #40
	str	r0, [r4]
	mov	lr, pc
	bx	r8
	smull	r2, r3, r0, r10
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	subs	r3, r0, r3
	bne	.L116
	mov	r3, #1
	ldr	r1, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r4, #16]
.L87:
	ldr	ip, [r6]
	ldr	lr, [r6, #20]
	asr	ip, ip, #8
	ldr	r2, [r4, #20]
	ldr	r0, [r4]
	str	ip, [sp]
	str	lr, [sp, #12]
	ldr	ip, [r6, #16]
	ldr	lr, [r6, #4]
	str	ip, [sp, #8]
	str	lr, [sp, #4]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L95
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L95
	mov	r2, #0
	mov	r3, #2
	ldr	r1, [r4, #52]
	cmp	r1, r2
	str	r2, [r4, #44]
	str	r3, [r4, #28]
	bne	.L117
.L96:
	ldr	r3, [fp]
	ldr	r2, .L119+28
	smull	r0, r1, r3, r2
	ldr	ip, .L119+32
	sub	r0, r1, r3, asr #31
	add	r0, r0, r0, lsl #1
	ldr	lr, [ip]
	sub	r3, r3, r0, lsl #1
	lsl	r0, r3, #1
	sub	lr, lr, #1
	str	r0, [r4, #36]
	mov	r3, #0
	ldr	r2, .L119+36
	ldr	r1, .L119+40
	ldr	r0, .L119+44
	ldr	r5, .L119+48
	str	lr, [ip]
	mov	lr, pc
	bx	r5
.L95:
	add	r7, r7, #1
	cmp	r7, #4
	add	r4, r4, #56
	bne	.L97
	ldr	r5, [sp, #20]
	ldr	r1, .L119+52
.L98:
	ldr	r3, [r5, #4]
	ldr	r2, [r5, #12]
	sub	r3, r3, r2
	str	r3, [r5, #4]
	add	r5, r5, #56
	cmp	r1, r5
	bne	.L98
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L88:
	mov	r2, #1
	mov	r3, #0
	str	r2, [r4, #48]
	str	r3, [r4, #4]
	mov	lr, pc
	bx	r8
	ldr	r1, .L119+56
	smull	r2, r3, r0, r1
	add	r2, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #3
	sub	r3, r0, r3, lsl #1
	add	r3, r3, #30
	str	r3, [r4]
	mov	lr, pc
	bx	r8
	smull	r2, r3, r0, r10
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	subs	r3, r0, r3
	bne	.L118
	mvn	r3, #0
	ldr	r1, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r4, #16]
	b	.L87
.L116:
	cmp	r3, #1
	moveq	r3, #2
	movne	r3, #3
	ldr	r1, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r4, #16]
	b	.L87
.L118:
	cmp	r3, #1
	mvneq	r3, #1
	mvnne	r3, #2
	ldr	r1, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r4, #16]
	b	.L87
.L117:
	mov	r0, r7
	bl	drawHitSmlbirds.part.0
	b	.L96
.L120:
	.align	2
.L119:
	.word	smlbird1
	.word	player
	.word	collision
	.word	rand
	.word	1431655766
	.word	aniCounter
	.word	myRandom
	.word	715827883
	.word	birdsNum
	.word	11025
	.word	6586
	.word	hitbird
	.word	playSoundB
	.word	smlbird1+224
	.word	-368140053
	.size	updateSmlbirds, .-updateSmlbirds
	.align	2
	.global	drawHitSmlbirds
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHitSmlbirds, %function
drawHitSmlbirds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #52]
	cmp	r3, #0
	bxeq	lr
	mov	r0, r1
	b	drawHitSmlbirds.part.0
	.size	drawHitSmlbirds, .-drawHitSmlbirds
	.align	2
	.global	drawSmlbirds
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSmlbirds, %function
drawSmlbirds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L134
	ldr	r2, .L134+4
	ldr	r3, [r3]
	smull	r0, r1, r3, r2
	sub	r2, r1, r3, asr #31
	add	r2, r2, r2, lsl #1
	sub	r2, r3, r2, lsl #1
	push	{r4, r5, r6, r7, lr}
	ldr	r3, .L134+8
	add	r4, r2, #32
	lsl	r4, r4, #17
	lsl	r2, r2, #17
	ldr	r1, .L134+12
	ldr	r5, .L134+16
	ldr	r6, .L134+20
	lsr	r4, r4, #16
	lsr	r0, r2, #16
	add	r7, r3, #224
.L128:
	ldr	ip, [r3, #44]
	ldr	r2, [r3, #4]
	cmp	ip, #0
	and	r2, r2, r5
	orr	r2, r2, #16384
	ldrb	ip, [r3]	@ zero_extendqisi2
	beq	.L124
	ldr	lr, [r3, #28]
	cmp	lr, #0
	bne	.L124
	ldr	lr, [r3, #48]
	cmp	lr, #0
	strh	ip, [r1, #72]	@ movhi
	strh	r2, [r1, #74]	@ movhi
	strheq	r0, [r1, #76]	@ movhi
	strhne	r4, [r1, #76]	@ movhi
.L126:
	add	r3, r3, #56
	cmp	r7, r3
	add	r1, r1, #8
	bne	.L128
	ldr	r3, .L134+24
	mov	r0, #5
	mov	r2, r3
	mov	lr, #40
	mov	ip, #50
	ldr	r1, .L134+28
	ldr	r1, [r1]
	strh	r0, [r2, #64]!	@ movhi
	strh	lr, [r3, #2]	@ movhi
	ldr	lr, .L134+32
	add	r1, r1, #716
	strh	lr, [r3, #4]	@ movhi
	strh	r1, [r3, #68]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	ip, [r2, #2]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L124:
	ldr	lr, [r3, #52]
	cmp	lr, #0
	ldrne	lr, [r3, #36]
	addne	lr, lr, #832
	strhne	ip, [r1, #72]	@ movhi
	strhne	r2, [r1, #74]	@ movhi
	strhne	lr, [r1, #76]	@ movhi
	strheq	ip, [r1, #72]	@ movhi
	strheq	r2, [r1, #74]	@ movhi
	strheq	r6, [r1, #76]	@ movhi
	b	.L126
.L135:
	.align	2
.L134:
	.word	aniCounter
	.word	715827883
	.word	smlbird1
	.word	shadowOAM
	.word	511
	.word	990
	.word	shadowOAM+392
	.word	birdsNum
	.word	749
	.size	drawSmlbirds, .-drawSmlbirds
	.align	2
	.global	initLanterns
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLanterns, %function
initLanterns:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, #2
	mov	r7, #16
	ldr	r4, .L140
	ldr	r5, .L140+4
	ldr	r6, .L140+8
	add	r9, r4, #520
.L137:
	mov	lr, pc
	bx	r5
	smull	r10, fp, r0, r6
	asr	r2, r0, #31
	rsb	r3, r2, fp, asr #4
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #3
	add	r0, r0, #30
	str	r0, [r4]
	mov	lr, pc
	bx	r5
	smull	r10, fp, r0, r6
	asr	r2, r0, #31
	rsb	r3, r2, fp, asr #6
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #5
	add	r0, r0, #30
	str	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r5
	mov	r3, #0
	str	r8, [r4, #8]
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	str	r3, [r4, #48]
	str	r3, [r4, #32]
	str	r3, [r4, #36]
	str	r3, [r4, #40]
	str	r3, [r4, #44]
	str	r8, [r4, #12]
	str	r7, [r4, #16]
	str	r7, [r4, #20]
	mov	lr, pc
	bx	r5
	smull	r10, fp, r0, r6
	asr	r3, r0, #31
	rsb	r3, r3, fp, asr #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #1
	str	r3, [r4, #28]
	add	r4, r4, #52
	cmp	r4, r9
	bne	.L137
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L141:
	.align	2
.L140:
	.word	lanterns
	.word	rand
	.word	1717986919
	.size	initLanterns, .-initLanterns
	.align	2
	.global	initGame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame1, %function
initGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #16384
	ldr	r4, .L144
	ldr	r2, .L144+4
	ldr	r1, .L144+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L144+12
	ldr	r1, .L144+16
	mov	r0, #3
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L144+20
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r8, #7168
	mov	r4, #0
	mov	r0, #34560
	mov	r1, #16
	mov	lr, #2
	mov	ip, #256
	mov	r5, #5
	mov	r6, #1
	mov	r7, #120
	ldrh	r2, [r3]
	orr	r2, r2, #4096
	strh	r2, [r3]	@ movhi
	strh	r8, [r3, #12]	@ movhi
	ldr	r3, .L144+24
	stmib	r3, {r7, lr}
	str	r0, [r3]
	str	r0, [r3, #44]
	str	ip, [r3, #40]
	str	r4, [r3, #12]
	str	r4, [r3, #32]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r6, [r3, #36]
	str	r5, [r3, #48]
	bl	initSmlbirds
	bl	initLanterns
	mov	lr, #180
	mov	r2, #8
	mov	r0, #4
	ldr	r1, .L144+28
	ldr	ip, .L144+32
	ldrh	ip, [ip, #48]
	str	r4, [r1]
	ldr	r1, .L144+36
	strh	ip, [r1]	@ movhi
	ldr	r1, .L144+40
	ldr	r3, .L144+44
	str	r5, [r1]
	ldr	ip, .L144+48
	ldr	r1, .L144+52
	str	r4, [ip]
	str	r6, [r1]
	str	lr, [r3, #4]
	ldr	ip, .L144+56
	ldr	lr, .L144+60
	ldr	r1, .L144+64
	str	r5, [r3]
	str	r4, [r3, #24]
	str	r4, [r3, #28]
	str	r4, [lr]
	str	r4, [ip]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r0, [r1]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L145:
	.align	2
.L144:
	.word	DMANow
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	player
	.word	aniCounter
	.word	67109120
	.word	buttons
	.word	livesNum
	.word	live
	.word	lanternNum
	.word	level
	.word	hOff
	.word	vOff
	.word	birdsNum
	.size	initGame1, .-initGame1
	.align	2
	.global	initGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame2, %function
initGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	initGame1
	.size	initGame2, .-initGame2
	.align	2
	.global	updateLanterns
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLanterns, %function
updateLanterns:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r9, .L186
	ldr	r7, .L186+4
	ldr	r1, [r9]
	sub	sp, sp, #20
	mov	r4, r7
	ldr	r8, .L186+8
	ldr	r5, .L186+12
	asr	r0, r1, #31
	add	r6, r7, #520
	b	.L157
.L152:
	add	r4, r4, #52
	cmp	r4, r6
	beq	.L181
.L157:
	ldr	r3, [r4]
	cmp	r3, #17
	ble	.L151
	ldr	r2, [r4, #20]
	add	r3, r3, r2
	cmp	r3, #100
	bgt	.L151
	ldr	r3, [r4, #4]
	cmp	r3, #4
	ble	.L151
	ldr	r2, [r4, #16]
	add	r3, r3, r2
	cmp	r3, #200
	ble	.L150
.L151:
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	rsb	r2, r2, #0
	rsb	r3, r3, #0
	str	r2, [r4, #8]
	str	r3, [r4, #12]
.L150:
	smull	r2, r3, r1, r8
	rsb	r3, r0, r3, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r1, r3, lsl #1
	bne	.L152
	mov	lr, pc
	bx	r5
	rsbs	r3, r0, #0
	and	r3, r3, #3
	and	r0, r0, #3
	rsbpl	r0, r3, #0
	cmp	r0, #0
	bne	.L153
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #12]
	ldr	r3, [r4]
	ldr	r0, [r4, #8]
	add	r2, r2, r1
	add	r3, r3, r0
	str	r2, [r4, #4]
	str	r3, [r4]
	ldr	r1, [r9]
	add	r4, r4, #52
	cmp	r4, r6
	asr	r0, r1, #31
	bne	.L157
.L181:
	ldr	ip, .L186+16
	smull	r2, r3, r1, ip
	rsb	r0, r0, r3, asr #4
	add	r0, r0, r0, lsl #2
	add	r0, r0, r0, lsl #2
	cmp	r1, r0, lsl #1
	bne	.L158
	ldr	r3, .L186+4
	b	.L161
.L182:
	ldr	r1, [r3, #48]
	cmp	r1, #0
	add	r2, r2, #1
	bne	.L160
.L179:
	str	r2, [r3, #28]
.L160:
	add	r3, r3, #52
	cmp	r3, r4
	beq	.L158
.L161:
	ldr	r2, [r3, #28]
	cmp	r2, #10
	ble	.L182
	cmp	r2, #11
	bne	.L160
	ldr	r2, [r3, #48]
	cmp	r2, #0
	beq	.L179
	add	r3, r3, #52
	cmp	r3, r4
	bne	.L161
.L158:
	ldr	r5, .L186+4
	ldr	r6, .L186+20
	ldr	r8, .L186+24
	ldr	fp, .L186+28
	ldr	r10, .L186+32
.L165:
	ldr	ip, [r6]
	asr	ip, ip, #8
	ldr	lr, [r6, #20]
	ldr	r3, [r5, #16]
	ldr	r2, [r5, #20]
	ldm	r5, {r0, r1}
	str	ip, [sp]
	ldr	ip, [r6, #16]
	str	lr, [sp, #12]
	ldr	lr, [r6, #4]
	str	ip, [sp, #8]
	str	lr, [sp, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L163
	ldr	r3, [r5, #28]
	cmp	r3, #7
	ble	.L163
	ldr	r3, [r5, #44]
	cmp	r3, #0
	beq	.L183
.L163:
	add	r5, r5, #52
	cmp	r5, r4
	bne	.L165
	ldr	r2, [r9]
	ldr	r3, .L186+16
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #4
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #1
	bne	.L147
	mov	r1, #1
.L169:
	ldr	r3, [r7, #48]
	sub	r2, r3, #1
	cmp	r2, #10
	add	r2, r3, #1
	strls	r2, [r7, #48]
	bls	.L168
	cmp	r3, #12
	streq	r1, [r7, #48]
.L168:
	add	r7, r7, #52
	cmp	r7, r5
	bne	.L169
.L147:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L153:
	cmp	r0, #1
	beq	.L184
	cmp	r0, #2
	beq	.L185
	cmp	r0, #3
	beq	.L156
	ldr	r1, [r9]
	asr	r0, r1, #31
	b	.L152
.L183:
	mov	ip, #1
	ldr	r2, .L186+36
	str	ip, [r5, #44]
	str	ip, [r5, #48]
	ldr	r1, .L186+40
	mov	r0, fp
	ldr	ip, .L186+44
	mov	lr, pc
	bx	ip
	ldr	r3, [r10]
	ldr	r2, [r5, #44]
	add	r3, r3, #1
	cmp	r2, #0
	str	r3, [r10]
	movne	r3, #2
	strne	r3, [r6, #48]
	b	.L163
.L184:
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #12]
	ldr	r3, [r4]
	sub	r2, r2, r1
	ldr	r1, [r4, #8]
	add	r3, r3, r1
	ldr	r1, [r9]
	str	r2, [r4, #4]
	str	r3, [r4]
	asr	r0, r1, #31
	b	.L152
.L156:
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #12]
	ldr	r3, [r4]
	sub	r2, r2, r1
.L178:
	ldr	r1, [r4, #8]
	sub	r3, r3, r1
	ldr	r1, [r9]
	str	r2, [r4, #4]
	str	r3, [r4]
	asr	r0, r1, #31
	b	.L152
.L185:
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #12]
	ldr	r3, [r4]
	add	r2, r2, r1
	b	.L178
.L187:
	.align	2
.L186:
	.word	aniCounter
	.word	lanterns
	.word	1717986919
	.word	rand
	.word	1374389535
	.word	player
	.word	collision
	.word	matchSound
	.word	lanternNum
	.word	11025
	.word	19369
	.word	playSoundB
	.size	updateLanterns, .-updateLanterns
	.align	2
	.global	updateGame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame1, %function
updateGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L199
	ldr	r5, [r4]
	cmp	r5, #1
	beq	.L195
.L189:
	ldr	r3, .L199+4
	ldr	r3, [r3]
	cmp	r3, #10
	beq	.L196
.L193:
	mov	r2, #67108864
	ldr	r3, .L199+8
	ldr	r1, .L199+12
	ldrh	r3, [r3]
	strh	r3, [r2, #26]	@ movhi
	strh	r3, [r2, #22]	@ movhi
	strh	r3, [r2, #18]	@ movhi
	ldr	r3, [r1]
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r2, #16]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L196:
	mov	r3, #2
	str	r3, [r4]
	bl	initGame1
	b	.L193
.L195:
	ldr	r2, .L199+16
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	bl	updatePlayer
	bl	updateSmlbirds
	bl	updateLanterns
	ldr	r3, .L199+20
	ldr	r3, [r3]
	cmp	r3, #3
	beq	.L197
	cmp	r3, #2
	beq	.L198
	cmp	r3, #1
	moveq	r2, #3
	ldreq	r3, .L199+24
	streq	r2, [r3, #28]
.L191:
	ldr	r3, .L199+28
	mov	lr, pc
	bx	r3
	ldr	r5, .L199+32
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L199+36
	mov	r0, #3
	mov	lr, pc
	bx	r5
	b	.L189
.L197:
	ldr	r3, .L199+24
	str	r5, [r3, #28]
	b	.L191
.L198:
	ldr	r2, .L199+24
	str	r3, [r2, #28]
	b	.L191
.L200:
	.align	2
.L199:
	.word	level
	.word	lanternNum
	.word	vOff
	.word	hOff
	.word	aniCounter
	.word	birdsNum
	.word	live
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.size	updateGame1, .-updateGame1
	.align	2
	.global	drawLanterns
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLanterns, %function
drawLanterns:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r10, #230
	mov	r9, #229
	mov	r7, #228
	mov	r5, #199
	mov	lr, #198
	ldr	r3, .L240
	ldr	r2, .L240+4
	ldr	ip, .L240+8
	ldr	r8, .L240+12
	ldr	r6, .L240+16
	ldr	r4, .L240+20
	add	r0, r3, #520
.L226:
	ldr	r1, [r3, #44]
	cmp	r1, #0
	bne	.L202
	ldr	r1, [r3, #28]
	cmp	r1, #0
	moveq	fp, #132
	beq	.L229
	cmp	r1, #1
	moveq	fp, #133
	beq	.L229
	cmp	r1, #2
	moveq	fp, #134
	beq	.L229
	cmp	r1, #3
	moveq	fp, #135
	beq	.L229
	cmp	r1, #4
	moveq	fp, #164
	beq	.L229
	cmp	r1, #5
	moveq	fp, #165
	beq	.L229
	cmp	r1, #6
	moveq	fp, #166
	beq	.L229
	cmp	r1, #7
	beq	.L231
	cmp	r1, #8
	beq	.L232
	cmp	r1, #9
	beq	.L233
	cmp	r1, #10
	moveq	fp, #194
	beq	.L230
	cmp	r1, #11
	moveq	fp, #130
	bne	.L204
.L230:
	ldr	r1, [r3, #4]
	and	r1, r1, ip
	orr	r1, r1, #16384
	strh	r1, [r2, #138]	@ movhi
	add	r3, r3, #52
	ldrb	r1, [r3, #-52]	@ zero_extendqisi2
	cmp	r3, r0
	strh	fp, [r2, #140]	@ movhi
	strh	r1, [r2, #136]	@ movhi
	add	r2, r2, #8
	bne	.L226
.L235:
	ldr	r3, .L240+24
	mov	r0, #5
	mov	r2, r3
	mov	r4, #10
	mov	lr, #748
	mov	ip, #20
	ldr	r1, .L240+28
	ldr	r1, [r1]
	strh	r0, [r2, #64]!	@ movhi
	add	r1, r1, #716
	strh	r4, [r3, #2]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	strh	r1, [r3, #68]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	ip, [r2, #2]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L202:
	ldr	r1, [r3, #48]
	cmp	r1, #1
	beq	.L234
	cmp	r1, #2
	moveq	fp, #320
	beq	.L230
	cmp	r1, #3
	moveq	fp, #256
	beq	.L230
	cmp	r1, #4
	moveq	fp, #192
	beq	.L230
	cmp	r1, #5
	moveq	fp, #128
	beq	.L230
	cmp	r1, #6
	bne	.L220
	mov	fp, #196
.L229:
	ldr	r1, [r3, #4]
	and	r1, r1, ip
	strh	r1, [r2, #138]	@ movhi
	ldrb	r1, [r3]	@ zero_extendqisi2
	strh	fp, [r2, #140]	@ movhi
	strh	r1, [r2, #136]	@ movhi
.L204:
	add	r3, r3, #52
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L226
	b	.L235
.L234:
	mov	fp, #384
	b	.L230
.L220:
	cmp	r1, #7
	moveq	fp, #197
	beq	.L229
	cmp	r1, #8
	beq	.L236
	cmp	r1, #9
	beq	.L237
	cmp	r1, #10
	beq	.L238
	cmp	r1, #11
	beq	.L239
	cmp	r1, #12
	bne	.L204
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	r10, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L204
.L236:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	lr, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L204
.L231:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	orr	r1, r1, #16384
	strh	r4, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L204
.L237:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	r5, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L204
.L232:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	orr	r1, r1, #16384
	strh	r6, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L204
.L238:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	r7, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L204
.L233:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	orr	r1, r1, #16384
	strh	r8, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L204
.L239:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	r9, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L204
.L241:
	.align	2
.L240:
	.word	lanterns
	.word	shadowOAM
	.word	511
	.word	258
	.word	322
	.word	386
	.word	shadowOAM+520
	.word	lanternNum
	.size	drawLanterns, .-drawLanterns
	.align	2
	.global	drawGame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame1, %function
drawGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L248
	ldr	r3, [r3]
	cmp	r3, #1
	bxne	lr
	push	{r4, lr}
	bl	drawPlayer
	bl	drawSmlbirds
	bl	drawLanterns
	ldr	r2, .L248+4
	mov	r1, r2
	mov	r4, #180
	mov	lr, #752
	mov	ip, #160
	ldr	r3, .L248+8
	ldr	r3, [r3, #28]
	rsbs	r0, r3, #0
	and	r0, r0, #3
	and	r3, r3, #3
	rsbpl	r3, r0, #0
	ldr	r0, .L248+12
	lsl	r3, r3, #6
	strh	r0, [r1, #-64]!	@ movhi
	add	r3, r3, #780
	strh	r4, [r2, #2]	@ movhi
	strh	lr, [r2, #-60]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	ip, [r1, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L249:
	.align	2
.L248:
	.word	level
	.word	shadowOAM+328
	.word	live
	.word	16389
	.size	drawGame1, .-drawGame1
	.align	2
	.global	initLive1
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLive1, %function
initLive1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #8
	mov	r2, #0
	mov	ip, #5
	mov	r0, #180
	ldr	r3, .L251
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	bx	lr
.L252:
	.align	2
.L251:
	.word	live
	.size	initLive1, .-initLive1
	.align	2
	.global	drawLive1
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLive1, %function
drawLive1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #180
	ldr	r3, .L254
	ldr	r3, [r3, #28]
	rsbs	r2, r3, #0
	and	r2, r2, #3
	and	r3, r3, #3
	rsbpl	r3, r2, #0
	ldr	r2, .L254+4
	lsl	r3, r3, #6
	ldr	r0, .L254+8
	add	ip, r2, #332
	add	r3, r3, #780
	add	r2, r2, #328
	strh	r3, [ip]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	bx	lr
.L255:
	.align	2
.L254:
	.word	live
	.word	shadowOAM
	.word	16389
	.size	drawLive1, .-drawLive1
	.align	2
	.global	updateLive1
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLive1, %function
updateLive1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L262
	ldr	r3, [r3]
	cmp	r3, #3
	beq	.L260
	cmp	r3, #2
	beq	.L261
	cmp	r3, #1
	moveq	r2, #3
	ldreq	r3, .L262+4
	streq	r2, [r3, #28]
	bx	lr
.L261:
	ldr	r2, .L262+4
	str	r3, [r2, #28]
	bx	lr
.L260:
	mov	r2, #1
	ldr	r3, .L262+4
	str	r2, [r3, #28]
	bx	lr
.L263:
	.align	2
.L262:
	.word	birdsNum
	.word	live
	.size	updateLive1, .-updateLive1
	.comm	shadowOAM,1024,4
	.comm	level,4,4
	.comm	lanternNum,4,4
	.comm	birdsNum,4,4
	.comm	livesNum,4,4
	.comm	live,32,4
	.comm	lanterns,520,4
	.comm	smlbird2,224,4
	.comm	smlbird1,224,4
	.comm	player,68,4
	.global	grav
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	aniCounter,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	grav, %object
	.size	grav, 4
grav:
	.word	50
	.ident	"GCC: (devkitARM release 47) 7.1.0"
