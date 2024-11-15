.MODEL SMALL
.STACK 100H
.DATA
STR DB "Enter Your number: $"  
STR2 DB "Your number is: $"
A DW ?
.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    MOV DX, OFFSET STR
    MOV AH, 9h
    INT 21H
    
    MOV AH, 1
    INT 21H
    SUB AL, '0'
    MOV AH,0
    MOV A,AX
    
    CALL newline  
    
    
     
    MOV DX,OFFSET STR2
    MOV AH,9h
    INT 21H  
  
   
    MOV AX,A
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 2
    INT 21H
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP  

newline PROC
    MOV AH, 2
    MOV DL, 13
    INT 21H
    MOV DL, 10
    INT 21H
    RET
newline ENDP


END MAIN
