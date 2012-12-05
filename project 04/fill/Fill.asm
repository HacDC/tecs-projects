// This file is part of the materials accompanying the book 
// "The Elements of Computing Systems" by Nisan and Schocken, 
// MIT Press. Book site: www.idc.ac.il/tecs
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

    @16384
    D=A
    @screen_start
    M=D
    @position
    M=D
    @8191
    D=D+A
    @screen_end
    M=D
    @24576
    D=A
    @keyboard
    M=D
(LOOP)
    @keyboard
    A=M
    D=M
    @FILL
    D;JNE
  (CLEAR)
    @position
    A=M
    D=M
    @C_DEC
    D;JNE
    @position
    D=M
    @screen_start
    D=D-M
    @END
    D;JEQ
    @position
    M=M-1
   (C_DEC)
    @position
    A=M
    M=!M
    @END
    0;JMP
  (FILL)
    @position
    A=M
    D=M
    @F_INC
    !D;JNE
    @position
    D=M
    @screen_end
    D=M-D
    @END
    D;JEQ
    @position
    M=M+1
   (F_INC)
    @position
    A=M
    M=!M
(END)
    @LOOP
    0;JMP  // restart loop
