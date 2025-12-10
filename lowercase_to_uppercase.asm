; Enter a lowercase letter
; Print the uppercase letter

.model small
.stack 100h
.data

sent1 db 'Enter a lowercase letter :$'
sent2 db 'The uppercase version is : $'

.code

mov ax, @data
mov ds, ax

mov ah, 9
lea dx, sent1
int 21h 


mov ah, 2
mov dl, 20h ;Printing space
int 21h


mov ah, 1
int 21h

mov bl, al

sub bl, 20h

mov ah, 2
mov dl, 0Ah
int 21h

mov ah, 2
mov dl, 0Dh
int 21h

mov ah, 9
lea dx, sent2
int 21h

mov ah, 2
mov dl, bl
int 21h






///////////////////
Explanation
//////////////////
; Enter a lowercase letter
; Print the uppercase letter

.model small
.stack 100h
.data

sent1 db 'Enter a lowercase letter :$'
sent2 db 'The uppercase version is : $'

.code

mov ax, @data
mov ds, ax

mov ah, 9
lea dx, sent1
int 21h         ; Display prompt "Enter a lowercase letter :"

mov ah, 2
mov dl, 20h     ; ASCII for space
int 21h         ; Print a space

mov ah, 1
int 21h         ; Read character input (ASCII in AL). e.g., 'a' = 61H

mov bl, al      ; Store the input character in BL

sub bl, 20h     ; Convert Lowercase to Uppercase: BL = BL - 20H
                ; (e.g., 61H - 20H = 41H, which is ASCII for 'A')

; Print Newline/Carriage Return
mov ah, 2
mov dl, 0Ah
int 21h
mov ah, 2
mov dl, 0Dh
int 21h

mov ah, 9
lea dx, sent2
int 21h         ; Display prompt "The uppercase version is : "

mov ah, 2
mov dl, bl
int 21h         ; Display the converted uppercase character (e.g., 'A')