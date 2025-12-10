////////////
Write an 8086 assembly language program (using emu8086) that demonstrates the use of DOS Function 09H to display the string 'Hello World' and then uses DOS Function 02H with control characters (0AH and 0DH) to display 'Hello' and 'World' on separate lines."



.model small
.stack 100h
.data

;variable declaring
var1 db 25h
char1 db 'A'
sentence1 db 'Hello World$'
sent1 db 'Hello$'
sent2 db 'World$'

.code

mov ax, @data
mov ds, ax

;mov ah, 2
;mov dl, char1
;int 21h

;mov ah, 2
;mov dl, var1
;int 21h

;mov al, 50h
;add al, var1
;int 21h     

mov ah, 9              ; Function 9: Display string
lea dx, sentence1      ; Load address of 'Hello World$'
int 21h                ; Print the string
                                          
                                          
mov ah, 2
mov dl, 0Ah
int 21h

mov dl, 2
mov dl, 0Dh
int 21h
                                          
mov ah, 9
lea dx, sent1
int 21h

mov ah, 2              ; Function 2: Display single character
mov dl, 0Ah            ; Line feed (move cursor to next line)
int 21h

mov ah, 2              ; Function 2: Display single character
mov dl, 0Dh            ; Carriage return (move cursor to line start)
int 21h
        
mov ah, 9
lea dx, sent2
int 21h










////////////////////
Explanation
/////////////////////



;Write an 8086 assembly language program (using emu8086) that displays the phrase 'Hello World' and then uses DOS Function 02H with control characters (0AH and 0DH) to display 'Hello' and 'World' on separate lines."

.model small
.stack 100h
.data

;variable declaring
var1 db 25h
char1 db 'A'
sentence1 db 'Hello World$'
sent1 db 'Hello$'
sent2 db 'World$'

.code

mov ax, @data
mov ds, ax                       ; Initialize the Data Segment Register

;... (Character display/arithmetic is commented out)

mov ah, 9                        ; Function 9: Display string
lea dx, sentence1                ; Load address of 'Hello World$' into DX
int 21h                          ; Print the string "Hello World"
                                
; --- First Newline ---
mov ah, 2                        ; Function 2: Display single character
mov dl, 0Ah                      ; Line feed (0AH)
int 21h                          ; Creates a newline
                                 
mov ah, 2                        ; Function 2: Display single character (AH must be set again)
mov dl, 0Dh                      ; Carriage return (0DH)
int 21h                          ; Moves cursor to start of line

mov ah, 9                        ; Function 9: Display string
lea dx, sent1                    ; Load address of 'Hello$'
int 21h                          ; Print the string "Hello"

; --- Second Newline ---
mov ah, 2                        ; Function 2: Display single character
mov dl, 0Ah                      ; Line feed (0AH)
int 21h                          ; Creates a newline

mov ah, 2                        ; Function 2: Display single character
mov dl, 0Dh                      ; Carriage return (0DH)
int 21h                          ; Moves cursor to line start
    
mov ah, 9                        ; Function 9: Display string
lea dx, sent2                    ; Load address of 'World$'
int 21h                          ; Print the string "World"
