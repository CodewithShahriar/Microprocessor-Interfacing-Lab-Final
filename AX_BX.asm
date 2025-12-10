; Write an assembly language program which performs the following functions:
; If AX contains a negative number, put -1 in BX;
; If AX contains 0, put 0 in BX;
; If AX contains a positive number, put +1 in BX.

.model small
.stack 100h
.data 
 
.code

mov ax, @data
mov ds, ax

mov ax, -6

cmp ax, 0
je make_bx_zero
jg make_bx_one
jl make_bx_negative_one

make_bx_zero:
mov bx, 0
jmp end

make_bx_one:
mov bx, 1
jmp end

make_bx_negative_one:
mov bx, -1
jmp end



end:
mov ah, 4Ch
int 21h





/////////////////////////
Explanation
/////////////////////



; Write an assembly language program which performs the following functions:
; If AX contains a negative number, put -1 in BX;
; If AX contains 0, put 0 in BX;
; If AX contains a positive number, put +1 in BX.

.model small
.stack 100h
.data 
 
.code

mov ax, @data
mov ds, ax

mov ax, -6          ; Initialize AX with a test value (e.g., -6, which is FFFAH in 2's complement)

cmp ax, 0           ; Compare AX with 0. This sets the Zero Flag (ZF) and Sign Flag (SF).
je make_bx_zero     ; Jump Equal: If ZF=1 (AX = 0)
jg make_bx_one      ; Jump Greater: If ZF=0 and SF=0 (AX > 0, Positive)
jl make_bx_negative_one ; Jump Less: If SF!=OF (AX < 0, Negative)

make_bx_zero:
mov bx, 0           ; Case: AX = 0
jmp end

make_bx_one:
mov bx, 1           ; Case: AX > 0
jmp end

make_bx_negative_one:
mov bx, -1          ; Case: AX < 0
jmp end


end:
mov ah, 4Ch
int 21h             ; Terminate Program