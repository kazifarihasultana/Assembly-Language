.model small        ; Define the memory model as small
.data
str1 db 10,13,"Enter the number: $" ; String for displaying the prompt to enter a number
str2 db 10,13,"The number is even. $" ; String for displaying even number message
str3 db 10,13,"The number is odd. $" ; String for displaying odd number message
.code               ; Start the code segment
main proc           ; Define the main procedure
    mov ax,@data    ; Move the address of the data segment into the ax register
    mov ds,ax       ; Set ds (data segment) to the value in ax
    
    lea dx,str1      ; Load the effective address of the str1 string into dx
    mov ah,9         ; Set the DOS service number to 9 (print string)
    int 21h           ; Call DOS interrupt 21h to print the string
    
    mov ah,1         ; Set the DOS service number to 1 (read character)
    int 21h           ; Call DOS interrupt 21h to read a character
    
    mov bl,2         ; Set bl to 2 for division
    div bl           ; Divide the entered number by 2
    
    cmp ah,0         ; Compare the remainder (ah) with 0
    je even          ; Jump to even if remainder is 0
    
    lea dx,str3      ; Load the effective address of the str3 string into dx
    mov ah,9         ; Set the DOS service number to 9 (print string)
    int 21h          ; Call DOS interrupt 21h to print the string
    
    mov ah,4ch       ; Set the DOS service number to 4ch (terminate program)
    int 21h          ; Call DOS interrupt 21h to terminate the program
    
even:
    lea dx,str2      ; Load the effective address of the str2 string into dx
    mov ah,9         ; Set the DOS service number to 9 (print string)
    int 21h          ; Call DOS interrupt 21h to print the string

main endp           ; End of the main procedure
end                ; End of the program
