# AUTHOR: Keith Stellyes
# WRITTEN: August 27, 2016
# Gets the length of a string
.data 
	#.asciiz automatically adds the NULL terminator character, \0 for us.
	string: .asciiz "Nice string you got there!"

.text
main:
	la $a1,string           #load the beginning address of the string.
	
loop:
	lb $a2,($a1)            #load byte (i.e. the char) at $a1 into $a2
	addi $a1,$a1,1          #increment $a1
	beqz $a2,exit_procedure #see if we've hit the NULL char yet
	addi $a0,$a0,1          #increment counter
	j loop                  #back to start
	
exit_procedure:
	li $v0,1                #set syscall to print integer
	syscall                 
	
	li $v0,10               #set syscall to cleanly exit EXIT_SUCCESS
	syscall