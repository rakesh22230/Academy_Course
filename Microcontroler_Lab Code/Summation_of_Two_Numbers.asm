ADDITION MACRO NUM1,NUM2 
    
    MOV AH,2
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H
    
    
    MOV AX,0
    MOV BX,0  
    MOV AX,NUM1
    MOV BX,NUM2
    ADD AX,BX 
    ADD AX,30H 
    MOV DX,0
    MOV DX,AX
    MOV AH,2
    INT 21H  
    
ENDM

INPUT MACRO STRING
    MOV DX,OFFSET STRING
    MOV AH,09H
    INT 21H
ENDM

ORG 100H
.DATA
  A DW ?
  B DW ? 
  I DW "ENTER YOUR NUMBER: $";
.CODE 
  
  MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX 
    
    INPUT I  
    
    MOV AH,1
    INT 21H
    SUB AX,30H
    MOV A,AX 
    MOV AX,0
    
    MOV AH,1
    INT 21H
    SUB AX,30H
    MOV B,AX
   
    
    ADDITION A,B  
    
    
    MOV AH,4CH
    INT 21H
   MAIN ENDP
END MAIN
 



