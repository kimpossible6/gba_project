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
	@ link register save eliminated.
	ldr	r3, .L17
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L17+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToInstruction1
.L18:
	.align	2
.L17:
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
	ldr	r2, .L21
	ldr	r1, .L21+4
	ldr	r0, .L21+8
	ldr	r4, .L21+12
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	r2, #4864
	ldr	r4, .L21+16
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L21+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #7936
	ldr	r3, .L21+24
	strh	r2, [r5, #10]	@ movhi
	ldr	r1, .L21+28
	mov	r2, #100663296
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L21+32
	ldr	r1, .L21+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L21+40
	mov	r3, #2656
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L21+44
	ldr	r2, .L21+48
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L21+52
	ldr	r1, .L21+56
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L21+60
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L22:
	.align	2
.L21:
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
	ldr	r2, .L30
	ldr	r4, .L30+4
	ldrh	r2, [r2]
	ldr	r3, [r4]
	tst	r2, #8
	add	r3, r3, #1
	str	r3, [r4]
	beq	.L23
	ldr	r3, .L30+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L29
.L23:
	pop	{r4, lr}
	bx	lr
.L29:
	ldr	r3, .L30+12
	mov	lr, pc
	bx	r3
	ldr	r0, [r4]
	ldr	r3, .L30+16
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L30+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L31:
	.align	2
.L30:
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
	ldr	r2, .L34
	mov	r3, #1
	ldr	r1, .L34+4
	ldr	r0, .L34+8
	ldr	r5, .L34+12
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
	ldr	r4, .L34+16
	ldr	r1, .L34+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L34+24
	mov	r2, #100663296
	ldr	r1, .L34+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L34+32
	ldr	r1, .L34+36
	mov	r0, #3
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L34+40
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	ldr	r1, .L34+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L34+48
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L34+52
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L35:
	.align	2
.L34:
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
	push	{r4, lr}
	ldr	r4, .L48
	mov	lr, pc
	bx	r4
	ldr	r3, .L48+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L37
	ldr	r2, .L48+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L46
.L37:
	tst	r3, #4
	beq	.L36
	ldr	r3, .L48+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L47
.L36:
	pop	{r4, lr}
	bx	lr
.L47:
	mov	lr, pc
	bx	r4
	ldr	r3, .L48+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L46:
	pop	{r4, lr}
	b	goToGame
.L49:
	.align	2
.L48:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	flipPage
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
	push	{r4, lr}
	mov	r3, #1
	ldr	r2, .L52
	ldr	r1, .L52+4
	ldr	r0, .L52+8
	ldr	r4, .L52+12
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r1, .L52+16
	ldr	r4, .L52+20
	strh	r1, [r2]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L52+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r0, .L52+28
	ldr	r3, .L52+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+36
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L52+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L52+44
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L53:
	.align	2
.L52:
	.word	11025
	.word	1685664
	.word	winSong
	.word	playSoundA
	.word	1044
	.word	DMANow
	.word	winPal
	.word	winBitmap
	.word	drawFullscreenImage4
	.word	hideSprites
	.word	shadowOAM
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
	push	{r4, lr}
	ldr	r3, .L61
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L54
	ldr	r3, .L61+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L60
.L54:
	pop	{r4, lr}
	bx	lr
.L60:
	pop	{r4, lr}
	b	goToStart
.L62:
	.align	2
.L61:
	.word	waitForVBlank
	.word	flipPage
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
	push	{r4, lr}
	mov	r3, #1
	ldr	r2, .L65
	ldr	r1, .L65+4
	ldr	r0, .L65+8
	ldr	r4, .L65+12
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r1, .L65+16
	ldr	r4, .L65+20
	strh	r1, [r2]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L65+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r0, .L65+28
	ldr	r3, .L65+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+36
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L65+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L65+44
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L66:
	.align	2
.L65:
	.word	11025
	.word	3308256
	.word	loseSong
	.word	playSoundA
	.word	1044
	.word	DMANow
	.word	losePal
	.word	loseBitmap
	.word	drawFullscreenImage4
	.word	hideSprites
	.word	shadowOAM
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
	ldr	r3, .L77
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L68
	ldr	r3, .L77+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L75
.L68:
	ldr	r3, .L77+16
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L69
	ldr	r3, .L77+20
	ldr	r3, [r3]
	sub	r3, r3, #1
	cmp	r3, #2
	bls	.L76
.L67:
	pop	{r4, lr}
	bx	lr
.L69:
	ldr	r3, .L77+24
	ldr	r3, [r3]
	cmp	r3, #9
	ble	.L67
	ldr	r3, .L77+20
	ldr	r3, [r3]
	cmp	r3, #3
	bne	.L67
	pop	{r4, lr}
	b	goToWin
.L76:
	pop	{r4, lr}
	b	goToLose
.L75:
	ldr	r3, .L77+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToPause
.L78:
	.align	2
.L77:
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
	ldr	r3, .L92
	mov	lr, pc
	bx	r3
	ldr	r3, .L92+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L92+8
	mov	lr, pc
	bx	r3
	ldr	fp, .L92+12
	ldr	r5, .L92+16
	ldr	r10, .L92+20
	ldr	r9, .L92+24
	ldr	r8, .L92+28
	ldr	r7, .L92+32
	ldr	r6, .L92+36
	ldr	r4, .L92+40
.L80:
	ldrh	r0, [fp]
	strh	r0, [r5]	@ movhi
	ldr	r2, [r10]
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L80
.L83:
	.word	.L82
	.word	.L84
	.word	.L85
	.word	.L86
	.word	.L87
	.word	.L87
.L87:
	mov	lr, pc
	bx	r6
	b	.L80
.L86:
	mov	lr, pc
	bx	r7
	b	.L80
.L85:
	mov	lr, pc
	bx	r8
	b	.L80
.L84:
	mov	lr, pc
	bx	r9
	b	.L80
.L82:
	tst	r0, #8
	beq	.L80
	tst	r3, #8
	bne	.L80
	ldr	r3, .L92+44
	mov	lr, pc
	bx	r3
	b	.L80
.L93:
	.align	2
.L92:
	.word	goToStart
	.word	setupSounds
	.word	setupInterrupts
	.word	buttons
	.word	oldButtons
	.word	state
	.word	insturction1
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.word	goToInstruction1
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
