"Write an 8086 assembly language program (using emu8086) that prompts the user for two single-digit numbers, displays the entered numbers separated by a '+' and '=', and then calculates and displays their single-digit sum."



; Add two numbers
; It will take input from users
; Display the sum of the Numbers


.model small
.stack 100h
.data

addition_sign db ' + $'
equal_sign db ' = $'

.code 

mov ax, @data
mov ds, ax


mov ah, 1
INT 21h

mov bl, al

mov ah, 9
lea dx, addition_sign  
INT 21h


mov ah, 1
INT 21h

mov cl, al

mov ah, 9
lea dx, equal_sign
int 21h

add bl, cl
sub bl, 30h

mov ah, 2
mov dl, bl
int 21h





//////////////////
Explanation
//////////////////////////




; Add two numbers
; It will take input from users
; Display the sum of the Numbers


.model small
.stack 100h
.data

addition_sign db ' + $'  ; String for the plus sign
equal_sign db ' = $'     ; String for the equals sign

.code 

mov ax, @data
mov ds, ax          ; Initialize the Data Segment Register


mov ah, 1           
INT 21h             ; Read the first digit (ASCII in AL)
mov bl, al          ; Store the first digit's ASCII in BL (e.g., '5' = 35H)

mov ah, 9
lea dx, addition_sign   
INT 21h             ; Display " + "


mov ah, 1
INT 21h             ; Read the second digit (ASCII in AL)
mov cl, al          ; Store the second digit's ASCII in CL (e.g., '3' = 33H)

mov ah, 9
lea dx, equal_sign
int 21h             ; Display " = "

add bl, cl          ; BL = BL + CL (e.g., 35H + 33H = 68H)
sub bl, 30h         ; Convert the ASCII sum to the displayable ASCII digit
                    ; (e.g., 68H - 30H = 38H, which is ASCII for '8')

mov ah, 2           ; Function 2: Display character
mov dl, bl          ; Move the resulting ASCII digit to DL
int 21h             ; Display the sum