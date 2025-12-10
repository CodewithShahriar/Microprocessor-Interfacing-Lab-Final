;Write a program that will
;take a Lowercase Letter a input
;from the user
;and then display the Uppercase Version
;of the NEXT LETTER       


.model small
.stack 100h 
.data
.code

mov ah, 1
INT 21h

mov ch, al
sub ch, 20h
add ch, 01h

mov ah, 2
mov dl, ch
INT 21h






///////////////////
Explanation
//////////////////


.model small
.stack 100h
.data
.code

mov ah, 1     ; DOS function to read a character (Input 1)
INT 21h       ; Input character's ASCII (lowercase letter) is stored in AL.

mov ch, al    ; Copy the lowercase input to CH (e.g., 'a' = 61H)
sub ch, 20h   ; Convert the letter to Uppercase (e.g., 61H - 20H = 41H = 'A')
add ch, 01h   ; Advance to the NEXT letter (e.g., 41H + 01H = 42H = 'B')

mov ah, 2     ; DOS function to display a character
mov dl, ch    ; Move the final result ('B') to DL
INT 21h       ; Display the final character

