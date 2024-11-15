.MODEL SMALL
.STACK 100H

.DATA
    UserInput DB ?
    PositiveMessage DB 'The number is positive.$'
    NegativeMessage DB 'The number is negative.$'
    ZeroMessage DB 'The number is zero.$'
    Prompt DB 'Enter your number: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV DX, OFFSET Prompt
    MOV AH, 09h
    INT 21h

    MOV AH, 01h
    INT 21h
    SUB AL, 30h
    MOV UserInput, AL

    MOV AH, 02h
    MOV DL, 13
    INT 21h
    MOV DL, 10
    INT 21h

    MOV AL, UserInput
    CMP AL, 0
    JE SHOW_ZERO
    JG SHOW_POSITIVE
    JL SHOW_NEGATIVE

SHOW_POSITIVE:
    MOV DX, OFFSET PositiveMessage
    MOV AH, 09h
    INT 21h
    JMP END_PROGRAM

SHOW_NEGATIVE:
    MOV DX, OFFSET NegativeMessage
    MOV AH, 09h
    INT 21h
    JMP END_PROGRAM

SHOW_ZERO:
    MOV DX, OFFSET ZeroMessage
    MOV AH, 09h
    INT 21h

END_PROGRAM:
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN

