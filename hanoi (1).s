// Benjamin Rosen -- 1790339 -- 11/10/24
// Tower of Hanoi problem, with 4 disks (change line 23 for higher disc numbers)
// Code is using Full-Descending Stack 

.text
hanoi:
//your code below
    CMP r1, #0             // check if n == 0
    BEQ end_hanoi          // if Y, return
    SUB r1, r1, #1         // decrease n
    PUSH {r0, r1, r2, r3}  // save registers on stack
    MOV r2, r3             // move source peg to secondary peg
	
    BL hanoi               // starts the recursive call for n-1
    POP {r0, r1, r2, r3}   // restore registers from stack
    ADD r1, r1, #1         // restore n
    BL hanoi               // recursive call for n-1, again
end_hanoi:
    MOV PC, LR             // return from sub routine 
// end of your code

// ------------------- user main program ------------------------------
.global _start
_start: 
    LDR sp, =stack_loc     
    MOV r0, #4             // ************* Number of disks (4)
    BL hanoi               // call hanoi function
	
STOP:     B STOP                

.data 
	.EQU 	stack_loc, 0x20001000 				// Initial Main Stack Pointer Value
.end
