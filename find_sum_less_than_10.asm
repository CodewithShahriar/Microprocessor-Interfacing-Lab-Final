"Write an 8086 assembly language program (using emu8086) that prompts the user to enter two single-digit numbers, calculates their sum (which is assumed to be less than 10), and displays the resulting single-digit sum."



; Program: Take two numbers, find their sum (less than 10)

.model small
.stack 100h
.data

msg1 db 'The first number is : $'
msg2 db 10, 13, 'The second number is : $'
msg3 db 10, 13, 'The sum is : $'

.code

mov ax, @data
mov ds, ax


mov ah, 9
lea dx, msg1
INT 21h

mov ah, 1
INT 21h

mov bl, al

mov ah, 9
lea dx, msg2
INT 21h

mov ah, 1
INT 21h

mov cl, al

add bl, cl
sub bl, 30h

mov ah, 9
lea dx, msg3
INT 21h

mov ah, 2
mov dl, bl
INT 21h



end:
mov ah, 4Ch
int 21h


