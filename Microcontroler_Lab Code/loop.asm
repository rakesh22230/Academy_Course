.MODEL SMALL
.STACK 100H
.DATA 
STR DB "Enter Your Number:  $" 
N DB ?
SUM DB 0
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV DX,OFFSET STR
    MOV AH,9h
    INT 21H
    
    ; Display Input
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV AH,0
    MOV N,AL
    
   
    
    XOR AX,AX
    MOV CL,N
    XOR BX,BX
    
SUM_LOOP:
       
       ADD AX,BX
       INC BX 
       LOOP SUM_LOOP
       
       
       ;MOV AL,SUM
       ADD AL,30H
       MOV DL,AL
       MOV AH,2
       INT 21H    

       
    
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



