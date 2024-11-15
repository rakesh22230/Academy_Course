.model small
.stack 100h

.data
a db ?    
b db ?    
sum db ?    
differ db ?      
produ db ?       
division db ?   

.code
main proc
    mov ax, @data
    mov ds, ax    
    
    ; First Input
    mov ah, 1      
    int 21h
    sub al, 30h    
    mov a, al      
    
    ; Newline
    mov ah, 2
    mov dl, 13     
    int 21h
    mov dl, 10     
    int 21h
     
    ; Second Input
    mov ah, 1
    int 21h 
    sub al, 30h    
    mov b, al 
     
    ; Newline
    mov ah, 2
    mov dl, 13     
    int 21h
    mov dl, 10     
    int 21h     
     
    ; ADDITION
    mov al, a      
    add al, b      
    mov sum, al    
    add al, 30h    
    mov ah, 2
    mov dl, al     
    int 21h        
    
    ; Newline
    mov ah, 2
    mov dl, 13     
    int 21h
    mov dl, 10     
    int 21h
    
    ; SUBTRACTION
    mov al, a      
    sub al, b      
    mov differ, al   
    add al, 30h    
    mov ah, 2
    mov dl, al     
    int 21h        
    
    ; Newline
    mov ah, 2
    mov dl, 13     
    int 21h
    mov dl, 10     
    int 21h
    
    ; MULTIPLICATION
    mov al, a      
    mov bl, b
    mul bl         
    mov produ, al   
    add al, 30h    
    mov ah, 2
    mov dl, al     
    int 21h        
     
    ; Newline
    mov ah, 2
    mov dl, 13     
    int 21h
    mov dl, 10     
    int 21h
    
    ; DIVISION
    mov al, a      
    mov bl, b
    xor ah, ah     
    div bl         
    mov division, al   
    add al, 30h    
    mov ah, 2
    mov dl, al     
    int 21h        

exit:
    mov ah, 4Ch    
    int 21h
main endp
end main
