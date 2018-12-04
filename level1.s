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
	mov	r2, #0
	mov	r0, #34560
	mov	r6, #120
	mov	r5, #2
	mov	r4, #1
	mov	lr, #256
	mov	r1, #16
	mov	ip, #5
	ldr	r3, .L4
	str	r6, [r3, #4]
	str	r5, [r3, #8]
	str	r4, [r3, #36]
	str	lr, [r3, #40]
	str	r0, [r3]
	str	r0, [r3, #44]
	str	ip, [r3, #48]
	str	r2, [r3, #12]
	str	r2, [r3, #32]
	str	r2, [r3, #64]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
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
	ldr	r3, .L20
	ldr	r2, [r3, #48]
	cmp	r2, #5
	beq	.L17
	cmp	r2, #4
	push	{r4, r5}
	beq	.L18
	cmp	r2, #3
	beq	.L19
	cmp	r2, #0
	moveq	r1, #16
	beq	.L16
	cmp	r2, #1
	moveq	r1, #144
	beq	.L16
	cmp	r2, #2
	bne	.L6
	mov	r1, #80
.L16:
	ldr	r2, [r3, #4]
	lsl	r2, r2, #23
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	lsr	r2, r2, #23
	ldr	r3, .L20+4
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	pop	{r4, r5}
	bx	lr
.L18:
	ldr	r2, [r3, #60]
	ldr	r1, .L20+8
	smull	r4, r5, r2, r1
	ldr	r1, [r3, #4]
	sub	r0, r5, r2, asr #31
	add	r0, r0, r0, lsl #1
	sub	r2, r2, r0
	lsl	r1, r1, #23
	ldr	r0, .L20+4
	lsl	r2, r2, #6
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	lsr	r1, r1, #23
	add	r2, r2, #20
	orr	r1, r1, #16384
	strh	r2, [r0, #4]	@ movhi
	strh	r3, [r0]	@ movhi
	strh	r1, [r0, #2]	@ movhi
.L6:
	pop	{r4, r5}
	bx	lr
.L17:
	mov	r1, #14
	ldr	r2, [r3, #4]
	lsl	r2, r2, #23
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	lsr	r2, r2, #23
	ldr	r3, .L20+4
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	bx	lr
.L19:
	ldr	r2, [r3, #60]
	ldr	r1, .L20+8
	smull	r4, r5, r2, r1
	ldr	r1, [r3, #4]
	sub	r0, r5, r2, asr #31
	add	r0, r0, r0, lsl #1
	sub	r2, r2, r0
	lsl	r1, r1, #23
	ldr	r0, .L20+4
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
.L21:
	.align	2
.L20:
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
	ldr	r3, .L55
	ldr	r2, [r3, #48]
	cmp	r2, #5
	push	{r4, r5, lr}
	streq	r2, [r3, #52]
	ldr	r2, .L55+4
	ldrh	r2, [r2]
	ands	r2, r2, #1
	str	r1, [r3, #48]
	beq	.L24
	ldr	r1, .L55+8
	ldrh	r1, [r1]
	tst	r1, #1
	bne	.L25
.L26:
	mov	r1, #0
.L53:
	str	r1, [r3, #60]
.L30:
	cmp	r2, #0
	ldr	r0, [r3, #64]
	ldr	r2, [r3, #32]
	beq	.L31
	ldr	r1, .L55+8
	ldrh	r1, [r1]
	ands	r1, r1, #1
	bne	.L31
	ldr	ip, .L55+12
	cmp	r2, #0
	str	r1, [ip]
	beq	.L54
.L31:
	cmp	r0, #0
	movne	r0, #0
	strne	r0, [r3, #12]
	strne	r0, [r3, #64]
	cmp	r2, #1
	ldr	r1, [r3]
	beq	.L32
.L34:
	ldr	r0, .L55+16
	ldr	r2, [r3, #12]
	ldr	r0, [r0]
	add	r2, r2, r0
	add	r0, r2, r1
	cmp	r0, #34816
	str	r1, [r3, #44]
	str	r0, [r3]
	str	r2, [r3, #12]
	blt	.L22
	mov	r2, #0
	mov	r1, #34560
	str	r2, [r3, #12]
	str	r2, [r3, #32]
	str	r1, [r3]
.L22:
	pop	{r4, r5, lr}
	bx	lr
.L24:
	ldr	r1, .L55+20
	ldrh	r1, [r1, #48]
	tst	r1, #32
	bne	.L38
.L37:
	ldr	r1, [r3, #4]
	ldr	r0, [r3, #8]
	cmp	r0, r1
	bgt	.L38
	mov	r4, #4
	ldr	lr, .L55+24
	sub	r1, r1, r0
	ldr	ip, [r3, #60]
	ldr	r0, [lr]
	cmp	ip, #1
	add	r0, r0, #1
	str	r1, [r3, #4]
	str	r0, [lr]
	str	r4, [r3, #48]
	bgt	.L26
.L29:
	add	ip, ip, #1
	str	ip, [r3, #60]
	b	.L30
.L25:
	ldr	r1, .L55+20
	ldrh	r1, [r1, #48]
	tst	r1, #32
	beq	.L37
.L38:
	ldr	r1, .L55+20
	ldrh	r1, [r1, #48]
	ands	r1, r1, #16
	bne	.L26
	ldr	ip, [r3, #4]
	ldr	r0, [r3, #20]
	ldr	lr, [r3, #8]
	add	r0, ip, r0
	rsb	r4, lr, #240
	cmp	r0, r4
	bgt	.L26
	mov	r5, #3
	ldr	r4, .L55+24
	add	ip, ip, lr
	ldr	r0, [r4]
	str	ip, [r3, #4]
	ldr	ip, [r3, #60]
	sub	r0, r0, #1
	cmp	ip, #1
	str	r0, [r4]
	str	r5, [r3, #48]
	bgt	.L53
	b	.L29
.L54:
	mov	ip, #1
	ldr	r1, .L55+28
	cmp	r0, #0
	str	r1, [r3, #12]
	str	r2, [r3, #36]
	str	ip, [r3, #32]
	ldr	r1, [r3]
	strne	r2, [r3, #12]
	strne	r2, [r3, #64]
.L32:
	ldr	r2, [r3, #44]
	cmp	r2, r1
	movlt	r2, #1
	strlt	r2, [r3, #48]
	blt	.L34
	movgt	r2, #0
	strgt	r2, [r3, #48]
	b	.L34
.L56:
	.align	2
.L55:
	.word	player
	.word	oldButtons
	.word	buttons
	.word	aniCounter
	.word	.LANCHOR0
	.word	67109120
	.word	hOff
	.word	-1792
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
	ldr	r3, .L72
	ldr	r2, [r3]
	cmp	r2, #120
	ldr	r3, .L72+4
	bgt	.L58
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L59
	ldr	ip, .L72+8
	smull	r0, r1, r2, ip
	sub	r1, r1, r2, asr #31
	add	r1, r1, r1, lsl #1
	cmp	r2, r1
	ldreq	r2, [r3]
	ldreq	r1, [r3, #12]
	subeq	r2, r2, r1
	streq	r2, [r3]
	bx	lr
.L58:
	ldr	r1, [r3]
	cmp	r1, #134
	ble	.L71
.L59:
	mov	r2, #0
	str	r2, [r3, #32]
	bx	lr
.L71:
	ldr	r0, [r3, #32]
	cmp	r0, #0
	beq	.L59
	ldr	r0, .L72+8
	push	{r4, r5}
	smull	r4, r5, r2, r0
	sub	r0, r5, r2, asr #31
	add	r0, r0, r0, lsl #1
	cmp	r2, r0
	ldreq	r2, [r3, #12]
	addeq	r1, r2, r1
	streq	r1, [r3]
.L57:
	pop	{r4, r5}
	bx	lr
.L73:
	.align	2
.L72:
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
	ldr	r4, .L81
	ldr	r5, .L81+4
	ldr	r8, .L81+8
	ldr	r7, .L81+12
	add	r6, r4, #224
.L78:
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
	beq	.L76
	cmp	r9, #1
	moveq	r3, #2
	movne	r3, #3
	str	r3, [r4, #12]
.L76:
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
	bne	.L78
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L82:
	.align	2
.L81:
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L112
	mov	r4, r5
	ldr	r6, .L112+4
	ldr	r9, .L112+8
	ldr	r7, .L112+12
	ldr	r10, .L112+16
	sub	sp, sp, #20
	add	r8, r5, #224
.L93:
	ldr	r1, [r4, #4]
	cmp	r1, #240
	movle	r2, #0
	movgt	r2, #1
	ldr	r3, [r4, #16]
	add	r0, r1, r3
	cmp	r0, #0
	orrle	r2, r2, #1
	cmp	r2, #0
	beq	.L84
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	and	r0, r0, #1
	mov	r3, r0
	rsblt	r3, r0, #0
	cmp	r3, #0
	bne	.L85
	ldr	r2, [r4, #16]
	rsb	r2, r2, #240
	str	r2, [r4, #4]
	str	r3, [r4, #48]
	mov	r0, #30
	ldr	r3, .L112+20
	mov	lr, pc
	bx	r3
	add	r0, r0, #40
	str	r0, [r4]
	mov	lr, pc
	bx	r7
	smull	r2, r3, r0, r10
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	subs	r3, r0, r3
	bne	.L109
	mov	r3, #1
	ldr	r1, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r4, #16]
.L84:
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
	beq	.L92
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L110
.L92:
	add	r4, r4, #56
	cmp	r4, r8
	bne	.L93
.L94:
	ldr	r3, [r5, #4]
	ldr	r2, [r5, #12]
	sub	r3, r3, r2
	str	r3, [r5, #4]
	add	r5, r5, #56
	cmp	r4, r5
	bne	.L94
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L85:
	mov	r2, #1
	mov	r3, #0
	str	r2, [r4, #48]
	str	r3, [r4, #4]
	mov	lr, pc
	bx	r7
	ldr	r1, .L112+24
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
	bx	r7
	smull	r2, r3, r0, r10
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	subs	r3, r0, r3
	bne	.L111
	mvn	r3, #0
	ldr	r1, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r4, #16]
	b	.L84
.L110:
	mov	ip, #1
	mov	r0, #0
	mov	lr, #2
	ldr	r3, .L112+28
	ldr	fp, .L112+32
	ldr	r1, [r3]
	smull	r2, r3, r1, fp
	sub	r2, r3, r1, asr #31
	add	r2, r2, r2, lsl ip
	ldr	r3, .L112+36
	ldr	fp, .L112+40
	sub	r1, r1, r2, lsl ip
	lsl	r2, r1, ip
	str	r2, [r4, #36]
	ldr	r1, [r3]
	ldr	r2, [fp]
	sub	r1, r1, #1
	sub	r2, r2, #1
	str	r1, [r3]
	str	r2, [fp]
	mov	r3, r0
	str	r0, [r4, #44]
	ldr	r2, .L112+44
	ldr	r1, .L112+48
	ldr	r0, .L112+52
	str	lr, [r4, #28]
	ldr	fp, .L112+56
	str	ip, [r4, #52]
	str	ip, [r6, #64]
	mov	lr, pc
	bx	fp
	b	.L92
.L109:
	cmp	r3, #1
	moveq	r3, #2
	movne	r3, #3
	ldr	r1, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r4, #16]
	b	.L84
.L111:
	cmp	r3, #1
	mvneq	r3, #1
	mvnne	r3, #2
	ldr	r1, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r4, #16]
	b	.L84
.L113:
	.align	2
.L112:
	.word	smlbird1
	.word	player
	.word	collision
	.word	rand
	.word	1431655766
	.word	myRandom
	.word	-368140053
	.word	aniCounter
	.word	715827883
	.word	birdsNum
	.word	livesNum
	.word	11025
	.word	6586
	.word	hitbird
	.word	playSoundB
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
	ldr	r3, [r0, #52]
	cmp	r3, #0
	bxeq	lr
	str	lr, [sp, #-4]!
	rsb	r2, r1, r1, lsl #3
	ldr	lr, .L123
	lsl	r2, r2, #3
	add	r0, lr, r2
	ldr	r3, [r0, #4]
	ldr	ip, .L123+4
	ldr	r0, [r0, #36]
	add	r1, r1, #9
	lsl	r3, r3, #23
	ldrb	lr, [lr, r2]	@ zero_extendqisi2
	lsl	r1, r1, #3
	lsr	r3, r3, #23
	add	r2, r0, #832
	orr	r3, r3, #16384
	add	r0, ip, r1
	strh	lr, [ip, r1]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L124:
	.align	2
.L123:
	.word	smlbird1
	.word	shadowOAM
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r4, #512
	mov	r5, #0
	ldr	r3, .L136
	ldr	r2, .L136+4
	ldr	r3, [r3]
	smull	r0, r1, r3, r2
	sub	r2, r1, r3, asr #31
	add	r2, r2, r2, lsl #1
	sub	r2, r3, r2, lsl #1
	add	r6, r2, #32
	ldr	r3, .L136+8
	lsl	r1, r2, #17
	lsl	r6, r6, #17
	ldr	r2, .L136+12
	ldr	r7, .L136+16
	lsr	r6, r6, #16
	lsr	r1, r1, #16
	add	r8, r3, #224
.L130:
	ldr	r0, [r3, #44]
	cmp	r0, #0
	beq	.L126
	ldr	r0, [r3, #28]
	cmp	r0, #0
	bne	.L126
	ldr	ip, [r3, #48]
	ldr	r0, [r3, #4]
	cmp	ip, #0
	and	r0, r0, r7
	ldrb	ip, [r3]	@ zero_extendqisi2
	orr	r0, r0, #16384
	strh	ip, [r2, #72]	@ movhi
	strh	r0, [r2, #74]	@ movhi
	strheq	r1, [r2, #76]	@ movhi
	strhne	r6, [r2, #76]	@ movhi
.L128:
	add	r3, r3, #56
	cmp	r8, r3
	add	r2, r2, #8
	bne	.L130
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L126:
	ldr	r0, [r3, #52]
	cmp	r0, #0
	strheq	r4, [r2, #72]	@ movhi
	beq	.L128
	ldr	r0, [r3, #4]
	ldr	lr, [r3, #48]
	ldr	ip, [r3, #40]
	and	r0, r0, r7
	add	r9, lr, #13
	orr	r0, r0, #16384
	ldr	lr, [r3, #36]
	add	ip, ip, #1
	strh	r0, [r2, #74]	@ movhi
	ldrb	r0, [r3]	@ zero_extendqisi2
	add	lr, lr, r9, lsl #6
	cmp	ip, #5
	strh	lr, [r2, #76]	@ movhi
	str	ip, [r3, #40]
	strh	r0, [r2, #72]	@ movhi
	strgt	r5, [r3, #52]
	b	.L128
.L137:
	.align	2
.L136:
	.word	aniCounter
	.word	715827883
	.word	smlbird1
	.word	shadowOAM
	.word	511
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
	ldr	r4, .L142
	ldr	r6, .L142+4
	ldr	r5, .L142+8
	add	r9, r4, #520
.L139:
	mov	lr, pc
	bx	r6
	smull	r10, fp, r0, r5
	asr	r2, r0, #31
	rsb	r3, r2, fp, asr #4
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #3
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
	bne	.L139
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L143:
	.align	2
.L142:
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
	ldr	r4, .L146
	ldr	r2, .L146+4
	ldr	r1, .L146+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L146+12
	ldr	r1, .L146+16
	mov	r0, #3
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L146+20
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r8, #7168
	mov	r4, #0
	mov	r0, #34560
	mov	r1, #16
	mov	lr, #2
	mov	ip, #256
	mov	r5, #1
	mov	r6, #5
	mov	r7, #120
	ldrh	r2, [r3]
	orr	r2, r2, #4096
	strh	r2, [r3]	@ movhi
	strh	r8, [r3, #12]	@ movhi
	ldr	r3, .L146+24
	stmib	r3, {r7, lr}
	str	r0, [r3]
	str	r0, [r3, #44]
	str	ip, [r3, #40]
	str	r4, [r3, #12]
	str	r4, [r3, #32]
	str	r4, [r3, #64]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r5, [r3, #36]
	str	r6, [r3, #48]
	bl	initSmlbirds
	bl	initLanterns
	mov	r0, #180
	mov	r1, #8
	mov	r2, #4
	ldr	r3, .L146+28
	ldr	ip, .L146+32
	ldrh	lr, [ip, #48]
	str	r0, [r3, #4]
	ldr	r0, .L146+36
	str	r6, [r3]
	str	r4, [r0]
	str	r4, [r3, #24]
	str	r4, [r3, #28]
	str	r1, [r3, #16]
	ldr	ip, .L146+40
	str	r1, [r3, #20]
	ldr	r0, .L146+44
	ldr	r1, .L146+48
	ldr	r3, .L146+52
	strh	lr, [ip]	@ movhi
	str	r4, [r0]
	str	r4, [r1]
	str	r5, [r3]
	ldr	ip, .L146+56
	ldr	r0, .L146+60
	ldr	r1, .L146+64
	ldr	r3, .L146+68
	str	r4, [ip]
	str	r4, [r0]
	str	r2, [r1]
	str	r2, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L147:
	.align	2
.L146:
	.word	DMANow
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	player
	.word	live
	.word	67109120
	.word	aniCounter
	.word	buttons
	.word	lanternNum
	.word	hidecountlevel1
	.word	level
	.word	vOff
	.word	hOff
	.word	livesNum
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
	ldr	r9, .L189
	ldr	r7, .L189+4
	ldr	r1, [r9]
	sub	sp, sp, #20
	mov	r6, #5
	mov	r4, r7
	ldr	r10, .L189+8
	ldr	r5, .L189+12
	asr	r0, r1, #31
	add	r8, r7, #520
	b	.L159
.L184:
	ldr	r3, [r4]
.L150:
	cmp	r3, #14
	movle	r3, #15
	strle	r3, [r4]
	ble	.L156
	ldr	r2, [r4, #20]
	add	r3, r2, r3
	cmp	r3, #100
	rsbgt	r2, r2, #100
	strgt	r2, [r4]
	bgt	.L156
	ldr	r3, [r4, #4]
	cmp	r3, #4
	strle	r6, [r4, #4]
	ble	.L156
	ldr	r2, [r4, #16]
	add	r3, r3, r2
	cmp	r3, #200
	rsbgt	r2, r2, #200
	strgt	r2, [r4, #4]
.L156:
	add	r4, r4, #52
	cmp	r4, r8
	beq	.L183
.L159:
	smull	r2, r3, r1, r10
	rsb	r3, r0, r3, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r1, r3, lsl #1
	bne	.L184
	mov	lr, pc
	bx	r5
	rsbs	r3, r0, #0
	and	r3, r3, #3
	and	r0, r0, #3
	rsbpl	r0, r3, #0
	cmp	r0, #0
	bne	.L151
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #12]
	ldr	r0, [r4]
	ldr	r3, [r4, #8]
	add	r2, r2, r1
.L180:
	ldr	r1, [r9]
	add	r3, r0, r3
	str	r2, [r4, #4]
	str	r3, [r4]
	asr	r0, r1, #31
	b	.L150
.L151:
	cmp	r0, #1
	beq	.L185
	cmp	r0, #2
	beq	.L186
	cmp	r0, #3
	beq	.L154
	ldr	r1, [r9]
	ldr	r3, [r4]
	asr	r0, r1, #31
	b	.L150
.L183:
	ldr	ip, .L189+16
	smull	r2, r3, r1, ip
	rsb	r0, r0, r3, asr #4
	add	r0, r0, r0, lsl #2
	add	r0, r0, r0, lsl #2
	cmp	r1, r0, lsl #1
	bne	.L160
	ldr	r3, .L189+4
	b	.L163
.L187:
	ldr	r1, [r3, #48]
	cmp	r1, #0
	add	r2, r2, #1
	bne	.L162
.L181:
	str	r2, [r3, #28]
.L162:
	add	r3, r3, #52
	cmp	r3, r4
	beq	.L160
.L163:
	ldr	r2, [r3, #28]
	cmp	r2, #10
	ble	.L187
	cmp	r2, #11
	bne	.L162
	ldr	r2, [r3, #48]
	cmp	r2, #0
	beq	.L181
	add	r3, r3, #52
	cmp	r3, r4
	bne	.L163
.L160:
	ldr	r5, .L189+4
	ldr	r6, .L189+20
	ldr	r8, .L189+24
	ldr	fp, .L189+28
	ldr	r10, .L189+32
.L167:
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
	beq	.L165
	ldr	r3, [r5, #28]
	cmp	r3, #7
	ble	.L165
	ldr	r3, [r5, #44]
	cmp	r3, #0
	beq	.L188
.L165:
	add	r5, r5, #52
	cmp	r5, r4
	bne	.L167
	ldr	r2, [r9]
	ldr	r3, .L189+16
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #4
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #1
	bne	.L148
	mov	r1, #1
.L171:
	ldr	r3, [r7, #48]
	sub	r2, r3, #1
	cmp	r2, #10
	add	r2, r3, #1
	strls	r2, [r7, #48]
	bls	.L170
	cmp	r3, #12
	streq	r1, [r7, #48]
.L170:
	add	r7, r7, #52
	cmp	r5, r7
	bne	.L171
.L148:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L188:
	mov	ip, #1
	ldr	r2, .L189+36
	str	ip, [r5, #44]
	str	ip, [r5, #48]
	ldr	r1, .L189+40
	mov	r0, fp
	ldr	ip, .L189+44
	mov	lr, pc
	bx	ip
	ldr	r3, [r10]
	ldr	r2, [r5, #44]
	add	r3, r3, #1
	cmp	r2, #0
	str	r3, [r10]
	movne	r3, #2
	strne	r3, [r6, #48]
	b	.L165
.L185:
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #12]
	ldr	r0, [r4]
	ldr	r3, [r4, #8]
	sub	r2, r2, r1
	b	.L180
.L154:
	ldr	r1, [r4]
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #4]
	ldr	r0, [r4, #12]
	sub	r3, r1, r3
	ldr	r1, [r9]
	sub	r2, r2, r0
	str	r2, [r4, #4]
	str	r3, [r4]
	asr	r0, r1, #31
	b	.L150
.L186:
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #12]
	ldr	r0, [r4]
	ldr	r3, [r4, #8]
	add	r2, r2, r1
	ldr	r1, [r9]
	sub	r3, r0, r3
	str	r2, [r4, #4]
	str	r3, [r4]
	asr	r0, r1, #31
	b	.L150
.L190:
	.align	2
.L189:
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
	ldr	r3, .L229
	ldr	r2, .L229+4
	ldr	ip, .L229+8
	ldr	r8, .L229+12
	ldr	r6, .L229+16
	ldr	r4, .L229+20
	add	r0, r3, #520
.L216:
	ldr	r1, [r3, #44]
	cmp	r1, #0
	bne	.L192
	ldr	r1, [r3, #28]
	cmp	r1, #0
	moveq	fp, #132
	beq	.L219
	cmp	r1, #1
	moveq	fp, #133
	beq	.L219
	cmp	r1, #2
	moveq	fp, #134
	beq	.L219
	cmp	r1, #3
	moveq	fp, #135
	beq	.L219
	cmp	r1, #4
	moveq	fp, #164
	beq	.L219
	cmp	r1, #5
	moveq	fp, #165
	beq	.L219
	cmp	r1, #6
	moveq	fp, #166
	beq	.L219
	cmp	r1, #7
	beq	.L221
	cmp	r1, #8
	beq	.L222
	cmp	r1, #9
	beq	.L223
	cmp	r1, #10
	moveq	fp, #194
	beq	.L220
	cmp	r1, #11
	moveq	fp, #130
	bne	.L194
.L220:
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
	bne	.L216
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L192:
	ldr	r1, [r3, #48]
	cmp	r1, #1
	beq	.L224
	cmp	r1, #2
	moveq	fp, #320
	beq	.L220
	cmp	r1, #3
	moveq	fp, #256
	beq	.L220
	cmp	r1, #4
	moveq	fp, #192
	beq	.L220
	cmp	r1, #5
	moveq	fp, #128
	beq	.L220
	cmp	r1, #6
	bne	.L210
	mov	fp, #196
.L219:
	ldr	r1, [r3, #4]
	and	r1, r1, ip
	strh	r1, [r2, #138]	@ movhi
	ldrb	r1, [r3]	@ zero_extendqisi2
	strh	fp, [r2, #140]	@ movhi
	strh	r1, [r2, #136]	@ movhi
.L194:
	add	r3, r3, #52
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L216
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L224:
	mov	fp, #384
	b	.L220
.L210:
	cmp	r1, #7
	moveq	fp, #197
	beq	.L219
	cmp	r1, #8
	beq	.L225
	cmp	r1, #9
	beq	.L226
	cmp	r1, #10
	beq	.L227
	cmp	r1, #11
	beq	.L228
	cmp	r1, #12
	bne	.L194
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	r10, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L194
.L225:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	lr, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L194
.L221:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	orr	r1, r1, #16384
	strh	r4, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L194
.L226:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	r5, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L194
.L222:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	orr	r1, r1, #16384
	strh	r6, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L194
.L227:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	r7, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L194
.L223:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	orr	r1, r1, #16384
	strh	r8, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L194
.L228:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	r9, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L194
.L230:
	.align	2
.L229:
	.word	lanterns
	.word	shadowOAM
	.word	511
	.word	258
	.word	322
	.word	386
	.size	drawLanterns, .-drawLanterns
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
	ldr	r3, .L232
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	bx	lr
.L233:
	.align	2
.L232:
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
	ldr	r3, .L239
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L238
	bxle	lr
	mov	r1, #180
	ldr	r3, .L239+4
	ldr	r3, [r3, #28]
	rsbs	r2, r3, #0
	and	r2, r2, #7
	and	r3, r3, #7
	rsbpl	r3, r2, #0
	lsl	r3, r3, #5
.L237:
	ldr	r2, .L239+8
	ldr	r0, .L239+12
	add	r3, r3, #780
	strh	r3, [r2, #4]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	bx	lr
.L238:
	ldr	r3, .L239+4
	ldr	r3, [r3, #28]
	rsbs	r2, r3, #0
	and	r2, r2, #3
	and	r3, r3, #3
	rsbpl	r3, r2, #0
	mov	r1, #180
	lsl	r3, r3, #6
	b	.L237
.L240:
	.align	2
.L239:
	.word	level
	.word	live
	.word	shadowOAM+352
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
	ldr	r3, .L244
	ldr	r2, [r3]
	ldr	r3, .L244+4
	ldr	r3, [r3]
	cmp	r2, #1
	ldr	r2, .L244+8
	rsbeq	r3, r3, #4
	rsbne	r3, r3, #8
	str	r3, [r2, #28]
	bx	lr
.L245:
	.align	2
.L244:
	.word	level
	.word	livesNum
	.word	live
	.size	updateLive1, .-updateLive1
	.align	2
	.global	initBird2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBird2, %function
initBird2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r10, #1
	ldr	r4, .L253
	ldr	r5, .L253+4
	ldr	r8, .L253+8
	ldr	r7, .L253+12
	add	r6, r4, #224
.L250:
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
	beq	.L248
	cmp	r9, #1
	moveq	r3, #2
	movne	r3, #3
	str	r3, [r4, #12]
.L248:
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
	bne	.L250
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L254:
	.align	2
.L253:
	.word	smlbird2
	.word	rand
	.word	1431655766
	.word	-368140053
	.size	initBird2, .-initBird2
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
	push	{r4, r5, r6, lr}
	mov	r1, #34560
	mov	r4, #0
	mov	r2, #16
	mov	lr, #120
	mov	ip, #1
	mov	r0, #256
	mov	r5, #2
	mov	r6, #5
	ldr	r3, .L257
	str	r1, [r3]
	str	r1, [r3, #44]
	str	lr, [r3, #4]
	str	ip, [r3, #36]
	str	r0, [r3, #40]
	str	r5, [r3, #8]
	str	r4, [r3, #12]
	str	r4, [r3, #32]
	str	r4, [r3, #64]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r6, [r3, #48]
	bl	initSmlbirds
	bl	initBird2
	bl	initLanterns
	mov	lr, #180
	mov	r2, #8
	mov	r1, #4
	ldr	r0, .L257+4
	ldr	ip, .L257+8
	ldrh	ip, [ip, #48]
	str	r5, [r0]
	ldr	r0, .L257+12
	strh	ip, [r0]	@ movhi
	ldr	r0, .L257+16
	ldr	ip, .L257+20
	str	r4, [r0]
	ldr	r0, .L257+24
	ldr	r3, .L257+28
	str	r4, [ip]
	str	r4, [r0]
	ldr	ip, .L257+32
	ldr	r0, .L257+36
	str	r4, [ip]
	str	r4, [r0]
	str	lr, [r3, #4]
	ldr	ip, .L257+40
	ldr	lr, .L257+44
	ldr	r0, .L257+48
	str	r6, [r3]
	str	r4, [r3, #24]
	str	r4, [r3, #28]
	str	r2, [lr]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r1, [ip]
	str	r1, [r0]
	pop	{r4, r5, r6, lr}
	bx	lr
.L258:
	.align	2
.L257:
	.word	player
	.word	level
	.word	67109120
	.word	buttons
	.word	aniCounter
	.word	lanternNum
	.word	hidecountlevel2
	.word	live
	.word	vOff
	.word	hOff
	.word	birdsNum
	.word	livesNum
	.word	birds2Num
	.size	initGame2, .-initGame2
	.align	2
	.global	drawBird2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBird2, %function
drawBird2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	lr, #512
	mov	r4, r2
	ldr	r1, .L270
	ldr	r3, .L270+4
	ldr	r1, [r1]
	smull	r6, r7, r1, r3
	sub	r3, r7, r1, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, r1, r3, lsl #1
	add	r6, r3, #384
	add	r3, r3, #352
	lsl	r1, r3, #17
	lsl	r6, r6, #17
	ldr	r3, .L270+8
	ldr	r5, .L270+12
	ldr	r7, .L270+16
	lsr	r6, r6, #16
	lsr	r0, r1, #16
.L264:
	ldr	r1, [r3, #44]
	cmp	r1, #0
	beq	.L260
	ldr	r1, [r3, #28]
	cmp	r1, #0
	bne	.L260
	ldr	r8, [r3, #4]
	ldr	r9, [r3, #48]
	add	ip, r5, r2
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r8, r8, r7
	cmp	r9, #0
	orr	r8, r8, #16384
	add	r9, ip, #360
	add	ip, ip, #364
	strheq	fp, [r9]	@ movhi
	strheq	r8, [r9, #2]	@ movhi
	strhne	fp, [r9]	@ movhi
	strhne	r8, [r9, #2]	@ movhi
	strheq	r0, [ip]	@ movhi
	strhne	r6, [ip]	@ movhi
.L262:
	add	r2, r2, #8
	cmp	r2, #32
	add	r3, r3, #56
	bne	.L264
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L260:
	ldr	ip, [r3, #52]
	add	r1, r5, r2
	cmp	ip, #0
	add	r10, r1, #360
	add	r1, r1, #364
	addeq	r1, r2, #360
	strheq	lr, [r5, r1]	@ movhi
	beq	.L262
	ldr	ip, [r3, #4]
	ldr	r9, [r3, #48]
	ldr	r8, [r3, #40]
	and	ip, ip, r7
	add	fp, r9, #13
	orr	ip, ip, #16384
	ldr	r9, [r3, #36]
	add	r8, r8, #1
	strh	ip, [r10, #2]	@ movhi
	ldrb	ip, [r3]	@ zero_extendqisi2
	add	r9, r9, fp, lsl #6
	cmp	r8, #5
	strh	ip, [r10]	@ movhi
	str	r8, [r3, #40]
	strh	r9, [r1]	@ movhi
	strgt	r4, [r3, #52]
	b	.L262
.L271:
	.align	2
.L270:
	.word	aniCounter
	.word	715827883
	.word	smlbird2
	.word	shadowOAM
	.word	511
	.size	drawBird2, .-drawBird2
	.align	2
	.global	updateBird2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBird2, %function
updateBird2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L301
	mov	r4, r5
	ldr	r6, .L301+4
	ldr	r9, .L301+8
	ldr	r7, .L301+12
	ldr	fp, .L301+16
	ldr	r10, .L301+20
	sub	sp, sp, #20
	add	r8, r5, #224
.L282:
	ldr	r1, [r4, #4]
	cmp	r1, #240
	movle	r2, #0
	movgt	r2, #1
	ldr	r3, [r4, #16]
	add	r0, r1, r3
	cmp	r0, #0
	orrle	r2, r2, #1
	cmp	r2, #0
	beq	.L273
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	and	r0, r0, #1
	mov	r3, r0
	rsblt	r3, r0, #0
	cmp	r3, #0
	bne	.L274
	ldr	r2, [r4, #16]
	rsb	r2, r2, #240
	str	r3, [r4, #48]
	str	r2, [r4, #4]
	mov	r0, #30
	mov	lr, pc
	bx	fp
	add	r0, r0, #50
	str	r0, [r4]
	mov	lr, pc
	bx	r7
	smull	r2, r3, r0, r10
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	subs	r3, r0, r3
	bne	.L298
	mov	r3, #1
	ldr	r1, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r4, #16]
.L273:
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
	beq	.L281
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L299
.L281:
	add	r4, r4, #56
	cmp	r4, r8
	bne	.L282
.L283:
	ldr	r3, [r5, #4]
	ldr	r2, [r5, #12]
	sub	r3, r3, r2
	str	r3, [r5, #4]
	add	r5, r5, #56
	cmp	r4, r5
	bne	.L283
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L274:
	mov	r2, #1
	mov	r3, #0
	str	r2, [r4, #48]
	str	r3, [r4, #4]
	mov	r0, #30
	mov	lr, pc
	bx	fp
	add	r0, r0, #50
	str	r0, [r4]
	mov	lr, pc
	bx	r7
	smull	r2, r3, r0, r10
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	subs	r3, r0, r3
	bne	.L300
	mvn	r3, #0
	ldr	r1, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r4, #16]
	b	.L273
.L299:
	mov	ip, #2
	mov	r0, #0
	str	ip, [r4, #28]
	mov	ip, #1
	ldr	r3, .L301+24
	ldr	lr, .L301+28
	ldr	r1, [r3]
	smull	r2, r3, r1, lr
	ldr	lr, .L301+32
	sub	r3, r3, r1, asr #31
	add	r3, r3, r3, lsl #1
	ldr	r2, [lr]
	sub	r3, r1, r3, lsl #1
	ldr	r1, .L301+36
	sub	r2, r2, #1
	ldr	r1, [r1]
	str	r2, [lr]
	ldr	lr, .L301+36
	lsl	r3, r3, #1
	sub	r1, r1, #1
	str	r3, [r4, #36]
	str	r1, [lr]
	mov	r3, r0
	str	r0, [r4, #44]
	str	ip, [r4, #52]
	ldr	r2, .L301+40
	ldr	r1, .L301+44
	ldr	r0, .L301+48
	ldr	ip, .L301+52
	mov	lr, pc
	bx	ip
	b	.L281
.L298:
	cmp	r3, #1
	moveq	r3, #2
	movne	r3, #3
	ldr	r1, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r4, #16]
	b	.L273
.L300:
	cmp	r3, #1
	mvneq	r3, #1
	mvnne	r3, #2
	ldr	r1, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r4, #16]
	b	.L273
.L302:
	.align	2
.L301:
	.word	smlbird2
	.word	player
	.word	collision
	.word	rand
	.word	myRandom
	.word	1431655766
	.word	aniCounter
	.word	715827883
	.word	livesNum
	.word	birds2Num
	.word	11025
	.word	6586
	.word	hitbird
	.word	playSoundB
	.size	updateBird2, .-updateBird2
	.align	2
	.global	initLGBird
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLGBird, %function
initLGBird:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	fp, #0
	mov	r10, #32
	mov	r6, #1
	ldr	r4, .L310
	ldr	r9, .L310+4
	ldr	r8, .L310+8
	ldr	r7, .L310+12
.L307:
	str	r10, [r4, #20]
	str	r10, [r4, #16]
	mov	lr, pc
	bx	r9
	mov	r1, r0
	smull	r2, r3, r0, r7
	sub	r5, r3, r0, asr #31
	add	r5, r5, r5, lsl #1
	mov	r0, #30
	sub	r5, r1, r5
	mov	lr, pc
	bx	r8
	mvn	r3, #39
	cmp	r5, #0
	add	r0, r0, #50
	stm	r4, {r0, r3, r6}
	streq	r6, [r4, #12]
	beq	.L305
	cmp	r5, #1
	moveq	r3, #2
	movne	r3, #3
	str	r3, [r4, #12]
.L305:
	mov	r3, #0
	cmp	fp, #1
	str	r6, [r4, #44]
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	str	r3, [r4, #32]
	str	r3, [r4, #36]
	str	r3, [r4, #40]
	str	r3, [r4, #52]
	add	r4, r4, #56
	bne	.L308
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L308:
	mov	fp, #1
	b	.L307
.L311:
	.align	2
.L310:
	.word	lgbird
	.word	rand
	.word	myRandom
	.word	1431655766
	.size	initLGBird, .-initLGBird
	.align	2
	.global	initGame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame3, %function
initGame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r1, #34560
	mov	r4, #0
	mov	r2, #16
	mov	lr, #120
	mov	ip, #1
	mov	r0, #256
	mov	r5, #2
	mov	r6, #5
	ldr	r3, .L314
	mov	r7, #180
	str	r1, [r3]
	str	r1, [r3, #44]
	str	lr, [r3, #4]
	str	ip, [r3, #36]
	str	r0, [r3, #40]
	str	r5, [r3, #8]
	str	r4, [r3, #12]
	str	r4, [r3, #32]
	str	r4, [r3, #64]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r6, [r3, #48]
	bl	initSmlbirds
	bl	initBird2
	bl	initLGBird
	bl	initLanterns
	mov	r2, #8
	mov	r1, #4
	mov	r0, #3
	ldr	ip, .L314+4
	ldr	lr, .L314+8
	ldrh	lr, [lr, #48]
	str	r5, [ip]
	ldr	ip, .L314+12
	ldr	r3, .L314+16
	strh	lr, [ip]	@ movhi
	ldr	ip, .L314+20
	str	r6, [r3]
	str	r4, [ip]
	str	r4, [r3, #24]
	str	r4, [r3, #28]
	str	r7, [r3, #4]
	ldr	ip, .L314+24
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	ldr	r3, .L314+28
	str	r4, [ip]
	str	r4, [r3]
	ldr	lr, .L314+32
	ldr	ip, .L314+36
	ldr	r3, .L314+40
	str	r4, [lr]
	str	r4, [ip]
	ldr	lr, .L314+44
	str	r2, [r3]
	ldr	ip, .L314+48
	ldr	r3, .L314+52
	str	r1, [lr]
	str	r1, [ip]
	str	r0, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L315:
	.align	2
.L314:
	.word	player
	.word	lgbirdsNum
	.word	67109120
	.word	buttons
	.word	live
	.word	aniCounter
	.word	hidecountlevel3
	.word	vOff
	.word	lanternNum
	.word	hOff
	.word	livesNum
	.word	birdsNum
	.word	birds2Num
	.word	level
	.size	initGame3, .-initGame3
	.align	2
	.global	drawLGBird
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLGBird, %function
drawLGBird:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	lr, #924
	ldr	r3, .L327
	ldr	r3, [r3]
	cmp	r3, r0
	and	r3, r3, #1
	rsblt	r3, r3, #0
	add	r4, r3, #115
	add	r3, r3, #144
	lsl	r2, r3, #18
	lsl	r4, r4, #18
	ldr	r3, .L327+4
	ldr	r5, .L327+8
	ldr	r7, .L327+12
	ldr	r6, .L327+16
	lsr	r4, r4, #16
	lsr	r2, r2, #16
.L321:
	ldr	r1, [r3, #4]
	ldr	r8, [r3, #44]
	and	ip, r1, r7
	cmp	r8, #0
	and	r1, r6, #32768
	orr	r1, r1, ip
	ldrb	r8, [r3]	@ zero_extendqisi2
	beq	.L317
	ldr	ip, [r3, #28]
	cmp	ip, #0
	bne	.L317
	ldr	r10, [r3, #48]
	add	r9, r5, r0
	cmp	r10, #0
	add	fp, r9, #392
	add	r9, r9, #396
	strheq	r8, [fp]	@ movhi
	strheq	r1, [fp, #2]	@ movhi
	strhne	r8, [fp]	@ movhi
	strhne	r1, [fp, #2]	@ movhi
	strheq	r2, [r9]	@ movhi
	strhne	r4, [r9]	@ movhi
.L319:
	add	r0, r0, #8
	cmp	r0, #16
	add	r3, r3, #56
	bne	.L321
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L317:
	ldr	r9, [r3, #52]
	add	ip, r5, r0
	cmp	r9, #0
	add	r10, ip, #392
	add	ip, ip, #396
	beq	.L320
	ldr	r9, [r3, #36]
	add	r9, r9, #832
	strh	r8, [r10]	@ movhi
	strh	r1, [r10, #2]	@ movhi
	strh	r9, [ip]	@ movhi
	b	.L319
.L320:
	add	ip, r5, r0
	add	r9, ip, #392
	add	ip, ip, #396
	strh	r8, [r9]	@ movhi
	strh	r1, [r9, #2]	@ movhi
	strh	lr, [ip]	@ movhi
	b	.L319
.L328:
	.align	2
.L327:
	.word	aniCounter
	.word	lgbird
	.word	shadowOAM
	.word	511
	.word	-32768
	.size	drawLGBird, .-drawLGBird
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L336
	bl	drawPlayer
	bl	drawSmlbirds
	bl	drawLanterns
	bl	drawLive1
	ldr	r1, [r4]
	cmp	r1, #1
	bgt	.L335
.L330:
	mov	r10, #752
	ldr	r3, .L336+4
	mov	r2, #5
	mov	r6, r3
	strh	r10, [r3, #4]	@ movhi
	sub	r10, r10, #3
	strh	r10, [r3, #12]	@ movhi
	mov	r10, #30	@ movhi
	strh	r2, [r6, #8]!	@ movhi
	mov	r5, r3
	strh	r10, [r6, #2]	@ movhi
	add	r6, r1, #716
	strh	r6, [r3, #52]	@ movhi
	mov	r6, #40	@ movhi
	mov	r9, #748
	mov	lr, r3
	mov	r8, #20
	mov	r4, r3
	mov	r0, r3
	mov	ip, r3
	strh	r2, [r5, #16]!	@ movhi
	mov	fp, #160
	mov	r7, #125
	strh	r6, [r5, #2]	@ movhi
	mov	r5, #10	@ movhi
	strh	r9, [r3, #28]	@ movhi
	ldr	r9, .L336+8
	ldr	r9, [r9]
	add	r9, r9, #716
	strh	r9, [r3, #20]	@ movhi
	ldr	r9, .L336+12
	strh	r2, [lr, #32]!	@ movhi
	ldr	r9, [r9]
	strh	r8, [lr, #2]	@ movhi
	ldr	lr, .L336+16
	add	r9, r9, #716
	strh	lr, [r0, #40]!	@ movhi
	strh	r2, [r4, #24]!	@ movhi
	strh	r2, [ip, #48]!	@ movhi
	strh	r9, [r3, #36]	@ movhi
	ldr	r9, .L336+20
	strh	lr, [r3]	@ movhi
	cmp	r1, #1
	add	lr, lr, #95
	strh	fp, [r3, #2]	@ movhi
	strh	r9, [r3, #44]	@ movhi
	strh	r5, [r4, #2]	@ movhi
	strh	r7, [ip, #2]	@ movhi
	strh	lr, [r0, #2]	@ movhi
	ble	.L329
	mov	ip, r3
	mov	r0, r3
	mov	r5, #50
	mov	r4, #60
	ldr	lr, .L336+24
	ldr	lr, [lr]
	cmp	r1, #3
	add	r1, lr, #716
	strh	r2, [ip, #56]!	@ movhi
	strh	r2, [r0, #64]!	@ movhi
	strh	r1, [r3, #68]	@ movhi
	ldr	r1, .L336+28
	strh	r5, [ip, #2]	@ movhi
	strh	r4, [r0, #2]	@ movhi
	strh	r1, [r3, #60]	@ movhi
	bne	.L329
	mov	r0, r3
	mov	r1, r3
	mov	r4, #70
	mov	lr, #80
	ldr	ip, .L336+32
	ldr	ip, [ip]
	strh	r2, [r0, #144]!	@ movhi
	strh	r2, [r1, #152]!	@ movhi
	add	r2, ip, #716
	strh	r2, [r3, #156]	@ movhi
	ldr	r2, .L336+36
	strh	r4, [r0, #2]	@ movhi
	strh	lr, [r1, #2]	@ movhi
	strh	r2, [r3, #148]	@ movhi
.L329:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L335:
	bl	drawBird2
	ldr	r1, [r4]
	cmp	r1, #3
	bne	.L330
	bl	drawLGBird
	ldr	r1, [r4]
	b	.L330
.L337:
	.align	2
.L336:
	.word	level
	.word	shadowOAM+264
	.word	birdsNum
	.word	lanternNum
	.word	16389
	.word	754
	.word	birds2Num
	.word	750
	.word	lgbirdsNum
	.word	751
	.size	drawGame1, .-drawGame1
	.align	2
	.global	updateLGBird
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLGBird, %function
updateLGBird:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, .L365
	mov	r7, #0
	mov	r4, r6
	ldr	r5, .L365+4
	ldr	r9, .L365+8
	ldr	r8, .L365+12
	ldr	r10, .L365+16
	ldr	fp, .L365+20
	sub	sp, sp, #20
.L348:
	ldr	r1, [r4, #4]
	cmp	r1, #240
	movle	r2, #0
	movgt	r2, #1
	ldr	r3, [r4, #16]
	add	r0, r1, r3
	cmp	r0, #0
	orrle	r2, r2, #1
	cmp	r2, #0
	beq	.L339
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	and	r0, r0, #1
	mov	r3, r0
	rsblt	r3, r0, #0
	cmp	r3, #0
	bne	.L340
	ldr	r2, [r4, #16]
	rsb	r2, r2, #240
	str	r3, [r4, #48]
	str	r2, [r4, #4]
	mov	r0, #30
	mov	lr, pc
	bx	r10
	add	r0, r0, #50
	str	r0, [r4]
	mov	lr, pc
	bx	r8
	smull	r2, r3, r0, fp
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	subs	r3, r0, r3
	bne	.L362
	mov	r3, #1
	ldr	r1, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r4, #16]
.L339:
	ldr	ip, [r5]
	ldr	lr, [r5, #20]
	asr	ip, ip, #8
	ldr	r2, [r4, #20]
	ldr	r0, [r4]
	str	ip, [sp]
	str	lr, [sp, #12]
	ldr	ip, [r5, #16]
	ldr	lr, [r5, #4]
	str	ip, [sp, #8]
	str	lr, [sp, #4]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L347
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L363
.L347:
	cmp	r7, #1
	add	r4, r4, #56
	bne	.L349
	ldr	r2, [r6, #4]
	ldr	r3, [r6, #60]
	ldr	r0, [r6, #12]
	ldr	r1, [r6, #68]
	sub	r2, r2, r0
	sub	r3, r3, r1
	str	r2, [r6, #4]
	str	r3, [r6, #60]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L349:
	mov	r7, #1
	b	.L348
.L340:
	mov	r2, #1
	mov	r3, #0
	str	r2, [r4, #48]
	str	r3, [r4, #4]
	mov	r0, #30
	mov	lr, pc
	bx	r10
	add	r0, r0, #50
	str	r0, [r4]
	mov	lr, pc
	bx	r8
	smull	r2, r3, r0, fp
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	subs	r3, r0, r3
	bne	.L364
	mvn	r3, #0
	ldr	r1, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r4, #16]
	b	.L339
.L364:
	cmp	r3, #1
	mvneq	r3, #1
	mvnne	r3, #2
	ldr	r1, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r4, #16]
	b	.L339
.L362:
	cmp	r3, #1
	moveq	r3, #2
	movne	r3, #3
	ldr	r1, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r4, #16]
	b	.L339
.L363:
	mov	ip, #0
	ldr	r3, .L365+24
	ldr	r0, .L365+28
	ldr	r1, [r3]
	smull	r2, r3, r1, r0
	sub	r3, r3, r1, asr #31
	add	r3, r3, r3, lsl #1
	sub	r1, r1, r3, lsl #1
	ldr	r3, .L365+32
	str	ip, [r4, #44]
	ldr	r0, [r3]
	mov	r3, ip
	mov	ip, #2
	ldr	lr, .L365+36
	ldr	r2, [lr]
	sub	r2, r2, #1
	str	r2, [lr]
	ldr	lr, .L365+32
	lsl	r1, r1, #1
	sub	r0, r0, #1
	str	r1, [r4, #36]
	str	r0, [lr]
	str	ip, [r4, #28]
	ldr	r2, .L365+40
	ldr	r1, .L365+44
	ldr	r0, .L365+48
	ldr	ip, .L365+52
	mov	lr, pc
	bx	ip
	b	.L347
.L366:
	.align	2
.L365:
	.word	lgbird
	.word	player
	.word	collision
	.word	rand
	.word	myRandom
	.word	1431655766
	.word	aniCounter
	.word	715827883
	.word	lgbirdsNum
	.word	livesNum
	.word	11025
	.word	6586
	.word	hitbird
	.word	playSoundB
	.size	updateLGBird, .-updateLGBird
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
	ldr	r2, .L418
	ldr	r3, [r2]
	push	{r4, r5, r6, lr}
	ldr	r4, .L418+4
	add	r3, r3, #1
	str	r3, [r2]
	bl	updatePlayer
	bl	updateSmlbirds
	ldr	r3, [r4]
	cmp	r3, #1
	bgt	.L412
.L368:
	bl	updateLanterns
	ldr	r3, [r4]
	cmp	r3, #1
	ldr	r3, .L418+8
	ldr	r3, [r3]
	ldr	r2, .L418+12
	rsbeq	r3, r3, #4
	rsbne	r3, r3, #8
	str	r3, [r2, #28]
	ldr	r3, .L418+16
	mov	lr, pc
	bx	r3
	ldr	r5, .L418+20
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L418+24
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, .L418+28
	ldr	r3, [r3]
	cmp	r3, #9
	ble	.L371
	ldr	r3, [r4]
	cmp	r3, #1
	beq	.L413
	cmp	r3, #2
	beq	.L414
.L371:
	ldr	r3, .L418+32
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L374
	ldr	r3, .L418+36
	ldrh	r3, [r3]
	ands	r3, r3, #4
	bne	.L374
	ldr	r2, [r4]
	cmp	r2, #1
	beq	.L415
	cmp	r2, #2
	beq	.L393
	cmp	r2, #3
	bne	.L374
	ldr	lr, .L418+40
	ldr	ip, [lr]
	cmp	ip, #9
	bgt	.L374
	ldr	r0, .L418+44
	mov	r1, r0
.L386:
	ldr	r2, [r1, #44]
	cmp	r2, #0
	bne	.L411
	add	r3, r3, #1
	cmp	r3, #4
	add	r1, r1, #56
	bne	.L386
	ldr	r1, .L418+48
	mov	r3, r1
.L388:
	ldr	r0, [r3, #44]
	cmp	r0, #0
	bne	.L416
	add	r2, r2, #1
	cmp	r2, #4
	add	r3, r3, #56
	bne	.L388
	ldr	r3, .L418+52
	ldr	r2, [r3, #44]
	cmp	r2, #0
	bne	.L390
	ldr	r2, [r3, #100]
	cmp	r2, #0
	beq	.L374
	mov	r0, #1
.L390:
	mov	r1, #0
	ldr	r2, .L418+56
	rsb	r0, r0, r0, lsl #3
	add	r0, r3, r0, lsl #3
	ldr	r3, [r2]
	add	ip, ip, #1
	sub	r3, r3, #1
	str	ip, [lr]
	str	r1, [r0, #44]
	str	r3, [r2]
.L374:
	mov	r2, #67108864
	ldr	r3, .L418+60
	ldr	r1, .L418+64
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
.L412:
	bl	updateBird2
	ldr	r3, [r4]
	cmp	r3, #3
	bne	.L368
	bl	updateLGBird
	b	.L368
.L413:
	mov	r3, #2
	str	r3, [r4]
	bl	initGame2
	b	.L371
.L414:
	mov	r3, #3
	str	r3, [r4]
	bl	initGame3
	b	.L371
.L415:
	ldr	lr, .L418+68
	ldr	ip, [lr]
	cmp	ip, #3
	bgt	.L374
	ldr	r0, .L418+44
	mov	r2, r0
.L379:
	ldr	r1, [r2, #44]
	cmp	r1, #0
	bne	.L411
	add	r3, r3, #1
	cmp	r3, #4
	add	r2, r2, #56
	bne	.L379
	b	.L374
.L393:
	ldr	r4, .L418+72
	ldr	ip, [r4]
	cmp	ip, #7
	bgt	.L374
	ldr	r0, .L418+44
	mov	r1, r0
.L382:
	ldr	lr, [r1, #44]
	cmp	lr, #0
	bne	.L417
	add	r3, r3, #1
	cmp	r3, #4
	add	r1, r1, #56
	bne	.L382
	ldr	r1, .L418+48
	ldr	r3, [r1, #44]
	cmp	r3, #0
	bne	.L383
	ldr	r3, [r1, #100]
	cmp	r3, #0
	bne	.L395
	ldr	r3, [r1, #156]
	cmp	r3, #0
	bne	.L384
	ldr	r3, [r1, #212]
	cmp	r3, #0
	movne	r2, #3
	beq	.L374
.L384:
	mov	lr, r2
.L383:
	mov	r5, #0
	ldr	r0, .L418+76
	ldr	r2, [r0]
	rsb	lr, lr, lr, lsl #3
	add	r3, r1, lr, lsl #3
	add	ip, ip, #1
	sub	r2, r2, #1
	str	ip, [r4]
	str	r5, [r3, #44]
	str	r2, [r0]
	b	.L374
.L417:
	mov	lr, #0
	ldr	r1, .L418+80
	ldr	r2, [r1]
	rsb	r3, r3, r3, lsl #3
	add	r3, r0, r3, lsl #3
	add	ip, ip, #1
	sub	r2, r2, #1
	str	ip, [r4]
	str	lr, [r3, #44]
	str	r2, [r1]
	b	.L374
.L411:
	mov	r4, #0
	ldr	r1, .L418+80
	ldr	r2, [r1]
	rsb	r3, r3, r3, lsl #3
	add	r3, r0, r3, lsl #3
	add	ip, ip, #1
	sub	r2, r2, #1
	str	ip, [lr]
	str	r4, [r3, #44]
	str	r2, [r1]
	b	.L374
.L416:
	mov	r4, #0
	ldr	r0, .L418+76
	ldr	r3, [r0]
	rsb	r2, r2, r2, lsl #3
	add	r2, r1, r2, lsl #3
	add	ip, ip, #1
	sub	r3, r3, #1
	str	ip, [lr]
	str	r4, [r2, #44]
	str	r3, [r0]
	b	.L374
.L395:
	mov	r2, #1
	b	.L384
.L419:
	.align	2
.L418:
	.word	aniCounter
	.word	level
	.word	livesNum
	.word	live
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	lanternNum
	.word	oldButtons
	.word	buttons
	.word	hidecountlevel3
	.word	smlbird1
	.word	smlbird2
	.word	lgbird
	.word	lgbirdsNum
	.word	vOff
	.word	hOff
	.word	hidecountlevel1
	.word	hidecountlevel2
	.word	birds2Num
	.word	birdsNum
	.size	updateGame1, .-updateGame1
	.comm	shadowOAM,1024,4
	.comm	hidecountlevel3,4,4
	.comm	hidecountlevel2,4,4
	.comm	hidecountlevel1,4,4
	.comm	level,4,4
	.comm	lanternNum,4,4
	.comm	lgbirdsNum,4,4
	.comm	birds2Num,4,4
	.comm	birdsNum,4,4
	.comm	livesNum,4,4
	.comm	live,32,4
	.comm	lanterns,520,4
	.comm	lgbird,112,4
	.comm	smlbird2,224,4
	.comm	smlbird1,224,4
	.comm	player,72,4
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
