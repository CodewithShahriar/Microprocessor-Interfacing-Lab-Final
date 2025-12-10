.model small
.stack 100h

.data

msg1 db 'Enter a uppercase letter : $'
msg2 db 10, 13, 'The lowercase letter : $'
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
add cl, 22h

mov ah, 9
lea dx, newline
int 21h

mov ah, 9
lea dx, msg2
int 21h

mov ah, 2
mov dl, cl
int 21h

mov ah, 4CH
int 21H