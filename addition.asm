.model small        ; Define the memory model as small
.data               ; Data section
str1 db "Enter first number: $"   ; String for user prompt
str2 db 13,10,"Enter second number: $"  ; String for user prompt with newline characters
str3 db 13,10,"The sum is: $"   ; String for result message
.code               ; Code section
main proc           ; Main procedure

    mov ax, @data   ; Initialize the data segment address
    mov ds, ax      ; Set the data segment register

    lea dx, str1    ; Load the address of the first prompt into DX
    mov ah, 9       ; Set AH to 9 to print a string
    int 21h         ; Call DOS interrupt to print the string

    mov ah, 1       ; Set AH to 1 to read a character from standard input
    int 21h         ; Call DOS interrupt to read the character
    mov bl, al      ; Move the character to BL for later use

    lea dx, str2    ; Load the address of the second prompt into DX
    mov ah, 9       ; Set AH to 9 to print a string
    int 21h         ; Call DOS interrupt to print the string

    mov ah, 1       ; Set AH to 1 to read a character from standard input
    int 21h         ; Call DOS interrupt to read the character
    add bl, al      ; Add the character to BL (considering it's a digit)

    sub bl, 48      ; Subtract 48 to convert ASCII to numeric

    lea dx, str3    ; Load the address of the result message into DX
    mov ah, 9       ; Set AH to 9 to print a string
    int 21h         ; Call DOS interrupt to print the string

    add bl, 48      ; Add 48 to convert the sum back to ASCII
    mov dl, bl      ; Move the sum to DL for printing
    mov ah, 2       ; Set AH to 2 to print a character
    int 21h         ; Call DOS interrupt to print the character

    mov ah, 4Ch      ; Set AH to 4Ch to terminate the program
    int 21h         ; Call DOS interrupt to terminate the program
main endp           ; End of the main procedure
end                ; End of the program
