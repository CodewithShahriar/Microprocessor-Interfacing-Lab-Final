"Write an 8086 assembly language program (using emu8086) that prompts the user to enter a single-digit number (0-9), checks if the number is divisible by 3 by using the $\mathbf{DIV}$ instruction to find the remainder, and displays a message indicating whether the number is divisible by 3 or not."




; Program: Check if a number is divisible by 3 or not
; Using 8086 Assembly Language

.model small
.stack 100h
.data

msg1 db 'Enter a number : $'
msg2 db 10, 13, 'Number is divisible by 3.$'
msg3 db 10, 13, 'Number is NOT divisible by 3.$'

.code

mov ax, @data
mov ds, ax


mov ah, 9
lea dx, msg1
int 21h

mov ah, 1
int 21h

sub al, 30h
mov bl, al

mov ah, 0
mov al, bl
mov bl, 3
div bl


cmp ah, 0
je divisible

not_divisible:
mov ah, 9
lea dx, msg3
int 21h
jmp end

divisible:
mov ah, 9
lea dx, msg2
int 21h

end:
mov ah, 4Ch
int 21h





/////////////////////

Explanation
/////////////////////



; Program: Check if a number is divisible by 3 or not
; Using 8086 Assembly Language

.model small
.stack 100h
.data

msg1 db 'Enter a number : $'
msg2 db 10, 13, 'Number is divisible by 3.$'     ; 10=Line Feed, 13=Carriage Return (Newline)
msg3 db 10, 13, 'Number is NOT divisible by 3.$'

.code

mov ax, @data
mov ds, ax      ; Initialize the Data Segment Register


mov ah, 9
lea dx, msg1
int 21h         ; Display the prompt "Enter a number : "

mov ah, 1
int 21h         ; Read character input (ASCII in AL)

sub al, 30h     ; Convert ASCII digit to its numerical value (e.g., '6' (36H) -> 06H)
mov bl, al      ; Move the numerical value to BL (temporarily store the dividend)

mov ah, 0       ; Clear AH (important for 8-bit DIV: AX/BL)
mov al, bl      ; Move the numerical value back to AL (AL holds the dividend)
mov bl, 3       ; Set the divisor to 3
div bl          ; Divide AX by BL (AL/3). AL = quotient, AH = remainder 

cmp ah, 0       ; Compare remainder (AH) with 0
je divisible    ; Jump Equal: If remainder is 0, the number is divisible.

not_divisible:
mov ah, 9
lea dx, msg3
int 21h         ; Display "Number is NOT divisible by 3."
jmp end

divisible:
mov ah, 9
lea dx, msg2
int 21h         ; Display "Number is divisible by 3."

end:
mov ah, 4Ch     ; Terminate Program
int 21h
