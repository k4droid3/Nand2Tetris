// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


@8192
D=A
@reg_count //total screen registry count
M=D

(KEY_PRESS_LOOP)
	@i	//incrementor initialization
	M=0

	@KBD
	D=M
	@WHITE_LOOP // jumping to screen white loop when KBD=0
	D;JEQ

	(BLACK_LOOP)
		@i
		D=M
		@reg_count
		D=D-M
		@KEY_PRESS_LOOP // jumping back to KEY_PRESS_LOOP after black screen 
		D;JGE

		@SCREEN
		D=A
		@i
		A=D+M
		M=-1
		
		@i  //i++
		M=M+1

		@BLACK_LOOP
		0;JMP

	(WHITE_LOOP)
		@i
		D=M
		@reg_count
		D=D-M
		@KEY_PRESS_LOOP // jumping back to KEY_PRESS_LOOP after white screen 
		D;JGE

		@SCREEN
		D=A
		@i
		A=D+M
		M=0
		
		@i  //i++
		M=M+1

		@WHITE_LOOP
		0;JMP