.MODEL SMALL
.STACK 100H
.DATA 
A DB "LOO CONCEPT $"
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV DX,OFFSET A
    MOV AH,9h
    INT 21H
    
    CALL Newline
    
    MOV CX,10
    MOV AH,2 
    MOV DL,'A'
    
LEVEL1:
     
     INT 21H
     INC DL
     LOOP LEVEL1 
    
       
    
EXIT:
    
    MOV AH,4CH
    INT 21H 
    
MAIN ENDP 

Newline PROC
    MOV AH,2
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H
    RET
Newline ENDP

END MAIN