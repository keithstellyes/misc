; AUTHOR: Keith Stellyes
; WRITTEN: September 8, 2016
; NASM syntax, x86-64 Linux, calls C libs for stdin/stdout
; Very basic, take in two integers, then print the result.
; TO COMPILE AND RUN:
;nasm -felf64 even_or_odd.asm && gcc even_or_odd.o && ./a.out

global main
extern printf, scanf

section .data
   msg: db "n = ",0
   format:db "%d",0
   is_even: db "EVEN",10,0 ;10 being the newline for clean output
   is_odd: db "ODD",10,0

section .bss
   n resb 4        ;a place for our integer

section .text
main:
   mov rdi, msg    ;set printf arg
   mov al, 0
   call printf     ;make the call

   mov rsi, n      ;set place to store number
   mov rdi, format ;set format str arg
   mov rax, 0
   call scanf

   mov ax,[n]      ;copy the contents of the address pointed at by n
   and ax,1        ;we can't do and [n],1 we must compare the register
   jz even         ;note that NUMBER BITWISE-AND 1 returns 0 if even
   jmp odd
odd:
   mov rdi,is_odd
   mov rcx,0       ;make sure it's 0!
   mov rax,0
   call printf
   jmp exit        ;otherwise, we fall through to exit
even:
   mov rdi,is_even
   mov rcx,0       ;make sure it's 0!
   mov rax,0
   call printf

exit:
   ret
