"Write an 8086 assembly language program (using emu8086) that prompts the user for a single character input, compares its ASCII value to the ASCII value of the digit '5' (35H), and then displays one of the following messages using conditional jumps: 'User input is equal to 5', 'User input is greater than 5', or 'User input is less than 5'."


.model small
.stack 100h
.data
 
input db 'Take an input : $'    
sent1 db 'User input is equal to 5$'
sent2 db 'User input is greater than 5$'
sent3 db 'User input is less than 5$'    
    
.code 

mov ax, @data
mov ds, ax

mov ah, 9
lea dx, input
int 21h 
 
mov ah, 1
int 21h

mov cl, al
mov bl, 35h
           
mov ah, 2
mov dl, 0Ah 
int 21h

mov ah, 2
mov dl, 0Dh
int 21h

cmp cl, bl
je equal
jg greater
jl lessthan

equal: 

mov ah, 9
lea dx, sent1
int 21h
jmp end

greater:

mov ah, 9
lea dx, sent2
int 21h
jmp end
 
lessthan: 

mov ah, 9
lea dx, sent3
int 21h
jmp end 

end:
mov ah, 4Ch
int 21h









///////////////

Explanation

////////////////

.model small
.stack 100h
.data
 
input db 'Take an input : $'      ; Prompt for user
sent1 db 'User input is equal to 5$'
sent2 db 'User input is greater than 5$'
sent3 db 'User input is less than 5$'    
    
.code 

mov ax, @data
mov ds, ax      ; Initialize the Data Segment Register

mov ah, 9
lea dx, input
int 21h         ; Display the prompt "Take an input : "
 
mov ah, 1
int 21h         ; Read character input (ASCII in AL)

mov cl, al      ; Move input ASCII (e.g., '6' = 36H) to CL
mov bl, 35h     ; Store ASCII of '5' (35H) in BL
           
; Print Newline/Carriage Return
mov ah, 2
mov dl, 0Ah 
int 21h
mov ah, 2
mov dl, 0Dh
int 21h

cmp cl, bl      ; Compare input character (CL) with '5' (BL)
je equal        ; Jump Equal: If CL = BL, jump to 'equal'
jg greater      ; Jump Greater: If CL > BL, jump to 'greater'
jl lessthan     ; Jump Less: If CL < BL, jump to 'lessthan' 

equal: 
mov ah, 9
lea dx, sent1
int 21h         ; Display "User input is equal to 5"
jmp end

greater:
mov ah, 9
lea dx, sent2
int 21h         ; Display "User input is greater than 5"
jmp end
 
lessthan: 
mov ah, 9
lea dx, sent3
int 21h         ; Display "User input is less than 5"
jmp end 

end:
mov ah, 4Ch     ; Terminate Program
int 21h