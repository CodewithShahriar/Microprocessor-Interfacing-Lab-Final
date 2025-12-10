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