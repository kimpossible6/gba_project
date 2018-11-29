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
	push	{r4, r5, r6, lr}
	mov	r3, #67108864
	mov	r5, #1024
	mov	r2, #7936
	ldr	r4, .L4
	strh	r2, [r3, #12]	@ movhi
	strh	r5, [r3]	@ movhi
	mov	r2, #83886080
	mov	r3, #256
	ldr	r1, .L4+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+8
	mov	r2, #100663296
	ldr	r1, .L4+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
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
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startPal
	.word	7344
	.word	startTiles
	.word	100726784
	.word	startMap
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
	mov	r3, #67108864
	mov	r2, #1024
	strh	r2, [r3]	@ movhi
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
	mov	r2, #67108864
	mov	r1, #7168
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L9
	strh	r1, [r2, #12]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L9+4
	mov	lr, pc
	bx	r4
	ldr	r3, .L9+8
	mov	r2, #100663296
	ldr	r1, .L9+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L9+16
	mov	r3, #1024
	ldr	r1, .L9+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L9+24
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L9+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L10:
	.align	2
.L9:
	.word	DMANow
	.word	instructionPal
	.word	5216
	.word	instructionTiles
	.word	100720640
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
	ldr	r3, .L18
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L18+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L11
	ldr	r3, .L18+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L17
.L11:
	pop	{r4, lr}
	bx	lr
.L17:
	pop	{r4, lr}
	b	goToInstruction1
.L19:
	.align	2
.L18:
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
	ldr	r2, .L22
	ldr	r1, .L22+4
	ldr	r0, .L22+8
	ldr	r4, .L22+12
	mov	lr, pc
	bx	r4
	mov	r5, #67108864
	mov	r2, #4864
	ldr	r4, .L22+16
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L22+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #7936
	ldr	r3, .L22+24
	strh	r2, [r5, #10]	@ movhi
	ldr	r1, .L22+28
	mov	r2, #100663296
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L22+32
	ldr	r1, .L22+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L22+40
	mov	r3, #2656
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L22+44
	ldr	r2, .L22+48
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L22+52
	ldr	r1, .L22+56
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L22+60
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L23:
	.align	2
.L22:
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
	ldr	r2, .L31
	ldr	r4, .L31+4
	ldrh	r2, [r2]
	ldr	r3, [r4]
	tst	r2, #8
	add	r3, r3, #1
	str	r3, [r4]
	beq	.L24
	ldr	r3, .L31+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L30
.L24:
	pop	{r4, lr}
	bx	lr
.L30:
	ldr	r3, .L31+12
	mov	lr, pc
	bx	r3
	ldr	r0, [r4]
	ldr	r3, .L31+16
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L31+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L32:
	.align	2
.L31:
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
	push	{r4, lr}
	mov	r3, #1
	ldr	r2, .L35
	ldr	r1, .L35+4
	ldr	r0, .L35+8
	ldr	r4, .L35+12
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r0, #0
	mov	r1, #57088
	ldrh	r2, [r3]
	eor	r2, r2, #256
	ldr	r4, .L35+16
	strh	r0, [r3, #26]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #12]	@ movhi
	mov	r2, #83886080
	mov	r3, #256
	ldr	r1, .L35+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1296
	mov	r2, #100663296
	ldr	r1, .L35+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L35+28
	ldr	r1, .L35+32
	mov	r0, #3
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L35+36
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	ldr	r1, .L35+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L35+44
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L35+48
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L36:
	.align	2
.L35:
	.word	11025
	.word	1581696
	.word	pauseSong
	.word	playSoundA
	.word	DMANow
	.word	PausePal
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
	ldr	r3, .L49
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L49+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L38
	ldr	r2, .L49+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L47
.L38:
	tst	r3, #4
	beq	.L37
	ldr	r3, .L49+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L48
.L37:
	pop	{r4, lr}
	bx	lr
.L48:
	pop	{r4, lr}
	b	goToStart
.L47:
	pop	{r4, lr}
	b	goToGame
.L50:
	.align	2
.L49:
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
	push	{r4, lr}
	ldr	r3, .L53
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L53+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L54:
	.align	2
.L53:
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
	mov	r2, #67108864
	mov	r3, #0
	mov	r1, #57088
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2, #26]	@ movhi
	ldr	r4, .L62
	strh	r1, [r2, #12]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L62+4
	mov	lr, pc
	bx	r4
	mov	r3, #1360
	mov	r2, #100663296
	ldr	r1, .L62+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L62+12
	ldr	r1, .L62+16
	mov	r0, #3
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L62+20
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L62+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L62+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L55
	ldr	r3, .L62+36
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L61
.L55:
	pop	{r4, lr}
	bx	lr
.L61:
	pop	{r4, lr}
	b	goToStart
.L63:
	.align	2
.L62:
	.word	DMANow
	.word	winPal
	.word	winTiles
	.word	100726784
	.word	winMap
	.word	hideSprites
	.word	shadowOAM
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
	mov	r3, #0
	mov	r1, #57088
	push	{r4, lr}
	mov	r0, #3
	ldr	r4, .L66
	strh	r3, [r2, #26]	@ movhi
	strh	r1, [r2, #12]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L66+4
	mov	lr, pc
	bx	r4
	mov	r3, #1232
	mov	r2, #100663296
	ldr	r1, .L66+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L66+12
	ldr	r1, .L66+16
	mov	r0, #3
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L66+20
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	ldr	r1, .L66+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L66+28
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L66+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L67:
	.align	2
.L66:
	.word	DMANow
	.word	losePal
	.word	loseTiles
	.word	100726784
	.word	loseMap
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
	ldr	r3, .L79
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L69
	ldr	r3, .L79+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L76
.L69:
	ldr	r3, .L79+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L77
	ldr	r3, .L79+20
	ldr	r3, [r3]
	cmp	r3, #10
	beq	.L78
	pop	{r4, lr}
	bx	lr
.L77:
	pop	{r4, lr}
	b	goToLose
.L76:
	ldr	r3, .L79+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToPause
.L78:
	ldr	r3, .L79+28
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L79+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L80:
	.align	2
.L79:
	.word	updateGame1
	.word	drawGame1
	.word	oldButtons
	.word	buttons
	.word	birdsNum
	.word	lanternNum
	.word	stopSound
	.word	waitForVBlank
	.word	state
	.size	game, .-game
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
	ldr	r3, .L88
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L88+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L81
	ldr	r3, .L88+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L87
.L81:
	pop	{r4, lr}
	bx	lr
.L87:
	pop	{r4, lr}
	b	goToStart
.L89:
	.align	2
.L88:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
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
	mov	r2, #67108864
	mov	r1, #1024
	push	{r4, r7, fp, lr}
	ldr	r3, .L103
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L103+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L103+8
	mov	lr, pc
	bx	r3
	ldr	r6, .L103+12
	ldr	r7, .L103+16
	ldr	r5, .L103+20
	ldr	fp, .L103+24
	ldr	r10, .L103+28
	ldr	r9, .L103+32
	ldr	r8, .L103+36
	ldr	r4, .L103+40
.L91:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L92:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L92
.L94:
	.word	.L93
	.word	.L95
	.word	.L96
	.word	.L97
	.word	.L98
	.word	.L99
.L99:
	ldr	r3, .L103+44
	mov	lr, pc
	bx	r3
	b	.L91
.L98:
	ldr	r3, .L103+48
	mov	lr, pc
	bx	r3
	b	.L91
.L97:
	mov	lr, pc
	bx	r8
	b	.L91
.L96:
	mov	lr, pc
	bx	r9
	b	.L91
.L95:
	mov	lr, pc
	bx	r10
	b	.L91
.L93:
	mov	lr, pc
	bx	fp
	b	.L91
.L104:
	.align	2
.L103:
	.word	goToStart
	.word	setupSounds
	.word	setupInterrupts
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	insturction1
	.word	game
	.word	pause
	.word	67109120
	.word	lose
	.word	win
	.size	main, .-main
	.comm	buffer,41,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
