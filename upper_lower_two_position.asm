.model small
.stack 100h

.data

msg1 db 'Enter a uppercase letter : $'
msg2 db 10, 13, 'The lowercase letter : $'
newline db 10, 13, '$'

.code

mov ax, @data
mov ds, ax

mov ah, 9
lea dx, msg1
int 21h

mov ah, 1
int 21h

mov cl, al
add cl, 22h

mov ah, 9
lea dx, newline
int 21h

mov ah, 9
lea dx, msg2
int 21h

mov ah, 2
mov dl, cl
int 21h

mov ah, 4CH
int 21H

















//////////////
Explanation
///////////////


.model small        ; Defines the memory model as small (code and data fit within a single 64KB segment each)
.stack 100h         ; Reserves 100 hexadecimal bytes for the stack segment

.data               ; Start of the Data Segment, where variables and messages are defined

msg1 db 'Enter a uppercase letter : $' ; Defines the string prompt for the user
msg2 db 10, 13, 'The lowercase letter : $' ; Defines the output prompt, preceded by Line Feed (10) and Carriage Return (13) for a newline
newline db 10, 13, '$' ; Defines a separate string for printing a newline

.code               ; Start of the Code Segment, where program instructions reside

mov ax, @data       ; Load the starting address of the data segment into AX
mov ds, ax          ; Initialize the Data Segment register (DS) with the data segment address

mov ah, 9           ; Set AH = 09H (DOS Function: Display string)
lea dx, msg1        ; Load the Effective Address of the prompt 'msg1' into DX
int 21h             ; Execute DOS function (Display the prompt)

mov ah, 1           ; Set AH = 01H (DOS Function: Read character from standard input)
int 21h             ; Execute DOS function (Waits for input; stores the character's ASCII value in AL)

mov cl, al          ; Move the input character (e.g., 'A' = 41H) from AL to CL
add cl, 22h         ; Perform the conversion logic: CL = CL + 22H (22H = 2 + 20H). 
                    ; 2 positions forward + 20H for lowercase conversion. 
                    ; (e.g., 41H + 22H = 63H, which is 'c')

mov ah, 9           ; Set AH = 09H (DOS Function: Display string)
lea dx, newline     ; Load the address of the newline string into DX
int 21h             ; Execute DOS function (Prints the newline)

mov ah, 9           ; Set AH = 09H (DOS Function: Display string)
lea dx, msg2        ; Load the address of the output prompt 'msg2' into DX
int 21h             ; Execute DOS function (Display the result prompt)

mov ah, 2           ; Set AH = 02H (DOS Function: Display single character)
mov dl, cl          ; Move the calculated result (e.g., 'c') from CL to DL (where Function 02H expects it)
int 21h             ; Execute DOS function (Display the final lowercase character)

mov ah, 4CH         ; Set AH = 4CH (DOS Function: Terminate program)
int 21H             ; Execute DOS function (Exit to DOS/Emulator)