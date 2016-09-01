; AUTHOR: Keith Stellyes
; WRITTEN: August 31, 2016
; NASM syntax, x86-64 Linux, calls GCC libs for stdin/stdout
; Very basic, take in two integers, then print the result. 
; TO COMPILE AND RUN: nasm -felf64 a_plus_b.asm && gcc a_plus_b.o && ./a.out

global main
extern printf, scanf

section .data
   x_msg: db "x = ",0
   y_msg: db "y = ",0
   format:db "%d",0
   out_format: db "%d + %d = %d",10,0

section .bss
   x resb 4
   y resb 4

section .text
main:
   mov rdi, x_msg
   mov al, 0
   call printf

   mov rsi, x
   mov rdi, format
   mov rax, 0
   call scanf

   mov rdi, y_msg
   mov al, 0
   call printf

   mov rsi, y
   mov rdi, format
   mov rax, 0
   call scanf

   mov rdi,out_format
   mov rsi,[x]
   mov rdx,[y]
   mov rcx,0  ;make sure it's 0!
   add rcx,rsi
   add rcx,rdx
   mov rax,0
   call printf 

   ret
