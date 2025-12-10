Write an 8086 assembly language program (using emu8086) that reads a single-digit number from the user, multiplies it by $\mathbf{15}$ (decimal), and then compares the product with the constant $\mathbf{45}$ (decimal). Display 'Numbers are Equal' if the values are the same. Otherwise, display 'The constant value is greater' or 'The user input is greater', indicating which value was larger."



.model small
.stack 100h

.data

msg1 db 'Take a lowercasen character input : $'
msg2 db 10, 13, 'Take another lowecase character input : $'
msg3 db 10, 13, 'Show output: $'
error_msg db 10, 13, 'The user input is not lowercase letter$'

.code

mov ax, @data
mov ds, ax

mov ah, 9
lea dx, msg1
int 21h

mov ah, 1
int 21h

mov bl, al

mov ah, 9
lea dx, msg2
int 21h

mov ah, 1
int 21h

mov cl, al

cmp bl, 'a'
jl error

cmp bl, 'z'
jg error


cmp cl, 'a'
jl error

cmp cl, 'z'
jg error

mov ah, 9
lea dx, msg3
int 21h

cmp bl, cl
jl show1
jg show2


error:
mov ah, 9
lea dx, error_msg
int 21h
jmp end

show1:
mov ah, 2
mov dl,bl
int 21h
jmp end

show2:
mov ah, 2
mov dl, cl
int 21h
jmp end


end:
mov ah, 4ch
int 21h








/////////////
Explanation
/////////////


; Store a number 50 (in decimal) in BL
; Take an Input of 1 digit from the user.
; Multiply it by 15.
; Compare the two values.
; If they are equal, display “Numbers are Equal”.
; If not, display ONLY the GREATER number:
; - If 50 is greater? “The constant value is greater”
; - If user input * 15 is greater? “The user input is greater”

.model small
.stack 100h
.data

msg1 db 'Numbers are Equal.$'
msg2 db 'The constant value is greater.$'
msg3 db 'The user input is greater.$'

.code

mov ax, @data
mov ds, ax

mov bl, 45          ; Store the constant 45 (decimal) in BL (which is 2DH)

mov ah, 1
int 21h             ; Read character input (ASCII in AL)
sub al, '0'         ; Convert ASCII to numerical value (e.g., '3' -> 03H). AL = User_Input

mov cl, 15          ; Store the multiplier 15 (decimal) in CL (which is 0FH)
mul cl              ; Multiply AL by CL. Result is stored in AX: AL = User_Input * 15
                    ; Note: Since AL is the accumulator for MUL, the high byte AH should be 0, which it is from the previous INT 21H call.
                    ; The product is an 8-bit result stored in AL (e.g., 3 * 15 = 45, AL = 2DH)

cmp al, bl          ; Compare User_Input * 15 (AL) with 45 (BL)
je num_equal        ; Jump Equal: AL = BL
jg user_input_generator ; Jump Greater: AL > BL (User_Input * 15 > 45)

const_value_generator: ; Implied Jump Less: AL < BL (User_Input * 15 < 45)
mov ah, 9
lea dx, msg2
int 21h             ; Display "The constant value is greater."
jmp end

num_equal:
mov ah, 9
lea dx, msg1
int 21h             ; Display "Numbers are Equal."
jmp end

user_input_generator:
mov ah, 9
lea dx, msg3
int 21h             ; Display "The user input is greater."


end:
mov ah, 4ch
int 21h             ; Terminate Program