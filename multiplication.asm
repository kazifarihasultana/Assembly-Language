.model small         ; Define the memory model as small
.stack 100h          ; Set the stack size to 100h bytes

.data                ; Start the data segment
a       dw      ?    ; Define a word-sized variable 'a' to store the first number
b       dw      ?    ; Define a word-sized variable 'b' to store the second number
str1    db      13,10, 'First number: $' ; Define a string for displaying the prompt for the first number
str2    db      13,10,'Second number: $' ; Define a string for displaying the prompt for the second number
str3    db      13,10,"The multiplication is: $" ; Define a string for displaying the multiplication result
.code                ; Start the code segment
main proc            ; Define the main procedure
    mov ax, @data     ; Move the address of the data segment into the ax register
    mov ds, ax        ; Set ds (data segment) to the value in ax

    ; Display prompt for the first number
    mov ah, 9         ; Set the DOS service number to 9 (print string)
    lea dx, str1      ; Load the effective address of the str1 string into dx
    int 21h           ; Call DOS interrupt 21h to print the string

    ; Read the first number from the user
    mov ah, 1         ; Set the DOS service number to 1 (read character)
    int 21h           ; Call DOS interrupt 21h to read a character
    sub al, 48        ; Convert ASCII character to integer ('0' -> 0, '1' -> 1, etc.)
    mov byte ptr a, al; Store the first number in variable 'a'

    ; Display prompt for the second number
    mov ah, 9         ; Set the DOS service number to 9 (print string)
    lea dx, str2      ; Load the effective address of the str2 string into dx
    int 21h           ; Call DOS interrupt 21h to print the string

    ; Read the second number from the user
    mov ah, 1         ; Set the DOS service number to 1 (read character)
    int 21h           ; Call DOS interrupt 21h to read a character
    sub al, 48        ; Convert ASCII character to integer ('0' -> 0, '1' -> 1, etc.)
    mov byte ptr b, al; Store the second number in variable 'b'

    ; Display prompt for the multiplication result
    mov ah, 9         ; Set the DOS service number to 9 (print string)
    lea dx, str3      ; Load the effective address of the str3 string into dx
    int 21h           ; Call DOS interrupt 21h to print the string

    ; Perform multiplication of a and b
    mov ax, a         ; Move the value of 'a' into the ax register
    mul b             ; Multiply the value in ax by 'b'
    
    ; Display the result
    mov dl, al        ; Move the lower byte of the result into dl (since mul result is in ax)
    add dl, 48        ; Convert the result to ASCII by adding '0'
    mov ah, 2         ; Set the DOS service number to 2 (print character)
    int 21h           ; Call DOS interrupt 21h to print the character
    
    ; Terminate the program
    mov ah, 4ch       ; Set the DOS service number to 4ch (terminate program)
    int 21h           ; Call DOS interrupt 21h to terminate the program

main endp             ; End of the main procedure
end                  ; End of the program
