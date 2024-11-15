.MODEL SMALL
.STACK 100H

.DATA
PROMPT1 DB 'ENTER FIRST NUMBER: $'   
PROMPT2 DB 'ENTER SECOND NUMBER: $'  
NEWLINE DB 13, 10, '$'               
NUMB1 DB ?    
NUMB2 DB ?    
SUM_RES DB ?    
DIFF_RES DB ?      
PROD_RES DB ?       
DIV_RES DB ?   

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX    
    
    ; PROMPT FOR THE FIRST NUMBER
    MOV AH, 09H
    LEA DX, PROMPT1
    INT 21H
    
    ; FIRST INPUT
    MOV AH, 1      
    INT 21H
    SUB AL, 30H    
    MOV NUMB1, AL   
    
    ; NEWLINE
    MOV AH, 09H
    LEA DX, NEWLINE
    INT 21H
     
    ; PROMPT FOR THE SECOND NUMBER
    MOV AH, 09H
    LEA DX, PROMPT2
    INT 21H
    
    ; SECOND INPUT
    MOV AH, 1
    INT 21H 
    SUB AL, 30H    
    MOV NUMB2, AL  
    
    ; NEWLINE
    MOV AH, 09H
    LEA DX, NEWLINE
    INT 21H
     
    ; ADDITION
    MOV AL, NUMB1      
    ADD AL, NUMB2      
    MOV SUM_RES, AL    
    ADD AL, 30H    
    MOV AH, 2
    MOV DL, AL     
    INT 21H        
    
    ; NEWLINE
    MOV AH, 09H
    LEA DX, NEWLINE
    INT 21H
    
    ; SUBTRACTION
    MOV AL, NUMB1      
    SUB AL, NUMB2      
    MOV DIFF_RES, AL   
    ADD AL, 30H    
    MOV AH, 2
    MOV DL, AL     
    INT 21H        
    
    ; NEWLINE
    MOV AH, 09H
    LEA DX, NEWLINE
    INT 21H
    
    ; MULTIPLICATION
    MOV AL, NUMB1      
    MOV BL, NUMB2
    MUL BL         
    MOV PROD_RES, AL   
    ADD AL, 30H    
    MOV AH, 2
    MOV DL, AL     
    INT 21H        
     
    ; NEWLINE
    MOV AH, 09H
    LEA DX, NEWLINE
    INT 21H
    
    ; DIVISION
    MOV AL, NUMB1      
    MOV BL, NUMB2
    XOR AH, AH     
    DIV BL         
    MOV DIV_RES, AL   
    ADD AL, 30H    
    MOV AH, 2
    MOV DL, AL     
    INT 21H        

EXIT:
    MOV AH, 4CH    
    INT 21H
MAIN ENDP
END MAIN
