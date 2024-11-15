.MODEL SMALL
.STACK 100H
.DATA  
STR DB "Enter Your Number: $"  
O DB "Odd Number $"
E DB "Even Number $"
.CODE

MAIN PROC  
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV DX, OFFSET STR
    MOV AH,9h
    INT 21H 
    
    MOV AH,1
    INT 21H  
    SUB AL,'0'
    MOV BL,AL
    
    MOV AL,BL 
    MOV AH,0
    MOV CL,2
    DIV CL
    
    CMP AH,0
    JZ EVEN
    JMP ODD
 
EVEN: 
    CALL Newline
 
    MOV DX,OFFSET E
    MOV AH,9h
    INT 21H
    JMP EXIT

ODD:
    CALL Newline
   
    MOV DX, OFFSET O
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



