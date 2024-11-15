.MODEL SMALL
.STACK 100H
.DATA  
N DB ?
STR1 DB "Enter Your digit: $"
X DB "Postive Number $"
Y DB "Negative Number $"
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV DX,OFFSET STR1
    MOV AH,9h
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AX,30H
    MOV N,AL
    
    
    
    MOV AL,N
    CMP AL,0
    JGE L1
    JMP L2 
    
    ;CALL Newline
    
 L1: 
    CALL Newline
    
    MOV DX, OFFSET X
    MOV AH,9h
    INT 21H
    JMP EXIT
    
 L2: 
    CALL Newline
    
    MOV DX,OFFSET Y
    MOV AH,9h
    INT 21H
    JMP EXIT
    
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



