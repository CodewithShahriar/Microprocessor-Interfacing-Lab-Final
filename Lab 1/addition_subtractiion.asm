//////////////////
Write a single 8086 assembly language program (using emu8086) that first performs the addition of two single-digit numbers (0-9) taken from the user, displays the sum, and immediately after, performs the subtraction of two more single-digit numbers taken from the user, and displays the difference.



.model small
.stack 100h

.data

.code  

;Addition
; Only 0-9

mov ah, 1
INT 21h

mov cl, al

mov ah, 1
INT 21h
mov ch, al

add cl, ch
sub cl, 30h ; if you subtract by 30h it will give us the decimal value    

mov ah, 2
mov dl, cl
INT 21h


; Subtraction

mov ah, 1
int 21h
mov cl, al

mov ah, 1
int 21h
mov ch, al

sub cl, ch
add cl, 30h

mov ah, 2
mov dl, cl
int 21h