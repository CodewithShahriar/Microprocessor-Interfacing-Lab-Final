////////////
the Carry Flag (CF) and the Overflow Flag (OF) when adding two maximum 16-bit numbers, which inevitably causes both a carry and an overflow


.model small
.stack 100h

.data
;all variables are defined there

.code

MOV AX, 0FFFFH
MOV BX, 0FFFFH

add AX, BX
           

;mov al, 80h
;mov bl, 80h

;add al, bl