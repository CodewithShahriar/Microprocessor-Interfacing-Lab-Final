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











/////////////////
Explanation
/////////////////////////


; Program: Take two numbers, find their sum (less than 10)

.model small
.stack 100h
.data

msg1 db 'The first number is : $'
msg2 db 10, 13, 'The second number is : $' ; Line Feed (10) and Carriage Return (13) for newline
msg3 db 10, 13, 'The sum is : $'

.code

mov ax, @data
mov ds, ax      ; Initialize the Data Segment Register


mov ah, 9
lea dx, msg1
INT 21h         ; Display the prompt for the first number

mov ah, 1
INT 21h         ; Read the first digit (ASCII in AL). e.g., '3' = 33H

mov bl, al      ; Store the first digit's ASCII in BL

mov ah, 9
lea dx, msg2
INT 21h         ; Display the prompt for the second number

mov ah, 1
INT 21h         ; Read the second digit (ASCII in AL). e.g., '5' = 35H

mov cl, al      ; Store the second digit's ASCII in CL

add bl, cl      ; BL = BL + CL (e.g., 33H + 35H = 68H)
sub bl, 30h     ; Convert the ASCII sum to the displayable ASCII digit.
                ; The calculation for two ASCII digits $N_1 + N_2$ is: 
                ; $(V_1 + 30H) + (V_2 + 30H) = (V_1 + V_2) + 60H$.
                ; Subtracting $30H$ once yields $(V_1 + V_2) + 30H$, which is the correct ASCII for the single-digit sum.
                ; e.g., 68H - 30H = 38H, which is ASCII for '8'.

mov ah, 9
lea dx, msg3
INT 21h         ; Display the prompt "The sum is : "

mov ah, 2
mov dl, bl
INT 21h         ; Display the final ASCII sum (e.g., '8')


end:
mov ah, 4Ch     ; Terminate Program
int 21h
