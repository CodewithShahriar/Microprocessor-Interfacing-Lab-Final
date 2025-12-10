/////////////////////////

Write an 8086 assembly language program (using emu8086) that first initializes the data segment, displays the character 'A' defined in the data segment, and then performs the 8-bit addition of the hexadecimal value 50H with the variable $\text{var1}$ (initialized to 25H).


.model small
.stack 100h
.data

;variable declaring
var1 db 25h
char1 db 'A'

.code

mov ax, @data
mov ds, ax

mov ah, 2
mov dl, char1
int 21h

;mov ah, 2
;mov dl, var1
;int 21h

mov al, 50h
add al, var1
int 21h
