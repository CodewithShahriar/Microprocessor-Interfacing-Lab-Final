; -------------------------------------------------------
; WHILE loop logic:
; Keep reading characters from the user until ENTER is pressed
; For each character:
;   - If it is a capital letter ('A' to 'Z'), increment the counter CL
;   - Otherwise, ignore it and continue reading
; When ENTER is pressed, exit the loop and print the number of capital letters
; -------------------------------------------------------

.model small
.stack 100h
.data

newline db 10, 13, '$'

.code

mov ax, @data
mov ds, ax

mov cx, 0

WHILE:
mov ah, 1
int 21h

cmp al, 13
je print_num_of_char

cmp al, 'A'
jl WHILE

cmp al, 'Z'
jg WHILE

inc cl
jmp WHILE

print_num_of_char:
mov ah, 9
lea dx, newline
int 21h

add cl, 30h

mov ah, 2
mov dl, cl
int 21h

end:
mov ah, 4Ch
int 21h






//////////////
Explanation
//////////////

; -------------------------------------------------------
; WHILE loop logic:
; Keep reading characters from the user until ENTER is pressed
; For each character:
;   - If it is a capital letter ('A' to 'Z'), increment the counter CL
;   - Otherwise, ignore it and continue reading
; When ENTER is pressed, exit the loop and print the number of capital letters
; -------------------------------------------------------

.model small
.stack 100h
.data

newline db 10, 13, '$' ; Line Feed (10) and Carriage Return (13) for newline

.code

mov ax, @data
mov ds, ax

mov cl, 0       ; Initialize the counter (CL) to zero

WHILE:
mov ah, 1
int 21h         ; Read character input (ASCII in AL)

cmp al, 13
je print_num_of_char ; Exit loop if ENTER (ASCII 13) is pressed

; --- Validation/Check for Uppercase Letter ---
cmp al, 'A'     ; Check if AL < 'A'
jl WHILE        ; Jump Less: Not an uppercase letter, loop again

cmp al, 'Z'     ; Check if AL > 'Z'
jg WHILE        ; Jump Greater: Not an uppercase letter, loop again

inc cl          ; If execution reaches here, the character is A-Z. Increment counter.
jmp WHILE       ; Loop again

print_num_of_char:
mov ah, 9
lea dx, newline
int 21h         ; Print a newline for formatting

add cl, 30h     ; Convert the numerical count (in CL) back to its ASCII character representation (e.g., 5 -> '5')

mov ah, 2
mov dl, cl
int 21h         ; Display the final count (single digit assumed)

end:
mov ah, 4Ch
int 21h