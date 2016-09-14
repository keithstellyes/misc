; 99 Bottles of Beer On The Wall hand-written
; AUTHOR: Keith Stellyes WRITTEN: September 13, 2016
; x86-64 Assembly using NASM syntax targetting Linux. Should run on Windows
;     with only minimal change.
; TO COMPILE AND RUN:
;nasm -felf64 beer-wall.asm && gcc beer-wall.o && ./a.out
global main
extern printf

section .data
   msg_a: db "%d bottles of beer on the wall, %d bottles of beer.",10,0
   msg_b: db "Take one down and pass it around, %d bottles of beer on the wall.",10,10,0

   ;stored as multiple variables for the sake of readability.
   msg_f_a: db "2 bottles of beer on the wall, 2 bottles of beer.",10,0
   msg_f_b: db "Take one down and pass it around, 1 bottle of beer on the wall.",10,10,0
   msg_f_c: db "1 bottle of beer on the wall, 1 bottle of beer.",10,0
   msg_f_d: db "Take one down and pass it around, no more bottles of beer on the wall.",10,10,0
   msg_f_e: db "No more bottles of beer on the wall, no more bottles of beer.",10,0
   msg_f_f: db "Go to the store and buy some more, 99 bottles of beer on the wall.",10,0
   n: db 99
section .text
main:
loop:

   mov rsi,[n]   ;set our printf integer args to our counter
   mov rdx,[n]
   mov rdi,msg_a ;set the printf string arg to the message string
   mov rax,0
   call printf

   mov rsi,[n]   ;get the variable again and set as printf integer arg
   dec rsi       ;decrement it
   mov [n],rsi   ;save it in our counter
   mov rax,0
   mov rdi,msg_b
   call printf

   mov rsi,[n]   ;grab the variable again for comparison
   cmp rsi,2     ;if counter != 2: then, repeat
   jne loop

final_print:
   mov rdi,msg_f_a
   mov rax,0
   call printf
   mov rdi,msg_f_b
   mov rax,0
   call printf
   mov rdi,msg_f_c
   mov rax,0
   call printf
   mov rdi,msg_f_d
   mov rax,0
   call printf
   mov rdi,msg_f_e
   mov rax,0
   call printf
   mov rdi,msg_f_f
   mov rax,0
   call printf
