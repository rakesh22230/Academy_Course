.MODEL SMALL
.STACK 100H
.DATA
A DW ?
B DW ?
RESULT DW ?
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX   
    
    ;first input
    
    MOV AH,1
    INT 21H 
    SUB AL,'0'
    MOV AH,0
    MOV A,AX
    
    CALL newline
    
    ;second input
    
    MOV AH,1
    INT 21H 
    SUB AL,'0' 
    MOV AH,0
    MOV B,AX   
    
    CALL newline
    
    ;multiplication
    MOV AX,A
    MOV BX,B
    MUL BX
    ;MOV RESULT,AX 
    
    
    
    ;OUTPUT/PRINT
    
    ADD AL ,'0'
    MOV DL,AL
    MOV AH,2
    INT 21H
    
    
    
    MAIN ENDP  

newline PROC  
    MOV AH,2
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H
    RET
newline ENDP

END MAIN