//////////////
Write a single 8086 assembly language program (using emu8086) that first reads an uppercase letter and converts it to its corresponding lowercase letter for display, and then immediately reads a lowercase letter and converts it to its corresponding uppercase letter for display.



.model small
.stack 100h

.data

.code  


; Case Conversion Program
; Uppercase to Lowercase
; Captial letter to Small letter
mov ah, 1
INT 21h

add al, 20h

mov ah, 2
mov dl, al
INT 21h
       
       
; Small letter to capital letter

mov ah, 1
INT 21h

sub al, 20h

mov ah, 2
mov dl, al
INT 21h       









//////////////////////////
Explanation
//////////////////
;Write a single 8086 assembly language program (using emu8086) that first reads an uppercase letter and converts it to its corresponding lowercase letter for display, and then immediately reads a lowercase letter and converts it to its corresponding uppercase letter for display.

.model small
.stack 100h

.data

.code  

; Case Conversion Program
; Uppercase to Lowercase
; Captial letter to Small letter
mov ah, 1     ; DOS function to read a character (Input 1)
INT 21h       ; Input character's ASCII is stored in AL

add al, 20h   ; Convert Uppercase to Lowercase: Add 20H to the ASCII value 
              ; (e.g., 'A' (41H) + 20H = 'a' (61H))

mov ah, 2     ; DOS function to display a character
mov dl, al    ; Move the converted character to DL
INT 21h       ; Display the lowercase character

; Small letter to capital letter

mov ah, 1     ; DOS function to read a character (Input 2)
INT 21h       ; Input character's ASCII is stored in AL

sub al, 20h   ; Convert Lowercase to Uppercase: Subtract 20H from the ASCII value 
              ; (e.g., 'z' (7AH) - 20H = 'Z' (5AH))

mov ah, 2     ; DOS function to display a character
mov dl, al
INT 21h       ; Display the uppercase character