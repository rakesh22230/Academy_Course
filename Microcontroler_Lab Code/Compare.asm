.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    CALL newline
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    CALL newline
    
    CMP BL,BH
    JGE L1
    JMP L2
    
    L1:
    MOV AH,2
    MOV DL,BL
    INT 21H
    JMP EXIT:
    
    L2:
    MOV AH,2
    MOV DL,BH
    INT 21H
    JMP EXIT:
    
    
    EXIT:
    MOV AH,4CH
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


