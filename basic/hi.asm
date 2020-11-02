global _start

section .data
message: db 'hi, friend!', 10

section .text
_start:
    MOV     rax, 1 ; syscall number
    MOV     rdi, 1 ; argv[1] -> writer descriptor
    MOV     rsi, message ; argv[2] -> begin string
    MOV     rdx, 12 ; argv[3] -> lenght write
    syscall

    MOV     rax, 60 ; syscall 'exit'
    XOR     rdi, rdi
    syscall

; nasm -felf64 hi.asm -o hi.o; ld -o hi hi.o; chmod u+x hi