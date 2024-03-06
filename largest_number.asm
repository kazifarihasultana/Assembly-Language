.model small          ; Define the memory model as small

.data                 ; Data section

str1 db "Enter first number: $"   ; String for user prompt
str2 db 10,13, "Enter second number: $"  ; String for user prompt with newline characters
str3 db 10,13, "Enter third number: $"   ; String for user prompt with newline characters
str4 db 10,13, "The largest number is: $"  ; String for result message

num1 db ?   ; Variable to store the first number
num2 db ?   ; Variable to store the second number
num3 db ?   ; Variable to store the third number

.code                 ; Code section

main proc             ; Main procedure

    mov ax, @data     ; Initialize the data segment address
    mov ds, ax        ; Set the data segment register

    lea dx, str1      ; Load the address of the first prompt into DX
    mov ah, 9         ; Set AH to 9 to print a string
    int 21h           ; Call DOS interrupt to print the string

    mov ah, 1         ; Set AH to 1 to read a character from standard input
    int 21h           ; Call DOS interrupt to read the character
    sub al, 0         ; Subtract 0 to convert ASCII to numeric
    mov num1, al      ; Move the numeric value to num1

    lea dx, str2      ; Load the address of the second prompt into DX
    mov ah, 9         ; Set AH to 9 to print a string
    int 21h           ; Call DOS interrupt to print the string

    mov ah, 1         ; Set AH to 1 to read a character from standard input
    int 21h           ; Call DOS interrupt to read the character
    sub al, 0         ; Subtract 0 to convert ASCII to numeric
    mov num2, al      ; Move the numeric value to num2

    lea dx, str3      ; Load the address of the third prompt into DX
    mov ah, 9         ; Set AH to 9 to print a string
    int 21h           ; Call DOS interrupt to print the string

    mov ah, 1         ; Set AH to 1 to read a character from standard input
    int 21h           ; Call DOS interrupt to read the character
    sub al, 0         ; Subtract 0 to convert ASCII to numeric
    mov num3, al      ; Move the numeric value to num3

    mov al, num1      ; Move the value of num1 to AL
    mov bl, num2      ; Move the value of num2 to BL
    cmp al, bl        ; Compare AL and BL
    jg set_largest    ; Jump if AL is greater than BL
    mov al, bl        ; Move the value of BL to AL

set_largest:          ; Label to set the largest value
    mov bl, num3      ; Move the value of num3 to BL
    cmp al, bl        ; Compare AL and BL
    jg print_largest  ; Jump if AL is greater than BL
    mov al, bl        ; Move the value of BL to AL

print_largest:        ; Label to print the largest value
    mov num1, al      ; Move the value of AL to num1

    lea dx, str4      ; Load the address of the result message into DX
    mov ah, 9         ; Set AH to 9 to print a string
    int 21h           ; Call DOS interrupt to print the string

    mov al, num1      ; Move the value of num1 to AL
    add al, 0         ; Add 0 (no operation) to AL
    mov ah, 2         ; Set AH to 2 to print a character
    mov dl, al        ; Move the value of AL to DL
    int 21h           ; Call DOS interrupt to print the character

    mov ah, 4ch        ; Set AH to 4ch to terminate the program
    int 21h           ; Call DOS interrupt to terminate the program

main endp             ; End of the main procedure

end                  ; End of the program
