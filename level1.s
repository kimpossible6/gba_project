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
	ldr	r3, .L53
	ldr	r2, [r3, #48]
	cmp	r2, #5
	push	{r4, r5, lr}
	streq	r2, [r3, #52]
	ldr	r2, .L53+4
	ldrh	r2, [r2]
	ands	r2, r2, #1
	str	r1, [r3, #48]
	beq	.L28
	ldr	r1, .L53+8
	ldrh	r1, [r1]
	tst	r1, #1
	bne	.L29
.L30:
	mov	r1, #0
.L51:
	str	r1, [r3, #60]
.L34:
	cmp	r2, #0
	ldr	r2, [r3, #32]
	beq	.L35
	ldr	r1, .L53+8
	ldrh	r1, [r1]
	ands	r1, r1, #1
	bne	.L35
	ldr	r0, .L53+12
	cmp	r2, #0
	str	r1, [r0]
	beq	.L52
.L35:
	cmp	r2, #1
	ldr	r1, [r3]
	beq	.L36
.L37:
	ldr	r0, .L53+16
	ldr	r2, [r3, #12]
	ldr	r0, [r0]
	add	r2, r2, r0
	add	r0, r2, r1
	cmp	r0, #34816
	str	r1, [r3, #44]
	str	r0, [r3]
	str	r2, [r3, #12]
	blt	.L26
	mov	r2, #0
	mov	r1, #34560
	str	r2, [r3, #12]
	str	r2, [r3, #32]
	str	r1, [r3]
.L26:
	pop	{r4, r5, lr}
	bx	lr
.L28:
	ldr	r1, .L53+20
	ldrh	r1, [r1, #48]
	tst	r1, #32
	beq	.L42
.L41:
	ldr	r1, .L53+20
	ldrh	r1, [r1, #48]
	ands	r1, r1, #16
	bne	.L30
	ldr	ip, [r3, #4]
	ldr	r0, [r3, #20]
	ldr	lr, [r3, #8]
	add	r0, ip, r0
	rsb	r4, lr, #240
	cmp	r0, r4
	bgt	.L30
	mov	r5, #3
	ldr	r4, .L53+24
	add	ip, ip, lr
	ldr	r0, [r4]
	str	ip, [r3, #4]
	ldr	ip, [r3, #60]
	sub	r0, r0, #1
	cmp	ip, #1
	str	r0, [r4]
	str	r5, [r3, #48]
	bgt	.L51
	b	.L33
.L29:
	ldr	r1, .L53+20
	ldrh	r1, [r1, #48]
	tst	r1, #32
	bne	.L41
.L42:
	ldr	r1, [r3, #4]
	ldr	r0, [r3, #8]
	cmp	r0, r1
	bgt	.L41
	mov	r4, #4
	ldr	lr, .L53+24
	sub	r1, r1, r0
	ldr	ip, [r3, #60]
	ldr	r0, [lr]
	cmp	ip, #1
	add	r0, r0, #1
	str	r1, [r3, #4]
	str	r0, [lr]
	str	r4, [r3, #48]
	bgt	.L30
.L33:
	add	ip, ip, #1
	str	ip, [r3, #60]
	b	.L34
.L52:
	mov	r0, #1
	ldr	r1, [r3, #12]
	sub	r1, r1, #1792
	str	r1, [r3, #12]
	str	r2, [r3, #36]
	str	r0, [r3, #32]
	ldr	r1, [r3]
.L36:
	ldr	r2, [r3, #44]
	cmp	r2, r1
	movlt	r2, #1
	strlt	r2, [r3, #48]
	blt	.L37
	movgt	r2, #0
	strgt	r2, [r3, #48]
	b	.L37
.L54:
	.align	2
.L53:
	.word	player
	.word	oldButtons
	.word	buttons
	.word	aniCounter
	.word	.LANCHOR0
	.word	67109120
	.word	hOff
	.size	updatePlayer, .-updatePlayer
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
	ldr	r3, .L70
	ldr	r2, [r3]
	cmp	r2, #120
	ldr	r3, .L70+4
	bgt	.L56
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L57
	ldr	ip, .L70+8
	smull	r0, r1, r2, ip
	sub	r1, r1, r2, asr #31
	add	r1, r1, r1, lsl #1
	cmp	r2, r1
	ldreq	r2, [r3]
	ldreq	r1, [r3, #12]
	subeq	r2, r2, r1
	streq	r2, [r3]
	bx	lr
.L56:
	ldr	r1, [r3]
	cmp	r1, #134
	ble	.L69
.L57:
	mov	r2, #0
	str	r2, [r3, #32]
	bx	lr
.L69:
	ldr	r0, [r3, #32]
	cmp	r0, #0
	beq	.L57
	ldr	r0, .L70+8
	push	{r4, r5}
	smull	r4, r5, r2, r0
	sub	r0, r5, r2, asr #31
	add	r0, r0, r0, lsl #1
	cmp	r2, r0
	ldreq	r2, [r3, #12]
	addeq	r1, r2, r1
	streq	r1, [r3]
.L55:
	pop	{r4, r5}
	bx	lr
.L71:
	.align	2
.L70:
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
	ldr	r4, .L79
	ldr	r5, .L79+4
	ldr	r8, .L79+8
	ldr	r7, .L79+12
	add	r6, r4, #224
.L76:
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
	beq	.L74
	cmp	r9, #1
	moveq	r3, #2
	movne	r3, #3
	str	r3, [r4, #12]
.L74:
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
	bne	.L76
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L80:
	.align	2
.L79:
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
	ldr	r5, .L114
	mov	r7, #0
	mov	r4, r5
	sub	sp, sp, #28
	ldr	r6, .L114+4
	ldr	r9, .L114+8
	ldr	r8, .L114+12
	ldr	r10, .L114+16
	ldr	fp, .L114+20
	str	r5, [sp, #20]
.L92:
	ldr	r1, [r4, #4]
	cmp	r1, #240
	movle	r2, #0
	movgt	r2, #1
	ldr	r3, [r4, #16]
	add	r0, r1, r3
	cmp	r0, #0
	orrle	r2, r2, #1
	cmp	r2, #0
	beq	.L82
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	and	r0, r0, #1
	mov	r3, r0
	rsblt	r3, r0, #0
	cmp	r3, #0
	bne	.L83
	ldr	r2, [r4, #16]
	rsb	r2, r2, #240
	str	r2, [r4, #4]
	str	r3, [r4, #48]
	mov	r0, #30
	ldr	r3, .L114+24
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
	bne	.L111
	mov	r3, #1
	ldr	r1, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r4, #16]
.L82:
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
	beq	.L90
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L90
	mov	r2, #0
	mov	r3, #2
	ldr	r1, [r4, #52]
	cmp	r1, r2
	str	r2, [r4, #44]
	str	r3, [r4, #28]
	bne	.L112
.L91:
	ldr	r3, [fp]
	ldr	r2, .L114+28
	smull	r0, r1, r3, r2
	ldr	ip, .L114+32
	sub	r0, r1, r3, asr #31
	add	r0, r0, r0, lsl #1
	ldr	lr, [ip]
	sub	r3, r3, r0, lsl #1
	lsl	r0, r3, #1
	sub	lr, lr, #1
	str	r0, [r4, #36]
	mov	r3, #0
	ldr	r2, .L114+36
	ldr	r1, .L114+40
	ldr	r0, .L114+44
	ldr	r5, .L114+48
	str	lr, [ip]
	mov	lr, pc
	bx	r5
.L90:
	add	r7, r7, #1
	cmp	r7, #4
	add	r4, r4, #56
	bne	.L92
	ldr	r5, [sp, #20]
	ldr	r1, .L114+52
.L93:
	ldr	r3, [r5, #4]
	ldr	r2, [r5, #12]
	sub	r3, r3, r2
	str	r3, [r5, #4]
	add	r5, r5, #56
	cmp	r1, r5
	bne	.L93
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L83:
	mov	r2, #1
	mov	r3, #0
	str	r2, [r4, #48]
	str	r3, [r4, #4]
	mov	lr, pc
	bx	r8
	ldr	r1, .L114+56
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
	bne	.L113
	mvn	r3, #0
	ldr	r1, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r4, #16]
	b	.L82
.L111:
	cmp	r3, #1
	moveq	r3, #2
	movne	r3, #3
	ldr	r1, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r4, #16]
	b	.L82
.L113:
	cmp	r3, #1
	mvneq	r3, #1
	mvnne	r3, #2
	ldr	r1, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r4, #16]
	b	.L82
.L112:
	mov	r0, r7
	bl	drawHitSmlbirds.part.0
	b	.L91
.L115:
	.align	2
.L114:
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
	ldr	r3, .L129
	ldr	r2, .L129+4
	ldr	r3, [r3]
	smull	r0, r1, r3, r2
	sub	r2, r1, r3, asr #31
	add	r2, r2, r2, lsl #1
	sub	r2, r3, r2, lsl #1
	push	{r4, r5, r6, r7, lr}
	ldr	r3, .L129+8
	add	r4, r2, #32
	lsl	r4, r4, #17
	lsl	r2, r2, #17
	ldr	r1, .L129+12
	ldr	r5, .L129+16
	ldr	r6, .L129+20
	lsr	r4, r4, #16
	lsr	r0, r2, #16
	add	r7, r3, #224
.L123:
	ldr	ip, [r3, #44]
	ldr	r2, [r3, #4]
	cmp	ip, #0
	and	r2, r2, r5
	orr	r2, r2, #16384
	ldrb	ip, [r3]	@ zero_extendqisi2
	beq	.L119
	ldr	lr, [r3, #28]
	cmp	lr, #0
	bne	.L119
	ldr	lr, [r3, #48]
	cmp	lr, #0
	strh	ip, [r1, #72]	@ movhi
	strh	r2, [r1, #74]	@ movhi
	strheq	r0, [r1, #76]	@ movhi
	strhne	r4, [r1, #76]	@ movhi
.L121:
	add	r3, r3, #56
	cmp	r3, r7
	add	r1, r1, #8
	bne	.L123
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L119:
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
	b	.L121
.L130:
	.align	2
.L129:
	.word	aniCounter
	.word	715827883
	.word	smlbird1
	.word	shadowOAM
	.word	511
	.word	990
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
	mov	r8, #1
	mov	r7, #16
	ldr	r4, .L135
	ldr	r6, .L135+4
	ldr	r5, .L135+8
	add	r9, r4, #520
.L132:
	mov	lr, pc
	bx	r6
	smull	r10, fp, r0, r5
	asr	r2, r0, #31
	rsb	r3, r2, fp, asr #5
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #4
	add	r0, r0, #30
	str	r0, [r4]
	mov	lr, pc
	bx	r6
	mov	r1, #0
	smull	r10, fp, r0, r5
	asr	r2, r0, #31
	rsb	r3, r2, fp, asr #6
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #5
	add	r0, r0, #30
	str	r8, [r4, #8]
	str	r8, [r4, #12]
	str	r7, [r4, #16]
	str	r7, [r4, #20]
	str	r0, [r4, #4]
	str	r1, [r4, #24]
	str	r1, [r4, #28]
	str	r1, [r4, #48]
	str	r1, [r4, #32]
	str	r1, [r4, #36]
	str	r1, [r4, #40]
	str	r1, [r4, #44]
	mov	lr, pc
	bx	r6
	smull	r10, fp, r0, r5
	asr	r3, r0, #31
	rsb	r3, r3, fp, asr #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #1
	str	r3, [r4, #28]
	add	r4, r4, #52
	cmp	r4, r9
	bne	.L132
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L136:
	.align	2
.L135:
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
	ldr	r4, .L139
	ldr	r2, .L139+4
	ldr	r1, .L139+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L139+12
	ldr	r1, .L139+16
	mov	r0, #3
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L139+20
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r8, #7168
	mov	r4, #0
	mov	r0, #34560
	mov	r1, #16
	mov	lr, #1
	mov	ip, #256
	mov	r5, #5
	mov	r7, #120
	mov	r6, #2
	ldrh	r2, [r3]
	orr	r2, r2, #4096
	strh	r2, [r3]	@ movhi
	strh	r8, [r3, #12]	@ movhi
	ldr	r3, .L139+24
	str	r0, [r3]
	str	r0, [r3, #44]
	str	r7, [r3, #4]
	str	r6, [r3, #8]
	str	lr, [r3, #36]
	str	ip, [r3, #40]
	str	r4, [r3, #12]
	str	r4, [r3, #32]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r5, [r3, #48]
	bl	initSmlbirds
	bl	initLanterns
	mov	r2, #4
	ldr	r1, .L139+28
	ldr	r3, .L139+32
	ldrh	r0, [r1, #48]
	str	r4, [r3]
	ldr	r1, .L139+36
	ldr	r3, .L139+40
	strh	r0, [r1]	@ movhi
	str	r5, [r3]
	ldr	ip, .L139+44
	ldr	r0, .L139+48
	ldr	r1, .L139+52
	ldr	r3, .L139+56
	str	r4, [ip]
	str	r4, [r0]
	str	r4, [r1]
	str	r2, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L140:
	.align	2
.L139:
	.word	DMANow
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	player
	.word	67109120
	.word	aniCounter
	.word	buttons
	.word	livesNum
	.word	lanternNum
	.word	vOff
	.word	hOff
	.word	birdsNum
	.size	initGame1, .-initGame1
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
	ldr	r7, .L184
	sub	sp, sp, #20
	mov	r4, r7
	add	r1, r7, #520
	b	.L146
.L177:
	ldr	r2, [r4, #20]
	add	r3, r3, r2
	cmp	r3, #100
	bgt	.L142
	ldr	r3, [r4, #4]
	cmp	r3, #4
	ble	.L145
	ldr	r2, [r4, #16]
	add	r3, r3, r2
	cmp	r3, #200
	ble	.L144
.L145:
	ldr	r3, [r4, #12]
	rsb	r3, r3, #0
	str	r3, [r4, #12]
.L144:
	add	r4, r4, #52
	cmp	r4, r1
	beq	.L176
.L146:
	ldr	r3, [r4]
	cmp	r3, #17
	bgt	.L177
.L142:
	ldr	r3, [r4, #8]
	rsb	r3, r3, #0
	str	r3, [r4, #8]
	add	r4, r4, #52
	cmp	r4, r1
	bne	.L146
.L176:
	ldr	r9, .L184+4
	ldr	r3, .L184+8
	ldr	r2, [r9]
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r1, r3, r1, asr #2
	add	r1, r1, r1, lsl #2
	cmp	r2, r1, lsl #1
	bne	.L147
	ldr	r5, .L184
	ldr	r6, .L184+12
	b	.L152
.L179:
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	ldr	r0, [r5, #12]
	ldr	r1, [r5, #8]
	add	r2, r2, r0
	add	r3, r3, r1
	str	r2, [r5, #4]
	str	r3, [r5]
.L149:
	add	r5, r5, #52
	cmp	r5, r4
	beq	.L178
.L152:
	mov	lr, pc
	bx	r6
	rsbs	r3, r0, #0
	and	r3, r3, #3
	and	r0, r0, #3
	rsbpl	r0, r3, #0
	cmp	r0, #0
	beq	.L179
	cmp	r0, #1
	beq	.L180
	cmp	r0, #2
	beq	.L181
	cmp	r0, #3
	bne	.L149
	ldr	r2, [r5, #4]
	ldr	r1, [r5, #12]
	ldr	r3, [r5]
	sub	r2, r2, r1
	ldr	r1, [r5, #8]
	sub	r3, r3, r1
	str	r2, [r5, #4]
	str	r3, [r5]
	add	r5, r5, #52
	cmp	r5, r4
	bne	.L152
.L178:
	ldr	r2, [r9]
	asr	r3, r2, #31
.L147:
	ldr	ip, .L184+16
	smull	r0, r1, r2, ip
	rsb	r3, r3, r1, asr #4
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #1
	bne	.L153
	ldr	r3, .L184
	b	.L156
.L182:
	ldr	r1, [r3, #48]
	cmp	r1, #0
	add	r2, r2, #1
	bne	.L155
.L174:
	str	r2, [r3, #28]
.L155:
	add	r3, r3, #52
	cmp	r3, r4
	beq	.L153
.L156:
	ldr	r2, [r3, #28]
	cmp	r2, #10
	ble	.L182
	cmp	r2, #11
	bne	.L155
	ldr	r2, [r3, #48]
	cmp	r2, #0
	beq	.L174
	add	r3, r3, #52
	cmp	r3, r4
	bne	.L156
.L153:
	ldr	r5, .L184
	ldr	r6, .L184+20
	ldr	r8, .L184+24
	ldr	fp, .L184+28
	ldr	r10, .L184+32
.L160:
	ldr	ip, [r6]
	asr	ip, ip, #8
	ldr	lr, [r6, #20]
	str	ip, [sp]
	ldr	ip, [r6, #16]
	str	lr, [sp, #12]
	ldr	lr, [r6, #4]
	ldr	r3, [r5, #16]
	ldr	r2, [r5, #20]
	ldm	r5, {r0, r1}
	str	ip, [sp, #8]
	str	lr, [sp, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L158
	ldr	r3, [r5, #28]
	cmp	r3, #7
	ble	.L158
	ldr	r3, [r5, #44]
	cmp	r3, #0
	beq	.L183
.L158:
	add	r5, r5, #52
	cmp	r5, r4
	bne	.L160
	ldr	r2, [r9]
	ldr	r3, .L184+16
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #4
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #1
	bne	.L141
	mov	r1, #1
.L164:
	ldr	r3, [r7, #48]
	sub	r2, r3, #1
	cmp	r2, #10
	add	r2, r3, #1
	strls	r2, [r7, #48]
	bls	.L163
	cmp	r3, #12
	streq	r1, [r7, #48]
.L163:
	add	r7, r7, #52
	cmp	r5, r7
	bne	.L164
.L141:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L180:
	ldr	r2, [r5, #4]
	ldr	r1, [r5, #12]
	ldr	r3, [r5]
	sub	r2, r2, r1
	ldr	r1, [r5, #8]
	add	r3, r3, r1
	str	r2, [r5, #4]
	str	r3, [r5]
	b	.L149
.L183:
	mov	ip, #1
	ldr	r2, .L184+36
	str	ip, [r5, #44]
	str	ip, [r5, #48]
	ldr	r1, .L184+40
	mov	r0, fp
	ldr	ip, .L184+44
	mov	lr, pc
	bx	ip
	ldr	r3, [r10]
	ldr	r2, [r5, #44]
	add	r3, r3, #1
	cmp	r2, #0
	str	r3, [r10]
	movne	r3, #2
	strne	r3, [r6, #48]
	b	.L158
.L181:
	ldr	r2, [r5, #4]
	ldr	r1, [r5, #12]
	ldr	r3, [r5]
	add	r2, r2, r1
	ldr	r1, [r5, #8]
	sub	r3, r3, r1
	str	r2, [r5, #4]
	str	r3, [r5]
	b	.L149
.L185:
	.align	2
.L184:
	.word	lanterns
	.word	aniCounter
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
	ldr	r2, .L188
	ldr	r3, [r2]
	push	{r4, lr}
	add	r3, r3, #1
	str	r3, [r2]
	bl	updatePlayer
	bl	updateSmlbirds
	bl	updateLanterns
	ldr	r3, .L188+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L188+8
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L188+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r3, .L188+16
	ldr	r1, .L188+20
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
	pop	{r4, lr}
	bx	lr
.L189:
	.align	2
.L188:
	.word	aniCounter
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	vOff
	.word	hOff
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
	ldr	r3, .L228
	ldr	r2, .L228+4
	ldr	ip, .L228+8
	ldr	r8, .L228+12
	ldr	r6, .L228+16
	ldr	r4, .L228+20
	add	r0, r3, #520
.L215:
	ldr	r1, [r3, #44]
	cmp	r1, #0
	bne	.L191
	ldr	r1, [r3, #28]
	cmp	r1, #0
	moveq	fp, #132
	beq	.L218
	cmp	r1, #1
	moveq	fp, #133
	beq	.L218
	cmp	r1, #2
	moveq	fp, #134
	beq	.L218
	cmp	r1, #3
	moveq	fp, #135
	beq	.L218
	cmp	r1, #4
	moveq	fp, #164
	beq	.L218
	cmp	r1, #5
	moveq	fp, #165
	beq	.L218
	cmp	r1, #6
	moveq	fp, #166
	beq	.L218
	cmp	r1, #7
	beq	.L220
	cmp	r1, #8
	beq	.L221
	cmp	r1, #9
	beq	.L222
	cmp	r1, #10
	moveq	fp, #194
	beq	.L219
	cmp	r1, #11
	moveq	fp, #130
	bne	.L193
.L219:
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
	bne	.L215
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L191:
	ldr	r1, [r3, #48]
	cmp	r1, #1
	beq	.L223
	cmp	r1, #2
	moveq	fp, #320
	beq	.L219
	cmp	r1, #3
	moveq	fp, #256
	beq	.L219
	cmp	r1, #4
	moveq	fp, #192
	beq	.L219
	cmp	r1, #5
	moveq	fp, #128
	beq	.L219
	cmp	r1, #6
	bne	.L209
	mov	fp, #196
.L218:
	ldr	r1, [r3, #4]
	and	r1, r1, ip
	strh	r1, [r2, #138]	@ movhi
	ldrb	r1, [r3]	@ zero_extendqisi2
	strh	fp, [r2, #140]	@ movhi
	strh	r1, [r2, #136]	@ movhi
.L193:
	add	r3, r3, #52
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L215
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L223:
	mov	fp, #384
	b	.L219
.L209:
	cmp	r1, #7
	moveq	fp, #197
	beq	.L218
	cmp	r1, #8
	beq	.L224
	cmp	r1, #9
	beq	.L225
	cmp	r1, #10
	beq	.L226
	cmp	r1, #11
	beq	.L227
	cmp	r1, #12
	bne	.L193
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	r10, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L193
.L224:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	lr, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L193
.L220:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	orr	r1, r1, #16384
	strh	r4, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L193
.L225:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	r5, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L193
.L221:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	orr	r1, r1, #16384
	strh	r6, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L193
.L226:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	r7, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L193
.L222:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	orr	r1, r1, #16384
	strh	r8, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L193
.L227:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	r9, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L193
.L229:
	.align	2
.L228:
	.word	lanterns
	.word	shadowOAM
	.word	511
	.word	258
	.word	322
	.word	386
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
	push	{r4, lr}
	bl	drawPlayer
	bl	drawSmlbirds
	pop	{r4, lr}
	b	drawLanterns
	.size	drawGame1, .-drawGame1
	.comm	shadowOAM,1024,4
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
