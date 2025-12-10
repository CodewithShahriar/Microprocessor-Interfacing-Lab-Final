/////////////////
Write an 8086 assembly language program (using emu8086) that displays the phrase 'My name is' followed by a line break, and then displays the name 'Abid Shahriar' on the next line, using separate string variables for each word and manually inserting spaces and the line break sequence (0AH and 0DH).



.model small
.stack 100h
.data
   
; My name is
; Abid Shahriar 
   
;variable declaring
sent1 db 'My$'
sent2 db 'name$'
sent3 db 'is$'
sent4 db 'Abid Shahriar$'

.code

mov ax, @data
mov ds, ax


mov ah, 9
lea dx, sent1
int 21h

mov ah, 2
mov dl, 20h ;Will print space
int 21h

mov ah, 9
lea dx, sent2
int 21h

mov ah, 2
mov dl, 20h
int 21h

mov ah, 9
lea dx, sent3
int 21h

mov ah, 2
mov dl, 0Ah
int 21h

mov ah, 2
mov dl,0Dh
int 21h

mov ah, 9
lea dx, sent4
int 21h       
       




//////////////////
Explanation
.//////////////


;Write an 8086 assembly language program (using emu8086) that displays the phrase 'My name is' followed by a line break, and then displays the name 'Abid Shahriar' on the next line, using separate string variables for each word and manually inserting spaces and the line break sequence (0AH and 0DH).

.model small
.stack 100h
.data
    
; My name is
; Abid Shahriar    
    
;variable declaring
sent1 db 'My$'     ; String 1
sent2 db 'name$'   ; String 2
sent3 db 'is$'     ; String 3
sent4 db 'Abid Shahriar$' ; String 4

.code

mov ax, @data
mov ds, ax         ; Initialize the Data Segment Register


mov ah, 9          ; Function 9: Display string
lea dx, sent1
int 21h            ; Print "My"

mov ah, 2          ; Function 2: Display single character
mov dl, 20h        ; ASCII for Space (20H)
int 21h            ; Print a Space

mov ah, 9          ; Function 9: Display string
lea dx, sent2
int 21h            ; Print "name"

mov ah, 2          ; Function 2: Display single character
mov dl, 20h        ; ASCII for Space (20H)
int 21h            ; Print a Space

mov ah, 9          ; Function 9: Display string
lea dx, sent3
int 21h            ; Print "is"

mov ah, 2          ; Function 2: Display single character
mov dl, 0Ah        ; Line Feed (move cursor down)
int 21h            

mov ah, 2          ; Function 2: Display single character
mov dl, 0Dh        ; Carriage Return (move cursor to line start)
int 21h            

mov ah, 9          ; Function 9: Display string
lea dx, sent4
int 21h            ; Print "Abid Shahriar"