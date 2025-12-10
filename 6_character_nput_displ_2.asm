.MODEL SMALL
.STACK 100H

.DATA

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV SI, 6       
    MOV BH, 0       

WHILE_LOOP:
    
    MOV AH, 1
    INT 21H
    
    CMP BH, 1
    JE STORE_CHAR

    JMP CONTINUE_LOOP

STORE_CHAR:
    MOV BL, AL
    
CONTINUE_LOOP:
    INC BH          
    DEC SI
    
    CMP SI, 0
    JNE WHILE_LOOP
    
    
    MOV AH, 2
    MOV DL, BL
    INT 21H
    
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN






//////////////////////
Explanation
/////////////////



.MODEL SMALL        ; Defines the memory model as small
.STACK 100H         ; Reserves 100 hexadecimal bytes for the stack segment

.DATA               ; Start of the Data Segment (no messages needed for this specific task)

.CODE               ; Start of the Code Segment
MAIN PROC
    MOV AX, @DATA       ; Load the starting address of the data segment into AX
    MOV DS, AX          ; Initialize the Data Segment register (DS)

    MOV SI, 6           ; Initialize SI (Loop Counter) to 6 (for exactly six inputs)
    MOV BH, 0           ; Initialize BH (Input Counter/Index) to 0. 
                        ; We will use BH to track which iteration we are in.

WHILE_LOOP:             ; Start of the loop to read six characters
    
    MOV AH, 1           ; Set AH = 01H (DOS Function: Read character from standard input)
    INT 21H             ; Execute DOS function (Stores the input character's ASCII value in AL)
    
    ; --- Check for the Second Input ---
    CMP BH, 1           ; Compare the current input index (BH) with 1 (0-indexed: 0=1st, 1=2nd, 2=3rd, etc.)
    JE STORE_CHAR       ; Jump Equal: If BH is 1, it means this is the SECOND character.
                        ; Store the character if it's the second one.

    JMP CONTINUE_LOOP   ; If it's not the second character, skip the storage and continue the loop
                        ; (The first character is skipped here, and subsequent characters are skipped here)

STORE_CHAR:
    MOV BL, AL          ; Store the second character (from AL) into BL. 
                        ; This value will not be overwritten because subsequent inputs skip this label.
    
CONTINUE_LOOP:
    INC BH              ; Increment the Input Counter/Index (BH) to move to the next iteration count
    DEC SI              ; Decrement the Loop Counter (SI)
    
    CMP SI, 0           ; Compare SI with 0
    JNE WHILE_LOOP      ; Jump Not Equal: If SI is not 0, loop back to WHILE_LOOP to read the next character
    
    ; --- Display Result ---
    MOV AH, 2           ; Set AH = 02H (DOS Function: Display single character)
    MOV DL, BL          ; Move the stored second character (from BL) to DL
    INT 21H             ; Execute DOS function (Display the character)
    
    ; --- Program Termination ---
    MOV AH, 4CH         ; Set AH = 4CH (DOS Function: Terminate program)
    INT 21H             ; Execute DOS function (Exit to DOS/Emulator)
MAIN ENDP
END MAIN