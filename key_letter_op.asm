.MODEL SMALL
.STACK 100H

.DATA
    KEY_MSG DB 10, 13, 'Key Letters: $'
    NORMAL_MSG DB 10, 13, 'Normal Letters: $'
    
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CL, 0       
    MOV CH, 0      
    MOV SI, 8       

WHILE_LOOP:
    
    MOV AH, 1
    INT 21H         
    
    
    CMP AL, 'o'
    JE INCREMENT_KEY
    
    
    CMP AL, 'p'
    JE INCREMENT_KEY
    
    
    INC CH
    JMP CONTINUE_LOOP
    
INCREMENT_KEY:
    INC CL          
    
CONTINUE_LOOP:
    DEC SI          
    CMP SI, 0
    JNE WHILE_LOOP  


    
    
    MOV AH, 9
    LEA DX, KEY_MSG
    INT 21H         
    
    
    ADD CL, 30H     
    MOV AH, 2
    MOV DL, CL
    INT 21H
    
    
    MOV AH, 9
    LEA DX, NORMAL_MSG
    INT 21H         
    
    
    ADD CH, 30H     
    MOV AH, 2
    MOV DL, CH
    INT 21H
    
    
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN










//////////////
Explanation
//////////////


.MODEL SMALL        ; Defines the memory model as small (code and data in separate 64KB segments)
.STACK 100H         ; Reserves 100H bytes for the stack segment

.DATA               ; Start of the Data Segment
    KEY_MSG DB 10, 13, 'Key Letters: $'  ; String to prompt for Key Letter count (preceded by Newline)
    NORMAL_MSG DB 10, 13, 'Normal Letters: $' ; String to prompt for Normal Letter count (preceded by Newline)
    
.CODE               ; Start of the Code Segment
MAIN PROC
    MOV AX, @DATA       ; Load the starting address of the data segment into AX
    MOV DS, AX          ; Initialize the Data Segment register (DS)

    MOV CL, 0           ; Initialize CL (Key Letter Counter) to 0
    MOV CH, 0           ; Initialize CH (Normal Letter Counter) to 0
    MOV SI, 8           ; Initialize SI (Loop Counter) to 8 (for 8 inputs)

WHILE_LOOP:
    ; --- Input ---
    MOV AH, 1           ; Set AH = 01H (DOS Function: Read character from standard input)
    INT 21H             ; Execute DOS function (Stores the input character's ASCII value in AL)
    
    ; --- Check 1: Is it 'o'? ---
    CMP AL, 'o'         ; Compare input (AL) with the character 'o'
    JE INCREMENT_KEY    ; Jump Equal: If it is 'o', go to increment the key counter
    
    ; --- Check 2: Is it 'p'? ---
    CMP AL, 'p'         ; Compare input (AL) with the character 'p'
    JE INCREMENT_KEY    ; Jump Equal: If it is 'p', go to increment the key counter
    
    ; --- Normal Letter ---
    INC CH              ; If not 'o' or 'p', increment Normal Letter counter (CH)
    JMP CONTINUE_LOOP   ; Skip the key counter increment and go to loop control
    
INCREMENT_KEY:
    INC CL              ; Increment Key Letter counter (CL)
    
CONTINUE_LOOP:
    ; --- Loop Control ---
    DEC SI              ; Decrement the loop counter (SI)
    CMP SI, 0           ; Compare SI with 0
    JNE WHILE_LOOP      ; Jump Not Equal: If SI is not 0, loop back to WHILE_LOOP 

    ; --- Display Key Letter Count ---
    MOV AH, 9           ; Set AH = 09H (DOS Function: Display string)
    LEA DX, KEY_MSG     ; Load address of the Key Message (includes newline)
    INT 21H             ; Execute DOS function (Display "Key Letters: ")
    
    ADD CL, 30H         ; Convert the numerical Key Count in CL to its ASCII character representation (e.g., 3 -> '3')
    MOV AH, 2           ; Set AH = 02H (DOS Function: Display single character)
    MOV DL, CL          ; Move the ASCII count to DL
    INT 21H             ; Execute DOS function (Display the Key Letter count)
    
    ; --- Display Normal Letter Count ---
    MOV AH, 9           ; Set AH = 09H (DOS Function: Display string)
    LEA DX, NORMAL_MSG  ; Load address of the Normal Message (includes newline)
    INT 21H             ; Execute DOS function (Display "Normal Letters: ")
    
    ADD CH, 30H         ; Convert the numerical Normal Count in CH to its ASCII character representation
    MOV AH, 2           ; Set AH = 02H (DOS Function: Display single character)
    MOV DL, CH          ; Move the ASCII count to DL
    INT 21H             ; Execute DOS function (Display the Normal Letter count)
    
    ; --- Program Termination ---
    MOV AH, 4CH         ; Set AH = 4CH (DOS Function: Terminate program)
    INT 21H             ; Execute DOS function (Exit to DOS/Emulator)
MAIN ENDP
END MAIN