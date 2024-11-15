.MODEL SMALL
.STACK 100H

.DATA
STR DB "Enter the 5 elements of array (0-9): $"
AR  DB 5 DUP(0)
avg DB 0
Min DB 0
Max DB 0
Out_Avg DB "AVERAGE =  $"
Out_Min DB "SMALLEST =  $"
Out_Max DB "LARGEST =  $"


.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV DX, OFFSET STR
    MOV AH, 09h
    INT 21h

    MOV CX, 5
    MOV SI, 0
    CALL InputLoop 
    
    CALL newline

    CALL calculate_average
    CALL calculate_largest
    CALL calculate_smallest

    MOV DX, OFFSET Out_Avg
    MOV AH, 09h
    INT 21h

    MOV AL, avg
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 02h
    INT 21h

    CALL newline

    MOV DX, OFFSET Out_Max
    MOV AH, 09h
    INT 21h

    MOV AL, Max
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 02h
    INT 21h

    CALL newline

    MOV DX, OFFSET Out_Min
    MOV AH, 09h
    INT 21h

    MOV AL, Min
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 02h
    INT 21h

    CALL newline

EXIT:
    MOV AH, 4Ch
    INT 21h
MAIN ENDP
 
;----------------------------------- 
 
InputLoop PROC
    MOV AH, 01h
InputLoopStart:
    INT 21h
    SUB AL, '0'
    MOV AR[SI], AL
    INC SI
    LOOP InputLoopStart
    RET
InputLoop ENDP

;-----------------------------------
calculate_average PROC
    MOV CX, 5
    MOV SI, 0
    MOV AX, 0
SumLoop:
    ADD AL, AR[SI]
    INC SI
    LOOP SumLoop
    MOV CL, 5
    DIV CL
    MOV avg, AL
    RET
calculate_average ENDP
 
;------------------------------------- 
calculate_largest PROC
    MOV SI, 0
    MOV AL, AR[SI]
    MOV Max, AL
LargestLoop:
    MOV AL, AR[SI]
    CMP AL, Max
    JGE SkipLargest
    MOV Max, AL
SkipLargest:
    INC SI
    CMP SI, 5
    JL LargestLoop
    RET
calculate_largest ENDP
;--------------------------------------

calculate_smallest PROC
    MOV SI, 0
    MOV AL, AR[SI]
    MOV Min, AL
SmallestLoop:
    MOV AL, AR[SI]
    CMP AL, Min
    JLE SkipSmallest
    MOV Min, AL
SkipSmallest:
    INC SI
    CMP SI, 5
    JL SmallestLoop
    RET
calculate_smallest ENDP
 
;----------------------------------------- 
newline PROC
    MOV AH, 02h
    MOV DL, 13
    INT 21h
    MOV DL, 10
    INT 21h
    RET
newline ENDP 


END MAIN
