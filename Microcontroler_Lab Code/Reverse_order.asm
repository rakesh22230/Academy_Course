.MODEL SMALL
.STACK 100H

.DATA
    Char1 DB ?                     
    Char2 DB ?                     
    MSG_REVERSE DB 'Reverse order: $'
    MSG_PROMPT_CHAR1 DB 'Enter your first character: $'
    MSG_PROMPT_CHAR2 DB 'Enter your second character: $'
    MSG_NEWLINE DB 0DH, 0AH, '$'   

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Prompt for first character
    MOV DX, OFFSET MSG_PROMPT_CHAR1
    MOV AH, 09h
    INT 21h
    MOV AH, 01h
    INT 21h
    MOV Char1, AL

    ; Print newline after first input  
    MOV AH,2
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H


    ; Prompt for second character
    MOV DX, OFFSET MSG_PROMPT_CHAR2
    MOV AH, 09h
    INT 21h
    MOV AH, 01h
    INT 21h
    MOV Char2, AL

    ; Print newline after second input   
    MOV AH,2
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H


   
    MOV DX, OFFSET MSG_REVERSE
    MOV AH, 09h
    INT 21h

    ; Compare
    MOV AL, Char1
    CMP AL, Char2
    JG DISPLAY_CHAR2_CHAR1
    JL DISPLAY_CHAR1_CHAR2

    DISPLAY_EQUAL:
        MOV DL, Char1
        MOV AH, 02h
        INT 21h
        JMP PRINT_NEWLINE

    DISPLAY_CHAR1_CHAR2:
        MOV DL, Char2
        MOV AH, 02h
        INT 21h
        MOV DL, Char1
        MOV AH, 02h
        INT 21h
        JMP PRINT_NEWLINE

    DISPLAY_CHAR2_CHAR1:
        MOV DL, Char1
        MOV AH, 02h
        INT 21h
        MOV DL, Char2
        MOV AH, 02h
        INT 21h

    PRINT_NEWLINE:
        MOV DX, OFFSET MSG_NEWLINE
        MOV AH, 09h
        INT 21h
        MOV AH, 4Ch
        INT 21h

MAIN ENDP
END MAIN
