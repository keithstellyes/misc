; AUTHOR: Keith Stellyes
; WRITTEN: August 31, 2016
; NASM syntax, x86-64 Linux, calls C libs for stdin/stdout
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
   x resb 4   ;we need a place in memory for our integers, for scanf and all
   y resb 4

section .text
main:
   mov rdi, x_msg ;set inital printf arg to print "x = "
   mov al, 0
   call printf

   mov rsi, x      ;first arg for scanf, the addr of where to store
   mov rdi, format ;formatting for scanf
   mov rax, 0      ;Need to declare floating points being used, none so...
   call scanf

   mov rdi, y_msg
   mov al, 0
   call printf

   mov rsi, y
   mov rdi, format
   mov rax, 0
   call scanf

   mov rdi,out_format ;set first printf arg, "%d + %d = %d"
   mov rsi,[x]        ;second printf arg, x
   mov rdx,[y]        ;third printf arg, y
   mov rcx,0          ;make sure it's 0! Or else, math will be wrong :)
   add rcx,rsi        ;add x into result 
   add rcx,rdx        ;add y into result (x+y)
   mov rax,0 
   call printf        ;printf("%d + %d = %d",x,y,x+y) 

   ret
