.model small        ; Define the memory model as small
.data
str1 db 13,10, "Divisor: $" ; Define a string for displaying the prompt for the divisor
str2 db 13,10, "Dividend: $" ; Define a string for displaying the prompt for the dividend
str3 db 13,10, "Quotient: $" ; Define a string for displaying the prompt for the quotient
str4 db 13,10, "Remainder: $" ; Define a string for displaying the prompt for the remainder
.code               ; Start the code segment
main proc           ; Define the main procedure
    mov ax, @data    ; Move the address of the data segment into the ax register
    mov ds, ax       ; Set ds (data segment) to the value in ax
    
    ; Display prompt for the divisor
    lea dx, str1      ; Load the effective address of the str1 string into dx
    mov ah, 9         ; Set the DOS service number to 9 (print string)
    int 21h           ; Call DOS interrupt 21h to print the string
    
    ; Read the divisor from the user
    mov ah, 1         ; Set the DOS service number to 1 (read character)
    int 21h           ; Call DOS interrupt 21h to read a character
    mov bl, al        ; Store the divisor in register bl
    
    ; Display prompt for the dividend
    lea ax, str2      ; Load the effective address of the str2 string into ax
    mov ah, 9         ; Set the DOS service number to 9 (print string)
    int 21h           ; Call DOS interrupt 21h to print the string
    
    ; Read the dividend from the user
    mov ah, 1         ; Set the DOS service number to 1 (read character)
    int 21h           ; Call DOS interrupt 21h to read a character
    mov bh, al        ; Store the dividend in register bh
    
    ; Convert ASCII characters to integers
    sub bl, 48        ; Convert ASCII character to integer for divisor ('0' -> 0, '1' -> 1, etc.)
    sub bh, 48        ; Convert ASCII character to integer for dividend
    
    ; Display prompt for the quotient
    lea dx, str3      ; Load the effective address of the str3 string into dx
    mov ah, 9         ; Set the DOS service number to 9 (print string)
    int 21h           ; Call DOS interrupt 21h to print the string
    
    ; Perform division to calculate the quotient
    mov al, bh        ; Move the value of the dividend into al
    mov ah, 0         ; Clear ah
    div bl            ; Divide the value in ax by the divisor in bl
    mov cl, ah        ; Move the quotient into cl
    add al, 48        ; Convert the quotient to ASCII by adding '0' 
    
    ; Display the quotient
    mov dl, al        ; Move the quotient into dl
    mov ah, 2         ; Set the DOS service number to 2 (print character)
    int 21h           ; Call DOS interrupt 21h to print the character
    
    ; Display prompt for the remainder
    lea dx, str4      ; Load the effective address of the str4 string into dx
    mov ah, 9         ; Set the DOS service number to 9 (print string)
    int 21h           ; Call DOS interrupt 21h to print the string
    
    ; Display the remainder
    mov dl, cl        ; Move the remainder into dl
    mov ah, 2         ; Set the DOS service number to 2 (print character)
    int 21h           ; Call DOS interrupt 21h to print the character
    
    ; Terminate the program
    mov ah, 4ch       ; Set the DOS service number to 4ch (terminate program)
    int 21h           ; Call DOS interrupt 21h to terminate the program

main endp            ; End of the main procedure
end                 ; End of the program
