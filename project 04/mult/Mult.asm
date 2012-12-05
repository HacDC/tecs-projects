// This file is part of the materials accompanying the book 
// "The Elements of Computing Systems" by Nisan and Schocken, 
// MIT Press. Book site: www.idc.ac.il/tecs
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[3], respectively.)

    @R2
    M=0  // initialize R2 to 0

(LOOP)
    @R1
    D=M
    @END
    D;JEQ  // if R1 is 0, jump to end
    @R1
    M=M-1  // decrement R1
    @R0
    D=M
    @R2
    M=D+M  // R2 = R2 + R0
    @LOOP
    0;JMP  // restart the loop
(END)
    @END
    0;JMP
