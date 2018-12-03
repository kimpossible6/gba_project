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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L4
	push	{r4, lr}
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L4+4
	ldr	r4, .L4+8
	mov	lr, pc
	bx	r4
	ldr	r0, .L4+12
	ldr	r3, .L4+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+28
	mov	r3, #1
	ldr	r2, .L4+32
	ldr	r1, .L4+36
	ldr	r0, .L4+40
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r1, .L4+44
	ldr	r2, .L4+48
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1044
	.word	startPal
	.word	DMANow
	.word	startBitmap
	.word	drawFullscreenImage4
	.word	flipPage
	.word	waitForVBlank
	.word	playSoundA
	.word	11025
	.word	1197216
	.word	theme
	.word	state
	.word	seed
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	goToStart
	.size	initialize, .-initialize
	.align	2
	.global	goToInstruction1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstruction1, %function
goToInstruction1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #7936
	mov	r1, #1024
	push	{r4, lr}
	strh	r2, [r3, #12]	@ movhi
	ldr	r2, .L10
	strh	r1, [r3]	@ movhi
	ldr	r2, [r2]
	ldr	r3, .L10+4
	smull	r0, r1, r2, r3
	mov	r0, #4
	sub	r3, r1, r2, asr #31
	mov	r1, #67108864
	add	r3, r3, r3, lsl #1
	cmp	r2, r3
	ldreq	r2, .L10+8
	ldreq	r3, [r2]
	subeq	r3, r3, #1
	streq	r3, [r2]
	ldr	r4, .L10+12
	strh	r0, [r1, #26]	@ movhi
	mov	r3, #256
	strh	r0, [r1, #24]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L10+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L10+20
	mov	r2, #100663296
	ldr	r1, .L10+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L10+28
	mov	r3, #1024
	ldr	r1, .L10+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L10+36
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L10+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L11:
	.align	2
.L10:
	.word	aniCounter
	.word	1431655766
	.word	vOff
	.word	DMANow
	.word	instructionPal
	.word	11936
	.word	instructionTiles
	.word	100726784
	.word	instructionMap
	.word	waitForVBlank
	.word	state
	.size	goToInstruction1, .-goToInstruction1
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L19
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L12
	ldr	r3, .L19+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L18
.L12:
	pop	{r4, lr}
	bx	lr
.L18:
	pop	{r4, lr}
	b	goToInstruction1
.L20:
	.align	2
.L19:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	start, .-start
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #1
	ldr	r2, .L23
	ldr	r1, .L23+4
	ldr	r0, .L23+8
	ldr	r4, .L23+12
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	r2, #4864
	ldr	r4, .L23+16
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L23+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #7936
	ldr	r3, .L23+24
	strh	r2, [r5, #10]	@ movhi
	ldr	r1, .L23+28
	mov	r2, #100663296
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L23+32
	ldr	r1, .L23+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L23+40
	mov	r3, #2656
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L23+44
	ldr	r2, .L23+48
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L23+52
	ldr	r1, .L23+56
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L23+60
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L24:
	.align	2
.L23:
	.word	11025
	.word	226839
	.word	gameSong
	.word	playSoundA
	.word	DMANow
	.word	skyPal
	.word	11120
	.word	skyTiles
	.word	100726784
	.word	skyMap
	.word	7172
	.word	seaTiles
	.word	100679680
	.word	100720640
	.word	seaMap
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	insturction1
	.syntax unified
	.arm
	.fpu softvfp
	.type	insturction1, %function
insturction1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L32
	ldr	r4, .L32+4
	ldrh	r2, [r2]
	ldr	r3, [r4]
	tst	r2, #8
	add	r3, r3, #1
	str	r3, [r4]
	beq	.L25
	ldr	r3, .L32+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L31
.L25:
	pop	{r4, lr}
	bx	lr
.L31:
	ldr	r3, .L32+12
	mov	lr, pc
	bx	r3
	ldr	r0, [r4]
	ldr	r3, .L32+16
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L32+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	oldButtons
	.word	seed
	.word	buttons
	.word	stopSound
	.word	srand
	.word	initGame1
	.size	insturction1, .-insturction1
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #67108864
	ldrh	r3, [r4]
	eor	r3, r3, #768
	orr	r3, r3, #1024
	strh	r3, [r4]	@ movhi
	ldr	r2, .L36
	mov	r3, #1
	ldr	r1, .L36+4
	ldr	r0, .L36+8
	ldr	r5, .L36+12
	mov	lr, pc
	bx	r5
	mov	r2, #0
	mov	r1, #7936
	strh	r2, [r4, #26]	@ movhi
	mov	r3, #256
	strh	r2, [r4, #24]	@ movhi
	mov	r0, #3
	strh	r1, [r4, #12]	@ movhi
	mov	r2, #83886080
	ldr	r4, .L36+16
	ldr	r1, .L36+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L36+24
	mov	r2, #100663296
	ldr	r1, .L36+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L36+32
	ldr	r1, .L36+36
	mov	r0, #3
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L36+40
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	ldr	r1, .L36+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L36+48
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L36+52
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L37:
	.align	2
.L36:
	.word	11025
	.word	1581696
	.word	pauseSong
	.word	playSoundA
	.word	DMANow
	.word	PausePal
	.word	5088
	.word	PauseTiles
	.word	100726784
	.word	PauseMap
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L50
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L50+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L39
	ldr	r2, .L50+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L48
.L39:
	tst	r3, #4
	beq	.L38
	ldr	r3, .L50+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L49
.L38:
	pop	{r4, lr}
	bx	lr
.L49:
	pop	{r4, lr}
	b	goToStart
.L48:
	pop	{r4, lr}
	b	goToGame
.L51:
	.align	2
.L50:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L54
	push	{r4, lr}
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	ldr	r4, .L54+4
	mov	r2, #83886080
	ldr	r1, .L54+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r0, .L54+12
	ldr	r3, .L54+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+20
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	ldr	r1, .L54+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L54+28
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L54+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L55:
	.align	2
.L54:
	.word	1044
	.word	DMANow
	.word	losePal
	.word	loseBitmap
	.word	drawFullscreenImage4
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L63
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L56
	ldr	r3, .L63+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L62
.L56:
	pop	{r4, lr}
	bx	lr
.L62:
	pop	{r4, lr}
	b	goToStart
.L64:
	.align	2
.L63:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L67
	push	{r4, lr}
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	ldr	r4, .L67+4
	mov	r2, #83886080
	ldr	r1, .L67+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r0, .L67+12
	ldr	r3, .L67+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L67+20
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	ldr	r1, .L67+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L67+28
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L67+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L68:
	.align	2
.L67:
	.word	1044
	.word	DMANow
	.word	losePal
	.word	loseBitmap
	.word	drawFullscreenImage4
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L87
	mov	lr, pc
	bx	r3
	ldr	r3, .L87+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L87+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L70
	ldr	r2, .L87+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L85
.L70:
	ldr	r2, .L87+16
	ldr	r1, [r2]
	ldr	r2, .L87+20
	cmp	r1, #0
	ldr	r2, [r2]
	bne	.L71
	sub	r1, r2, #1
	cmp	r1, #2
	bls	.L86
.L71:
	ldr	r1, .L87+24
	ldr	r1, [r1]
	cmp	r1, #9
	ble	.L72
	cmp	r2, #3
	beq	.L73
.L69:
	pop	{r4, lr}
	bx	lr
.L72:
	cmp	r2, #3
	bne	.L69
	tst	r3, #2
	beq	.L69
	ldr	r3, .L87+12
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L69
.L73:
	pop	{r4, lr}
	b	goToWin
.L86:
	pop	{r4, lr}
	b	goToLose
.L85:
	ldr	r3, .L87+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToPause
.L88:
	.align	2
.L87:
	.word	updateGame1
	.word	drawGame1
	.word	oldButtons
	.word	buttons
	.word	livesNum
	.word	level
	.word	lanternNum
	.word	stopSound
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L101
	mov	lr, pc
	bx	r3
	ldr	r3, .L101+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L101+8
	mov	lr, pc
	bx	r3
	ldr	r6, .L101+12
	ldr	r8, .L101+16
	ldr	r5, .L101+20
	ldr	fp, .L101+24
	ldr	r10, .L101+28
	ldr	r9, .L101+32
	ldr	r7, .L101+36
	ldr	r4, .L101+40
.L90:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L91:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L91
.L93:
	.word	.L92
	.word	.L94
	.word	.L95
	.word	.L96
	.word	.L97
	.word	.L97
.L97:
	mov	lr, pc
	bx	r7
	b	.L90
.L96:
	ldr	r3, .L101+44
	mov	lr, pc
	bx	r3
	b	.L90
.L95:
	mov	lr, pc
	bx	r9
	b	.L90
.L94:
	mov	lr, pc
	bx	r10
	b	.L90
.L92:
	mov	lr, pc
	bx	fp
	b	.L90
.L102:
	.align	2
.L101:
	.word	goToStart
	.word	setupSounds
	.word	setupInterrupts
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	insturction1
	.word	game
	.word	win
	.word	67109120
	.word	pause
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	buffer,41,4
	.comm	aniCounter,4,4
	.comm	vOff,4,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
