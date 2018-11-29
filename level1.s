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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r1, #0
	mov	r8, #34560
	mov	r7, #120
	mov	r6, #2
	mov	r5, #20
	mov	r4, #1
	mov	lr, #256
	mov	r2, #16
	mov	ip, #45
	mov	r0, #5
	ldr	r3, .L4
	str	r8, [r3]
	str	r7, [r3, #4]
	str	r6, [r3, #8]
	str	r5, [r3, #24]
	str	r4, [r3, #40]
	str	lr, [r3, #44]
	str	ip, [r3, #48]
	str	r0, [r3, #52]
	str	r1, [r3, #12]
	str	r1, [r3, #36]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	pop	{r4, r5, r6, r7, r8, lr}
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
	mov	r1, #14
	ldr	r2, .L7
	ldr	r3, [r2, #4]
	lsl	r3, r3, #23
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	lsr	r3, r3, #23
	ldr	r2, .L7+4
	orr	r3, r3, #16384
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L8:
	.align	2
.L7:
	.word	player
	.word	shadowOAM
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
	ldr	r3, .L34
	ldr	r2, [r3, #52]
	ldr	r0, .L34+4
	cmp	r2, #5
	push	{r4, lr}
	streq	r2, [r3, #56]
	ldrh	r2, [r0]
	ands	r2, r2, #1
	str	r1, [r3, #52]
	beq	.L11
	ldr	r1, .L34+8
	ldrh	r1, [r1]
	tst	r1, #1
	bne	.L12
.L13:
	mov	r0, #0
	ldr	r1, [r3, #56]
	str	r0, [r3, #64]
	str	r1, [r3, #52]
.L21:
	cmp	r2, #0
	ldr	r2, [r3, #12]
	beq	.L16
	ldr	r1, .L34+8
	ldrh	r1, [r1]
	ands	r1, r1, #1
	bne	.L16
	ldr	r0, [r3, #36]
	ldr	ip, .L34+12
	cmp	r0, #0
	str	r1, [ip]
	moveq	r1, #1
	streq	r0, [r3, #40]
	streq	r1, [r3, #36]
	subeq	r2, r2, #1792
.L16:
	ldr	r1, .L34+16
	ldr	r0, [r1]
	ldr	r1, [r3]
	add	r2, r2, r0
	add	r1, r2, r1
	cmp	r1, #34816
	str	r2, [r3, #12]
	str	r1, [r3]
	blt	.L9
	mov	r2, #0
	mov	r1, #34560
	str	r2, [r3, #12]
	str	r2, [r3, #36]
	str	r1, [r3]
.L9:
	pop	{r4, lr}
	bx	lr
.L11:
	ldr	r1, .L34+20
	ldrh	r1, [r1, #48]
	tst	r1, #32
	beq	.L32
.L19:
	ldr	r1, .L34+20
	ldrh	r1, [r1, #48]
	tst	r1, #16
	bne	.L13
.L33:
	ldr	ip, [r3, #4]
	ldr	r1, [r3, #20]
	ldr	lr, [r3, #8]
	add	r1, ip, r1
	rsb	r4, lr, #240
	cmp	r1, r4
	bgt	.L13
	mov	r4, #3
	ldr	r1, .L34+24
	ldr	r2, [r1]
	add	ip, ip, lr
	sub	r2, r2, #1
	str	ip, [r3, #4]
	str	r2, [r1]
	str	r4, [r3, #52]
.L14:
	ldr	r2, [r3, #64]
	cmp	r2, #1
	movgt	r2, #0
	strgt	r2, [r3, #64]
	addle	r2, r2, #1
	strle	r2, [r3, #64]
.L15:
	ldr	r1, [r3, #60]
	ldrh	r2, [r0]
	add	r1, r1, #1
	and	r2, r2, #1
	str	r1, [r3, #60]
	b	.L21
.L12:
	ldr	r1, .L34+20
	ldrh	r1, [r1, #48]
	tst	r1, #32
	bne	.L19
	ldmib	r3, {r1, ip}
	cmp	r1, ip
	bge	.L24
	ldr	r1, .L34+20
	ldrh	r1, [r1, #48]
	tst	r1, #16
	bne	.L13
	b	.L33
.L32:
	ldmib	r3, {r1, ip}
	cmp	ip, r1
	bgt	.L19
.L24:
	mov	r4, #4
	ldr	lr, .L34+24
	ldr	r2, [lr]
	sub	r1, r1, ip
	add	r2, r2, #1
	str	r1, [r3, #4]
	str	r2, [lr]
	str	r4, [r3, #52]
	b	.L14
.L35:
	.align	2
.L34:
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
	ldr	r3, .L51
	ldr	r2, [r3]
	cmp	r2, #120
	ldr	r3, .L51+4
	bgt	.L37
	ldr	r1, [r3, #36]
	cmp	r1, #0
	beq	.L38
	ldr	ip, .L51+8
	smull	r0, r1, r2, ip
	sub	r1, r1, r2, asr #31
	add	r1, r1, r1, lsl #1
	cmp	r2, r1
	ldreq	r2, [r3]
	ldreq	r1, [r3, #12]
	subeq	r2, r2, r1
	streq	r2, [r3]
	bx	lr
.L37:
	ldr	r1, [r3]
	cmp	r1, #134
	ble	.L50
.L38:
	mov	r2, #0
	str	r2, [r3, #36]
	bx	lr
.L50:
	ldr	r0, [r3, #36]
	cmp	r0, #0
	beq	.L38
	ldr	r0, .L51+8
	push	{r4, r5}
	smull	r4, r5, r2, r0
	sub	r0, r5, r2, asr #31
	add	r0, r0, r0, lsl #1
	cmp	r2, r0
	ldreq	r2, [r3, #12]
	addeq	r1, r2, r1
	streq	r1, [r3]
.L36:
	pop	{r4, r5}
	bx	lr
.L52:
	.align	2
.L51:
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, .L62
	mov	r10, #0
	mov	r4, r8
	mov	fp, #1
	ldr	r5, .L62+4
	ldr	r7, .L62+8
	ldr	r6, .L62+12
.L59:
	mov	r3, #16
	str	r3, [r4, #20]
	str	r3, [r4, #16]
	mov	lr, pc
	bx	r5
	smull	r2, r3, r0, r7
	sub	r9, r3, r0, asr #31
	add	r9, r9, r9, lsl #1
	sub	r9, r0, r9
	mov	lr, pc
	bx	r5
	smull	r2, r3, r0, r6
	add	r2, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #3
	sub	r3, r0, r3, lsl #1
	cmp	r10, #0
	add	r3, r3, #30
	str	r3, [r4]
	moveq	r3, #10
	ldrne	r3, [r4, #-44]
	ldrne	r2, [r4, #-32]
	addne	r3, r3, r2
	addne	r3, r3, #40
	streq	r3, [r8, #4]
	strne	r3, [r4, #4]
	cmp	r9, #0
	str	fp, [r4, #8]
	streq	fp, [r4, #12]
	beq	.L57
	cmp	r9, #1
	moveq	r3, #2
	movne	r3, #3
	str	r3, [r4, #12]
.L57:
	mov	r3, #0
	add	r10, r10, #1
	cmp	r10, #4
	str	fp, [r4, #44]
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	str	r3, [r4, #32]
	str	r3, [r4, #36]
	str	r3, [r4, #40]
	add	r4, r4, #48
	bne	.L59
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L63:
	.align	2
.L62:
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
	ldr	r5, .L82
	mov	r4, r5
	ldr	r6, .L82+4
	ldr	r8, .L82+8
	ldr	r9, .L82+12
	ldr	fp, .L82+16
	ldr	r10, .L82+20
	sub	sp, sp, #20
	add	r7, r5, #192
.L69:
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #16]
	add	r2, r1, r3
	cmp	r2, #0
	ble	.L80
.L65:
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
	bx	r8
	cmp	r0, #0
	beq	.L68
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L81
.L68:
	add	r4, r4, #48
	cmp	r4, r7
	bne	.L69
.L70:
	ldr	r3, [r5, #4]
	ldr	r2, [r5, #12]
	sub	r3, r3, r2
	str	r3, [r5, #4]
	add	r5, r5, #48
	cmp	r5, r4
	bne	.L70
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L80:
	rsb	r3, r3, #240
	str	r3, [r4, #4]
	mov	lr, pc
	bx	r9
	smull	r2, r3, r0, fp
	add	r2, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #3
	sub	r3, r0, r3, lsl #1
	add	r3, r3, #30
	str	r3, [r4]
	mov	lr, pc
	bx	r9
	ldr	r1, .L82+24
	smull	r2, r3, r0, r1
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	subs	r3, r0, r3
	bne	.L66
	mov	r3, #1
	ldr	r1, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r4, #16]
	b	.L65
.L81:
	mov	r0, #0
	mov	ip, #2
	ldr	r1, [r10]
	sub	r1, r1, #1
	mov	r3, r0
	str	r1, [r10]
	str	r0, [r4, #44]
	str	ip, [r4, #28]
	ldr	r2, .L82+28
	ldr	r1, .L82+32
	ldr	r0, .L82+36
	ldr	ip, .L82+40
	mov	lr, pc
	bx	ip
	b	.L68
.L66:
	cmp	r3, #1
	moveq	r3, #2
	movne	r3, #3
	ldr	r1, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r4, #16]
	b	.L65
.L83:
	.align	2
.L82:
	.word	smlbird1
	.word	player
	.word	collision
	.word	rand
	.word	-368140053
	.word	birdsNum
	.word	1431655766
	.word	11025
	.word	6586
	.word	hitbird
	.word	playSoundB
	.size	updateSmlbirds, .-updateSmlbirds
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
	ldr	r3, .L93
	ldr	r2, .L93+4
	ldr	r3, [r3]
	smull	r0, r1, r3, r2
	sub	r0, r1, r3, asr #31
	add	r0, r0, r0, lsl #1
	sub	r0, r3, r0, lsl #1
	ldr	r3, .L93+8
	push	{r4, r5, r6, lr}
	lsl	r0, r0, #17
	ldr	r1, .L93+12
	ldr	r4, .L93+16
	ldr	r5, .L93+20
	lsr	r0, r0, #16
	add	lr, r3, #192
.L87:
	ldr	ip, [r3, #44]
	ldr	r2, [r3, #4]
	cmp	ip, #0
	and	r2, r2, r4
	orr	r2, r2, #16384
	ldrb	ip, [r3]	@ zero_extendqisi2
	beq	.L85
	ldr	r6, [r3, #28]
	cmp	r6, #0
	bne	.L85
	strh	ip, [r1, #72]	@ movhi
	strh	r2, [r1, #74]	@ movhi
	strh	r0, [r1, #76]	@ movhi
.L86:
	add	r3, r3, #48
	cmp	r3, lr
	add	r1, r1, #8
	bne	.L87
	pop	{r4, r5, r6, lr}
	bx	lr
.L85:
	strh	ip, [r1, #72]	@ movhi
	strh	r2, [r1, #74]	@ movhi
	strh	r5, [r1, #76]	@ movhi
	b	.L86
.L94:
	.align	2
.L93:
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
	ldr	r4, .L99
	ldr	r6, .L99+4
	ldr	r5, .L99+8
	add	r9, r4, #520
.L96:
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
	bne	.L96
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L100:
	.align	2
.L99:
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r3, #16384
	ldr	r4, .L103
	ldr	r2, .L103+4
	ldr	r1, .L103+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L103+12
	ldr	r1, .L103+16
	mov	r0, #3
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L103+20
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r10, #7168
	mov	r4, #0
	mov	r1, #16
	mov	lr, #1
	mov	ip, #256
	mov	r0, #45
	mov	r5, #5
	mov	r9, #34560
	mov	r8, #120
	mov	r7, #2
	mov	r6, #20
	ldrh	r2, [r3]
	orr	r2, r2, #4096
	strh	r2, [r3]	@ movhi
	strh	r10, [r3, #12]	@ movhi
	ldr	r3, .L103+24
	str	r9, [r3]
	str	r8, [r3, #4]
	str	r7, [r3, #8]
	str	r6, [r3, #24]
	str	lr, [r3, #40]
	str	ip, [r3, #44]
	str	r0, [r3, #48]
	str	r4, [r3, #12]
	str	r4, [r3, #36]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r5, [r3, #52]
	bl	initSmlbirds
	bl	initLanterns
	mov	r2, #4
	ldr	r1, .L103+28
	ldr	r3, .L103+32
	ldrh	r0, [r1, #48]
	str	r4, [r3]
	ldr	r1, .L103+36
	ldr	r3, .L103+40
	strh	r0, [r1]	@ movhi
	str	r5, [r3]
	ldr	ip, .L103+44
	ldr	r0, .L103+48
	ldr	r1, .L103+52
	ldr	r3, .L103+56
	str	r4, [ip]
	str	r4, [r0]
	str	r4, [r1]
	str	r2, [r3]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L104:
	.align	2
.L103:
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
	ldr	r7, .L146
	sub	sp, sp, #20
	mov	r4, r7
	add	r1, r7, #520
	b	.L110
.L139:
	ldr	r2, [r4, #20]
	add	r3, r3, r2
	cmp	r3, #100
	bgt	.L106
	ldr	r3, [r4, #4]
	cmp	r3, #4
	ble	.L109
	ldr	r2, [r4, #16]
	add	r3, r3, r2
	cmp	r3, #200
	ble	.L108
.L109:
	ldr	r3, [r4, #12]
	rsb	r3, r3, #0
	str	r3, [r4, #12]
.L108:
	add	r4, r4, #52
	cmp	r4, r1
	beq	.L138
.L110:
	ldr	r3, [r4]
	cmp	r3, #17
	bgt	.L139
.L106:
	ldr	r3, [r4, #8]
	rsb	r3, r3, #0
	str	r3, [r4, #8]
	add	r4, r4, #52
	cmp	r4, r1
	bne	.L110
.L138:
	ldr	r9, .L146+4
	ldr	r3, .L146+8
	ldr	r2, [r9]
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r1, r3, r1, asr #2
	add	r1, r1, r1, lsl #2
	cmp	r2, r1, lsl #1
	bne	.L111
	ldr	r5, .L146
	ldr	r6, .L146+12
	b	.L116
.L141:
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	ldr	r0, [r5, #12]
	ldr	r1, [r5, #8]
	add	r2, r2, r0
	add	r3, r3, r1
	str	r2, [r5, #4]
	str	r3, [r5]
.L113:
	add	r5, r5, #52
	cmp	r5, r4
	beq	.L140
.L116:
	mov	lr, pc
	bx	r6
	rsbs	r3, r0, #0
	and	r3, r3, #3
	and	r0, r0, #3
	rsbpl	r0, r3, #0
	cmp	r0, #0
	beq	.L141
	cmp	r0, #1
	beq	.L142
	cmp	r0, #2
	beq	.L143
	cmp	r0, #3
	bne	.L113
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
	bne	.L116
.L140:
	ldr	r2, [r9]
	asr	r3, r2, #31
.L111:
	ldr	ip, .L146+16
	smull	r0, r1, r2, ip
	rsb	r3, r3, r1, asr #4
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #1
	bne	.L117
	ldr	r3, .L146
	b	.L120
.L144:
	ldr	r1, [r3, #48]
	cmp	r1, #0
	add	r2, r2, #1
	bne	.L119
.L136:
	str	r2, [r3, #28]
.L119:
	add	r3, r3, #52
	cmp	r3, r4
	beq	.L117
.L120:
	ldr	r2, [r3, #28]
	cmp	r2, #10
	ble	.L144
	cmp	r2, #11
	bne	.L119
	ldr	r2, [r3, #48]
	cmp	r2, #0
	beq	.L136
	add	r3, r3, #52
	cmp	r3, r4
	bne	.L120
.L117:
	ldr	r5, .L146
	ldr	r6, .L146+20
	ldr	r8, .L146+24
	ldr	fp, .L146+28
	ldr	r10, .L146+32
.L122:
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
	beq	.L121
	ldr	r3, [r5, #28]
	cmp	r3, #7
	ble	.L121
	ldr	r3, [r5, #44]
	cmp	r3, #0
	beq	.L145
.L121:
	add	r5, r5, #52
	cmp	r5, r4
	bne	.L122
	ldr	r2, [r9]
	ldr	r3, .L146+16
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #4
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #1
	bne	.L105
	mov	r1, #1
.L126:
	ldr	r3, [r7, #48]
	sub	r2, r3, #1
	cmp	r2, #10
	add	r2, r3, #1
	strls	r2, [r7, #48]
	bls	.L125
	cmp	r3, #12
	streq	r1, [r7, #48]
.L125:
	add	r7, r7, #52
	cmp	r7, r5
	bne	.L126
.L105:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L142:
	ldr	r2, [r5, #4]
	ldr	r1, [r5, #12]
	ldr	r3, [r5]
	sub	r2, r2, r1
	ldr	r1, [r5, #8]
	add	r3, r3, r1
	str	r2, [r5, #4]
	str	r3, [r5]
	b	.L113
.L145:
	mov	ip, #1
	ldr	r2, .L146+36
	str	ip, [r5, #44]
	str	ip, [r5, #48]
	ldr	r1, .L146+40
	mov	r0, fp
	ldr	ip, .L146+44
	mov	lr, pc
	bx	ip
	ldr	r3, [r10]
	add	r3, r3, #1
	str	r3, [r10]
	b	.L121
.L143:
	ldr	r2, [r5, #4]
	ldr	r1, [r5, #12]
	ldr	r3, [r5]
	add	r2, r2, r1
	ldr	r1, [r5, #8]
	sub	r3, r3, r1
	str	r2, [r5, #4]
	str	r3, [r5]
	b	.L113
.L147:
	.align	2
.L146:
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
	ldr	r2, .L150
	ldr	r3, [r2]
	push	{r4, lr}
	add	r3, r3, #1
	str	r3, [r2]
	bl	updatePlayer
	bl	updateSmlbirds
	bl	updateLanterns
	ldr	r3, .L150+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L150+8
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L150+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r3, .L150+16
	ldr	r1, .L150+20
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
.L151:
	.align	2
.L150:
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
	ldr	r3, .L190
	ldr	r2, .L190+4
	ldr	ip, .L190+8
	ldr	r8, .L190+12
	ldr	r6, .L190+16
	ldr	r4, .L190+20
	add	r0, r3, #520
.L177:
	ldr	r1, [r3, #44]
	cmp	r1, #0
	bne	.L153
	ldr	r1, [r3, #28]
	cmp	r1, #0
	moveq	fp, #132
	beq	.L180
	cmp	r1, #1
	moveq	fp, #133
	beq	.L180
	cmp	r1, #2
	moveq	fp, #134
	beq	.L180
	cmp	r1, #3
	moveq	fp, #135
	beq	.L180
	cmp	r1, #4
	moveq	fp, #164
	beq	.L180
	cmp	r1, #5
	moveq	fp, #165
	beq	.L180
	cmp	r1, #6
	moveq	fp, #166
	beq	.L180
	cmp	r1, #7
	beq	.L182
	cmp	r1, #8
	beq	.L183
	cmp	r1, #9
	beq	.L184
	cmp	r1, #10
	moveq	fp, #194
	beq	.L181
	cmp	r1, #11
	moveq	fp, #130
	bne	.L155
.L181:
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
	bne	.L177
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L153:
	ldr	r1, [r3, #48]
	cmp	r1, #1
	beq	.L185
	cmp	r1, #2
	moveq	fp, #320
	beq	.L181
	cmp	r1, #3
	moveq	fp, #256
	beq	.L181
	cmp	r1, #4
	moveq	fp, #192
	beq	.L181
	cmp	r1, #5
	moveq	fp, #128
	beq	.L181
	cmp	r1, #6
	bne	.L171
	mov	fp, #196
.L180:
	ldr	r1, [r3, #4]
	and	r1, r1, ip
	strh	r1, [r2, #138]	@ movhi
	ldrb	r1, [r3]	@ zero_extendqisi2
	strh	fp, [r2, #140]	@ movhi
	strh	r1, [r2, #136]	@ movhi
.L155:
	add	r3, r3, #52
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L177
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L185:
	mov	fp, #384
	b	.L181
.L171:
	cmp	r1, #7
	moveq	fp, #197
	beq	.L180
	cmp	r1, #8
	beq	.L186
	cmp	r1, #9
	beq	.L187
	cmp	r1, #10
	beq	.L188
	cmp	r1, #11
	beq	.L189
	cmp	r1, #12
	bne	.L155
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	r10, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L155
.L186:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	lr, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L155
.L182:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	orr	r1, r1, #16384
	strh	r4, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L155
.L187:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	r5, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L155
.L183:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	orr	r1, r1, #16384
	strh	r6, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L155
.L188:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	r7, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L155
.L184:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	orr	r1, r1, #16384
	strh	r8, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L155
.L189:
	ldr	r1, [r3, #4]
	ldrb	fp, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	r9, [r2, #140]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	fp, [r2, #136]	@ movhi
	b	.L155
.L191:
	.align	2
.L190:
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
	mov	r1, #14
	ldr	r2, .L194
	ldr	r3, [r2, #4]
	push	{r4, lr}
	lsl	r3, r3, #23
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	lsr	r3, r3, #23
	ldr	r2, .L194+4
	orr	r3, r3, #16384
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	bl	drawSmlbirds
	pop	{r4, lr}
	b	drawLanterns
.L195:
	.align	2
.L194:
	.word	player
	.word	shadowOAM
	.size	drawGame1, .-drawGame1
	.comm	shadowOAM,1024,4
	.comm	lanternNum,4,4
	.comm	birdsNum,4,4
	.comm	livesNum,4,4
	.comm	live,32,4
	.comm	lanterns,520,4
	.comm	smlbird2,192,4
	.comm	smlbird1,192,4
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
