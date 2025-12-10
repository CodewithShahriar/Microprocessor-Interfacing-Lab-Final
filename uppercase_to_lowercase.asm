"Write an 8086 assembly language program (using emu8086) that prompts the user to enter a single uppercase letter, converts that character to its corresponding lowercase letter, and displays the resulting lowercase character after a newline."


.model small
.stack 100h

.data

msg1 db 'Enter a uppercase letter : $'
msg2 db 'The lowercase letter : $'
newline db 10, 13, '$'

.code

mov ax, @data
mov ds, ax

mov ah, 9
lea dx, msg1
int 21h

mov ah, 1
int 21h

mov cl, al
add cl, 20h

mov ah, 9
lea dx, newline
int 21h

mov ah, 9
lea dx, msg2
int 21h

mov ah, 2
mov dl, cl
int 21h




//////////////
Explanation
/////////////\


.model small
.stack 100h

.data

msg1 db 'Enter a uppercase letter : $'
msg2 db 'The lowercase letter : $'
newline db 10, 13, '$'  ; Line Feed (10) and Carriage Return (13) bundled with $ terminator

.code

mov ax, @data
mov ds, ax      ; Initialize the Data Segment Register

mov ah, 9
lea dx, msg1
int 21h         ; Display the prompt "Enter a uppercase letter : "

mov ah, 1
int 21h         ; Read character input (ASCII in AL). e.g., 'A' = 41H

mov cl, al      ; Store the input character in CL
add cl, 20h     ; Convert Uppercase to Lowercase: CL = CL + 20H 
                ; (e.g., 41H + 20H = 61H, which is ASCII for 'a')

mov ah, 9
lea dx, newline
int 21h         ; Display a newline

mov ah, 9
lea dx, msg2
int 21h         ; Display the prompt "The lowercase letter : "

mov ah, 2
mov dl, cl
int 21h         ; Display the converted lowercase character (e.g., 'a')