Write an 8086 assembly language program (using emu8086) that reads a single-digit number (0-9) from the user, determines if the number is even or odd using the division instruction, and displays the appropriate message ('Number is Even' or 'Number is Odd').




; Take an input and check if it is Even or Odd
; If even print Number is Even
; If Odd print Number is Odd


.model small
.stack 100h
.data

even_msg db 'Number is Even.$'
odd_msg db 'Number is Odd.$'   
   
.code

mov ax, @data
mov ds, ax

mov ah, 1
int 21h

sub al, 30h       ; Convert ASCII to numeric value ('0' = 30h)
                  ; Now AL has the real number (0�9)

mov bl, 2         ; Set divisor = 2
div bl            ; AL / 2 ? AL = quotient, AH = remainder
                  ; If AH = 0 ? even, else odd

cmp ah, 0
je even
jne odd


even: 

mov ah, 2
mov dl, 0Ah
int 21h

mov ah, 2
mov dl, 0Dh
int 21h 


mov ah, 9
lea dx, even_msg
int 21h
jmp end

odd:    
       
       
mov ah, 2
mov dl, 0Ah
int 21h

mov ah, 2
mov dl, 0Dh
int 21h


mov ah, 9
lea dx, odd_msg
int 21h
jmp end


end:
mov ah, 4Ch
int 21h





////////////////////
Explanation
///////////////////

.model small
.stack 100h
.data

even_msg db 'Number is Even.$'
odd_msg db 'Number is Odd.$'    
    
.code

mov ax, @data
mov ds, ax      ; Initialize the Data Segment Register

mov ah, 1
int 21h         ; Read character input (ASCII in AL)

sub al, 30h     ; Convert ASCII to numeric value (e.g., '5' (35H) -> 05H)
                ; Now AL has the real number (0-9)

mov bl, 2       ; Set divisor = 2
div bl          ; AL / BL. AL = quotient, AH = remainder
                ; If AH = 0 (Remainder is zero) -> even, else odd

cmp ah, 0       ; Compare remainder (AH) with 0
je even         ; Jump Equal: If AH = 0, jump to 'even'
jne odd         ; Jump Not Equal: If AH != 0, jump to 'odd' (or just 'jmp odd' if no other code follows)


even:           
; Line Break sequence (0Ah/0Dh)
mov ah, 2
mov dl, 0Ah
int 21h
mov ah, 2
mov dl, 0Dh
int 21h 

mov ah, 9       ; Display string function
lea dx, even_msg
int 21h
jmp end

odd:            
; Line Break sequence (0Ah/0Dh)
mov ah, 2
mov dl, 0Ah
int 21h
mov ah, 2
mov dl, 0Dh
int 21h

mov ah, 9       ; Display string function
lea dx, odd_msg
int 21h
jmp end


end:
mov ah, 4Ch     ; Terminate Program
int 21h