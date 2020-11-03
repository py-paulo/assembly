section .data
codes:
    db      '0123456789ABCDEF'

section .text
global _start

_start:
    MOV     rax, 0x1122334455667788

    MOV     rdi, 1
    MOV     rdx, 1
    MOV     rcx, 64

.loop:
    PUSH    rax
    SUB     rcx, 4

    SAR     rax, cl
    AND     rax, 0xf
    LEA     rsi, [codes + rax]
    MOV     rax, 1

    PUSH    rcx
    syscall
    POP     rcx

    POP     rax

    TEST    rcx, rcx
    JNZ     .loop

    MOV     rax, 60
    XOR     rdi, rdi
    syscall

; nasm -felf64 print_rax.asm -o bin/print_rax.o; ld -o bin/print_rax bin/print_rax.o; chmod u+x bin/print_rax