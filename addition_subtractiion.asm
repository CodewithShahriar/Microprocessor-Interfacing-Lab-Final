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

















///////////////////
Explanation
/////////////////

;Write a single 8086 assembly language program (using emu8086) that first performs the addition of two single-digit numbers (0-9) taken from the user, displays the sum, and immediately after, performs the subtraction of two more single-digit numbers taken from the user, and displays the difference.

.model small
.stack 100h

.data

.code  

;Addition
; Only 0-9

mov ah, 1     ; Service 01H for character input
INT 21h       ; Read first digit (ASCII in AL)
mov cl, al    ; Store first digit's ASCII in CL (e.g., '5' = 35H)

mov ah, 1     ; Service 01H for character input
INT 21h       ; Read second digit (ASCII in AL)
mov ch, al    ; Store second digit's ASCII in CH (e.g., '3' = 33H)

add cl, ch    ; CL = CL + CH (e.g., 35H + 33H = 68H)
sub cl, 30h   ; Corrects the addition for display. 
              ; Result is (Value1 + Value2) + 30H (the ASCII result). E.g., 68H - 30H = 38H ('8')

mov ah, 2     ; Service 02H for character output
mov dl, cl    ; Move the resulting ASCII digit to DL
INT 21h       ; Display the sum

; Subtraction

mov ah, 1     ; Service 01H for character input
int 21h       ; Read third digit (ASCII in AL)
mov cl, al    ; Store third digit's ASCII in CL

mov ah, 1     ; Service 01H for character input
int 21h       ; Read fourth digit (ASCII in AL)
mov ch, al    ; Store fourth digit's ASCII in CH

sub cl, ch    ; CL = CL - CH (e.g., '7' (37H) - '4' (34H) = 03H) - Result is the correct numerical difference.
add cl, 30h   ; Convert the numerical difference (e.g., 03H) back to its ASCII character (03H + 30H = 33H = '3')

mov ah, 2     ; Service 02H for character output
mov dl, cl    ; Move the resulting ASCII digit to DL
int 21h       ; Display the difference